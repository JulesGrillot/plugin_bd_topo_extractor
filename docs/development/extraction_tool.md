# Fork the project

You can use this plugin as your own WFS service extractor.
> **Minimal modification:** If you just want an awesome WFS extractor, the only thing you need to do is change the values in `metadata.txt` to fit your service.
> **Maximum modification:** If you want to create a complete tool, with logo, documentation and other translation.


## Minimum modification

The `metadata.txt` file is located in the `bd_topo_extractor` folder.
The values specified in this file concern basic informations on the plugin:
- Name
- Description
- Version
- QGIS compatible versions
- Author

But also some specific informations on the WFS service and the data targeted inside the service :
- WFS URL
- Schema name
- Geometry column name
- Crs of the WFS
- Methada url
- Logo url

Modifying those will not change the way the plugin works but all the links and text specific to the BD TOPO®.

## Maximum modification

