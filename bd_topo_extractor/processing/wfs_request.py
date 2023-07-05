from urllib import request
from qgis.core import (
    QgsVectorLayer,
    QgsProject,
    QgsDataSourceUri,
    QgsGeometry,
    QgsFeature,
)
import processing


class WfsRequest:
    def __init__(
        self,
        iface=None,
        url=None,
        layer=None,
        crs=None,
        boundingbox=None,
        path=None,
        schema=None,
        geom=None,
    ):
        # QGIS Interface
        self.iface = iface
        # Service url
        self.service_url = url
        self.uri = QgsDataSourceUri()
        # Data name
        self.data = layer
        # Coordinate System
        self.crs = crs
        # Rectangle coordinate
        self.boundingbox = boundingbox
        # Output path
        self.path = path
        # Schema name
        self.schema = schema
        # Geom operation
        self.geom = geom

        # self.build_url()
        # self.request_data()
        # self.add_layer()

        self.build_url_v2()
        self.add_layer_v2()

    def build_url(self):
        # Wfs url
        self.url = (
            "{service_url}?VERSION=2.0.0&TYPENAMES={data}&SRSNAME=EPSG:{crs}&BBOX={ymin},{xmin},{ymax},"
            "{xmax}&request=GetFeature&outputFormat=json".format(
                service_url=self.service_url,
                data=self.data,
                crs=self.crs,
                ymin=str(self.boundingbox.yMinimum()),
                xmin=str(self.boundingbox.xMinimum()),
                ymax=str(self.boundingbox.yMaximum()),
                xmax=str(self.boundingbox.xMaximum()),
            )
        )

    def build_url_v2(self):
        self.uri.setParam("url", self.service_url)
        self.uri.setParam("service", "wfs")
        self.uri.setParam("version", "auto")
        self.uri.setParam("request", "GetFeature")
        self.uri.setParam("typename", self.data)
        self.uri.setParam("title", self.data)
        self.uri.setParam("table", "")
        self.uri.setParam("srsName", "EPSG:" + str(self.crs))
        sql = "SELECT * FROM \"{data}\" as t1 WHERE ST_Intersects(t1.geometrie, ST_GeometryFromText('Polygon (({xmin} {ymin}, {xmax} {ymin}, {xmax} {ymax}, {xmin} {ymax}, {xmin} {ymin}))', 4326))".format(
            data=self.data,
            ymin=str(self.boundingbox.yMinimum()),
            xmin=str(self.boundingbox.xMinimum()),
            ymax=str(self.boundingbox.yMaximum()),
            xmax=str(self.boundingbox.xMaximum()),
        )
        self.uri.setSql(sql)

    def request_data(self):
        # Request
        req = request.Request(self.url, method="POST")
        r = request.urlopen(req)
        self.content = r.read().decode("utf-8")

    def add_layer(self):
        # Add Layer
        layer = QgsVectorLayer(self.content, self.data, "ogr")
        QgsProject.instance().addMapLayer(layer)

    def add_layer_v2(self):
        layer = QgsVectorLayer(self.uri.uri(False), self.data, "WFS")
        layer.selectAll()
        if len(layer.selectedFeatureIds()) > 0:
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
