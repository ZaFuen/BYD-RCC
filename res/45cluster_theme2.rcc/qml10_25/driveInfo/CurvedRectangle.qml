import QtQuick 2.15
import QtQuick.Shapes 1.15

Shape {
    id: shape
    property var cornersRadius   //数组 顺序为从左上顺时针一圈
    property color color
    property color borderColor:"transparent"
    property int borderWidth: 1
    property alias fillGradient: shapePath.fillGradient
    layer.enabled: true
    layer.samples: 12
    layer.smooth: true


    ShapePath {
        id :shapePath
        startX: 0
        startY: cornersRadius[0]
        fillColor: color
        strokeColor: borderColor
        strokeWidth: borderWidth
        PathArc  { relativeX: cornersRadius[0]; relativeY: -cornersRadius[0]; radiusX: cornersRadius[0]; radiusY: radiusX }
        PathLine { relativeX: shape.width - cornersRadius[0] - cornersRadius[1]; relativeY: 0 }
        PathArc  { relativeX: cornersRadius[1]; relativeY: cornersRadius[1]; radiusX: cornersRadius[1]; radiusY: radiusX }
        PathLine { relativeX: 0; relativeY: shape.height - cornersRadius[1] - cornersRadius[2] }
        PathArc  { relativeX: -cornersRadius[2]; relativeY: cornersRadius[2]; radiusX: cornersRadius[2]; radiusY: radiusX }
        PathLine { relativeX: -(shape.width - cornersRadius[2] - cornersRadius[3]); relativeY: 0 }
        PathArc  { relativeX: -cornersRadius[3]; relativeY: -cornersRadius[3]; radiusX: cornersRadius[3]; radiusY: radiusX }
        PathLine { relativeX: 0; relativeY: -(shape.height - cornersRadius[0] - cornersRadius[3])  }
    }
}
