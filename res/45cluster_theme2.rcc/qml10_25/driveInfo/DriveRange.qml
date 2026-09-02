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

    Item {
        id: hevDriveRange
        anchors.fill: parent
        visible: DataSource.vehicleType !== DataSource.CAR_TYPE_EV

        Text {
            font.bold:rootItemId.jiacu === 1
            id: elecDriveTitle
            text: TranslateStr.driveInfo_powerDriveRangeStr
			font.family: rootItemId.ziti
            font.pixelSize: DataSource.language !== 0x01 ? 22 : 28
            font.weight: Font.Medium
            color: DataSource.dayNightMode === 0x02 ? "#FFD2DFE8" : "#B3262D33"
            anchors.horizontalCenter: elecDriveImg.horizontalCenter
            y: 21
        }

        Image {
            id: elecDriveImg
            x: 112
            y: 61
            source: DataSource.dayNightMode === 0x02 ? "qrc:/images10_25/driveInfo/night/eleDrive.png" : "qrc:/images10_25/driveInfo/day/eleDrive.png"
            cache: false
        }

        Text {
            font.bold:rootItemId.jiacu === 1
            id: elecDriveValue
            text: DataSource.socMile
			font.family: rootItemId.ziti
            anchors.top: elecDriveImg.bottom
            anchors.topMargin: -2
            color: DataSource.dayNightMode === 0x02 ? "#FFFFFFFF" : "#FF262D33"
            font.pixelSize: 44
            anchors.horizontalCenter: elecDriveTitle.horizontalCenter
            visible: DataSource.socMile === "1000" ? 0 : 1
        }

        Text {
            font.bold:rootItemId.jiacu === 1
            id: elecDriveUnit
            text: DataSource.odoUnit !==2 ? "km" : (DataSource.socMile === "1" ? "mile" : "miles")
			font.family: rootItemId.ziti
            anchors.horizontalCenter: elecDriveTitle.horizontalCenter
            anchors.top: elecDriveValue.bottom
            anchors.topMargin: -8
            color: DataSource.dayNightMode === 0x02 ? "#B3DAE1EB" : "#B3262D33"
            font.pixelSize: 24
            visible: elecDriveValue.visible
        }

        Text {
            font.bold:rootItemId.jiacu === 1
            id: fuelDriveTitle
            text: TranslateStr.driveInfo_fuelDriveRangeStrStr
            color: DataSource.dayNightMode === 0x02 ? "#FFD2DFE8" : "#B3262D33"
			font.family: rootItemId.ziti
            font.pixelSize: DataSource.language !== 0x01 ? 22 : 28
            font.weight: Font.Medium
            anchors.horizontalCenter: fuelDriveImg.horizontalCenter
            anchors.bottom: elecDriveTitle.bottom
        }

        Image{
            id: fuelDriveImg
            x: 328
            y: 61
            source: DataSource.dayNightMode === 0x02 ? "qrc:/images10_25/driveInfo/night/fuelDrive.png" : "qrc:/images10_25/driveInfo/day/fuelDrive.png"
            cache: false
        }

        Text {
            font.bold:rootItemId.jiacu === 1
            id: fuelDriveValue
            text: DataSource.fuelMile
			font.family: rootItemId.ziti
            anchors.top: fuelDriveImg.bottom
            anchors.topMargin: -2
            color: DataSource.dayNightMode === 0x02 ? "#FFFFFFFF" : "#FF262D33"
            font.pixelSize: 44
            anchors.horizontalCenter: fuelDriveImg.horizontalCenter
            visible: DataSource.fuelMile === "0" ? 0 : 1
        }

        Text {
            font.bold:rootItemId.jiacu === 1
            id: fuelDriveUnit
            text: DataSource.odoEvUnit !==2 ? "km" : "miles"
			font.family: rootItemId.ziti
            anchors.horizontalCenter: fuelDriveImg.horizontalCenter
            anchors.top: fuelDriveValue.bottom
            anchors.topMargin: -8
            color: DataSource.dayNightMode === 0x02 ? "#B3DAE1EB" : "#B3262D33"
            font.pixelSize: 24
            visible: fuelDriveValue.visible
        }
    }

    Item {
        id: evDriveRange
        width: parent.width
        height: parent.height
        visible: DataSource.vehicleType === DataSource.CAR_TYPE_EV

        Text {
            font.bold:rootItemId.jiacu === 1
            id: evElecDriveTitle
            text: TranslateStr.driveInfo_powerDriveRangeStr
			font.family: rootItemId.ziti
            anchors.horizontalCenter: parent.horizontalCenter
            font.pixelSize: 28
            font.weight: Font.Medium
            color: DataSource.dayNightMode === 0x02 ? "#FFD2DFE8" : "#B3262D33"
            y: 21
        }
        Image {
            id: img
            anchors.horizontalCenter: parent.horizontalCenter
            y: 61
            source: DataSource.dayNightMode === 0x02 ? "qrc:/images10_25/driveInfo/night/eleDrive.png" : "qrc:/images10_25/driveInfo/day/eleDrive.png"
            cache: false
        }
        Text {
            font.bold:rootItemId.jiacu === 1
            id: evElecDriveValue
            text: DataSource.socMile
			font.family: rootItemId.ziti
            anchors.horizontalCenter: parent.horizontalCenter
            anchors.top: img.bottom
            anchors.topMargin: -2
            color: DataSource.dayNightMode === 0x02 ? "#FFFFFFFF" : "#FF262D33"
            font.pixelSize: 44
            visible: DataSource.socMile === "1000" ? 0 : 1
        }
        Text {
            font.bold:rootItemId.jiacu === 1
            id: evElecDriveUnit
            text: DataSource.odoUnit !==2 ? "km" : (DataSource.socMile === "1" ? "mile" : "miles")
			font.family: rootItemId.ziti
            anchors.horizontalCenter: parent.horizontalCenter
            anchors.top: evElecDriveValue.bottom
            anchors.topMargin: -8
            color: DataSource.dayNightMode === 0x02 ? "#B3DAE1EB" : "#B3262D33"
            font.pixelSize: 24
            visible: evElecDriveValue.visible
        }
    }
}
}