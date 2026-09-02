import QtQuick 2.15
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
        id: titleId
        text:  DataSource.odoEvUnit !== 2 ? TranslateStr.driveInfo_recent50EnergyConsumeStr : TranslateStr.driveInfo_recent50EnergyConsumeMileStr
		font.family: rootItemId.ziti
        anchors.horizontalCenter: parent.horizontalCenter
        y: 19
        font.pixelSize: 28
        font.weight: Font.Medium
        color: DataSource.dayNightMode === 0x02 ? "#FFD2DFE8" : "#B3262D33"
    }

    Item {
        id: valueItemId
        visible: DataSource.recent50EnergyConsumeDisplay === 1 ? 1 : 0
        height: parent.height
        x: (560-recent50AvgFuelValueId.width - 43 - plusIcon.width - 41 - recent50PowerValueId.width - 33 - equalIon.width - 33 - recent50EqualFuelValueId.width) / 2

        Image {
            id: powerIcon
            x: recent50PowerValueId.x + (recent50PowerValueId.width - width) / 2
            y: 69
        source: DataSource.dayNightMode === 0x02 ? "qrc:/images10_25/driveInfo/night/power_cosume.png" : "qrc:/images10_25/driveInfo/day/power_cosume.png"
            cache: false
        }

        Text {
            font.bold:rootItemId.jiacu === 1
            id: recent50PowerValueId
            y: 144
            anchors.left: parent.left
            anchors.leftMargin: (DataSource.recent50PowerValue === "---" && DataSource.recent50FuelValue === "---") ? -5 : 0
            color: DataSource.dayNightMode === 0x02? "#ffffff" : "#FF262D33"
            font.pixelSize: 44
            text: DataSource.recent50PowerValue
			font.family: rootItemId.ziti
        }

        Text {
            font.bold:rootItemId.jiacu === 1
            id: recent50PowerUnitId
            anchors.top: recent50PowerValueId.bottom
            anchors.topMargin: -3
            x: (DataSource.recent50PowerValue === "---" && DataSource.recent50FuelValue === "---") ?
                   (recent50PowerValueId.x + (recent50PowerValueId.width - width - 5) / 2) :
                   (recent50PowerValueId.x + (recent50PowerValueId.width - width) / 2)
            text: "kW·h/100km"
			font.family: rootItemId.ziti
            color: DataSource.dayNightMode === 0x02 ? "#80ffffff" : "#B3262D33"
            font.pixelSize: 24
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
        Image {
            id: plusIcon
            source: DataSource.dayNightMode === 0x02 ? "qrc:/images10_25/driveInfo/night/plus.ktx" : "qrc:/images10_25/driveInfo/day/plus.ktx"
            anchors.left: recent50PowerValueId.right
            anchors.leftMargin: (DataSource.recent50PowerValue === "---" && DataSource.recent50FuelValue === "---") ? 43 : 37
            y: recent50AvgFuelValueId.y + (recent50AvgFuelValueId.height - height) / 2
            cache: false
        }

        Image {
            id: fuelIcon
            y: 69
            x: recent50AvgFuelValueId.x + (recent50AvgFuelValueId.width - width) / 2
        source: DataSource.dayNightMode === 0x02 ? "qrc:/images10_25/driveInfo/night/fuel_consume.png" : "qrc:/images10_25/driveInfo/day/fuel_consume.png"
            cache: false
        }

        Text {
            font.bold:rootItemId.jiacu === 1
            id: recent50AvgFuelValueId
            y: 144
            anchors.left: plusIcon.right
            anchors.leftMargin: (DataSource.recent50PowerValue === "---" && DataSource.recent50FuelValue === "---") ? 41 : 35
            color: DataSource.dayNightMode === 0x02 ? "#ffffff" : "#FF262D33"
            font.pixelSize: 44
            text: DataSource.recent50FuelValue
			font.family: rootItemId.ziti
        }

        Text {
            font.bold:rootItemId.jiacu === 1
            id: recent50AvgFuelUnitId
            anchors.top: recent50AvgFuelValueId.bottom
            anchors.topMargin: -3
            x: (DataSource.recent50PowerValue === "---" && DataSource.recent50FuelValue === "---") ?
                   (recent50AvgFuelValueId.x + (recent50AvgFuelValueId.width - width + 5) / 2) :
                   (recent50AvgFuelValueId.x + (recent50AvgFuelValueId.width - width) / 2)
            text: "L/100km"
			font.family: rootItemId.ziti
            color: DataSource.dayNightMode === 0x02 ? "#80FFFFFF" : "#B3262D33"
            font.pixelSize: 24
            states: [
                State {
                    name: "L"
                    when:DataSource.avgFuelUnit === 1
                    PropertyChanges {
                        target: recent50AvgFuelUnitId
                        text: "L/100km"
                    }
                },
                State {
                    name: "km"
                    when:DataSource.avgFuelUnit === 2
                    PropertyChanges {
                        target: recent50AvgFuelUnitId
                        text: "km/L"
                    }
                },
                State {
                    name: "mpg"
                    when:DataSource.avgFuelUnit === 3
                    PropertyChanges {
                        target: recent50AvgFuelUnitId
                        text: "mpg"
                    }
                },
                State {
                    name: "h"
                    when:DataSource.avgFuelUnit === 4
                    PropertyChanges {
                        target: recent50AvgFuelUnitId
                        text: "mpg"
                    }
                }
            ]
        }
        Image {
            id: equalIon
            source: DataSource.dayNightMode === 0x02 ? "qrc:/images10_25/driveInfo/night/equal.ktx" : "qrc:/images10_25/driveInfo/day/equal.ktx"
            anchors.left: recent50AvgFuelValueId.right
            anchors.leftMargin: 33
            y: recent50AvgFuelValueId.y + (recent50AvgFuelValueId.height - height) / 2
            cache: false
        }

        Text {
            font.bold:rootItemId.jiacu === 1
            id: recent50EqualFuelValueId
            y: 144
            anchors.left: equalIon.right
            anchors.leftMargin: 33
            color: DataSource.dayNightMode === 0x02 ? "#ffffff" : "#FF262D33"
            font.pixelSize: 44
            text: DataSource.recent50EqualFuelValue
			font.family: rootItemId.ziti
        }

        Text {
            font.bold:rootItemId.jiacu === 1
            id: recent50AvgEuqlFuelUnitId
            anchors.top: recent50EqualFuelValueId.bottom
            anchors.topMargin: -3
            x: recent50EqualFuelValueId.x + (recent50EqualFuelValueId.width - width) / 2
            text: "L/100km"
			font.family: rootItemId.ziti
            color: DataSource.dayNightMode === 0x02 ? "#80ffffff" : "#B3262D33"
            font.pixelSize: 24
            states: [
                State {
                    name: "L"
                    when:DataSource.avgFuelUnit === 1
                    PropertyChanges {
                        target: recent50AvgEuqlFuelUnitId
                        text: "L/100km"
                    }
                },
                State {
                    name: "km"
                    when:DataSource.avgFuelUnit === 2
                    PropertyChanges {
                        target: recent50AvgEuqlFuelUnitId
                        text: "km/L"
                    }
                },
                State {
                    name: "mpg"
                    when:DataSource.avgFuelUnit === 3
                    PropertyChanges {
                        target: recent50AvgEuqlFuelUnitId
                        text: "mpg"
                    }
                },
                State {
                    name: "h"
                    when:DataSource.avgFuelUnit === 4
                    PropertyChanges {
                        target: recent50AvgEuqlFuelUnitId
                        text: "mpg"
                    }
                }
            ]
        }
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
