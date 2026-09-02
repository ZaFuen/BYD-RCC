import QtQuick 2.0
import com.byd.DataSource 1.0
import com.byd.CenterChild 1.0
import "qrc:/common/singleton"

CenterChild {
    width: 560
    height: 300
    visible: true
    Item {
        id: mainItem
        x: (DataSource.menuNeedDisplay !== DataSource.UI_DISPLAY && DataSource.themeIndex === 0x02)? -1640 : 0
        width: parent.width
        height: parent.height

    Text {
        font.bold:rootItemId.jiacu === 1
        id: timeTitle
        text: TranslateStr.driveInfo_driveTimeStr
		font.family: rootItemId.ziti
        color: DataSource.dayNightMode === 0x02 ? "#FFD2DFE8" : "#B3262D33"
        font.pixelSize: 28
        font.weight: Font.Medium
        anchors.horizontalCenter: timeImg.horizontalCenter
        y: 21
    }

    Image {
        id: timeImg
        source: DataSource.dayNightMode === 0x02 ? "qrc:/images10_25/driveInfo/night/travelTime.png" : "qrc:/images10_25/driveInfo/day/travelTime.png"
        cache: false
        x: 110
        y: 49
    }

    Text {
        font.bold:rootItemId.jiacu === 1
        id: timeValue
        text: DataSource.driveTime
		font.family: rootItemId.ziti
        anchors.top: timeImg.bottom
        anchors.topMargin: -13
        anchors.horizontalCenter: timeTitle.horizontalCenter
        color: DataSource.dayNightMode === 0x02 ? "#ffffff" : "#FF262D33"
        font.pixelSize: 44
    }

    Text {
        font.bold:rootItemId.jiacu === 1
        id: timeUnit
        text: "h"
		font.family: rootItemId.ziti
        anchors.horizontalCenter: timeTitle.horizontalCenter
        anchors.top: timeValue.bottom
        anchors.topMargin: -8
        color: DataSource.dayNightMode === 0x02 ? "#B3DAE1EB" : "#B3262D33"
        font.pixelSize: 24
    }

    Text {
        font.bold:rootItemId.jiacu === 1
        id: speedTitle
        text: TranslateStr.driveInfo_driveAvgSpeedStr
		font.family: rootItemId.ziti
        font.pixelSize: 28
        font.weight: Font.Medium
        color: DataSource.dayNightMode === 0x02 ? "#FFD2DFE8" : "#B3262D33"
        anchors.horizontalCenter: speedImg.horizontalCenter
        anchors.bottom: timeTitle.bottom
    }

    Image {
        id: speedImg
        source: DataSource.dayNightMode === 0x02 ? "qrc:/images10_25/driveInfo/night/travelSpeed.png" : "qrc:/images10_25/driveInfo/day/travelSpeed.png"
        cache: false
        x: 326
        y: 49
    }

    Text {
        font.bold:rootItemId.jiacu === 1
        id: speedValue
        text: DataSource.avgSpeedValue !== -1 ? DataSource.avgSpeedValue : "---"
		font.family: rootItemId.ziti
        anchors.top: speedImg.bottom
        anchors.topMargin: -13
        color: DataSource.dayNightMode === 0x02 ? "#ffffff" : "#FF262D33"
        font.pixelSize: 44
        anchors.horizontalCenter: speedTitle.horizontalCenter
    }

    Text {
        font.bold:rootItemId.jiacu === 1
        id: speedUnit
        text: DataSource.avgSpeedUnit !== 2 ? "km/h" : "mph"
		font.family: rootItemId.ziti
        anchors.horizontalCenter: speedTitle.horizontalCenter
        anchors.top: speedValue.bottom
        anchors.topMargin: -8
        color: DataSource.dayNightMode === 0x02 ? "#B3DAE1EB" : "#B3262D33"
        font.pixelSize: 24
    }

    Text {
        font.bold:rootItemId.jiacu === 1
        id: tipText
        text: TranslateStr.driveInfo_tipTitleStr
		font.family: rootItemId.ziti
        color: DataSource.dayNightMode === 0x02 ? "#80FFFFFF" : "#B3262D33"
        font.pixelSize: 28
        anchors.bottom: parent.bottom
        anchors.bottomMargin: 20
        anchors.horizontalCenter: parent.horizontalCenter
        visible: parent.parent.objectName === "CenterContainer"? false : true
    }
}
}