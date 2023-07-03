#! python3  # noqa: E265

"""
    Plugin settings form integrated into QGIS 'Options' menu.
"""

# standard
from functools import partial
from pathlib import Path

# PyQGIS
from qgis.core import (
    QgsApplication,
    QgsGeometry,
    QgsCoordinateReferenceSystem,
    QgsCoordinateTransform,
)
from qgis.gui import QgsOptionsPageWidget, QgsOptionsWidgetFactory, QgsMapLayerComboBox
from qgis.PyQt import uic
from qgis.PyQt.Qt import QUrl
from qgis.PyQt.QtGui import QDesktopServices, QIcon
from qgis.PyQt.QtWidgets import QDialog, QDialogButtonBox, QPushButton
from PyQt5.QtWidgets import QGridLayout, QCheckBox, QButtonGroup, QLabel

# project
from bd_topo_extractor.__about__ import (
    DIR_PLUGIN_ROOT,
    __icon_path__,
    __title__,
    __uri_homepage__,
    __uri_tracker__,
    __version__,
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
    def __init__(self, parent=None, iface=None, project=None):
        """Constructor."""
        super(BdTopoExtractorDialog, self).__init__(parent)
        self.setObjectName("{}".format(__title__))

        self.iface = iface
        self.project = project
        self.crs = self.project.crs()
        self.canvas = self.iface.mapCanvas()
        self.rectangle_tool = RectangleDrawTool(self.canvas)
        self.getcapabilities = GetCapabilitiesRequest(
            url="https://wxs.ign.fr/topographie/geoportail/wfs"
        )
        self.layer = None
        self.new_crs = QgsCoordinateReferenceSystem()
        self.new_crs.createFromSrid(4326)

        # qself.resize(400, 600)

        layout = QGridLayout()
        extent_check_group = QButtonGroup(self)
        extent_check_group.setExclusive(True)

        self.draw_rectangle_button = QPushButton(self)
        # self.draw_rectangle_button.setGeometry(30, 100, 150, 30)
        self.draw_rectangle_button.clicked.connect(self.pointer)
        self.draw_rectangle_button.setText("Dessiner un rectangle")
        layout.addWidget(self.draw_rectangle_button, 0, 2)

        self.draw_rectangle_checkbox = QCheckBox(self)
        self.draw_rectangle_checkbox.setText(
            "Dessiner la zone à extraire sur la carte : "
        )
        self.draw_rectangle_checkbox.setChecked(True)
        extent_check_group.addButton(self.draw_rectangle_checkbox)
        layout.addWidget(self.draw_rectangle_checkbox, 0, 0)

        self.select_layer_combo_box = QgsMapLayerComboBox(self)
        self.select_layer_combo_box.setEnabled(False)
        # self.select_layer_combo_box.setGeometry(30, 120, 150, 30)
        layout.addWidget(self.select_layer_combo_box, 1, 2)

        self.select_layer_checkbox = QCheckBox(self)
        self.select_layer_checkbox.setText(
            "Utiliser l'emprise d'une couche pour l'extraction : "
        )
        self.select_layer_checkbox.setChecked(False)
        extent_check_group.addButton(self.select_layer_checkbox)
        layout.addWidget(self.select_layer_checkbox, 1, 0)

        select_data_to_extract_label = QLabel(self)
        select_data_to_extract_label.setText("Données à extraire de la BD TOPO®")
        layout.addWidget(select_data_to_extract_label, 2, 0)
        print(self.getcapabilities.service_layers)

        self.button_box = QDialogButtonBox(self)
        self.button_box.setEnabled(False)
        self.button_box.setGeometry(30, 340, 341, 32)
        self.button_box.addButton("Ok", QDialogButtonBox.AcceptRole)
        self.button_box.addButton("Cancel", QDialogButtonBox.RejectRole)
        layout.addWidget(self.button_box, 3, 2)
        self.button_box.accepted.connect(self.accept)
        self.button_box.rejected.connect(self.reject)
        self.accepted.connect(self.get_result)
        self.rejected.connect(self.disconnect)
        self.rectangle_tool.signal.connect(self.activate_window)
        self.setLayout(layout)

        self.draw_rectangle_checkbox.stateChanged.connect(
            self.draw_rectangle_button.setEnabled
        )
        self.draw_rectangle_checkbox.stateChanged.connect(
            self.select_layer_combo_box.setDisabled
        )
        self.draw_rectangle_checkbox.stateChanged.connect(self.button_box.setDisabled)

        self.select_layer_checkbox.stateChanged.connect(
            self.select_layer_combo_box.setEnabled
        )
        self.select_layer_checkbox.stateChanged.connect(
            self.draw_rectangle_button.setDisabled
        )
        self.select_layer_checkbox.stateChanged.connect(self.button_box.setEnabled)
        self.select_layer_checkbox.stateChanged.connect(self.erase_rubber_band)

    def get_result(self):
        if self.draw_rectangle_checkbox.isChecked():
            self.erase_rubber_band()
            self.canvas.unsetMapTool(self.rectangle_tool)
            self.extent = self.transform_crs(self.rectangle_tool.rectangle())
        else:
            self.layer = self.select_layer_combo_box.currentLayer()
            self.crs = self.layer.crs()
            self.extent = self.transform_crs(self.layer.extent())

    def transform_crs(self, rectangle):
        geom = QgsGeometry().fromRect(rectangle)
        geom.transform(QgsCoordinateTransform(self.crs, self.new_crs, self.project))
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
        self.canvas.setMapTool(self.rectangle_tool)

    def activate_window(self):
        self.activateWindow()
        self.button_box.setEnabled(True)


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
