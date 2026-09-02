import QtQuick 2.0
import com.byd.DataSource 1.0
import com.byd.CenterChild 1.0
import "qrc:/common/singleton"
import "../"

Item {
    id: tirePressureDisplay1
Image {
    id: tirePressureCarImage1
    x: 225
    y: 31
    visible: parent.visible
    
    source: DataSource.dayNightMode === 0x01 && DataSource.lfTirePressureColor === 1 ? "qrc:/images10_25/display_always/1-1.png" :
            DataSource.dayNightMode === 0x01 && DataSource.lfTirePressureColor === 2 ? "qrc:/images10_25/display_always/1-2.png" :
            DataSource.dayNightMode === 0x01 && DataSource.lfTirePressureColor === 3 ? "qrc:/images10_25/display_always/1-3.png" :
            DataSource.dayNightMode === 0x02 && DataSource.lfTirePressureColor === 1 ? "qrc:/images10_25/display_always/2-1.png" :
            DataSource.dayNightMode === 0x02 && DataSource.lfTirePressureColor === 2 ? "qrc:/images10_25/display_always/2-2.png" :
            DataSource.dayNightMode === 0x02 && DataSource.lfTirePressureColor === 3 ? "qrc:/images10_25/display_always/2-3.png" :
            ""
}
    // 左前轮胎
    Text {
        font.bold:rootItemId.jiacu === 1
        id: lfTireValue1
        font.pixelSize: 30
        x: 26+88
        y: 57-2
        text: DataSource.lfTirePressureValue
		font.family: rootItemId.ziti
        states: [
            State {
                name: "white"
                when: DataSource.lfTirePressureColor === 1
                PropertyChanges {
                    target: lfTireValue1
                    color: (DataSource.dayNightMode === 0x02 || DataSource.powerGear !== 3) ? "#ffffff" : "#333333"
                }
            },
            State {
                name: "yellow"
                when: DataSource.lfTirePressureColor === 2
                PropertyChanges {
                    target: lfTireValue1
                    color: "#ffff00"
                }
            },
            State {
                name: "red"
                when: DataSource.lfTirePressureColor === 3
                PropertyChanges {
                    target: lfTireValue1
                    color: "#ff0000"
                }
            }
        ]
    }
    
    Text {
        font.bold:rootItemId.jiacu === 1
        id: lfTireUnit1
        text: qsTr("kPa")
		font.family: rootItemId.ziti
        font.pixelSize: 22
        anchors.left: lfTireValue1.right
        anchors.leftMargin: 3
        anchors.bottom: lfTireValue1.bottom
        anchors.bottomMargin: 2
        visible: lfTireValue1.visible
        color: DataSource.lfTirePressureColor === 1 ? (DataSource.dayNightMode === 0x02 ? "#80ffffff" : "#575757") : lfTireValue1.color
        states: [
            State {
                name: "bar"
                when: DataSource.tirePressureUnit === 1
                PropertyChanges {
                    target: lfTireUnit1
                    text: "bar"
                }
            },
            State {
                name: "psi"
                when: DataSource.tirePressureUnit === 2
                PropertyChanges {
                    target: lfTireUnit1
                    text: "psi"
                }
            },
            State {
                name: "kPa"
                when: DataSource.tirePressureUnit === 3
                PropertyChanges {
                    target: lfTireUnit1
                    text: "kPa"
                }
            }
        ]
    }

    Rectangle {
        width: lfTireValue1.width + lfTireUnit1.width + 3
        height: 1
        x: lfTireValue1.x
        y: 87
        color: DataSource.lfTirePressureColor === 1 ? (DataSource.dayNightMode === 0x02 ? "#80ffffff" : "#575757") : lfTireValue1.color
        opacity: 0
    }

    Text {
        font.bold:rootItemId.jiacu === 1
        id: lfTireTempValue1
        text: DataSource.lfTireTempValue
		font.family: rootItemId.ziti
        font.pixelSize: 30
        x: 46+88
        y: 92-6
        states: [
            State {
                name: "white"
                when: DataSource.lfTireTempColor === 1
                PropertyChanges {
                    target: lfTireTempValue1
                    color: (DataSource.dayNightMode === 0x02 || DataSource.powerGear !== 3) ? "#ffffff" : "#333333"
                }
            },
            State {
                name: "yellow"
                when: DataSource.lfTireTempColor === 2
                PropertyChanges {
                    target: lfTireTempValue1
                    color: "#ffff00"
                }
            },
            State {
                name: "red"
                when: DataSource.lfTireTempColor === 3
                PropertyChanges {
                    target: lfTireTempValue1
                    color: "#ff0000"
                }
            }
        ]
    }

    Text {
        font.bold:rootItemId.jiacu === 1
        id: lfTireTempUnit1
        text: DataSource.tireTempUnit !== 1 ? "°C" : "°F"
		font.family: rootItemId.ziti
        anchors.left: lfTireTempValue1.right
        anchors.leftMargin: 3
        anchors.bottom: lfTireTempValue1.bottom
        anchors.bottomMargin: 3
        font.pixelSize: 22
        horizontalAlignment: Text.AlignHCenter
        color: DataSource.lfTireTempColor === 1 ? (DataSource.dayNightMode === 0x02 ? "#80ffffff" : "#575757") : lfTireTempValue1.color
    }

    // 右前轮胎
    Text {
        font.bold:rootItemId.jiacu === 1
        id: rfTireValue1
        font.pixelSize: 30
        x: 262+88
        y: 57-2
        text: DataSource.rfTirePressureValue
		font.family: rootItemId.ziti
        states: [
            State {
                name: "white"
                when: DataSource.rfTirePressureColor === 1
                PropertyChanges {
                    target: rfTireValue1
                    color: (DataSource.dayNightMode === 0x02 || DataSource.powerGear !== 3) ? "#ffffff" : "#333333"
                }
            },
            State {
                name: "yellow"
                when: DataSource.rfTirePressureColor === 2
                PropertyChanges {
                    target: rfTireValue1
                    color: "#ffff00"
                }
            },
            State {
                name: "red"
                when: DataSource.rfTirePressureColor === 3
                PropertyChanges {
                    target: rfTireValue1
                    color: "#ff0000"
                }
            }
        ]
    }
    
    Text {
        font.bold:rootItemId.jiacu === 1
        id: rfTireUnit1
        text: qsTr("kPa")
		font.family: rootItemId.ziti
        font.pixelSize: 22
        anchors.left: rfTireValue1.right
        anchors.leftMargin: 3
        anchors.bottom: rfTireValue1.bottom
        anchors.bottomMargin: 2
        visible: rfTireValue1.visible
        color: DataSource.rfTirePressureColor === 1 ? (DataSource.dayNightMode === 0x02 ? "#80ffffff" : "#575757") : rfTireValue1.color
        states: [
            State {
                name: "bar"
                when: DataSource.tirePressureUnit === 1
                PropertyChanges {
                    target: rfTireUnit1
                    text: "bar"
                }
            },
            State {
                name: "psi"
                when: DataSource.tirePressureUnit === 2
                PropertyChanges {
                    target: rfTireUnit1
                    text: "psi"
                }
            },
            State {
                name: "kPa"
                when: DataSource.tirePressureUnit === 3
                PropertyChanges {
                    target: rfTireUnit1
                    text: "kPa"
                }
            }
        ]
    }

    Rectangle {
        width: rfTireValue1.width + rfTireUnit1.width + 3
        height: 1
        x: rfTireValue1.x
        y: 87
        color: DataSource.rfTirePressureColor === 1 ? (DataSource.dayNightMode === 0x02 ? "#80ffffff" : "#575757") : rfTireValue1.color
        opacity: 0
    }

    Text {
        font.bold:rootItemId.jiacu === 1
        id: rfTireTempValue1
        font.pixelSize: 30
        x: 282+88
        y: 92-6
        text: DataSource.rfTireTempValue
		font.family: rootItemId.ziti
        states: [
            State {
                name: "white"
                when: DataSource.rfTireTempColor === 1
                PropertyChanges {
                    target: rfTireTempValue1
                    color: (DataSource.dayNightMode === 0x02 || DataSource.powerGear !== 3) ? "#ffffff" : "#333333"
                }
            },
            State {
                name: "yellow"
                when: DataSource.rfTireTempColor === 2
                PropertyChanges {
                    target: rfTireTempValue1
                    color: "#ffff00"
                }
            },
            State {
                name: "red"
                when: DataSource.rfTireTempColor === 3
                PropertyChanges {
                    target: rfTireTempValue1
                    color: "#ff0000"
                }
            }
        ]
    }

    Text {
        font.bold:rootItemId.jiacu === 1
        id: rfTireTempUnit1
        text: DataSource.tireTempUnit !== 1 ? "°C" : "°F"
		font.family: rootItemId.ziti
        anchors.left: rfTireTempValue1.right
        anchors.leftMargin: 3
        anchors.bottom: rfTireTempValue1.bottom
        anchors.bottomMargin: 3
        font.pixelSize: 22
        horizontalAlignment: Text.AlignHCenter
        color: DataSource.rfTireTempColor === 1 ? (DataSource.dayNightMode === 0x02 ? "#80ffffff" : "#575757") : rfTireTempValue1.color
    }

    // 左后轮胎
    Text {
        font.bold:rootItemId.jiacu === 1
        id: lrTireValue1
        text: DataSource.lrTirePressureValue
		font.family: rootItemId.ziti
        font.pixelSize: 30
        x: 26+88
        y: 185-2
        states: [
            State {
                name: "white"
                when: DataSource.lrTirePressureColor === 1
                PropertyChanges {
                    target: lrTireValue1
                    color: (DataSource.dayNightMode === 0x02 || DataSource.powerGear !== 3) ? "#ffffff" : "#333333"
                }
            },
            State {
                name: "yellow"
                when: DataSource.lrTirePressureColor === 2
                PropertyChanges {
                    target: lrTireValue1
                    color: "#ffff00"
                }
            },
            State {
                name: "red"
                when: DataSource.lrTirePressureColor === 3
                PropertyChanges {
                    target: lrTireValue1
                    color: "#ff0000"
                }
            }
        ]
    }
    
    Text {
        font.bold:rootItemId.jiacu === 1
        id: lrTireUnit1
        text: qsTr("kPa")
		font.family: rootItemId.ziti
        font.pixelSize: 22
        anchors.left: lrTireValue1.right
        anchors.leftMargin: 3
        anchors.bottom: lrTireValue1.bottom
        anchors.bottomMargin: 2
        visible: lrTireValue1.visible
        color: DataSource.lrTirePressureColor === 1 ? (DataSource.dayNightMode === 0x02 ? "#80ffffff" : "#575757") : lrTireValue1.color
        states: [
            State {
                name: "bar"
                when: DataSource.tirePressureUnit === 1
                PropertyChanges {
                    target: lrTireUnit1
                    text: "bar"
                }
            },
            State {
                name: "psi"
                when: DataSource.tirePressureUnit === 2
                PropertyChanges {
                    target: lrTireUnit1
                    text: "psi"
                }
            },
            State {
                name: "kPa"
                when: DataSource.tirePressureUnit === 3
                PropertyChanges {
                    target: lrTireUnit1
                    text: "kPa"
                }
            }
        ]
    }

    Rectangle {
        width: lrTireValue1.width + lrTireUnit1.width + 3
        height: 1
        x: lrTireValue1.x
        y: 215
        color: DataSource.lrTirePressureColor === 1 ? (DataSource.dayNightMode === 0x02 ? "#80ffffff" : "#575757") : lrTireValue1.color
        opacity: 0
    }

    Text {
        font.bold:rootItemId.jiacu === 1
        id: lrTireTempValue1
        text: DataSource.lrTireTempValue
		font.family: rootItemId.ziti
        font.pixelSize: 30
        x: 46+88
        y: 220-6
        states: [
            State {
                name: "white"
                when: DataSource.lrTireTempColor === 1
                PropertyChanges {
                    target: lrTireTempValue1
                    color: (DataSource.dayNightMode === 0x02 || DataSource.powerGear !== 3) ? "#ffffff" : "#333333"
                }
            },
            State {
                name: "yellow"
                when: DataSource.lrTireTempColor === 2
                PropertyChanges {
                    target: lrTireTempValue1
                    color: "#ffff00"
                }
            },
            State {
                name: "red"
                when: DataSource.lrTireTempColor === 3
                PropertyChanges {
                    target: lrTireTempValue1
                    color: "#ff0000"
                }
            }
        ]
    }

    Text {
        font.bold:rootItemId.jiacu === 1
        id: lrTireTempUnit1
        text: DataSource.tireTempUnit !== 1 ? "°C" : "°F"
		font.family: rootItemId.ziti
        anchors.left: lrTireTempValue1.right
        anchors.leftMargin: 3
        anchors.bottom: lrTireTempValue1.bottom
        anchors.bottomMargin: 3
        color: DataSource.lrTireTempColor === 1 ? (DataSource.dayNightMode === 0x02 ? "#80ffffff" : "#575757") : lrTireTempValue1.color
        font.pixelSize: 22
        horizontalAlignment: Text.AlignHCenter
    }

    // 右后轮胎
    Text {
        font.bold:rootItemId.jiacu === 1
        id: rrTireValue1
        font.pixelSize: 30
        x: 262+88
        y: 185-2
        text: DataSource.rrTirePressureValue
		font.family: rootItemId.ziti
        states: [
            State {
                name: "white"
                when: DataSource.rrTirePressureColor === 1
                PropertyChanges {
                    target: rrTireValue1
                    color: (DataSource.dayNightMode === 0x02 || DataSource.powerGear !== 3) ? "#ffffff" : "#333333"
                }
            },
            State {
                name: "yellow"
                when: DataSource.rrTirePressureColor === 2
                PropertyChanges {
                    target: rrTireValue1
                    color: "#ffff00"
                }
            },
            State {
                name: "red"
                when: DataSource.rrTirePressureColor === 3
                PropertyChanges {
                    target: rrTireValue1
                    color: "#ff0000"
                }
            }
        ]
    }
    
    Text {
        font.bold:rootItemId.jiacu === 1
        id: rrTireUnit1
        text: qsTr("kPa")
		font.family: rootItemId.ziti
        font.pixelSize: 22
        anchors.left: rrTireValue1.right
        anchors.leftMargin: 3
        anchors.bottom: rrTireValue1.bottom
        anchors.bottomMargin: 2
        visible: rrTireValue1.visible
        color: DataSource.rrTirePressureColor === 1 ? (DataSource.dayNightMode === 0x02 ? "#80ffffff" : "#575757") : rrTireValue1.color
        states: [
            State {
                name: "bar"
                when: DataSource.tirePressureUnit === 1
                PropertyChanges {
                    target: rrTireUnit1
                    text: "bar"
                }
            },
            State {
                name: "psi"
                when: DataSource.tirePressureUnit === 2
                PropertyChanges {
                    target: rrTireUnit1
                    text: "psi"
                }
            },
            State {
                name: "kPa"
                when: DataSource.tirePressureUnit === 3
                PropertyChanges {
                    target: rrTireUnit1
                    text: "kPa"
                }
            }
        ]
    }

    Rectangle {
        width: rrTireValue1.width + rrTireUnit1.width + 3
        height: 1
        x: rrTireValue1.x
        y: 215
        color: DataSource.rrTirePressureColor === 1 ? (DataSource.dayNightMode === 0x02 ? "#80ffffff" : "#575757") : rrTireValue1.color
        opacity: 0
    }

    Text {
        font.bold:rootItemId.jiacu === 1
        id: rrTireTempValue1
        font.pixelSize: 30
        x: 282+88
        y: 220-6
        text: DataSource.rrTireTempValue
		font.family: rootItemId.ziti
        states: [
            State {
                name: "white"
                when: DataSource.rrTireTempColor === 1
                PropertyChanges {
                    target: rrTireTempValue1
                    color: (DataSource.dayNightMode === 0x02 || DataSource.powerGear !== 3) ? "#ffffff" : "#333333"
                }
            },
            State {
                name: "yellow"
                when: DataSource.rrTireTempColor === 2
                PropertyChanges {
                    target: rrTireTempValue1
                    color: "#ffff00"
                }
            },
            State {
                name: "red"
                when: DataSource.rrTireTempColor === 3
                PropertyChanges {
                    target: rrTireTempValue1
                    color: "#ff0000"
                }
            }
        ]
    }

    Text {
        font.bold:rootItemId.jiacu === 1
        id: rrTireTempUnit1
        text: DataSource.tireTempUnit !== 1 ? "°C" : "°F"
		font.family: rootItemId.ziti
        anchors.left: rrTireTempValue1.right
        anchors.leftMargin: 3
        anchors.bottom: rrTireTempValue1.bottom
        anchors.bottomMargin: 3        
        font.pixelSize: 22
        horizontalAlignment: Text.AlignHCenter
        color: DataSource.rrTireTempColor === 1 ? (DataSource.dayNightMode === 0x02 ? "#80ffffff" : "#575757") : rrTireTempValue1.color
    }
}