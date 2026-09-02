import QtQuick 2.15
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

    Component.onCompleted: {
        tipText.visible = DataSource.menuNeedDisplay === DataSource.UI_DISPLAY ? true : false
    }

    Text {
        font.bold:rootItemId.jiacu === 1
        id: titleId
        text:DataSource.odoUnit !== 2 ? TranslateStr.driveInfo_recent50PowerConsumeStr : TranslateStr.driveInfo_recent50PowerMileConsumeStr
		font.family: rootItemId.ziti
        anchors.horizontalCenter: parent.horizontalCenter
        y: 19
        font.pixelSize: 28
        font.weight: Font.Medium
        color: DataSource.dayNightMode === 0x02 ? "#FFD2DFE8" : "#B3262D33"
    }

    Image {
        id: powerIcon
        anchors.horizontalCenter: parent.horizontalCenter
        y: 69
        source: "qrc:/images10_25/driveInfo/night/power_cosume.png"
        cache: false
        visible: recent50PowerValueId.visible
    }

    Text {
        font.bold:rootItemId.jiacu === 1
        id: recent50PowerValueId
        anchors.horizontalCenter: parent.horizontalCenter
        y: 144
        color: DataSource.dayNightMode === 0x02 ? "#ffffff" : "#FF262D33"
        font.pixelSize: 44
        text: DataSource.recent50PowerValue
		font.family: rootItemId.ziti
        visible: DataSource.recent50PowerValue !== "1999" ? true : false
    }

    Text {
        font.bold:rootItemId.jiacu === 1
        id: recent50PowerUnitId
        anchors.horizontalCenter: parent.horizontalCenter
        anchors.top: recent50PowerValueId.bottom
        anchors.topMargin: -3
        text: "kW·h/100km"
		font.family: rootItemId.ziti
        color: DataSource.dayNightMode === 0x02 ? "#80ffffff" : "#B3262D33"
        font.pixelSize: 24
        visible: recent50PowerValueId.visible
        states: [
            State {
                name: "kW_km"
                when:DataSource.recent50PowerUnit === 1
                PropertyChanges {
                    target: recent50PowerUnitId
                    text: "kW·h/100km"
                }
            },
            State {
                name: "kW_mi"
                when:DataSource.recent50PowerUnit === 2
                PropertyChanges {
                    target: recent50PowerUnitId
                    text: "kW·h/100miles"
                }
            },
            State {
                name: "HP_km"
                when:DataSource.recent50PowerUnit === 3
                PropertyChanges {
                    target: recent50PowerUnitId
                    text: "HP·h/100km"
                }
            },
            State {
                name: "HP_mi"
                when:DataSource.recent50PowerUnit === 4
                PropertyChanges {
                    target: recent50PowerUnitId
                    text: "HP·h/100miles"
                }
            }
        ]
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