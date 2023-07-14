from PyQt5.QtWidgets import (
    QDialog,
    QVBoxLayout,
)

# project
from bd_topo_extractor.__about__ import (
    DIR_PLUGIN_ROOT,
    __icon_path__,
    __title__,
    __uri_homepage__,
    __uri_tracker__,
    __version__,
)


class ResultLogger(QDialog):
    def __init__(self, parent=None, good_result=None, bad_result=None, no_result=None):
        """Constructor."""
        super(ResultLogger, self).__init__(parent)
        self.setObjectName("{}".format(__title__))

        self.setWindowTitle("Log des résultats")

        self.layout = QVBoxLayout()
