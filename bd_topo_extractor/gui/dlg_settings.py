#! python3  # noqa: E265

"""
    Plugin settings form integrated into QGIS 'Options' menu.
"""

# standard
from functools import partial
from pathlib import Path
import os
import requests

# PyQGIS
from qgis.core import (
    QgsApplication,
    QgsGeometry,
    QgsCoordinateReferenceSystem,
    QgsCoordinateTransform,
    QgsMapLayerProxyModel,
    QgsFeature,
    QgsVectorLayer,
)
from qgis.gui import (
    QgsOptionsPageWidget,
    QgsOptionsWidgetFactory,
    QgsMapLayerComboBox,
    QgsProjectionSelectionWidget,
)
from qgis.PyQt import uic
from qgis.PyQt.Qt import QUrl
from qgis.PyQt.QtGui import QDesktopServices, QIcon
from qgis.PyQt.QtWidgets import QDialog, QDialogButtonBox, QPushButton
from PyQt5.QtCore import Qt, QThread, pyqtSignal, QSize
from PyQt5.QtGui import QPixmap
from PyQt5.QtWidgets import (
    QGridLayout,
    QVBoxLayout,
    QHBoxLayout,
    QCheckBox,
    QButtonGroup,
    QLabel,
    QLineEdit,
    QFileDialog,
    QWidget,
    QScrollArea,
    QProgressBar,
    QToolButton,
    QSpacerItem,
    QSizePolicy,
)

# project
from bd_topo_extractor.__about__ import (
    DIR_PLUGIN_ROOT,
    __icon_path__,
    __title__,
    __uri_homepage__,
    __uri_tracker__,
    __version__,
    __wfs_name__,
    __wfs_logo__,
    __wfs_metadata__,
    __wfs_credit__,
)
from bd_topo_extractor.toolbelt import PlgLogger, PlgOptionsManager
from bd_topo_extractor.toolbelt.preferences import PlgSettingsStructure
from bd_topo_extractor.processing import RectangleDrawTool
from bd_topo_extractor.processing import GetCapabilitiesRequest

# ############################################################################
# ########## Globals ###############
# ##################################

FORM_CLASS, _ = uic.loadUiType(
    Path(__file__).parent / "{}.ui".format(Path(__file__).stem)
)


# ############################################################################
# ########## Classes ###############
# ##################################


