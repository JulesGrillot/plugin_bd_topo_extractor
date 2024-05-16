#! python3  # noqa: E265

"""
    Main plugin module.
"""

# standard
from functools import partial
from pathlib import Path
import datetime
import os.path

# PyQGIS
from qgis.core import (
    QgsApplication,
    QgsSettings,
    QgsProject,
    QgsVectorLayer,
    QgsCoordinateReferenceSystem,
)
from qgis.gui import QgisInterface
from qgis.PyQt.QtCore import QCoreApplication, QLocale, QTranslator, QUrl
from qgis.PyQt.QtGui import QDesktopServices, QIcon
from qgis.PyQt.QtWidgets import QAction, QMessageBox
from PyQt5.QtCore import pyqtSignal, QObject
from PyQt5.QtNetwork import (
    QNetworkRequest,
    QNetworkReply,
    QNetworkAccessManager,
)

# project
from bd_topo_extractor.__about__ import (
    DIR_PLUGIN_ROOT,
    __icon_path__,
    __title__,
    __uri_homepage__,
    __wfs_uri__,
    __wfs_name__,
    __uri_tracker__,
)
from bd_topo_extractor.gui.dlg_settings import PlgOptionsFactory

from bd_topo_extractor.gui.dlg_main import BdTopoExtractorDialog

from bd_topo_extractor.processing import BdTopoExtractorProvider

from bd_topo_extractor.processing import WfsRequest

from bd_topo_extractor.toolbelt import PlgLogger

# ############################################################################
# ########## Classes ###############
# ##################################


