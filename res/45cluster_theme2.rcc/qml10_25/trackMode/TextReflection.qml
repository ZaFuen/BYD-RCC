import QtQuick 2.15
import com.byd.DataSource 1.0
import QtQuick.Controls 2.15
import com.byd.WarningLight 1.0
import com.byd.CenterChild 1.0
import QtGraphicalEffects 1.12
import "qrc:/common/singleton"
Rectangle{
    anchors.left: parent.left
    anchors.top: parent.top
    property alias textSource: textItem.text
    property alias fontpix: textItem.font.pixelSize
    property alias letterSpacing: textItem.font.letterSpacing
    Rectangle {
        id: gradientRect
        width: textItem.width
        height: 10
        gradient: Gradient {
            GradientStop { position: 0; color: "transparent" }
            GradientStop { position: 0.3; color: "transparent" }
            GradientStop { position: 0.5; color: "#20ffffff" }
            GradientStop { position: 1; color: "#40ffffff" }
        }
        visible: false
        layer.enabled: true
        layer.smooth: true
    }

    Text {
        font.bold:rootItemId.jiacu === 1
        font.family: rootItemId.ziti
        id: textItem
        anchors.left: parent.left
        anchors.top: parent.top
        layer.enabled: true
        layer.samplerName: "maskSource"
        layer.effect: ShaderEffect {
            property var colorSource: gradientRect;
            fragmentShader: "
                uniform lowp sampler2D colorSource;
                uniform lowp sampler2D maskSource;
                uniform lowp float qt_Opacity;
                varying highp vec2 qt_TexCoord0;
                void main() {
                    gl_FragColor =
                        texture2D(colorSource, qt_TexCoord0)
                        * texture2D(maskSource, qt_TexCoord0).a
                        * qt_Opacity;
                }
            "
            vertexShader: "
                uniform highp mat4 qt_Matrix;
                attribute highp vec4 qt_Vertex;
                attribute highp vec2 qt_MultiTexCoord0;
                varying highp vec2 qt_TexCoord0;
                void main() {
                    qt_TexCoord0 = vec2(0, 1) + qt_MultiTexCoord0 * vec2(1, -1);
                    gl_Position = qt_Matrix * qt_Vertex;
                }
            "
        }
    }
}

