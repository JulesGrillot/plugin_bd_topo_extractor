import re
import requests


class GetCapabilitiesRequest:
    def __init__(self, url=None):
        self.url = url
        self.service_layers = self.list_layers()

    def list_layers(self):
        file = requests.get(
            "{url}?service=wfs&version=2.0.0&request=GetCapabilities".format(
                url=self.url
            )
        )
        data = file.text
        string = "<Name>(.+?)</Name><Title>"
        layers = []
        for word in data.split():
            layer = re.search(string, word)
            if layer is not None:
                list_layer_name = layer.group(1).split(":")
                list_layer_name.pop(0)
                layer_name = ":".join(list_layer_name)
                layers.append(layer_name)
        return layers
