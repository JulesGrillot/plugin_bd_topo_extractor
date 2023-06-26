from urllib import request
from qgis.core import QgsVectorLayer, QgsProject


class WfsRequest:
    def __init__(self, url=None, layer=None, crs=None, boundingbox=None):
        super().__init__(url, layer, crs, boundingbox)
        # Service url
        self.service_url = url
        # Data name
        self.data = layer
        # Coordinate System
        self.crs = crs
        # Rectangle coordinate
        self.boundingbox = boundingbox  # [2.0, 46.8, 7.1, 44.1]

    def build_url(self):
        # Wfs url
        self.url = (
            "{service_url}?VERSION=2.0.0&TYPENAMES={data}&SRSNAME=EPSG:{crs}&BBOX={xmax},{xmin},{ymax},"
            "{ymin}&request=GetFeature&outputFormat=json".format(
                service_url=self.service_url,
                data=self.data,
                crs=self.crs,
                xmax=str(self.boundingbox[3]),
                xmin=str(self.boundingbox[0]),
                ymax=str(self.boundingbox[1]),
                ymin=str(self.boundingbox[2]),
            )
        )

    def request_data(self):
        # Request
        req = request.Request(self.url, method="POST")
        r = request.urlopen(req)
        self.content = r.read().decode("utf-8")

    def add_layer(self):
        # Add Layer
        layer = QgsVectorLayer(self.content, self.data, "ogr")
        QgsProject.instance().addMapLayer(layer)
