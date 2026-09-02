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
        id: titleId
        text: TranslateStr.driveInfo_accAvgPowerConsumeStr
		font.family: rootItemId.ziti
        anchors.horizontalCenter: parent.horizontalCenter
        y: 19
        color: DataSource.dayNightMode === 0x02 ? "#FFD2DFE8" : "#B3262D33"
        font.pixelSize: 28
        font.weight: Font.Medium
    }

    Image {
        id: powerIcon
        anchors.horizontalCenter: parent.horizontalCenter
        y: 88.5
        source: "qrc:/images10_25/driveInfo/night/power_cosume.png"
        cache: false
        visible: accAvgPowerValueId.visible
    }

    Text {
        font.bold:rootItemId.jiacu === 1
        id: accAvgPowerValueId
        anchors.top: powerIcon.bottom
        anchors.topMargin: 23.5
        anchors.horizontalCenter: parent.horizontalCenter
        color: DataSource.dayNightMode === 0x02 ? "#FFFFFFFF" : "#FF262D33"
        font.pixelSize: 44
        text: DataSource.accAvgPowerValue
		font.family: rootItemId.ziti
        visible: DataSource.accAvgPowerValue !== "1999" ? 1 : 0
    }

    Text {
        font.bold:rootItemId.jiacu === 1
        id: accAvgPowerUnitId
        anchors.top: accAvgPowerValueId.bottom
        anchors.topMargin: -6
        anchors.horizontalCenter: parent.horizontalCenter
        text: "kW·h/100km"
		font.family: rootItemId.ziti
        color: DataSource.dayNightMode === 0x02 ? "#80FFFFFF" : "#B3262D33"
        font.pixelSize: 24
        visible: accAvgPowerValueId.visible
        states: [
            State {
                name: "kW_km"
                when:DataSource.accAvgPowerUnit === 1
                PropertyChanges {
                    target: accAvgPowerUnitId
                    text: "kW·h/100km"
                }
            },
            State {
                name: "kW_mi"
                when:DataSource.accAvgPowerUnit === 2
                PropertyChanges {
                    target: accAvgPowerUnitId
                    text: "kW·h/100miles"
                }
            },
            State {
                name: "HP_km"
                when:DataSource.accAvgPowerUnit === 3
                PropertyChanges {
                    target: accAvgPowerUnitId
                    text: "HP·h/100km"
                }
            },
            State {
                name: "HP_mi"
                when:DataSource.accAvgPowerUnit === 4
                PropertyChanges {
                    target: accAvgPowerUnitId
                    text: "HP·h/100miles"
                }
            }
        ]
    }
}
}