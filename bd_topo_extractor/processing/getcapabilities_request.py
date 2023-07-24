import re
import requests
from qgis.core import QgsRectangle


class GetCapabilitiesRequest:
    """Get multiples informations from a getcapabilities request.
    List all layers available, get the maximal extent of all the Wfs' data."""

    def __init__(self, url=None):
        self.url = url
        (
            self.service_layers,
            self.service_schema,
            self.max_bounding_box,
        ) = self.list_layers()

    def list_layers(self):
        # Use regex to find the informations.
        file = requests.get(
            "{url}?service=wfs&request=GetCapabilities".format(url=self.url)
        )
        data = file.text
        name_string = "<Name>(.+?)</Name><Title>"
        extent_1_string = "<ows:LowerCorner>([+-]?\d+(?:\.\d+)?)"
        extent_2_string = "([+-]?\d+(?:\.\d+)?)</ows:LowerCorner>"
        extent_3_string = "<ows:UpperCorner>([+-]?\d+(?:\.\d+)?)"
        extent_4_string = "([+-]?\d+(?:\.\d+)?)</ows:UpperCorner>"
        extent_1 = None
        extent_2 = None
        extent_3 = None
        extent_4 = None
        layers = []
        for word in data.split():
            extent_1_re = re.search(extent_1_string, word)
            extent_2_re = re.search(extent_2_string, word)
            extent_3_re = re.search(extent_3_string, word)
            extent_4_re = re.search(extent_4_string, word)
            if extent_1_re is not None:
                if extent_1 is None:
                    extent_1 = float(extent_1_re.group(1))
                else:
                    if float(extent_1_re.group(1)) < float(extent_1):
                        extent_1 = float(extent_1_re.group(1))
            if extent_2_re is not None:
                if extent_2 is None:
                    extent_2 = float(extent_2_re.group(1))
                else:
                    if float(extent_2_re.group(1)) < float(extent_2):
                        extent_2 = float(extent_2_re.group(1))
            if extent_3_re is not None:
                if extent_3 is None:
                    extent_3 = float(extent_3_re.group(1))
                else:
                    if float(extent_3_re.group(1)) > float(extent_3):
                        extent_3 = float(extent_3_re.group(1))
            if extent_4_re is not None:
                if extent_4 is None:
                    extent_4 = float(extent_4_re.group(1))
                else:
                    if float(extent_4_re.group(1)) > float(extent_4):
                        extent_4 = float(extent_4_re.group(1))

            layer = re.search(name_string, word)
            if layer is not None:
                list_layer_name = layer.group(1).split(":")
                schema = list_layer_name[0]
                list_layer_name.pop(0)
                layer_name = ":".join(list_layer_name)
                layers.append(layer_name)

        max_bounding_box = QgsRectangle()
        max_bounding_box.setXMinimum(float(extent_1))
        max_bounding_box.setYMinimum(float(extent_2))
        max_bounding_box.setXMaximum(float(extent_3))
        max_bounding_box.setYMaximum(float(extent_4))

        return layers, schema, max_bounding_box