class BdTopoExtractorDialog(QDialog):
    def __init__(self, project=None, iface=None, url=None):
        """Constructor.
        :param 
        project: The current QGIS project instance
        iface: An interface instance that will be passed to this class which \
        provides the hook by which you can manipulate the QGIS application at run time.
        url: The wfs url
        """
        super(BdTopoExtractorDialog, self).__init__()
        self.setObjectName("{}".format(__title__))

        self.iface = iface
        self.project = project
        self.url = url
        self.canvas = self.iface.mapCanvas()
        self.getcapabilities = GetCapabilitiesRequest(self.url)
        self.rectangle_tool = RectangleDrawTool(
            self.project, self.canvas, self.getcapabilities.max_bounding_box
        )
        self.layer = None
        self.rectangle = None
        self.checked = 0

        self.setWindowTitle(__title__)

        self.layout = QVBoxLayout()
        extent_check_group = QButtonGroup(self)
        extent_check_group.setExclusive(True)
        layout_row_count = 0

        # Source and credit
        self.source_doc_layout = QGridLayout()
        credit_label = QLabel(self)
        credit_label.setText("Données fournies par :")
        self.layout.addWidget(credit_label)

        pixmap = QPixmap()
        pixmap.loadFromData(requests.get(__wfs_logo__).content)
        self.producer_label = QToolButton(self)
        self.producer_label.setObjectName(__wfs_credit__)
        icon = QIcon()
        icon.addPixmap(pixmap)
        self.producer_label.setIcon(icon)
        self.producer_label.setIconSize(QSize(60, 60))
        self.source_doc_layout.addWidget(self.producer_label, 0, 0, 3, 3)

        widget = QWidget()
        self.doc_layout = QVBoxLayout()
        self.documentation_label = QPushButton(self)
        self.documentation_label.setObjectName(__uri_homepage__)
        self.documentation_label.setText("Documentation")
        self.doc_layout.addWidget(self.documentation_label)

        self.doc_layout.addStretch()

        self.metadata_label = QPushButton(self)
        self.metadata_label.setObjectName(__wfs_metadata__)
        self.metadata_label.setText("Metadonnées")
        self.doc_layout.addWidget(self.metadata_label)
        widget.setLayout(self.doc_layout)
        self.source_doc_layout.addWidget(widget, 0, 2, 1, -1)

        self.layout.addLayout(self.source_doc_layout)

        # Draw rectangle tool
        self.extent_layout = QGridLayout()
        layout_row_count = 0
        self.draw_rectangle_checkbox = QCheckBox(self)
        self.draw_rectangle_checkbox.setText(
            "Dessiner la zone à extraire sur la carte : "
        )
        self.draw_rectangle_checkbox.setChecked(True)
        extent_check_group.addButton(self.draw_rectangle_checkbox)
        self.extent_layout.addWidget(
            self.draw_rectangle_checkbox, layout_row_count, 0, 1, 2
        )

        self.draw_rectangle_button = QPushButton(self)
        self.draw_rectangle_button.clicked.connect(self.pointer)
        self.draw_rectangle_button.setText("Dessiner un rectangle")
        self.extent_layout.addWidget(
            self.draw_rectangle_button, layout_row_count, 2, 1, 3
        )
        layout_row_count = layout_row_count + 1

        # Select layer tool
        self.select_layer_checkbox = QCheckBox(self)
        self.select_layer_checkbox.setText(
            "Utiliser l'emprise d'une couche pour l'extraction : "
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
        self.select_layer_combo_box.setEnabled(False)
        self.extent_layout.addWidget(
            self.select_layer_combo_box, layout_row_count, 2, 1, 3
        )
        layout_row_count = layout_row_count + 2

        # Show WFS max data extent
        self.show_wfs_extent_checkbox = QCheckBox(self)
        self.show_wfs_extent_checkbox.setText(
            "Dessiner la zone à extraire sur la carte"
        )
        self.show_wfs_extent_checkbox.setChecked(False)
        self.extent_layout.addWidget(
            self.show_wfs_extent_checkbox, layout_row_count, 0, 1, 2
        )
        self.layout.addLayout(self.extent_layout)
        self.layout.insertSpacing(100, 25)

        # Select data to extract from WFS
        select_data_to_extract_label = QLabel(self)
        select_data_to_extract_label.setText(
            "Données à extraire de la {0}".format(__wfs_name__)
        )
        self.layout.addWidget(select_data_to_extract_label)

        self.select_all_checkbox = QCheckBox(self)
        self.select_all_checkbox.setText(
            "Extraire toutes les données de la {0}".format(__wfs_name__)
        )
        self.layout.addWidget(self.select_all_checkbox)

        self.scroll_area = QScrollArea(self)
        self.scroll_area.setVerticalScrollBarPolicy(Qt.ScrollBarAsNeeded)
        self.scroll_area.setHorizontalScrollBarPolicy(Qt.ScrollBarAsNeeded)
        self.scroll_area.setMinimumHeight(75)
        self.scroll_area.setWidgetResizable(True)
        # self.scroll_area.setMinimumWidth(460)

        self.scroll_area_content = QWidget()
        self.layer_check_group = QButtonGroup(self)
        self.layer_check_group.setExclusive(False)
        self.schema = self.getcapabilities.service_schema
        self.add_layers(self.getcapabilities.service_layers)
        self.scroll_area.setWidget(self.scroll_area_content)
        self.layout.addWidget(self.scroll_area)
        self.layout.insertSpacing(100, 25)

        # Geom predicat
        self.geom_layout = QGridLayout()
        self.geom_button_group = QButtonGroup(self)
        self.geom_button_group.setExclusive(True)
        self.intersect_checkbox = QCheckBox(self)
        self.intersect_checkbox.setAccessibleName("intersect")
        self.intersect_checkbox.setChecked(True)
        self.intersect_checkbox.setText("Conserver les données intersectant l'emprise")
        self.geom_layout.addWidget(self.intersect_checkbox, 0, 0)
        self.geom_button_group.addButton(self.intersect_checkbox)
        self.within_checkbox = QCheckBox(self)
        self.within_checkbox.setAccessibleName("within")
        self.within_checkbox.setText("Découper les données")
        self.geom_layout.addWidget(self.within_checkbox, 0, 1)
        self.geom_button_group.addButton(self.within_checkbox)

        # Crs Selection
        select_crs_label = QLabel(self)
        select_crs_label.setText("Sélectionner une projection pour les exports :")
        self.geom_layout.addWidget(select_crs_label, 1, 0)
        self.crs_selector = QgsProjectionSelectionWidget(self)
        self.crs_selector.setCrs(self.project.crs())
        self.geom_layout.addWidget(self.crs_selector, 1, 1)
        self.layout.addLayout(self.geom_layout)

        # Add result to project
        self.result_layout = QVBoxLayout()
        self.add_to_project_checkbox = QCheckBox(self)
        self.add_to_project_checkbox.setText(
            "Ajouter les données exportées au projet actuel"
        )
        self.add_to_project_checkbox.setChecked(True)
        self.add_to_project_checkbox.setEnabled(False)
        self.result_layout.addWidget(self.add_to_project_checkbox)

        # Output folder selection
        self.save_result_checkbox = QCheckBox(self)
        self.save_result_checkbox.setText("Sauvergarder les résultats :")
        self.result_layout.addWidget(self.save_result_checkbox)

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
        self.result_layout.addLayout(self.format_layout)

        self.output_layout = QGridLayout()
        label_output = QLabel(self)
        label_output.setText("Parcourir les dossiers :")
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
        self.result_layout.addLayout(self.output_layout)
        self.layout.addLayout(self.result_layout)
        self.layout.insertSpacing(100, 25)

        # Accept and reject button box
        self.button_box = QDialogButtonBox(self)
        self.button_box.setEnabled(False)
        self.button_box.addButton("Ok", QDialogButtonBox.AcceptRole)
        self.button_box.addButton("Cancel", QDialogButtonBox.RejectRole)
        self.layout.addWidget(self.button_box)
        self.button_box.accepted.connect(self.accept)
        self.button_box.rejected.connect(self.reject)
        self.accepted.connect(self.get_result)
        self.rejected.connect(self.disconnect)
        self.rectangle_tool.signal.connect(self.activate_window)

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
        self.metadata_label.clicked.connect(self.open_url)
        self.documentation_label.clicked.connect(self.open_url)

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
        url = QUrl(self.sender().objectName())
        QDesktopServices.openUrl(url)

    def show_max_extent(self, value):
        if value == 0:
            self.project.instance().removeMapLayer(self.max_extent_layer)
            self.canvas.refresh()
        else:
            self.max_extent_layer = QgsVectorLayer(
                "Polygon?crs=epsg:4326", "Max extent", "memory"
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
                DIR_PLUGIN_ROOT / f"resources/styles/max_extent_style.qml"
            )
            self.max_extent_layer.loadNamedStyle(style_path.__str__())
            self.project.instance().addMapLayer(self.max_extent_layer)
            self.canvas.refresh()

    def get_result(self):
        if self.draw_rectangle_checkbox.isChecked():
            self.erase_rubber_band()
            self.canvas.unsetMapTool(self.rectangle_tool)
            self.extent = self.transform_crs(
                self.rectangle_tool.rectangle(),
                QgsCoordinateReferenceSystem("EPSG:4326"),
            )
        else:
            self.layer = self.select_layer_combo_box.currentLayer()
            self.extent = self.transform_crs(self.layer.extent(), self.layer.crs())

    def signal_accept(self, msg):
        self.progress_bar.setValue(int(msg))
        if self.progress_bar.value() == 101:
            self.progress_bar.setValue(0)

    def output_format(self):
        format = ""
        for button in self.output_format_button_group.buttons():
            if button.isChecked():
                format = button.accessibleName()
        return format

    def select_output_folder(self):
        my_dir = QFileDialog.getExistingDirectory(
            self, "Select a folder", "", QFileDialog.ShowDirsOnly
        )
        self.line_edit_output_folder.setText(my_dir)
        self.check_path()

    def check_path(self):
        if self.rectangle:
            if self.checked > 0:
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
        if not self.save_result_checkbox.isChecked():
            self.add_to_project_checkbox.setChecked(True)
            self.gpkg_checkbox.setChecked(True)

    def select_all(self):
        if self.select_all_checkbox.isChecked():
            for button in self.layer_check_group.buttons():
                button.setChecked(True)
        else:
            for button in self.layer_check_group.buttons():
                button.setChecked(False)

    def add_layers(self, layer_list):
        row = 0
        column = 0
        layout = QGridLayout(self.scroll_area_content)
        for layer in layer_list:
            checkbox = QCheckBox(self)
            text_with_spaces = layer.replace("_", " ")
            for elem in [" d ", " l ", " s "]:
                if elem in text_with_spaces:
                    text_with_spaces = text_with_spaces.replace(
                        elem, " " + elem[1] + "'"
                    )
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
            checkbox.setText(text_with_spaces.capitalize())
            checkbox.setAccessibleName(self.schema + ":" + str(layer))
            checkbox.stateChanged.connect(self.check_result)
            self.layer_check_group.addButton(checkbox)
            layout.addWidget(checkbox, row, column)
            if column != 2:
                column = column + 1
            else:
                row = row + 1
                column = 0
        self.scroll_area_content.setLayout(layout)

    def check_result(self, value):
        if value == 0:
            self.checked = self.checked - 1
        else:
            self.checked = self.checked + 1
        self.check_path()

    def check_rectangle(self):
        if self.select_layer_checkbox.isChecked():
            if self.select_layer_combo_box is None:
                self.rectangle = None
            else:
                self.rectangle = True
        elif self.draw_rectangle_checkbox.isChecked():
            self.rectangle = None

    def transform_crs(self, rectangle, input_crs):
        geom = QgsGeometry().fromRect(rectangle)
        geom.transform(
            QgsCoordinateTransform(input_crs, self.project.crs(), self.project)
        )
        transformed_extent = geom.boundingBox()
        return transformed_extent

    def erase_rubber_band(self):
        if self.rectangle_tool.rubber_band:
            self.rectangle_tool.rubber_band.reset()
        else:
            pass

    def disconnect(self):
        if self.rectangle_tool:
            self.canvas.unsetMapTool(self.rectangle_tool)
            self.erase_rubber_band()

    def pointer(self):
        # self.setVisible(False)
        self.iface.mainWindow().activateWindow()
        self.canvas.setMapTool(self.rectangle_tool)

    def activate_window(self):
        self.activateWindow()
        self.rectangle = True
        self.check_path()
        # if self.layer_check_group.checkedButton():
        # self.button_box.setEnabled(True)


class Thread(QThread):
    _signal = pyqtSignal(int)

    def __init__(self):
        super(Thread, self).__init__()
        self.max_value = 1
        self.value = 0

    def __del__(self):
        self.wait()

    def set_max(self, max_value):
        self.max_value = max_value

    def add_one(self):
        self.value = self.value + 1
        self._signal.emit((self.value / self.max_value) * 100)

    def finish(self):
        self._signal.emit(101)

    def reset_value(self):
        self.value = 0


class ConfigOptionsPage(FORM_CLASS, QgsOptionsPageWidget):
    """Settings form embedded into QGIS 'options' menu."""

    def __init__(self, parent):
        super().__init__(parent)
        self.log = PlgLogger().log
        self.plg_settings = PlgOptionsManager()

        # load UI and set objectName
        self.setupUi(self)
        self.setObjectName("mOptionsPage{}".format(__title__))

        # header
        self.lbl_title.setText(f"{__title__} - Version {__version__}")

        # customization
        self.btn_help.setIcon(QIcon(QgsApplication.iconPath("mActionHelpContents.svg")))
        self.btn_help.pressed.connect(
            partial(QDesktopServices.openUrl, QUrl(__uri_homepage__))
        )

        self.btn_report.setIcon(
            QIcon(QgsApplication.iconPath("console/iconSyntaxErrorConsole.svg"))
        )
        self.btn_report.pressed.connect(
            partial(QDesktopServices.openUrl, QUrl(f"{__uri_tracker__}/new/choose"))
        )

        self.btn_reset.setIcon(QIcon(QgsApplication.iconPath("mActionUndo.svg")))
        self.btn_reset.pressed.connect(self.reset_settings)

        # load previously saved settings
        self.load_settings()

    def apply(self):
        """Called to permanently apply the settings shown in the options page (e.g. \
        save them to QgsSettings objects). This is usually called when the options \
        dialog is accepted."""
        settings = self.plg_settings.get_plg_settings()

        # misc
        settings.debug_mode = self.opt_debug.isChecked()
        settings.version = __version__

        # dump new settings into QgsSettings
        self.plg_settings.save_from_object(settings)

        if __debug__:
            self.log(
                message="DEBUG - Settings successfully saved.",
                log_level=4,
            )

    def load_settings(self):
        """Load options from QgsSettings into UI form."""
        settings = self.plg_settings.get_plg_settings()

        # global
        self.opt_debug.setChecked(settings.debug_mode)
        self.lbl_version_saved_value.setText(settings.version)

    def reset_settings(self):
        """Reset settings to default values (set in preferences.py module)."""
        default_settings = PlgSettingsStructure()

        # dump default settings into QgsSettings
        self.plg_settings.save_from_object(default_settings)

        # update the form
        self.load_settings()


class PlgOptionsFactory(QgsOptionsWidgetFactory):
    """Factory for options widget."""

    def __init__(self):
        """Constructor."""
        super().__init__()

    def icon(self) -> QIcon:
        """Returns plugin icon, used to as tab icon in QGIS options tab widget.

        :return: _description_
        :rtype: QIcon
        """
        return QIcon(str(__icon_path__))

    def createWidget(self, parent) -> ConfigOptionsPage:
        """Create settings widget.

        :param parent: Qt parent where to include the options page.
        :type parent: QObject

        :return: options page for tab widget
        :rtype: ConfigOptionsPage
        """
        return ConfigOptionsPage(parent)

    def title(self) -> str:
        """Returns plugin title, used to name the tab in QGIS options tab widget.

        :return: plugin title from about module
        :rtype: str
        """
        return __title__

    def helpId(self) -> str:
        """Returns plugin help URL.

        :return: plugin homepage url from about module
        :rtype: str
        """
        return __uri_homepage__
