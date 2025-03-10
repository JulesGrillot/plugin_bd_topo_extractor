#! python3  # noqa: E265

"""
    Plugin dialog.
"""

import os

# standard
from pathlib import Path

# PyQGIS
from qgis.core import (
    QgsCoordinateReferenceSystem,
    QgsCoordinateTransform,
    QgsDistanceArea,
    QgsFeature,
    QgsGeometry,
    QgsMapLayerProxyModel,
    QgsVectorLayer,
)
from qgis.gui import QgsMapLayerComboBox, QgsProjectionSelectionWidget

# PyQt
from qgis.PyQt.Qt import QUrl
from qgis.PyQt.QtCore import QSize, Qt, QThread, pyqtSignal
from qgis.PyQt.QtGui import QDesktopServices, QIcon, QMovie, QPixmap
from qgis.PyQt.QtWidgets import (
    QButtonGroup,
    QCheckBox,
    QDialog,
    QDialogButtonBox,
    QFileDialog,
    QGridLayout,
    QHBoxLayout,
    QLabel,
    QLineEdit,
    QMessageBox,
    QProgressBar,
    QPushButton,
    QScrollArea,
    QToolButton,
    QVBoxLayout,
    QWidget,
)

# project
from bd_topo_extractor.__about__ import (
    DIR_PLUGIN_ROOT,
    __loading_gif__,
    __uri_homepage__,
    __wfs_credit__,
    __wfs_crs__,
    __wfs_logo__,
    __wfs_metadata__,
    __wfs_name__,
    __wfs_schema__,
    __wfs_style__,
)
from bd_topo_extractor.processing import GetCapabilitiesRequest, RectangleDrawTool

# ############################################################################
# ########## Classes ###############
# ##################################