class BdTopoExtractorPlugin:
    def __init__(self, iface: QgisInterface):
        """Constructor.

        :param iface: An interface instance \
            that will be passed to this class which \
        provides the hook by which you can manipulate \
            the QGIS application at run time.
        :type iface: QgsInterface
        """
        self.iface = iface
        self.project = QgsProject.instance()
        self.manager = QNetworkAccessManager()
        self.log = PlgLogger().log
        self.provider = None
        self.pluginIsActive = False
        self.url = __wfs_uri__
        self.action_launch = None

        # translation
        # initialize the locale
        self.locale: str = QgsSettings().value(
            "locale/userLocale", QLocale().name())[0:2]
        locale_path: Path = (
            DIR_PLUGIN_ROOT / f"resources/i18n/{__title__.lower()}_{self.locale}.qm"
        )
        self.log(
            message=f"Translation: {self.locale}, {locale_path}", log_level=4
        )
        if locale_path.exists():
            self.translator = QTranslator()
            self.translator.load(str(locale_path.resolve()))
            QCoreApplication.installTranslator(self.translator)

    def initGui(self):
        """Set up plugin UI elements."""

        # settings page within the QGIS preferences menu
        self.options_factory = PlgOptionsFactory()
        self.iface.registerOptionsWidgetFactory(self.options_factory)

        # -- Actions
        self.action_launch = QAction(
            QIcon(str(__icon_path__)),
            self.tr("{} Extractor".format(__wfs_name__)),
            self.iface.mainWindow(),
        )
        self.iface.addToolBarIcon(self.action_launch)
        self.action_launch.triggered.connect(lambda: self.run())
        self.action_help = QAction(
            QgsApplication.getThemeIcon("mActionHelpContents.svg"),
            self.tr("Help"),
            self.iface.mainWindow(),
        )
        self.action_help.triggered.connect(
            partial(QDesktopServices.openUrl, QUrl(__uri_homepage__))
        )

        self.action_settings = QAction(
            QgsApplication.getThemeIcon("console/iconSettingsConsole.svg"),
            self.tr("Settings"),
            self.iface.mainWindow(),
        )
        self.action_settings.triggered.connect(
            lambda: self.iface.showOptionsDialog(
                currentPage="mOptionsPage{}".format(__title__)
            )
        )

        # -- Menu
        self.iface.addPluginToMenu(
            "{} Extractor".format(__wfs_name__), self.action_launch
        )
        self.iface.addPluginToMenu(
            "{} Extractor".format(__wfs_name__), self.action_settings
        )
        self.iface.addPluginToMenu(
            "{} Extractor".format(__wfs_name__), self.action_help
        )

        # -- Processing
        self.initProcessing()

        # -- Help menu

        # documentation
        self.iface.pluginHelpMenu().addSeparator()
        self.action_help_plugin_menu_documentation = QAction(
            QIcon(str(__icon_path__)),
            f"{__wfs_name__} Extractor - Documentation",
            self.iface.mainWindow(),
        )
        self.action_help_plugin_menu_documentation.triggered.connect(
            partial(QDesktopServices.openUrl, QUrl(__uri_homepage__))
        )

        self.iface.pluginHelpMenu().addAction(
            self.action_help_plugin_menu_documentation
        )

    def initProcessing(self):
        self.provider = BdTopoExtractorProvider()
        QgsApplication.processingRegistry().addProvider(self.provider)

    def tr(self, message: str) -> str:
        """Get the translation for a string using Qt translation API.

        :param message: string to be translated.
        :type message: str

        :returns: Translated version of message.
        :rtype: str
        """
        return QCoreApplication.translate(self.__class__.__name__, message)

    def unload(self):
        """Cleans up when plugin is disabled/uninstalled."""
        # -- Clean up menu
        self.iface.removePluginMenu(
            "{} Extractor".format(__wfs_name__), self.action_launch
        )
        self.iface.removeToolBarIcon(self.action_launch)
        self.iface.removePluginMenu(
            "{} Extractor".format(__wfs_name__), self.action_help
        )
        self.iface.removePluginMenu(
            "{} Extractor".format(__wfs_name__), self.action_settings
        )

        # -- Clean up preferences panel in QGIS settings
        self.iface.unregisterOptionsWidgetFactory(self.options_factory)

        # -- Unregister processing
        QgsApplication.processingRegistry().removeProvider(self.provider)

        # remove from QGIS help/extensions menu
        if self.action_help_plugin_menu_documentation:
            self.iface.pluginHelpMenu().removeAction(
                self.action_help_plugin_menu_documentation
            )

        # remove actions
        del self.action_launch
        del self.action_settings
        del self.action_help
        self.pluginIsActive = False

    def run(self):
        """Main process.

        Try to connect to internet, if successfull, the dialog appear.
        Else an error message appear.
        """
        self.internet_checker = InternetChecker(None, self.manager)
        self.internet_checker.finished.connect(self.handle_finished)
        self.internet_checker.ping("https://github.com/")

    def handle_finished(self):
        # Check if plugin is already launched
        if not self.pluginIsActive:
            self.pluginIsActive = True
            # Open Dialog
            self.dlg = BdTopoExtractorDialog(
                self.project, self.iface, self.url, self.manager)
            self.dlg.show()
            # If there is no layers, an OSM layer is added
            # to simplify the rectangle drawing
            if len(self.project.instance().mapLayers()) == 0:
                
                # Type of WMTS, url and name
                type = "xyz"
                url = "http://tile.openstreetmap.org/{z}/{x}/{y}.png"
                name = "OpenStreetMap"
                uri = "type=" + type + "&url=" + url

                # Add WMTS to the QgsProject
                self.iface.addRasterLayer(uri, name, "wms")
            result = self.dlg.exec_()
            if result:
                # If dialog is accepted, "OK" is pressed, the process is launch
                self.processing()
            else:
                # Else the dialog close and plugin can be launched again
                self.pluginIsActive = False
        # If the plugin is already launched, clicking on the plugin icon will
        # put back the window on top
        else:
            self.dlg.activateWindow()

    def processing(self):
        """Processing chain if the dialog is accepted
        Depending on user's choices, a folder can be created, the wfs is
        requested and the layers in the specific extent can be added to
        the QGIS project

        """
        # Show the dialog back for the ProgressBar
        self.dlg.show()

        # Creation of the folder name
        today = datetime.datetime.now()
        year = today.year
        month = today.strftime("%m")
        day = today.strftime("%d")
        hour = today.strftime("%H")
        minute = today.strftime("%M")
        folder = (
            "BDTopoExport_"
            + str(year)
            + str(month)
            + str(day)
            + "_"
            + str(hour)
            + str(minute)
        )
        if self.dlg.save_result_checkbox.isChecked():
            # Creation of the folder
            path = self.dlg.line_edit_output_folder.text() + "/" + str(folder)
            if not os.path.exists(path):
                os.makedirs(path)
        else:
            path = None

        # Creation of a group of layers to store the results of the request
        if self.dlg.add_to_project_checkbox.isChecked():
            self.project.instance().layerTreeRoot().insertGroup(0, folder)
            group = self.project.instance().layerTreeRoot().findGroup(folder)
        # Fetch if the results must be clipped or kept full
        for button in self.dlg.geom_button_group.buttons():
            if button.isChecked():
                result_geometry = button.accessibleName()
        # Fetch the number of data requested by the user
        max = 0
        for button in self.dlg.layer_check_group.buttons():
            if button.isChecked():
                max = max + 1
        # Set the ProgressBar
        self.dlg.thread.set_max(max)
        n = 0
        error_list = []
        good_list = []
        # Download the layer for every data asked by the user
        for button in self.dlg.layer_check_group.buttons():
            if button.isChecked():
                request = WfsRequest(
                    project=self.project,
                    iface=self.iface,
                    url=self.url,
                    data=button.accessibleName(),
                    crs=self.dlg.crs_selector.crs(),
                    boundingbox=self.dlg.extent,
                    path=path,
                    schema=self.dlg.schema,
                    geom=result_geometry,
                    format=self.dlg.output_format(),
                    error=error_list,
                    good=good_list,
                )
                # If a layer is created and needs to be added to the project
                if request.final_layer and self.dlg.add_to_project_checkbox.isChecked():
                    # If output format is a SHP or a GEOJSON or if the
                    # layers are not saved. Saved GPKG are processed
                    # differently.
                    if (
                        self.dlg.output_format() != "gpkg"
                        or self.dlg.output_format() == "gpkg"
                        and not self.dlg.save_result_checkbox.isChecked()
                    ):
                        self.project.instance().addMapLayer(
                            request.final_layer, False)
                        group.addLayer(request.final_layer)

                # Increase the ProgressBar value
                n = n + 1
                self.dlg.thread.add_one()
                self.dlg.select_progress_bar_label.setText(
                    self.tr("Downloaded data : " + str(n) + "/" + str(max))
                )
        # If the user wants to saved as GPKG
        if (
            self.dlg.output_format() == "gpkg"
            and self.dlg.save_result_checkbox.isChecked()
        ):
            # If a layer as been saved, the GPKG is opened and every layer are
            # added to the project
            if (len(good_list) / n) > 0:
                gpkg = QgsVectorLayer(request.final_layer, "", "ogr")
                layers = gpkg.dataProvider().subLayers()
                for layer in layers:
                    name = layer.split("!!::!!")[1]
                    uri = "%s|layername=%s" % (
                        request.final_layer,
                        name,
                    )
                    # Create layer
                    final_layer = QgsVectorLayer(uri, name, "ogr")
                    self.project.instance().addMapLayer(final_layer, False)
                    group.addLayer(final_layer)
        msg = QMessageBox()
        msg.information(
            None,
            self.tr("Informations"),
            self.tr("No data number : ")
            + str(len(error_list))
            + "\n"
            + self.tr("Data number : ")
            + str(len(good_list))
            + "\n"
            + self.tr("Total data : ")
            + str(n),
        )
        # Once it's finished, the ProgressBar is set back to 0
        self.dlg.thread.finish()
        self.dlg.select_progress_bar_label.setText("")
        self.dlg.thread.reset_value()
        self.dlg.close()
        self.pluginIsActive = False


