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
        id: fuelConsumeTitle
        text: TranslateStr.driveInfo_fuelConsumeStr
		font.family: rootItemId.ziti
        y: 21
        color: DataSource.dayNightMode === 0x02 ? "#FFD2DFE8" : "#B3262D33"
        font.pixelSize: 28
        font.weight: Font.Medium
        anchors.horizontalCenter: parent.horizontalCenter
    }

    Image{
        id: fuelConsumeIcon
        y: 75
        source: DataSource.dayNightMode === 0x02 ? "qrc:/images10_25/driveInfo/night/fuelConsumeIcon.png" : "qrc:/images10_25/driveInfo/day/fuelConsumeIcon.png"
        anchors.horizontalCenter: parent.horizontalCenter
        cache: false
    }

    Text {
        font.bold:rootItemId.jiacu === 1
        id: fuelConsumeValue
        text: DataSource.fuelConsumeValue
		font.family: rootItemId.ziti
        color: DataSource.dayNightMode === 0x02 ? "#ffffff" : "#FF262D33"
        font.pixelSize: 44
        y: 173
        anchors.horizontalCenter: parent.horizontalCenter
        visible: DataSource.fuelConsumeDisplay === 1 ? 1 : 0
    }

    Text {
        font.bold:rootItemId.jiacu === 1
        id: fuelConsumeUnit
        text: DataSource.fuelConsumeUnit !== 2 ? "L": "gal"
		font.family: rootItemId.ziti
        color: DataSource.dayNightMode === 0x02 ? "#FFD2DFE8" : "#B3262D33"
        font.pixelSize: 24
        anchors.left: fuelConsumeValue.right
        anchors.leftMargin: 6
        anchors.bottom: fuelConsumeValue.bottom
        anchors.bottomMargin: 6
        visible: DataSource.fuelConsumeDisplay === 1 ? 1 : 0
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
