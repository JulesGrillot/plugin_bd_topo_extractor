from urllib import request
from qgis.core import QgsVectorLayer, QgsProject


class WfsRequest:
    def __init__(self, url=None, layer=None, crs=None, boundingbox=None):
        # Service url
        self.service_url = url
        # Data name
        self.data = layer
        # Coordinate System
        self.crs = crs
        # Rectangle coordinate
        self.boundingbox = boundingbox

        self.build_url()
        self.request_data()
        self.add_layer()

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

    def request_data(self):
        # Request
        print(self.url)
        req = request.Request(self.url, method="POST")
        r = request.urlopen(req)
        self.content = r.read().decode("utf-8")

    def add_layer(self):
        # Add Layer
        layer = QgsVectorLayer(self.content, self.data, "ogr")
        QgsProject.instance().addMapLayer(layer)
