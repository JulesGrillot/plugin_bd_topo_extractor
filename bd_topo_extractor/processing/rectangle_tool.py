from qgis.core import (
    QgsCoordinateReferenceSystem,
    QgsCoordinateTransform,
    QgsDistanceArea,
    QgsGeometry,
    QgsPointXY,
    QgsRectangle,
    QgsWkbTypes,
)
from qgis.gui import QgsMapMouseEvent, QgsMapTool, QgsRubberBand
from qgis.PyQt.QtCore import Qt, pyqtSignal
from qgis.PyQt.QtGui import QColor
from qgis.PyQt.QtWidgets import QMessageBox

# project
from bd_topo_extractor.__about__ import __wfs_crs__


class RectangleDrawTool(QgsMapTool):
    signal = pyqtSignal()

    def __init__(self, project=None, canvas=None, max_extent=None):
        super().__init__(canvas)

        self.signal.connect(self.deactivate)

        self.project = project
        self.canvas = canvas
        self.max_extent = max_extent
        self.start_point = None
        self.end_point = None
        self.new_extent = None

        # flag to check if the left mouse button was pressed
        self.is_left_button_pressed = False
        # create a rubber line object
        # to display the geometry of the dragged object on the canvas
        self.rubber_band = QgsRubberBand(self.canvas, QgsWkbTypes.PolygonGeometry)
        self.rubber_band.setColor(QColor(255, 0, 0, 50))
        self.rubber_band.setWidth(2)

    # Mouse button pressed.
    def canvasPressEvent(self, event: QgsMapMouseEvent):
        if event.button() == Qt.LeftButton:
            self.start_point = self.toMapCoordinates(event.pos())
            self.end_point = self.start_point
            self.is_left_button_pressed = True
            self.rubber_band.reset()  # remove rubber band from canvas

    # The cursor moves across the screen.
    def canvasMoveEvent(self, event: QgsMapMouseEvent):
        # if the left mouse button is pressed
        if self.is_left_button_pressed:
            self.end_point = self.toMapCoordinates(event.pos())
            # draw a rectangle on the canvas
            self.showRect(self.start_point, self.end_point)

    # The mouse button is released.
    def canvasReleaseEvent(self, event: QgsMapMouseEvent):
        # if the left mouse button was released
        if event.button() == Qt.LeftButton:
            if event.type() == 3:
                # get the rectangle created from the click point and
                # left mouse button release points
                self.new_extent = self.rectangle()
                self.signal.emit()
        # toggle the flag, the left mouse button is no longer held down
        self.is_left_button_pressed = False

    def showRect(self, startPoint, endPoint):
        # Reset the last rectangle
        self.rubber_band.reset(QgsWkbTypes.PolygonGeometry)
        # Only a rectangle can be used
        if startPoint.x() == endPoint.x() or startPoint.y() == endPoint.y():
            return

        point1 = QgsPointXY(startPoint.x(), startPoint.y())
        point2 = QgsPointXY(startPoint.x(), endPoint.y())
        point3 = QgsPointXY(endPoint.x(), endPoint.y())
        point4 = QgsPointXY(endPoint.x(), startPoint.y())

        # Create the rectangle
        self.rubber_band.addPoint(point1, False)
        self.rubber_band.addPoint(point2, False)
        self.rubber_band.addPoint(point3, False)
        self.rubber_band.addPoint(point4, True)  # true to update canvas
        self.rubber_band.show()

    def rectangle(self):
        # Only a rectangle is accepted
        if self.start_point is None or self.end_point is None:
            return None
        elif (
            self.start_point.x() == self.end_point.x()
            or self.start_point.y() == self.end_point.y()
        ):
            return None
        else:
            # Rectangle reprojection
            if str(self.project.instance().crs().postgisSrid()) != str(
                __wfs_crs__
            ):  # noqa: E501
                start_point = self.transform_geom(
                    QgsGeometry().fromPointXY(self.start_point),
                    self.project.instance().crs(),
                    QgsCoordinateReferenceSystem("EPSG:" + str(__wfs_crs__)),
                )
                self.start_point = QgsPointXY(
                    start_point.asPoint().x(), start_point.asPoint().y()
                )
                end_point = self.transform_geom(
                    QgsGeometry().fromPointXY(self.end_point),
                    self.project.instance().crs(),
                    QgsCoordinateReferenceSystem("EPSG:" + str(__wfs_crs__)),
                )
                self.end_point = QgsPointXY(
                    end_point.asPoint().x(), end_point.asPoint().y()
                )

            # Rectangle must be in the max extent of the WFS layer
            if self.max_extent.intersects(
                QgsRectangle(self.start_point, self.end_point)
            ):
                # If the drawn rectangle is too big, an error message appear
                area = QgsDistanceArea()
                ellipsoid = QgsCoordinateReferenceSystem(
                    "EPSG:" + str(__wfs_crs__)
                ).ellipsoidAcronym()  # noqa: E501
                area.setEllipsoid(ellipsoid)
                if (
                    area.measureArea(
                        QgsGeometry().fromRect(
                            QgsRectangle(self.start_point, self.end_point)
                        )
                    )
                    > 100000000
                ):  # noqa: E501
                    msg = QMessageBox()
                    msg.warning(
                        None,
                        self.tr("Warning"),
                        self.tr(
                            "Drawned rectangle is very large (degraded performances)"  # noqa: E501
                        ),
                    )

                return QgsRectangle(self.start_point, self.end_point)
            else:
                # If the drawn rectangle is outside of the max extent,
                # an error message appear
                msg = QMessageBox()
                msg.critical(
                    None,
                    self.tr("Error"),
                    self.tr(
                        "Drawned rectangle is outside of the WFS' extent."
                    ),  # noqa: E501
                )

    def transform_geom(self, geom, input_crs, output_crs):
        # Function used to reproject a geometry
        geom.transform(
            QgsCoordinateTransform(
                input_crs,
                output_crs,
                self.project,
            )
        )
        return geom

    # def getExtent(self):
    #     #
    #     return self.new_extent

    def deactivate(self):
        # Signal to put the window on top when drawing the rectangle is over.
        pass
