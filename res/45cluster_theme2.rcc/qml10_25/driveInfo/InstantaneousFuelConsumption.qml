import QtQuick 2.0
import QtQuick.Window 2.14
import QtQuick.Controls 2.5
import com.byd.DataSource 1.0
import com.byd.CenterChild 1.0
import "qrc:/common/singleton"
import "../"

CenterChild {
    width: 560
    height: 300
    visible: true
    Item {
        id: mainItem
        x: (DataSource.menuNeedDisplay !== DataSource.UI_DISPLAY && DataSource.themeIndex === 0x02)? -1640 : 0
        width: parent.width
        height: parent.height
    Skin {
        id: skinValue
    }

    Item {
        id: idleSpeed
        width: parent.width
        visible: DataSource.instantFuelConsumePageUnit === 4 ? 1 : 0

        Text {
            font.bold:rootItemId.jiacu === 1
            id: title
            text: TranslateStr.driveInfo_instantFuelConsumeStr
			font.family: rootItemId.ziti
            y: 21
            color: DataSource.dayNightMode === 0x02 ? "#FFD2DFE8" : "#B3262D33"
            font.pixelSize: 28
            font.weight: Font.Medium
            anchors.horizontalCenter: parent.horizontalCenter
        }

        Text {
            font.bold:rootItemId.jiacu === 1
            id: fuelConsumeValue
            text: DataSource.instantFuelConsumeValue
			font.family: rootItemId.ziti
            anchors.top: title.bottom
            anchors.topMargin: 69
            color: DataSource.dayNightMode === 0x02 ? "#ffffffff" : "#FF262D33"
            font.pixelSize: 60
            anchors.horizontalCenter: parent.horizontalCenter
            visible: DataSource.instantFuelConsumeDisplay === 1 ? 1 : 0
        }

        Text {
            font.bold:rootItemId.jiacu === 1
            id: fuelConsumeUnit
            text: "L/h"
			font.family: rootItemId.ziti
            color: DataSource.dayNightMode === 0x02 ? "#80FFFFFF" : "#B3262D33"
            font.pixelSize: 24
            anchors.left: fuelConsumeValue.right
            anchors.leftMargin: 6.5
            anchors.bottom: fuelConsumeValue.bottom
            anchors.bottomMargin: 10
            visible: DataSource.instantFuelConsumeDisplay === 1 ? 1 : 0
            states: [
                State {
                    name: "km/L"
                    when:DataSource.instantFuelConsumeUnit === 2
                    PropertyChanges {
                        target: fuelConsumeUnit
                        text: "km/L"
                    }
                },
                State {
                    name: "mpg"
                    when:DataSource.instantFuelConsumeUnit === 3
                    PropertyChanges {
                        target: fuelConsumeUnit
                        text: "mpg"
                    }
                },
                State {
                    name: "L/h"
                    when:DataSource.instantFuelConsumeUnit === 4
                    PropertyChanges {
                        target: fuelConsumeUnit
                        text: "L/h"
                    }
                },
                State {
                    name: "gal/h"
                    when:DataSource.instantFuelConsumeUnit === 5
                    PropertyChanges {
                        target: fuelConsumeUnit
                        text: "gal/h"
                    }
                }
            ]
        }
    }

    Item {
        id: normalItem
        width: parent.width
        height: parent.height
        visible: DataSource.instantFuelConsumePageUnit !== 4 ? 1 : 0

        Text {
            font.bold:rootItemId.jiacu === 1
            id: titleNormalFuel
            text: TranslateStr.driveInfo_instantFuelConsumeStr
			font.family: rootItemId.ziti
            y: 21
            color: DataSource.dayNightMode === 0x02 ? "#FFD2DFE8" : "#B3262D33"
            font.pixelSize: 28
            font.weight: Font.Medium
            anchors.horizontalCenter: parent.horizontalCenter
        }

        Image {
            id: bgImg
            anchors.horizontalCenter: parent.horizontalCenter
            y: 58
            source: DataSource.dayNightMode === 0x02 ? "qrc:/images10_25/driveInfo/night/instantFuelConsume_bg.ktx"
                                                     : "qrc:/images10_25/driveInfo/day/instantFuelConsume_bg.ktx"
            visible: true
            cache: false
        }

        Canvas {
            id: canvas
            anchors.fill: bgImg
            property real endAngle:updateFillAngle()
            property real consume:DataSource.instantFuelConsumeValue
            visible: DataSource.instantFuelConsumeDisplay === 1 ? 1 : 0

            onPaint: {
                var ctx = getContext("2d");
                //0-10 Math.PI/2+41*Math.PI/180 Math.PI/2+42*Math.PI/180+87*Math.PI/180
                //11-20 Math.PI/2+132*Math.PI/180,Math.PI/2+230*Math.PI/180
                //21-30 Math.PI/2+233*Math.PI/180,Math.PI/2+318*Math.PI/180
                ctx.clearRect(0, 0, 230, 230);
                if (consume < 10) {
                    ctx.beginPath();
                    ctx.lineWidth = 8
                    ctx.strokeStyle = skinValue.instantaneousFuelConsumption
                    ctx.arc(115, 130, 109 - 3, 131 * Math.PI / 180, endAngle)
                    ctx.stroke()
                } else {
                    if(consume < 20) {
                        ctx.beginPath();
                        ctx.lineWidth = 8
                        ctx.strokeStyle = skinValue.instantaneousFuelConsumption
                        ctx.arc(115, 130, 109 - 3, 131 * Math.PI / 180, 226 * Math.PI / 180)
                        ctx.stroke()

                        ctx.beginPath();
                        ctx.lineWidth = 8
                        ctx.strokeStyle = skinValue.instantaneousFuelConsumption
                        ctx.arc(115, 130, 109 - 3, 229 * Math.PI / 180, endAngle)
                        ctx.stroke()
                    } else {
                        ctx.beginPath();
                        ctx.lineWidth = 8
                        ctx.strokeStyle = skinValue.instantaneousFuelConsumption
                        ctx.arc(115, 130, 109 - 3, 131 * Math.PI / 180, 226 * Math.PI / 180)
                        ctx.stroke()

                        ctx.beginPath();
                        ctx.lineWidth = 8
                        ctx.strokeStyle = skinValue.instantaneousFuelConsumption
                        ctx.arc(115, 130, 109 - 3, 229 * Math.PI / 180, 311 * Math.PI / 180)
                        ctx.stroke()

                        ctx.beginPath();
                        ctx.lineWidth = 8
                        ctx.strokeStyle = skinValue.instantaneousFuelConsumption
                        ctx.arc(115, 130, 109 - 3, 314 * Math.PI / 180, endAngle)
                        ctx.stroke()
                    }
                }
            }
            onConsumeChanged: {
                updateFillAngle()
                requestPaint()
            }
            function updateFillAngle() {
                if (consume < 10) {
                    endAngle = 131 * Math.PI / 180 + consume / 10 * 95 * Math.PI / 180
                } else if (consume < 20) {
                    endAngle = (131 + 95 + 3) * Math.PI / 180 + (consume - 10) / 10 * 82 * Math.PI /180
                } else if(consume < 30) {
                    endAngle = (131 + 95 + 3 + 82 + 3) * Math.PI / 180 + (consume - 20) / 10 * 95 * Math.PI / 180
                } else {
                    endAngle = (131 + 95 + 3 + 82 + 3 + 95) * Math.PI / 180
                }
            }
        }

        Text {
            font.bold:rootItemId.jiacu === 1
            y: 243
            x: 221
            text: "0"
			font.family: rootItemId.ziti
            color: DataSource.dayNightMode === 0x02 ? "#99DAE1EB" : "#6B262D33"
            font.pixelSize: 18
        }
        Text {
            font.bold:rootItemId.jiacu === 1
            y: 124
            x: 212
            text: "10"
			font.family: rootItemId.ziti
            color: DataSource.dayNightMode === 0x02 ? "#99DAE1EB" : "#6B262D33"
            font.pixelSize: 18
        }
        Text {
            font.bold:rootItemId.jiacu === 1
            y: 124
            x: 329
            text: "20"
			font.family: rootItemId.ziti
            color: DataSource.dayNightMode === 0x02 ? "#99DAE1EB" : "#6B262D33"
            font.pixelSize: 18
        }
        Text{
            font.bold:rootItemId.jiacu === 1
            y: 243
            x: 321
            text: "30"
			font.family: rootItemId.ziti
            color: DataSource.dayNightMode === 0x02 ? "#99DAE1EB" : "#6B262D33"
            font.pixelSize: 18
        }
        Text {
            font.bold:rootItemId.jiacu === 1
            id: fuelConsumeValue1
            text: DataSource.instantFuelConsumeValue
			font.family: rootItemId.ziti
            y: 144
            color: DataSource.dayNightMode === 0x02 ? "#ffffff" : "#FF262D33"
            font.pixelSize: 48
            anchors.horizontalCenter: parent.horizontalCenter
            visible: DataSource.instantFuelConsumeDisplay === 1 ? 1 : 0
        }
        Text {
            font.bold:rootItemId.jiacu === 1
            id: normalFuelUnit
            text: "L/100km"
			font.family: rootItemId.ziti
            color: DataSource.dayNightMode === 0x02 ? "#80FFFFFF" : "#B3262D33"
            font.pixelSize: 24
            anchors.horizontalCenter: parent.horizontalCenter
            anchors.top: fuelConsumeValue1.bottom
            anchors.topMargin: -7
            visible: DataSource.instantFuelConsumeDisplay === 1 ? 1 : 0
            states: [
                State {
                    name: "L/100km"
                    when: DataSource.instantFuelConsumeUnit === 1
                    PropertyChanges {
                        target: normalFuelUnit
                        text: "L/100km"
                    }
                },
                State {
                    name: "km/L"
                    when:DataSource.instantFuelConsumeUnit === 2
                    PropertyChanges {
                        target: normalFuelUnit
                        text: "km/L"
                    }
                },
                State {
                    name: "mpg"
                    when:DataSource.instantFuelConsumeUnit === 3
                    PropertyChanges {
                        target: normalFuelUnit
                        text: "mpg"
                    }
                },
                State {
                    name: "gal/h"
                    when:DataSource.instantFuelConsumeUnit === 5
                    PropertyChanges {
                        target: normalFuelUnit
                        text: "gal/h"
                    }
                }
            ]
        }
    }
}
}