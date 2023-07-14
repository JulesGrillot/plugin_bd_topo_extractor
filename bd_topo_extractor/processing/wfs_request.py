from urllib import request
from qgis.core import (
    QgsVectorLayer,
    QgsProject,
    QgsDataSourceUri,
    QgsGeometry,
    QgsFeature,
    QgsVectorFileWriter,
    QgsWkbTypes,
    QgsCoordinateReferenceSystem,
    QgsRectangle,
)
from qgis.gui import QgisInterface
import processing
import os.path
from bd_topo_extractor.__about__ import (
    __title__,
)


class WfsRequest:
    def __init__(
        self,
        project: QgsProject,
        iface: QgisInterface,
        url: str,
        data: str,
        crs: QgsCoordinateReferenceSystem,
        boundingbox: QgsRectangle,
        path: str,
        schema: str,
        geom: str,
        format: str,
        error: list,
        good: list,
    ):
        """Constructor.
        :param 
        project: The current QGIS project instance
        iface: An interface instance that will be passed to this class which \
        provides the hook by which you can manipulate the QGIS application at run time.
        url: The wfs url
        data: The layer to extract from the wfs service
        crs: The coordinate reference system for the output layer
        boundingbox: The bounding box used to filter the data from the wfs service
        path: Ouput path to save layers
        schema: Name of the data's schema
        geom: Check if the data needs to be clipped by the extent
        format: Output layer format extension
        error: List of data not in the extent
        good: List of data extracted from the extent
        """

        self.project = project
        self.iface = iface
        self.service_url = url
        self.uri = QgsDataSourceUri()
        self.data = data
        self.crs = crs
        self.boundingbox = boundingbox
        self.path = path
        self.schema = schema
        self.format = format
        self.geom = geom
        self.no_data = error
        self.exported = good

        self.final_layer = None

        # self.build_url()
        # self.request_data()
        # self.create_layer()

        # self.build_url_v2()
        # self.create_layer_v2()

        self.build_url_v2()
        self.create_layer_v3()

    def build_url_v2(self):
        """
        Build the data source url to fetch features intersecting the extent
        """
        self.uri.setParam("url", self.service_url)
        self.uri.setParam("service", "wfs")
        self.uri.setParam("version", "auto")
        self.uri.setParam("request", "GetFeature")
        self.uri.setParam("typename", self.data)
        self.uri.setParam("title", self.data)
        self.uri.setParam("table", "")
        self.uri.setParam("srsName", "EPSG:" + str("4326"))
        sql = "SELECT * FROM \"{data}\" as t1 WHERE ST_Intersects(t1.geometrie, ST_GeometryFromText('Polygon (({xmin} {ymin}, {xmax} {ymin}, {xmax} {ymax}, {xmin} {ymax}, {xmin} {ymin}))', 4326))".format(
            data=self.data,
            ymin=str(self.boundingbox.yMinimum()),
            xmin=str(self.boundingbox.xMinimum()),
            ymax=str(self.boundingbox.yMaximum()),
            xmax=str(self.boundingbox.xMaximum()),
        )
        self.uri.setSql(sql)

    def create_layer_v3(self):
        """
        Create a layer based on the WFS request.
        If needed, the layer will be clipped with the selected extent.
        The layer is then saved to the slected format and the selected CRS.
        """
        # Check if the WFS request has any features
        wfs_layer = QgsVectorLayer(self.uri.uri(False), self.data, "WFS")
        if wfs_layer.featureCount() > 0:
            if self.path:
                # Creation of the output path used for SHP and GeoJSON.
                output = (
                    self.path
                    + "/"
                    + str(self.data.split(self.schema + ":")[1])
                    + "."
                    + str(self.format)
                )
            else:
                # Output for a memory layer.
                output = "memory:" + str(self.data.split(self.schema + ":")[1])

            # Check geometry type to create a memory layer to get all features from the WFS request.
            geom_type = QgsWkbTypes.geometryDisplayString(
                wfs_layer.getFeature(1).geometry().type()
            )
            if geom_type == "Line":
                geom_type = "Linestring"
            # Create a memory layer
            new_layer = QgsVectorLayer(
                geom_type + "?crs=epsg:4326",
                str(self.data.split(self.schema + ":")[1]),
                "memory",
            )
            # Add all features to the memory layer
            new_layer.startEditing()
            for feature in wfs_layer.getFeatures():
                new_layer.dataProvider().addFeatures([feature])
                new_layer.updateExtents()
            new_layer.commitChanges()
            new_layer.triggerRepaint()

            # Check if the layer needs to be clipped with the extent.
            if self.geom == "within":
                # Creation of a layer with the extent.
                clipping_layer = QgsVectorLayer(
                    "Polygon?crs=epsg:4326", "clipper", "memory"
                )
                clipping_layer.startEditing()
                new_geom = QgsGeometry().fromRect(self.boundingbox)
                new_feature = QgsFeature(clipping_layer.fields())
                new_feature.setGeometry(new_geom)
                clipping_layer.dataProvider().addFeatures([new_feature])
                clipping_layer.updateExtents()
                clipping_layer.commitChanges()
                clipping_layer.triggerRepaint()

                # Clip the layer with the extent.
                clip_parameters = {
                    "INPUT": new_layer,
                    "OVERLAY": clipping_layer,
                    "OUTPUT": "memory:" + str(self.data.split(self.schema + ":")[1]),
                }
                new_layer = processing.run("native:clip", clip_parameters)["OUTPUT"]
            if self.path:
                # Specific procedure if the layer must be saved as a GeoPackage.
                # Every data are saved in the same GeoPackage.
                if self.format == "gpkg":
                    driver = "GPKG"
                    context = self.project.instance().transformContext()
                    options = QgsVectorFileWriter.SaveVectorOptions()
                    # Check if the GeoPackage already exists, to know if it's need to be created or not
                    if os.path.isfile(self.path + "/" + "bd_topo_extract.gpkg"):
                        options.actionOnExistingFile = (
                            QgsVectorFileWriter.CreateOrOverwriteLayer
                        )
                    options.layerName = str(self.data.split(self.schema + ":")[1])
                    options.fileEncoding = new_layer.dataProvider().encoding()
                    options.driverName = driver
                    QgsVectorFileWriter.writeAsVectorFormatV2(
                        new_layer,
                        self.path + "/" + "bd_topo_extract.gpkg",
                        context,
                        options,
                    )
                    self.final_layer = self.path + "/" + "bd_topo_extract.gpkg"
                else:
                    # For every other format, the procedure is the same.
                    if self.format == "shp":
                        driver = "ESRI Shapefile"
                    elif self.format == "geojson":
                        driver = "GeoJSON"
                    QgsVectorFileWriter.writeAsVectorFormat(
                        new_layer,
                        output,
                        "utf-8",
                        self.crs,
                        driver,
                    )
                    self.final_layer = QgsVectorLayer(
                        output,
                        str(self.data.split(self.schema + ":")[1]),
                        "ogr",
                    )
            else:
                # Reproject the memory layer to the right crs
                reproject_parameter = {
                    "INPUT": new_layer,
                    "TARGET_CRS": self.crs,
                    "OUTPUT": "memory:" + str(self.data.split(self.schema + ":")[1]),
                }
                self.final_layer = processing.run(
                    "native:reprojectlayer", reproject_parameter
                )["OUTPUT"]
            self.exported.append(self.data)
        else:
            # If the WFS request has no features the data name is added to the no_data list.
            self.no_data.append(self.data)

    def build_url(self):
        # Wfs url
        self.url = (
            "{service_url}?VERSION=2.0.0&TYPENAMES={data}&SRSNAME=EPSG:{crs}&BBOX={ymin},{xmin},{ymax},"
            "{xmax}&request=GetFeature&outputFormat=json".format(
                service_url=self.service_url,
                data=self.data,
                crs="4326",
                ymin=str(self.boundingbox.yMinimum()),
                xmin=str(self.boundingbox.xMinimum()),
                ymax=str(self.boundingbox.yMaximum()),
                xmax=str(self.boundingbox.xMaximum()),
            )
        )

    def request_data(self):
        # Request
        req = request.Request(self.url, method="POST")
        r = request.urlopen(req)
        self.content = r.read().decode("utf-8")

    def create_layer(self):
        # Add Layer
        layer = QgsVectorLayer(self.content, self.data, "ogr")
        QgsProject.instance().addMapLayer(layer)

    def create_layer_v2(self):
        layer = QgsVectorLayer(self.uri.uri(False), self.data, "WFS")
        QgsProject.instance().addMapLayer(layer)
        layer.selectAll()
        if layer.selectedFeatureCount() > 0:
            if self.path:
                output = (
                    self.path
                    + "/"
                    + str(self.data.split(self.schema + ":")[1])
                    + ".shp"
                )
            else:
                output = "memory:" + str(self.data.split(self.schema + ":")[1])
            if self.geom == "within":
                clipping_layer = QgsVectorLayer(
                    "Polygon?crs=epsg:4326", "clipper", "memory"
                )
                clipping_layer.startEditing()
                new_geom = QgsGeometry().fromRect(self.boundingbox)
                new_feature = QgsFeature(clipping_layer.fields())
                new_feature.setGeometry(new_geom)
                clipping_layer.dataProvider().addFeatures([new_feature])
                clipping_layer.updateExtents()
                clipping_layer.commitChanges()
                clipping_layer.triggerRepaint()

                clip_parameters = {
                    "INPUT": layer,
                    "OVERLAY": clipping_layer,
                    "OUTPUT": output,
                }
                save_features = processing.run("native:clip", clip_parameters)
            else:
                save_features_param = {"INPUT": layer, "OUTPUT": output}
                save_features = processing.run(
                    "native:saveselectedfeatures", save_features_param
                )
            if self.path:
                self.iface.addVectorLayer(
                    save_features["OUTPUT"],
                    str(self.data.split(self.schema + ":")[0]),
                    "ogr",
                )
            else:
                QgsProject.instance().addMapLayer(save_features["OUTPUT"])
