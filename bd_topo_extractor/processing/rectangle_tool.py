from qgis.gui import QgsMapTool, QgsMapMouseEvent, QgsRubberBand
from qgis.core import QgsPointXY, QgsWkbTypes, QgsRectangle
from PyQt5.QtGui import QColor
from PyQt5.QtCore import Qt, pyqtSignal


class RectangleDrawTool(QgsMapTool):
    signal = pyqtSignal()

    def __init__(self, canvas=None):
        super().__init__(canvas)

        self.signal.connect(self.deactivate)

        self.canvas = canvas
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
        self.rubber_band.reset(QgsWkbTypes.PolygonGeometry)
        if startPoint.x() == endPoint.x() or startPoint.y() == endPoint.y():
            return

        point1 = QgsPointXY(startPoint.x(), startPoint.y())
        point2 = QgsPointXY(startPoint.x(), endPoint.y())
        point3 = QgsPointXY(endPoint.x(), endPoint.y())
        point4 = QgsPointXY(endPoint.x(), startPoint.y())

        self.rubber_band.addPoint(point1, False)
        self.rubber_band.addPoint(point2, False)
        self.rubber_band.addPoint(point3, False)
        self.rubber_band.addPoint(point4, True)  # true to update canvas
        self.rubber_band.show()

    def rectangle(self):
        if self.start_point is None or self.end_point is None:
            return None
        elif (
            self.start_point.x() == self.end_point.x()
            or self.start_point.y() == self.end_point.y()
        ):
            return None
        return QgsRectangle(self.start_point, self.end_point)

    def getExtent(self):
        return self.new_extent

    def deactivate(self):
        pass
