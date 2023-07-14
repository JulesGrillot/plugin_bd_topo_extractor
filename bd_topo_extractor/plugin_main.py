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
)
from qgis.gui import QgisInterface
from qgis.PyQt.QtCore import QCoreApplication, QLocale, QTranslator, QUrl
from qgis.PyQt.QtGui import QDesktopServices, QIcon
from qgis.PyQt.QtWidgets import QAction

# project
from bd_topo_extractor.__about__ import (
    DIR_PLUGIN_ROOT,
    __icon_path__,
    __title__,
    __uri_homepage__,
    __wfs_uri__,
)
from bd_topo_extractor.gui.dlg_settings import PlgOptionsFactory

from bd_topo_extractor.gui.dlg_settings import BdTopoExtractorDialog

from bd_topo_extractor.processing import BdTopoExtractorProvider

from bd_topo_extractor.processing import WfsRequest

from bd_topo_extractor.toolbelt import PlgLogger

# ############################################################################
# ########## Classes ###############
# ##################################


class BdTopoExtractorPlugin:
    def __init__(self, iface: QgisInterface):
        """Constructor.

        :param iface: An interface instance that will be passed to this class which \
        provides the hook by which you can manipulate the QGIS application at run time.
        :type iface: QgsInterface
        """
        self.iface = iface
        self.project = QgsProject.instance()
        self.log = PlgLogger().log
        self.provider = None
        self.pluginIsActive = False
        self.url = __wfs_uri__

        # translation
        # initialize the locale
        self.locale: str = QgsSettings().value("locale/userLocale", QLocale().name())[
            0:2
        ]
        locale_path: Path = (
            DIR_PLUGIN_ROOT / f"resources/i18n/{__title__.lower()}_{self.locale}.qm"
        )
        self.log(message=f"Translation: {self.locale}, {locale_path}", log_level=4)
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
            self.tr(__title__),
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
        self.iface.addPluginToMenu(__title__, self.action_launch)
        self.iface.addPluginToMenu(__title__, self.action_settings)
        self.iface.addPluginToMenu(__title__, self.action_help)

        # -- Processing
        self.initProcessing()

        # -- Help menu

        # documentation
        self.iface.pluginHelpMenu().addSeparator()
        self.action_help_plugin_menu_documentation = QAction(
            QIcon(str(__icon_path__)),
            f"{__title__} - Documentation",
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
        self.iface.removePluginMenu(__title__, self.action_launch)
        self.iface.removeToolBarIcon(self.action_launch)
        self.iface.removePluginMenu(__title__, self.action_help)
        self.iface.removePluginMenu(__title__, self.action_settings)

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

        :raises Exception: if there is no item in the feed
        """
        try:
            self.log(
                message=self.tr("Everything ran OK."),
                log_level=3,
                push=False,
            )
        except Exception as err:
            self.log(
                message=self.tr("Houston, we've got a problem: {}".format(err)),
                log_level=2,
                push=True,
            )
        if not self.pluginIsActive:
            self.pluginIsActive = True
            self.dlg = BdTopoExtractorDialog(None, self.iface, self.project, self.url)
            self.dlg.show()
            if len(self.project.instance().mapLayers()) == 0:
                # Type of WMTS, url and name
                type = "xyz"
                url = "http://tile.openstreetmap.org/{z}/{x}/{y}.png"
                name = "OpenStreetMap"

                # Uri's creation based on type and url
                uri = "type=" + type + "&url=" + url

                # Add WMTS to the QgsProject
                self.iface.addRasterLayer(uri, name, "wms")
                # DOESNT WORK
                # zoomed_extent = self.dlg.transform_crs(
                #     self.dlg.getcapabilities.max_bounding_box,
                #     QgsCoordinateReferenceSystem("EPSG:4326"),
                # )
                # self.iface.mapCanvas().setExtent(zoomed_extent)
                # self.iface.mapCanvas().refresh()
            result = self.dlg.exec_()
            if result:
                self.processing()
            else:
                self.pluginIsActive = False
        else:
            self.dlg.activateWindow()

    def processing(self):
        self.dlg.show()
        today = datetime.datetime.now()
        year = today.year
        month = today.month
        day = today.day
        hour = today.hour
        minute = today.minute
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
            path = self.dlg.line_edit_output_folder.text() + "/" + str(folder)
            if not os.path.exists(path):
                os.makedirs(path)
        else:
            path = None

        if self.dlg.add_to_project_checkbox.isChecked():
            self.project.instance().layerTreeRoot().insertGroup(0, folder)
            group = self.project.instance().layerTreeRoot().findGroup(folder)
        for button in self.dlg.geom_button_group.buttons():
            if button.isChecked():
                geom = button.accessibleName()

        max = 0
        for button in self.dlg.layer_check_group.buttons():
            if button.isChecked():
                max = max + 1
        self.dlg.thread.set_max(max)
        n = 0
        error_list = []
        good_list = []
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
                    geom=geom,
                    format=self.dlg.output_format(),
                    error=error_list,
                    good=good_list,
                )
                if request.final_layer and self.dlg.add_to_project_checkbox.isChecked():
                    if (
                        self.dlg.output_format() != "gpkg"
                        or self.dlg.output_format() == "gpkg"
                        and not self.dlg.save_result_checkbox.isChecked()
                    ):
                        self.project.instance().addMapLayer(request.final_layer, False)
                        group.addLayer(request.final_layer)
                n = n + 1
                self.dlg.thread.add_one()
                self.dlg.select_progress_bar_label.setText(
                    "Données téléchargées : " + str(n) + "/" + str(max)
                )
        if (
            self.dlg.output_format() == "gpkg"
            and self.dlg.save_result_checkbox.isChecked()
        ):
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

        print(error_list)
        print(good_list)
        print("Nb d'erreurs : " + str(len(error_list)))
        print("Nb de données : " + str(len(good_list)))
        print("Sur : " + str(n))
        self.dlg.thread.finish()
        self.dlg.select_progress_bar_label.setText("")
        self.dlg.thread.reset_value()
        self.dlg.close()
        self.pluginIsActive = False
        # self.pluginIsActive = None
