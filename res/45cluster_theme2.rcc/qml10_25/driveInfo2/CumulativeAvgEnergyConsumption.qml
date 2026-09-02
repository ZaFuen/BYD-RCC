import QtQuick 2.0
import com.byd.DataSource 1.0
import com.byd.CenterChild 1.0
import "qrc:/common/singleton"

CenterChild {
    width: 560
    height: 300
    visible: true
    Text {
        font.bold:rootItemId.jiacu === 1
        id: titleId
        text: TranslateStr.driveInfo_accAvgEnergyConsumeStr
		font.family: rootItemId.ziti
        anchors.horizontalCenter: parent.horizontalCenter
        y: 19
        color: DataSource.dayNightMode === 0x02 ? "#FFD2DFE8" : "#B3262D33"
        font.pixelSize: 28
        font.weight: Font.Medium
    }

    Item {
        anchors.fill: parent

        Image {
            id: powerIcon
            x: 137.5
            y: 88.5
            source: DataSource.dayNightMode === 0x02 ? "qrc:/images10_25/driveInfo/night/power_cosume.png" : "qrc:/images10_25/driveInfo/day/power_cosume.png"
            cache: false
            visible: accAvgPowerValueId.visible
        }

        Text {
            font.bold:rootItemId.jiacu === 1
            id: accAvgPowerValueId
            anchors.horizontalCenter: powerIcon.horizontalCenter
            anchors.top: powerIcon.bottom
            anchors.topMargin: 23.5
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
            anchors.horizontalCenter: accAvgPowerValueId.horizontalCenter
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

        Image {
            id: fuelIcon
            anchors.left: powerIcon.right
            anchors.leftMargin: 148.5
            anchors.top: powerIcon.top
            source: DataSource.dayNightMode === 0x02 ? "qrc:/images10_25/driveInfo/night/fuel_consume.png" : "qrc:/images10_25/driveInfo/day/fuel_consume.png"

            cache: false
            visible: accAvgFuelValueId.visible
        }

        Text {
            font.bold:rootItemId.jiacu === 1
            id: accAvgFuelValueId
            anchors.top: fuelIcon.bottom
            anchors.horizontalCenter: fuelIcon.horizontalCenter
            anchors.topMargin: 23.5
            color: DataSource.dayNightMode === 0x02 ? "#FFFFFFFF" : "#FF262D33"
            font.pixelSize: 44
            text: DataSource.accAvgFuelValue
			font.family: rootItemId.ziti
            visible: DataSource.accAvgFuelValue !== "1000"
        }

        Text {
            font.bold:rootItemId.jiacu === 1
            id: accAvgFuelUnitId
            anchors.top: accAvgFuelValueId.bottom
            anchors.topMargin: -6
            anchors.horizontalCenter: accAvgFuelValueId.horizontalCenter
            text: "L/100km"
			font.family: rootItemId.ziti
            color: DataSource.dayNightMode === 0x02 ? "#80FFFFFF" : "#B3262D33"
            font.pixelSize: 24
            visible: accAvgFuelValueId.visible
            states: [
                State {
                    name: "L"
                    when:DataSource.avgFuelUnit === 1
                    PropertyChanges {
                        target: accAvgFuelUnitId
                        text: "L/100km"
                    }
                },
                State {
                    name: "km"
                    when:DataSource.avgFuelUnit === 2
                    PropertyChanges {
                        target: accAvgFuelUnitId
                        text: "km/L"
                    }
                },
                State {
                    name: "mpg"
                    when:DataSource.avgFuelUnit === 3
                    PropertyChanges {
                        target: accAvgFuelUnitId
                        text: "mpg"
                    }
                },
                State {
                    name: "h"
                    when:DataSource.avgFuelUnit === 4
                    PropertyChanges {
                        target: accAvgFuelUnitId
                        text: "mpg"
                    }
                }
            ]
        }
    }
}