class InternetChecker(QObject):
    """Constructor.

    Class wich is going to ping a website
    to know if the user is connected to internet.
    """

    finished = pyqtSignal()

    def __init__(self, parent=None, manager=None):
        super().__init__(parent)
        self._manager = manager
        self.manager.finished.connect(self.handle_finished)

    @property
    def manager(self):
        return self._manager

    @property
    def pending_ping(self):
        return self._pending_ping

    def ping(self, url):
        qrequest = QNetworkRequest(QUrl(url))
        self.manager.get(qrequest)

    def handle_finished(self, reply):
        if reply.error() != QNetworkReply.NoError:
            # If the user does not have an internet connexion,
            # the plugin does not launch.
            msg = QMessageBox()
            if reply.error() == 403:
                msg.critical(
                    None,
                    self.tr("Error"),
                    self.tr("IGN Services' are down."),
                )
            elif reply.error() == 3:
                msg.critical(
                    None,
                    self.tr("Error"),
                    self.tr("You are not connected to the Internet."),
                )
            else:
                msg.critical(
                    None,
                    self.tr("Error"),
                    self.tr("Code error : {code}\nGo to\n{tracker}\nto report the issue.".format(code=str(reply.error()), tracker=__uri_tracker__)),
                )
        else:
            self.finished.emit()
