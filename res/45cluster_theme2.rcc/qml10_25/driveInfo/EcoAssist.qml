import QtQuick 2.15
import QtQuick.Controls 2.15
import QtQuick.Shapes  1.15
import com.byd.DataSource 1.0
import com.byd.CenterChild 1.0
import "qrc:/common/singleton"
import "qrc:/qml10_25/driveInfo"


CenterChild {
    width: 710
    height: 337
    visible: true

    Text {
        font.bold:rootItemId.jiacu === 1
        font.family: rootItemId.ziti
        id: titleId
        text: TranslateStr.driveInfo_ecoAssistStr
        anchors.horizontalCenter: parent.horizontalCenter
        y: 36
        font.pixelSize: 30
        color: DataSource.dayNightMode === 0x02?"#ffffff":"#333333"
    }

Item{
        id: ecoAssistItem
        anchors.fill: parent
        visible: DataSource.ecoAssistDisplay === DataSource.UI_DISPLAY

        function mapPercent(percent){
            return (percent/ 100 * (240 + 0.1))
        }

        property real accScale: DataSource.ecoAssistAccScale
        property real accValue: DataSource.ecoAssistAccValue
        property real brakeScale: DataSource.ecoAssistBrakeScale
        property real brakeValue: DataSource.ecoAssistBrakeValue

        //Behavior on accScale {NumberAnimation{duration: 100}}
        //Behavior on accValue {NumberAnimation{duration: 100}}
        //Behavior on brakeScale {NumberAnimation{duration: 100}}
        //Behavior on brakeValue {NumberAnimation{duration: 100}}

        //左侧绿色
        CurvedRectangle{
            id: curvrdRectLeftGreen
            anchors.right: parent.horizontalCenter
            anchors.rightMargin: 0.5
            y: 110
            width: ecoAssistItem.mapPercent(ecoAssistItem.brakeScale)
            height: 95
            cornersRadius: [height/2-1,0,0,height/2-1]
            visible: ecoAssistItem.brakeScale > 0

            fillGradient: DataSource.dayNightMode === 0x02 ? leftGreenNight : leftGreenDay

            LinearGradient {
                id: leftGreenDay
                //x1起点和x2终点位置对应position的0到1
                x1: 0;                          y1: curvrdRectLeftGreen.height/2
                x2: curvrdRectLeftGreen.width;  y2: curvrdRectLeftGreen.height/2
                GradientStop { position: 0.0; color: "#FF48C499" }
                GradientStop { position: 1.0; color: "#8055E2A2" }
            }

            LinearGradient {
                id: leftGreenNight
                //x1起点和x2终点位置对应position的0到1
                x1: 0;                          y1: curvrdRectLeftGreen.height/2
                x2: curvrdRectLeftGreen.width;  y2: curvrdRectLeftGreen.height/2
                GradientStop { position: 1.0; color: "#FF33A880" }
                GradientStop { position: 0.0; color: "#4D31CC85" }
            }

        }

        //左侧黄色
        CurvedRectangle{
            id: curvrdRectLeftOrange
            anchors.right: curvrdRectLeftGreen.right
            anchors.verticalCenter: curvrdRectLeftGreen.verticalCenter
            width: ecoAssistItem.mapPercent(ecoAssistItem.brakeValue)
            height: 52
            cornersRadius: [height/2-1,0,0,height/2-1]
            visible: ecoAssistItem.brakeValue > 0
            fillGradient: curvrdRectLeftOrange.width > curvrdRectLeftGreen.width? leftOrangeExceed : leftOrangeNormol

            LinearGradient {
                id: leftOrangeNormol
                //x1起点和x2终点位置对应position的0到1
                x1: 0;                          y1: curvrdRectLeftOrange.height/2
                x2: curvrdRectLeftOrange.width; y2: curvrdRectLeftOrange.height/2
                GradientStop { position: 0.0; color: "#FFFFFFFF" }
                GradientStop { position: 1.0; color: "#A1FFFFFF" }
            }
            LinearGradient {
                id: leftOrangeExceed
                //x1起点和x2终点位置对应position的0到1
                x1: 0;                          y1: curvrdRectLeftOrange.height/2
                x2: curvrdRectLeftOrange.width; y2: curvrdRectLeftOrange.height/2
                GradientStop { position: 0.0; color: "#FFF38D31" }
                GradientStop { position: 1.0; color: "#A1FFFFFF" }
            }
        }

        Image {
            source: DataSource.dayNightMode === 0x02 ? "qrc:/images10_25/driveInfo/night/ecoAssistIcon.png"
                                                     : "qrc:/images10_25/driveInfo/day/ecoAssistIcon.png"
            visible: ecoAssistItem.brakeValue > 0
            anchors.verticalCenter: curvrdRectLeftOrange.verticalCenter
            anchors.right: curvrdRectLeftOrange.left
            anchors.rightMargin: 1
        }



        //右侧绿色
        CurvedRectangle{
            id: curvrdRectRightGreen
            anchors.left: parent.horizontalCenter
            anchors.leftMargin: 0.5
            y: 110
            width: ecoAssistItem.mapPercent(ecoAssistItem.accScale)
            height: 95
            cornersRadius: [0,height/2,height/2,0]
            visible: ecoAssistItem.accScale > 0
            fillGradient: DataSource.dayNightMode === 0x02 ? rightGreenNight : rightGreenDay

            LinearGradient {
                id: rightGreenDay
                //x1起点和x2终点位置对应position的0到1
                x1: 0;                           y1: curvrdRectRightGreen.height/2
                x2: curvrdRectRightGreen.width;  y2: curvrdRectRightGreen.height/2
                GradientStop { position: 1.0; color: "#FF48C499" }
                GradientStop { position: 0.0; color: "#8055E2A2" }
            }
            LinearGradient {
                id: rightGreenNight
                //x1起点和x2终点位置对应position的0到1
                x1: 0;                           y1: curvrdRectRightGreen.height/2
                x2: curvrdRectRightGreen.width;  y2: curvrdRectRightGreen.height/2
                GradientStop { position: 0.0; color: "#FF33A880" }
                GradientStop { position: 1.0; color: "#4D31CC85" }
            }
        }
        //右侧黄色
        CurvedRectangle{
            id: curvrdRectRightOrange
            anchors.left: curvrdRectRightGreen.left
            anchors.verticalCenter: curvrdRectRightGreen.verticalCenter
            width: ecoAssistItem.mapPercent(ecoAssistItem.accValue)
            height: 52
            cornersRadius: [0,height/2,height/2,0]
            visible: ecoAssistItem.accValue > 0
            fillGradient: curvrdRectRightOrange.width > curvrdRectRightGreen.width? rightOrangeExceed : rightOrangeNormol

            LinearGradient {
                id: rightOrangeNormol
                //x1起点和x2终点位置对应position的0到1
                x1: 0;                          y1: curvrdRectRightOrange.height/2
                x2: curvrdRectRightOrange.width; y2: curvrdRectRightOrange.height/2
                GradientStop { position: 1.0; color: "#FFFFFFFF" }
                GradientStop { position: 0.0; color: "#A1FFFFFF" }
            }
            LinearGradient {
                id: rightOrangeExceed
                //x1起点和x2终点位置对应position的0到1
                x1: 0;                          y1: curvrdRectRightOrange.height/2
                x2: curvrdRectRightOrange.width; y2: curvrdRectRightOrange.height/2
                GradientStop { position: 1.0; color: "#FFF38D31" }
                GradientStop { position: 0.0; color: "#A0FFFFFF" }
            }
        }

        Image {
            source: DataSource.dayNightMode === 0x02 ? "qrc:/images10_25/driveInfo/night/ecoAssistIcon.png"
                                                     : "qrc:/images10_25/driveInfo/day/ecoAssistIcon.png"
            visible: ecoAssistItem.accValue > 0
            anchors.verticalCenter: curvrdRectRightOrange.verticalCenter
            anchors.left: curvrdRectRightOrange.right
            anchors.leftMargin: 1
        }
    }
}