class BdTopoExtractorDialog(QDialog):
    def __init__(self, project=None, iface=None, url=None, manager=None):
        """Constructor.
        :param
        project: The current QGIS project instance
        iface: An interface instance that will be passed to this class which \
        provides the hook by which you can manipulate the QGIS application \
        at run time.
        url: The wfs url
        """
        super().__init__()
        self.setObjectName(f"{__wfs_name__} Extractor")

        self.iface = iface
        self.project = project
        self.url = url
        self.manager = manager
        self.canvas = self.iface.mapCanvas()

        self.layer = None
        self.rectangle = None
        self.checked = 0
        self.schema = __wfs_schema__

        self.setWindowTitle(f"{__wfs_name__} Extractor")

        self.layout = QVBoxLayout()
        extent_check_group = QButtonGroup(self)
        extent_check_group.setExclusive(True)
        layout_row_count = 0

        # Source and credit
        self.source_doc_layout = QGridLayout()
        credit_label = QLabel(self)
        credit_label.setText(self.tr("Data provided by :"))
        self.layout.addWidget(credit_label)

        pixmap = QPixmap(str(__wfs_logo__))
        # pixmap.loadFromData(requests.get(__wfs_logo__).content)
        self.producer_label = QToolButton(self)
        self.producer_label.setObjectName(__wfs_credit__)
        icon = QIcon()
        icon.addPixmap(pixmap)
        self.producer_label.setIcon(icon)
        self.producer_label.setIconSize(QSize(60, 60))
        self.source_doc_layout.addWidget(self.producer_label, 0, 0, 3, 3)

        widget = QWidget()
        self.doc_layout = QVBoxLayout()
        self.documentation_button = QPushButton(self)
        self.documentation_button.setObjectName(__uri_homepage__)
        self.documentation_button.setText(self.tr("Documentation"))
        self.doc_layout.addWidget(self.documentation_button)

        self.doc_layout.addStretch()

        self.metadata_button = QPushButton(self)
        self.metadata_button.setObjectName(__wfs_metadata__)
        self.metadata_button.setText(self.tr("Metadata"))
        self.doc_layout.addWidget(self.metadata_button)
        widget.setLayout(self.doc_layout)
        self.source_doc_layout.addWidget(widget, 0, 2, 1, -1)

        self.layout.addLayout(self.source_doc_layout)

        # Draw rectangle tool
        self.extent_layout = QGridLayout()
        layout_row_count = 0
        self.draw_rectangle_checkbox = QCheckBox(self)
        self.draw_rectangle_checkbox.setText(
            self.tr("Draw an extent to extract data :")
        )
        self.draw_rectangle_checkbox.setChecked(True)
        extent_check_group.addButton(self.draw_rectangle_checkbox)
        self.extent_layout.addWidget(
            self.draw_rectangle_checkbox, layout_row_count, 0, 1, 2
        )

        self.draw_rectangle_button = QPushButton(self)
        self.draw_rectangle_button.setEnabled(False)
        self.draw_rectangle_button.clicked.connect(self.pointer)
        self.draw_rectangle_button.setText(self.tr("Draw an extent"))
        self.extent_layout.addWidget(
            self.draw_rectangle_button, layout_row_count, 2, 1, 3
        )
        layout_row_count = layout_row_count + 1

        # Select layer tool
        self.select_layer_checkbox = QCheckBox(self)
        self.select_layer_checkbox.setText(
            self.tr("Use layer extent to extract data :")
        )
        self.select_layer_checkbox.setChecked(False)
        extent_check_group.addButton(self.select_layer_checkbox)
        self.extent_layout.addWidget(
            self.select_layer_checkbox, layout_row_count, 0, 2, 2
        )

        self.select_layer_combo_box = QgsMapLayerComboBox(self)
        self.select_layer_combo_box.setFilters(
            QgsMapLayerProxyModel.PolygonLayer
            | QgsMapLayerProxyModel.LineLayer
            | QgsMapLayerProxyModel.RasterLayer
        )
        self.select_layer_combo_box.layerChanged.connect(self.check_layer_size)
        self.select_layer_combo_box.setEnabled(False)
        self.extent_layout.addWidget(
            self.select_layer_combo_box, layout_row_count, 2, 1, 3
        )
        layout_row_count = layout_row_count + 2

        # Show WFS max data extent
        self.show_wfs_extent_checkbox = QCheckBox()
        self.show_wfs_extent_checkbox.setText(self.tr("Draw the extent on the map"))
        self.show_wfs_extent_checkbox.setChecked(False)
        # self.extent_layout.addWidget(
        #     self.show_wfs_extent_checkbox, layout_row_count, 0, 1, 2
        # )
        self.layout.addLayout(self.extent_layout)
        self.layout.insertSpacing(50, 15)

        # Select data to extract from WFS
        select_data_to_extract_label = QLabel(self)
        select_data_to_extract_label.setText(
            self.tr("Data extracted from ") + str(__wfs_name__)
        )
        self.layout.addWidget(select_data_to_extract_label)

        self.select_all_checkbox = QCheckBox(self)
        self.select_all_checkbox.setText(
            self.tr("Extract all data from ") + str(__wfs_name__)
        )
        self.layout.addWidget(self.select_all_checkbox)

        # Text edition to filter WFS data
        self.text_data_filter = QLineEdit(self)
        self.text_data_filter.setEnabled(False)
        self.text_data_filter.textChanged.connect(
            lambda: self.filter_by_text(self.text_data_filter.text())
        )
        self.layout.addWidget(self.text_data_filter)

        self.scroll_area = QScrollArea(self)
        self.scroll_area.setVerticalScrollBarPolicy(Qt.ScrollBarAsNeeded)
        self.scroll_area.setHorizontalScrollBarPolicy(Qt.ScrollBarAsNeeded)
        self.scroll_area.setMinimumHeight(180)
        self.scroll_area.setWidgetResizable(True)
        self.scroll_area.setMinimumWidth(460)

        self.scroll_area_content = QWidget()
        self.layer_check_group = QButtonGroup(self)
        self.layer_check_group.setExclusive(False)
        self.scroll_area.setWidget(self.scroll_area_content)
        self.checkbox_layout = QGridLayout(self.scroll_area_content)
        self.layout.addWidget(self.scroll_area)
        self.layout.insertSpacing(50, 15)

        self.getcapabilities = GetCapabilitiesRequest(
            None, self.url, self.schema, self.manager
        )
        self.getcapabilities.finished_dl.connect(
            lambda: self.add_layers(self.getcapabilities.service_layers)
        )
        self.getcapabilities.finished_dl.connect(self.set_rectangle_tool)

        # Geom predicat
        self.geom_layout = QGridLayout()
        self.geom_button_group = QButtonGroup(self)
        self.geom_button_group.setExclusive(True)
        self.intersect_checkbox = QCheckBox(self)
        self.intersect_checkbox.setAccessibleName("intersect")
        self.intersect_checkbox.setChecked(True)
        self.intersect_checkbox.setText(self.tr("Keep data intersecting the extent"))
        self.geom_layout.addWidget(self.intersect_checkbox, 0, 0)
        self.geom_button_group.addButton(self.intersect_checkbox)
        self.within_checkbox = QCheckBox(self)
        self.within_checkbox.setAccessibleName("within")
        self.within_checkbox.setText(self.tr("Clip data intersecting the extent"))
        self.geom_layout.addWidget(self.within_checkbox, 0, 1)
        self.geom_button_group.addButton(self.within_checkbox)

        # Crs Selection
        select_crs_label = QLabel(self)
        select_crs_label.setText(self.tr("Select outputs' coordinate system :"))
        self.geom_layout.addWidget(select_crs_label, 1, 0)
        self.crs_selector = QgsProjectionSelectionWidget(self)
        self.crs_selector.setCrs(self.project.crs())
        self.geom_layout.addWidget(self.crs_selector, 1, 1)
        self.layout.addLayout(self.geom_layout)

        # Add result to project
        self.result_layout = QGridLayout()
        self.add_to_project_checkbox = QCheckBox(self)
        self.add_to_project_checkbox.setText(
            self.tr("Add exported data to the project")
        )
        self.add_to_project_checkbox.setChecked(True)
        self.add_to_project_checkbox.setEnabled(False)
        self.result_layout.addWidget(self.add_to_project_checkbox, 0, 0)

        # Output layers style
        if __wfs_style__:
            self.style_checkbox = QCheckBox(self)
            self.style_checkbox.setAccessibleName("style")
            self.style_checkbox.setText(self.tr("Add style to layers"))
            self.style_checkbox.setChecked(True)
            self.result_layout.addWidget(self.style_checkbox, 0, 1)

        # Output folder selection
        self.save_result_checkbox = QCheckBox(self)
        self.save_result_checkbox.setText(self.tr("Save the results :"))
        self.result_layout.addWidget(self.save_result_checkbox, 1, 0)

        # Output format
        self.format_layout = QHBoxLayout()
        self.output_format_button_group = QButtonGroup(self)
        self.output_format_button_group.setExclusive(True)
        self.gpkg_checkbox = QCheckBox(self)
        self.gpkg_checkbox.setAccessibleName("gpkg")
        self.gpkg_checkbox.setChecked(True)
        self.gpkg_checkbox.setEnabled(False)
        self.gpkg_checkbox.setText("GeoPackage")
        self.format_layout.addWidget(self.gpkg_checkbox)
        self.output_format_button_group.addButton(self.gpkg_checkbox, 0)
        self.shp_checkbox = QCheckBox(self)
        self.shp_checkbox.setAccessibleName("shp")
        self.shp_checkbox.setEnabled(False)
        self.shp_checkbox.setText("Shapefile")
        self.format_layout.addWidget(self.shp_checkbox)
        self.output_format_button_group.addButton(self.shp_checkbox, 1)
        self.geojson_checkbox = QCheckBox(self)
        self.geojson_checkbox.setAccessibleName("geojson")
        self.geojson_checkbox.setEnabled(False)
        self.geojson_checkbox.setText("GeoJSON")
        self.format_layout.addWidget(self.geojson_checkbox)
        self.output_format_button_group.addButton(self.geojson_checkbox, 2)
        self.result_layout.addLayout(self.format_layout, 2, 0, 1, 2)

        self.output_layout = QGridLayout()
        label_output = QLabel(self)
        label_output.setText(self.tr("Explore folders :"))
        self.output_layout.addWidget(label_output, 0, 0)
        self.line_edit_output_folder = QLineEdit(self)
        self.line_edit_output_folder.setEnabled(False)
        self.output_layout.addWidget(self.line_edit_output_folder, 0, 1)
        button_output_folder = QPushButton(self)
        button_output_folder.setEnabled(False)
        button_output_folder.setText("...")
        button_output_folder.clicked.connect(self.select_output_folder)
        button_output_folder.setMaximumWidth(30)
        self.output_layout.addWidget(button_output_folder, 0, 2)
        self.result_layout.addLayout(self.output_layout, 3, 0, 1, 2)
        self.layout.addLayout(self.result_layout)
        self.layout.insertSpacing(25, 10)

        # Accept and reject button box
        self.test_layout = QGridLayout()
        self.button_box = QDialogButtonBox(self)
        self.button_box.setEnabled(False)
        self.button_box.addButton(self.tr("Ok"), QDialogButtonBox.AcceptRole)
        self.button_box.addButton(self.tr("Cancel"), QDialogButtonBox.RejectRole)
        # self.layout.addWidget(self.button_box)
        self.button_box.accepted.connect(self.accept)
        self.button_box.rejected.connect(self.reject)
        self.accepted.connect(self.get_result)
        self.rejected.connect(self.disconnect)
        self.test_layout.addWidget(self.button_box, 0, 2)

        # loading gif
        self.loading_gif_label = QLabel(self)
        self.test_layout.addWidget(self.loading_gif_label, 0, 0, 2, 2)
        # self.layout.addWidget(self.loading_gif_label)
        self.layout.addLayout(self.test_layout)

        # Progress Bar
        self.select_progress_bar_label = QLabel(self)
        self.select_progress_bar_label.setText("")
        self.layout.addWidget(self.select_progress_bar_label)

        self.progress_bar = QProgressBar(self)
        self.progress_bar.setValue(0)
        self.thread = Thread()
        self.thread._signal.connect(self.signal_accept)
        self.layout.addWidget(self.progress_bar)

        # Add layout
        self.setLayout(self.layout)

        # Ui signals
        self.producer_label.clicked.connect(self.open_url)
        self.metadata_button.clicked.connect(self.open_url)
        self.documentation_button.clicked.connect(self.open_url)

        self.draw_rectangle_checkbox.stateChanged.connect(
            self.draw_rectangle_button.setEnabled
        )
        self.draw_rectangle_checkbox.stateChanged.connect(
            self.select_layer_combo_box.setDisabled
        )
        self.draw_rectangle_checkbox.stateChanged.connect(self.button_box.setDisabled)
        self.draw_rectangle_checkbox.stateChanged.connect(self.check_rectangle)

        self.select_layer_checkbox.stateChanged.connect(
            self.select_layer_combo_box.setEnabled
        )
        self.select_layer_checkbox.stateChanged.connect(
            self.draw_rectangle_button.setDisabled
        )

        self.select_layer_checkbox.stateChanged.connect(self.button_box.setEnabled)
        self.select_layer_checkbox.stateChanged.connect(self.erase_rubber_band)
        self.select_layer_checkbox.stateChanged.connect(self.check_rectangle)
        self.select_layer_checkbox.stateChanged.connect(self.check_layer_size)
        self.show_wfs_extent_checkbox.stateChanged.connect(self.show_max_extent)

        self.select_all_checkbox.stateChanged.connect(self.select_all)
        self.select_all_checkbox.stateChanged.connect(self.check_path)

        self.save_result_checkbox.stateChanged.connect(button_output_folder.setEnabled)
        self.save_result_checkbox.stateChanged.connect(
            self.line_edit_output_folder.setEnabled
        )
        self.save_result_checkbox.stateChanged.connect(self.check_path)
        self.save_result_checkbox.stateChanged.connect(
            self.add_to_project_checkbox.setEnabled
        )
        self.save_result_checkbox.stateChanged.connect(self.gpkg_checkbox.setEnabled)
        self.save_result_checkbox.stateChanged.connect(self.shp_checkbox.setEnabled)
        self.save_result_checkbox.stateChanged.connect(self.geojson_checkbox.setEnabled)

        self.line_edit_output_folder.textEdited.connect(self.check_path)

    def open_url(self):
        # Function to open the url of the buttons
        url = QUrl(self.sender().objectName())
        QDesktopServices.openUrl(url)

    def show_max_extent(self, value):
        # Show a rectangle for the max extent of the wfs' data
        if value == 0:
            if len(self.project.instance().mapLayersByName("Max extent")) != 0:
                self.project.instance().removeMapLayer(self.max_extent_layer)
                self.canvas.refresh()
        else:
            self.max_extent_layer = QgsVectorLayer(
                "Polygon?crs=epsg:" + str(__wfs_crs__), "Max extent", "memory"
            )
            self.max_extent_layer.startEditing()
            new_geom = QgsGeometry().fromRect(self.getcapabilities.max_bounding_box)
            new_feature = QgsFeature(self.max_extent_layer.fields())
            new_feature.setGeometry(new_geom)
            self.max_extent_layer.dataProvider().addFeatures([new_feature])
            self.max_extent_layer.updateExtents()
            self.max_extent_layer.commitChanges()
            self.max_extent_layer.triggerRepaint()
            style_path: Path = (
                DIR_PLUGIN_ROOT / f'{"resources/styles/max_extent_style.qml"}'
            )
            self.max_extent_layer.loadNamedStyle(style_path.__str__())
            self.project.instance().addMapLayer(self.max_extent_layer)
            self.canvas.refresh()

    def set_rectangle_tool(self):
        self.rectangle_tool = RectangleDrawTool(
            self.project, self.canvas, self.getcapabilities.max_bounding_box
        )
        self.rectangle_tool.signal.connect(self.activate_window)
        self.draw_rectangle_button.setEnabled(True)

    def check_layer_size(self):
        if self.select_layer_checkbox.isChecked():
            # Check layer size and add a warning message if extent is too large
            layer = self.select_layer_combo_box.currentLayer()
            # Reproject the layer
            transformed_extent = self.transform_crs(
                layer.extent(),
                layer.crs(),
                QgsCoordinateReferenceSystem("EPSG:" + str(__wfs_crs__)),
            )
            if self.getcapabilities.max_bounding_box.intersects(
                transformed_extent
            ):  # noqa: E501
                area = QgsDistanceArea()
                ellipsoid = QgsCoordinateReferenceSystem(
                    "EPSG:" + str(__wfs_crs__)
                ).ellipsoidAcronym()
                area.setEllipsoid(ellipsoid)
                if (
                    area.measureArea(QgsGeometry.fromRect(transformed_extent))
                    > 100000000
                ):  # noqa: E501
                    msg = QMessageBox()
                    msg.warning(
                        None,
                        self.tr("Warning"),
                        self.tr(
                            "Selected layer is very large (degraded performance)"
                        ),  # noqa: E501
                    )
            else:
                # If the layer is outside of the max extent,
                # an eror message appear
                msg = QMessageBox()
                msg.critical(
                    None,
                    self.tr("Error"),
                    self.tr("Selected layer is outside of the WFS' extent."),
                )

    def filter_by_text(self, searchtext):
        # Filter layer list by the text in the search bar
        if searchtext == "":
            row = 0
            column = 0
            # Show all items if searchbar is empty
            for checkbox in self.layer_check_group.buttons():
                checkbox.setHidden(False)
                self.checkbox_layout.addWidget(checkbox, row, column)
                if column < 2:
                    column = column + 1
                else:
                    column = 0
                    row = row + 1
        else:
            row = 0
            column = 0
            # Only show items with text corresponding to searchbar
            for checkbox in self.layer_check_group.buttons():
                if searchtext.lower() in checkbox.text().lower():
                    checkbox.setHidden(False)
                    self.checkbox_layout.addWidget(checkbox, row, column)
                    if column < 2:
                        column = column + 1
                    else:
                        column = 0
                        row = row + 1
                else:
                    checkbox.setHidden(True)

    def get_result(self):
        self.loading_gif = QMovie(str(__loading_gif__))
        self.loading_gif_label.setMovie(self.loading_gif)
        size = QSize(
            100,
            60,
        )
        movie = self.loading_gif_label.movie()
        movie.setScaledSize(size)
        self.loading_gif.start()
        # self.select_layer_combo_box.layerChanged.disconnect(self.check_layer_size)
        # Accepted result from the dialog
        # If the extent is from a drawn rectangle
        if self.draw_rectangle_checkbox.isChecked():
            # Remove rectangle from map
            self.erase_rubber_band()
            # Remove the map tool to draw the rectangle
            self.canvas.unsetMapTool(self.rectangle_tool)
            # Get the rectangle extent and reproject it
            self.extent = self.rectangle_tool.new_extent
        # If the extent is from a layer
        else:
            # Get the layer
            self.layer = self.select_layer_combo_box.currentLayer()
            # Reproject the layer
            self.extent = self.transform_crs(
                self.layer.extent(),
                self.layer.crs(),
                QgsCoordinateReferenceSystem("EPSG:" + str(__wfs_crs__)),
            )

    def signal_accept(self, msg):
        # Update the progress bar when result is pressed
        self.progress_bar.setValue(int(msg))
        if self.progress_bar.value() == 101:
            self.progress_bar.setValue(0)

    def output_format(self):
        # Function to get the requested output format
        format = ""
        for button in self.output_format_button_group.buttons():
            if button.isChecked():
                format = button.accessibleName()
        return format

    def select_output_folder(self):
        # Function to use the OS explorer and select an output directory
        my_dir = QFileDialog.getExistingDirectory(
            self,
            self.tr("Select an output folder"),
            "",
            QFileDialog.ShowDirsOnly,
        )
        self.line_edit_output_folder.setText(my_dir)
        self.check_path()

    def check_path(self):
        # Check if different conditions are True to enable the OK button.
        # Check if there is a rectangle
        if self.rectangle:
            # Check if a wfs data is checked
            if self.checked > 0:
                # If the result must be saved the output directory must exists.
                if self.save_result_checkbox.isChecked():
                    if os.path.exists(self.line_edit_output_folder.text()):
                        self.button_box.setEnabled(True)
                    else:
                        self.button_box.setEnabled(False)
                else:
                    self.button_box.setEnabled(True)
            else:
                self.button_box.setEnabled(False)
        else:
            self.button_box.setEnabled(False)
        # If the result is saved as a temporary output,
        # the result is added to the project and is a GPKG
        if not self.save_result_checkbox.isChecked():
            self.add_to_project_checkbox.setChecked(True)
            self.gpkg_checkbox.setChecked(True)

    def select_all(self):
        # Check all Wfs' data checkbox
        if self.select_all_checkbox.isChecked():
            for button in self.layer_check_group.buttons():
                button.setChecked(True)
        # Uncheck all Wfs' data checkbox
        else:
            for button in self.layer_check_group.buttons():
                button.setChecked(False)

    def add_layers(self, layers):
        self.text_data_filter.setEnabled(True)
        # Add all wfs' data checkboxes to the ui
        row = 0
        column = 0
        # Every checkbox are added to a grid layout
        # combo_box = QgsCheckableComboBox(self)
        for layer in layers:
            checkbox = QCheckBox(self)
            # Format data names to add apostrophe,
            # replace underscore with space
            if self.schema == "*":
                text_with_spaces = (
                    layer.split(":")[1].replace("_", " ")
                    + " ("
                    + str(layer.split(":")[0])
                    + ")"
                )  # noqa: E501
            else:
                text_with_spaces = layer.replace("_", " ")
            for elem in [" d ", " l ", " s "]:
                if elem in text_with_spaces:
                    text_with_spaces = text_with_spaces.replace(
                        elem, " " + elem[1] + "'"
                    )
            # If the name is too long, it is splitted in half
            n = len(text_with_spaces.split(" ")) / 2
            first_part = ""
            second_part = ""
            for word in text_with_spaces.split(" "):
                if text_with_spaces.split(" ").index(word) < n:
                    if first_part == "":
                        first_part = word
                    else:
                        first_part = first_part + " " + word
                else:
                    if second_part == "":
                        second_part = word
                    else:
                        second_part = second_part + " " + word
            text_with_spaces = first_part + "\n" + second_part
            # Add upper case to the data name
            checkbox.setText(text_with_spaces.capitalize())
            # Keep the real data name
            # add it to accessible name of the checkbox
            if self.schema == "*":
                checkbox.setAccessibleName(layer)
            else:
                checkbox.setAccessibleName(self.schema + ":" + str(layer))
            # Count the number of checked checkboxes
            checkbox.stateChanged.connect(self.check_result)
            self.layer_check_group.addButton(checkbox)
            # Add to the checkboxes to the layout
            self.checkbox_layout.addWidget(checkbox, row, column)
            # combo_box.addItemWithCheckState(
            #     checkbox, Qt.CheckState.Unchecked)
            # 3 columns max
            if column != 2:
                column = column + 1
            else:
                row = row + 1
                column = 0
        self.scroll_area_content.setLayout(self.checkbox_layout)

    def check_result(self, value):
        # Count the checked checkboxes to know if the Ok button must be enabled
        if value == 0:
            self.checked = self.checked - 1
        else:
            self.checked = self.checked + 1
        self.check_path()

    def check_rectangle(self):
        # Check if a rectangle is drawn or a layer is selected
        if self.select_layer_checkbox.isChecked():
            if self.select_layer_combo_box is None:
                self.rectangle = None
            else:
                self.rectangle = True
        elif self.draw_rectangle_checkbox.isChecked():
            self.rectangle = None

    def transform_crs(self, rectangle, input_crs, output_crs):
        # Reproject a rectangle to the project crs
        geom = QgsGeometry().fromRect(rectangle)
        geom.transform(QgsCoordinateTransform(input_crs, output_crs, self.project))
        transformed_extent = geom.boundingBox()
        return transformed_extent

    def erase_rubber_band(self):
        # Erase the drawn rectangle
        if self.rectangle_tool.rubber_band:
            self.rectangle_tool.rubber_band.reset()
        else:
            pass

    def disconnect(self):
        self.select_layer_combo_box.layerChanged.disconnect(self.check_layer_size)
        # Unset the tool to draw a rectangle
        if self.rectangle_tool:
            self.canvas.unsetMapTool(self.rectangle_tool)
            self.erase_rubber_band()

    def pointer(self):
        # Add the tool to draw a rectangle
        # self.setVisible(False)
        self.iface.mainWindow().activateWindow()
        self.canvas.setMapTool(self.rectangle_tool)

    def activate_window(self):
        # Put the dialog on top once the rectangle is drawn
        self.activateWindow()
        self.rectangle = True
        self.check_path()
        # if self.layer_check_group.checkedButton():
        # self.button_box.setEnabled(True)


class Thread(QThread):
    """Thread used fot the ProgressBar"""

    _signal = pyqtSignal(int)

    def __init__(self):
        super().__init__()
        self.max_value = 1
        self.value = 0

    def __del__(self):
        self.wait()

    def set_max(self, max_value):
        self.max_value = max_value

    def add_one(self):
        self.value = self.value + 1
        self._signal.emit(int((self.value / self.max_value) * 100))

    def finish(self):
        self._signal.emit(101)

    def reset_value(self):
        self.value = 0
