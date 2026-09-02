import QtQuick 2.0
import com.byd.DataSource 1.0
import com.byd.CenterChild 1.0
import "qrc:/common/singleton"

CenterChild {
    width: 560
    height: 300
    visible: true
    Component.onCompleted: {
        tipText.visible = DataSource.menuNeedDisplay === DataSource.UI_DISPLAY ? true : false
    }

    Text {
        font.bold:rootItemId.jiacu === 1
        id: chargePowerTitle
        text: TranslateStr.driveInfo_externalChargeStr
		font.family: rootItemId.ziti
        y: 21
        color: DataSource.dayNightMode === 0x02 ? "#FFD2DFE8" : "#B3262D33"
        font.pixelSize: 28
        font.weight: Font.Medium
        anchors.horizontalCenter: parent.horizontalCenter
    }

    Image {
        id: chargePowerImg
        anchors.horizontalCenter: parent.horizontalCenter
        y: 75
        source: DataSource.dayNightMode === 0x02 ? "qrc:/images10_25/driveInfo/night/externalChargePower.png" : "qrc:/images10_25/driveInfo/day/externalChargePower.png"
        cache: false
    }

    Text {
        font.bold:rootItemId.jiacu === 1
        id: chargePowerValue
        anchors.horizontalCenter: parent.horizontalCenter
        y: 173
        text: DataSource.externalCharge
		font.family: rootItemId.ziti
        color: DataSource.dayNightMode === 0x02 ? "#FFFFFFFF" : "#FF262D33"
        font.pixelSize: 44
        visible: DataSource.externalChargeDisplay === 1 ? 1 : 0
    }

    Text {
        font.bold:rootItemId.jiacu === 1
        id: chargePowerUnit
        text: DataSource.externalChargeUnit !== 2 ? "kW·h" : "HP·h"
		font.family: rootItemId.ziti
        color: DataSource.dayNightMode === 0x02 ? "#FFD2DFE8" : "#B3262D33"
        font.pixelSize: 24
        anchors.left: chargePowerValue.right
        anchors.leftMargin: 6
        anchors.bottom: chargePowerValue.bottom
        anchors.bottomMargin: 6
        visible: DataSource.externalChargeDisplay === 1 ? 1 : 0
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
