# BD Topo Extractor - QGIS Plugin

[![Code style: black](https://img.shields.io/badge/code%20style-black-000000.svg)](https://github.com/psf/black)
[![Imports: isort](https://img.shields.io/badge/%20imports-isort-%231674b1?style=flat&labelColor=ef8336)](https://pycqa.github.io/isort/)
[![pre-commit](https://img.shields.io/badge/pre--commit-enabled-brightgreen?logo=pre-commit&logoColor=white)](https://github.com/pre-commit/pre-commit)




## Generated options

### Plugin

| Cookiecutter option | Picked value |
| :-- | :--: |
| Plugin name | BD Topo Extractor |
| Plugin name slugified | bd_topo_extractor |
| Plugin name class (used in code) | BdTopoExtractor |
| Plugin category | Vector |
| Plugin description short | It allows the user to extract elements from IGN's BD Topo with an extent or inside a layer as reference. |
| Plugin description long | It allows the user to extract elements from IGN's BD Topo with an extent or inside a layer as reference. You cans select wich element you want to extract. |
| Plugin tags | vector |
| Plugin icon | default_icon.png |
| Plugin with processing provider | yes |
| Author name | Jules GRILLOT |
| Author organization | Company |
| Author email | jules.grillot@gmail.com |
| Minimum QGIS version | 3.10 |
| Maximum QGIS version | 3.99 |
| Git repository URL | https://github.com/JulesGrillot/bd_topo_extractor |
| Git default branch | main |
| License | None |
| Python linter | None |
| CI/CD platform | GitHub |
| IDE | VSCode |

### Tooling

This project is configured with the following tools:

- [Black](https://black.readthedocs.io/en/stable/) to format the code without any existential question
- [iSort](https://pycqa.github.io/isort/) to sort the Python imports

Code rules are enforced with [pre-commit](https://pre-commit.com/) hooks.

See also: [contribution guidelines](CONTRIBUTING.md).

## CI/CD

Plugin is linted, tested, packaged and published with GitHub.

If you mean to deploy it to the [official QGIS plugins repository](https://plugins.qgis.org/), remember to set your OSGeo credentials (`OSGEO_USER_NAME` and `OSGEO_USER_PASSWORD`) as environment variables in your CI/CD tool. 


### Documentation

The documentation is generated using Sphinx and is automatically generated through the CI and published on Pages.

- homepage: <https://github.com/JulesGrillot/bd_topo_extractor>
- repository: <https://github.com/JulesGrillot/bd_topo_extractor>
- tracker: <https://github.com/JulesGrillot/bd_topo_extractor/issues>

----

## Next steps

### Set up development environment

> Typical commands on Linux (Ubuntu).

1. If you don't pick the `git init` option, initialize your local repository:

    ```sh
    git init
    ```

1. Follow the [embedded documentation to set up your development environment](./docs/development/environment.md)
1. Add all files to git index to prepare initial commit:

    ```sh
    git add -A
    ```

1. Run the git hooks to ensure that everything runs OK and to start developing on quality standards:

    ```sh
    pre-commit run
    ```

### Try to build documentation locally

1. Have a look to the [plugin's metadata.txt file](bd_topo_extractor/metadata.txt): review it, complete it or fix it if needed (URLs, etc.).
1. Follow the [embedded documentation to build plugin documentation locally](./docs/development/environment.md)

----

## License

Distributed under the terms of the [`None` license](LICENSE).
