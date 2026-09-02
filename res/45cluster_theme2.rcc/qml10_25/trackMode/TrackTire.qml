import QtQuick 2.0
import com.byd.DataSource 1.0
import com.byd.CenterChild 1.0
import "qrc:/common/singleton"

Rectangle {
    height: 289
    width: 326
    color: "transparent"

    Image {
        id: tireBody
        anchors.horizontalCenter: parent.horizontalCenter
        y: 0
        source: "qrc:/images10_25/trackMode/tire/car_tire.png"
        cache: false
    }
    //水平线
    Image {
        y:78
        anchors.horizontalCenter: parent.horizontalCenter
        source: "qrc:/images10_25/trackMode/tire/horizontalLine.png"
        cache: false
    }
    Image {
        y:213
        anchors.horizontalCenter: parent.horizontalCenter
        source: "qrc:/images10_25/trackMode/tire/horizontalLine.png"
        cache: false
    }
    //前电机
    Image{
        x: 132
        y: 32
        cache: false
        source: {
            if(DataSource.trackFMotorTempColor === 0x01){
                "qrc:/images10_25/trackMode/tire/tireMotor_green.png"
            }else if(DataSource.trackFMotorTempColor === 0x02){
                "qrc:/images10_25/trackMode/tire/tireMotor_yellow.png"
            }else if(DataSource.trackFMotorTempColor === 0x03){
                "qrc:/images10_25/trackMode/tire/tireMotor_red.png"
            }else{
                "qrc:/images10_25/trackMode/tire/tireMotor_white.png"
            }
        }
    }
    //后电机
    Image{
        x: 132
        y: 226
        cache: false
        source: {
            if(DataSource.trackRMotorTempColor === 0x01){
                "qrc:/images10_25/trackMode/tire/tireMotor_green.png"
            }else if(DataSource.trackRMotorTempColor === 0x02){
                "qrc:/images10_25/trackMode/tire/tireMotor_yellow.png"
            }else if(DataSource.trackRMotorTempColor === 0x03){
                "qrc:/images10_25/trackMode/tire/tireMotor_red.png"
            }else{
                "qrc:/images10_25/trackMode/tire/tireMotor_white.png"
            }
        }
    }
    //电池
    Image{
        anchors.horizontalCenter: parent.horizontalCenter
        y: 119
        cache: false
        source: {
            if(DataSource.trackBatTempColor === 0x01){
                "qrc:/images10_25/trackMode/tire/tireBattery_green.png"
            }else if(DataSource.trackBatTempColor === 0x02){
                "qrc:/images10_25/trackMode/tire/tireBattery_yellow.png"
            }else if(DataSource.trackBatTempColor === 0x03){
                "qrc:/images10_25/trackMode/tire/tireBattery_red.png"
            }else{
                "qrc:/images10_25/trackMode/tire/tireBattery_white.png"
            }
        }
    }
    //直接式胎压
    Item{
        width: parent.width
        Item {
            id: lfTire
            visible: DataSource.lfTireNormal === 1 ? 1 : 0
            Image {
                id: lfWheel
                x: 85
                y: 36
                source: {
                    if (DataSource.trackLfWheelColor === 1) {
                        "qrc:/images10_25/trackMode/tire/wheel_green.png"
                    } else if (DataSource.trackLfWheelColor === 2) {
                        "qrc:/images10_25/trackMode/tire/wheel_yellow.png"
                    } else if (DataSource.trackLfWheelColor === 3) {
                        "qrc:/images10_25/trackMode/tire/wheel_red.png"
                    } else {
                        "qrc:/images10_25/trackMode/tire/wheel_white.png"
                    }
                }
                cache: false
            }
            Rectangle {
                width: 98
                height: 59
                x: 0
                y: 34
                color: "transparent"
                Image{
                    id:lfCircle
                    x:70
                    y:21
                    cache: false
                    source: {
                        if (DataSource.trackLfWheelColor === 1) {
                            "qrc:/images10_25/trackMode/tire/circle_green.png"
                        } else if (DataSource.trackLfWheelColor === 2) {
                            "qrc:/images10_25/trackMode/tire/circle_yellow.png"
                        } else if (DataSource.trackLfWheelColor === 3) {
                            "qrc:/images10_25/trackMode/tire/circle_red.png"
                        } else {
                            "qrc:/images10_25/trackMode/tire/circle_white.png"
                        }
                    }
                }
                Image {
                    id: lfLine
                    y:26
                    x:2
                    source:"qrc:/images10_25/trackMode/tire/front_left.png"
                    cache: false
                }
                Text {
                    font.bold:rootItemId.jiacu === 1
                    font.family: rootItemId.ziti
                    id: lfTireValue
                    font.pixelSize: 30
                    anchors.left: parent.left
                    anchors.leftMargin: -5
                    anchors.bottom: lfLine.top
                    anchors.bottomMargin: 3
                    visible: (DataSource.trackTireDisplay === 1&&DataSource.lfTirePressureColor !== 0) ? 1 : 0
                    text: DataSource.lfTirePressureValue
                    states: [
                        State {
                            name: "white"
                            when: DataSource.lfTirePressureColor === 1
                            PropertyChanges {
                                target: lfTireValue
                                color: "#ffffff"
                            }
                        },
                        State {
                            name: "yellow"
                            when: DataSource.lfTirePressureColor === 2
                            PropertyChanges {
                                target: lfTireValue
                                color: "#ffbf00"
                            }
                        },
                        State {
                            name: "red"
                            when: DataSource.lfTirePressureColor === 3
                            PropertyChanges {
                                target: lfTireValue
                                color: "#ff000e"
                            }
                        }
                    ]
                }
                Text {
                    font.bold:rootItemId.jiacu === 1
                    font.family: rootItemId.ziti
                    id: lfTireUnit
                    text: "kPa"
                    font.pixelSize: 24
                    anchors.left: lfTireValue.right
                    anchors.leftMargin: 4
                    anchors.bottom: lfTireValue.bottom
                    visible: lfTireValue.visible
                    color: lfTireValue.color
                    states: [
                        State {
                            name: "bar"
                            when: DataSource.tirePressureUnit === 1
                            PropertyChanges {
                                target: lfTireUnit
                                text: "bar"
                            }
                        },
                        State {
                            name: "psi"
                            when: DataSource.tirePressureUnit === 2
                            PropertyChanges {
                                target: lfTireUnit
                                text: "psi"
                            }
                        },
                        State {
                            name: "kPa"
                            when: DataSource.tirePressureUnit === 3
                            PropertyChanges {
                                target: lfTireUnit
                                text: "kPa"
                            }
                        }
                    ]
                }
                Text {
                    font.bold:rootItemId.jiacu === 1
                    font.family: rootItemId.ziti
                    id: lfTireTempValue
                    text: DataSource.lfTireTempValue
                    anchors.top: lfLine.top
                    anchors.topMargin: 3
                    anchors.left: lfTireValue.left
                    font.pixelSize: DataSource.trackLfTireTempColor === 3 ? 32 : 27
                    visible: (DataSource.trackTireDisplay === 1 &&DataSource.trackLfTireTempColor !== 0) ? 1 : 0
                    states: [
                        State {
                            name: "white"
                            when: DataSource.trackLfTireTempColor === 1
                            PropertyChanges {
                                target: lfTireTempValue
                                color: "#ffffff"
                            }
                        },
                        State {
                            name: "yellow"
                            when: DataSource.trackLfTireTempColor === 2
                            PropertyChanges {
                                target: lfTireTempValue
                                color: "#ffbf00"
                            }
                        },
                        State {
                            name: "red"
                            when: DataSource.trackLfTireTempColor === 3
                            PropertyChanges {
                                target: lfTireTempValue
                                color: "#ff000e"
                            }
                        }
                    ]
                }
                Text {
                    font.bold:rootItemId.jiacu === 1
                    font.family: rootItemId.ziti
                    id: lfTireTempUnit
                    text: DataSource.tireTempUnit !== 1 ? "°C" : "°F"
                    anchors.bottom: lfTireTempValue.bottom
                    anchors.bottomMargin: 1
                    anchors.left: lfTireTempValue.right
                    anchors.leftMargin: 2
                    font.pixelSize: 24
                    horizontalAlignment: Text.AlignHCenter
                    color: lfTireTempValue.color
                    visible: lfTireTempValue.visible
                }
            }
        }
        Item {
            id: rfTire
            visible: DataSource.rfTireNormal === 1 ? 1 : 0
            Image {
                id: rfWheel
                x: 181
                y: 36
                source: {
                    if (DataSource.trackRfWheelColor === 1) {
                        "qrc:/images10_25/trackMode/tire/wheel_green.png"
                    } else if (DataSource.trackRfWheelColor === 2) {
                        "qrc:/images10_25/trackMode/tire/wheel_yellow.png"
                    } else if (DataSource.trackRfWheelColor === 3) {
                        "qrc:/images10_25/trackMode/tire/wheel_red.png"
                    } else {
                        "qrc:/images10_25/trackMode/tire/wheel_white.png"
                    }
                }
                cache: false
            }
            Rectangle {
                width: 98
                height: 59
                y: 34
                x: 227
                color: "transparent"
                Image{
                    id:rfCircle
                    x:-12
                    y:21
                    cache: false
                    source: {
                        if (DataSource.trackRfWheelColor === 1) {
                            "qrc:/images10_25/trackMode/tire/circle_green.png"
                        } else if (DataSource.trackRfWheelColor === 2) {
                            "qrc:/images10_25/trackMode/tire/circle_yellow.png"
                        } else if (DataSource.trackRfWheelColor === 3) {
                            "qrc:/images10_25/trackMode/tire/circle_red.png"
                        } else {
                            "qrc:/images10_25/trackMode/tire/circle_white.png"
                        }
                    }
                }
                Image {
                    id: rfLine
                    x:10
                    y:27
                    source: "qrc:/images10_25/trackMode/tire/front_right.png"
                    cache: false
                }
                Text {
                    font.bold:rootItemId.jiacu === 1
                    font.family: rootItemId.ziti
                    id: rfTireValue
                    font.pixelSize: 30
                    anchors.bottom: rfLine.top
                    anchors.bottomMargin: 3
                    anchors.right: rfTireUnit.left
                    anchors.rightMargin: 4
                    visible: (DataSource.trackTireDisplay === 1&&DataSource.rfTirePressureColor !== 0) ? 1 : 0
                    text: DataSource.rfTirePressureValue
                    states: [
                        State {
                            name: "white"
                            when: DataSource.rfTirePressureColor === 1
                            PropertyChanges {
                                target: rfTireValue
                                color: "#ffffff"
                            }
                        },
                        State {
                            name: "yellow"
                            when: DataSource.rfTirePressureColor === 2
                            PropertyChanges {
                                target: rfTireValue
                                color: "#ffbf00"
                            }
                        },
                        State {
                            name: "red"
                            when: DataSource.rfTirePressureColor === 3
                            PropertyChanges {
                                target: rfTireValue
                                color: "#ff000e"
                            }
                        }
                    ]
                }
                Text {
                    font.bold:rootItemId.jiacu === 1
                    font.family: rootItemId.ziti
                    id: rfTireUnit
                    text: "kPa"
                    font.pixelSize: 24
                    anchors.right: parent.right
                    anchors.rightMargin: -5
                    anchors.bottom: rfTireValue.bottom
                    visible: rfTireValue.visible
                    color: rfTireValue.color
                    states: [
                        State {
                            name: "bar"
                            when: DataSource.tirePressureUnit === 1
                            PropertyChanges {
                                target: rfTireUnit
                                text: "bar"
                            }
                        },
                        State {
                            name: "psi"
                            when: DataSource.tirePressureUnit === 2
                            PropertyChanges {
                                target: rfTireUnit
                                text: "psi"
                            }
                        },
                        State {
                            name: "kPa"
                            when: DataSource.tirePressureUnit === 3
                            PropertyChanges {
                                target: rfTireUnit
                                text: "kPa"
                            }
                        }
                    ]
                }
                Text {
                    font.bold:rootItemId.jiacu === 1
                    font.family: rootItemId.ziti
                    id: rfTireTempValue
                    anchors.top: rfLine.top
                    anchors.topMargin: 3
                    font.pixelSize: DataSource.trackRfTireTempColor === 3 ? 32 : 27
                    anchors.right: rfTireTempUnit.left
                    anchors.rightMargin: 2
                    text: DataSource.rfTireTempValue
                    visible: (DataSource.trackTireDisplay === 1&&DataSource.trackRfTireTempColor !== 0) ? 1 : 0
                    states: [
                        State {
                            name: "white"
                            when: DataSource.trackRfTireTempColor === 1
                            PropertyChanges {
                                target: rfTireTempValue
                                color: "#ffffff"
                            }
                        },
                        State {
                            name: "yellow"
                            when: DataSource.trackRfTireTempColor === 2
                            PropertyChanges {
                                target: rfTireTempValue
                                color: "#ffbf00"
                            }
                        },
                        State {
                            name: "red"
                            when: DataSource.trackRfTireTempColor === 3
                            PropertyChanges {
                                target: rfTireTempValue
                                color: "#ff000e"
                            }
                        }
                    ]
                }
                Text {
                    font.bold:rootItemId.jiacu === 1
                    font.family: rootItemId.ziti
                    id: rfTireTempUnit
                    text: DataSource.tireTempUnit !== 1 ? "°C" : "°F"
                    anchors.bottom: rfTireTempValue.bottom
                    anchors.bottomMargin: 1
                    anchors.right: parent.right
                    anchors.rightMargin: -5
                    font.pixelSize: 24
                    horizontalAlignment: Text.AlignHCenter
                    color: rfTireTempValue.color
                    visible: rfTireTempValue.visible
                }
            }
        }
        Item {
            id: lrTire
            visible: DataSource.lrTireNormal === 1 ? 1 : 0
            Image {
                id: lrWheel
                x: 85
                y: 172
                source: {
                    if (DataSource.trackLrWheelColor === 1) {
                        "qrc:/images10_25/trackMode/tire/wheel_green.png"
                    } else if (DataSource.trackLrWheelColor === 2) {
                        "qrc:/images10_25/trackMode/tire/wheel_yellow.png"
                    } else if (DataSource.trackLrWheelColor === 3) {
                        "qrc:/images10_25/trackMode/tire/wheel_red.png"
                    } else {
                        "qrc:/images10_25/trackMode/tire/wheel_white.png"
                    }
                }
                cache: false
            }
            Rectangle {
                width: 98
                height: 59
                x: 0
                y: 205
                color: "transparent"
                Image{
                    id:lrCircle
                    x:70
                    y:-4
                    cache: false
                    source: {
                        if (DataSource.trackLrWheelColor === 1) {
                            "qrc:/images10_25/trackMode/tire/circle_green.png"
                        } else if (DataSource.trackLrWheelColor === 2) {
                            "qrc:/images10_25/trackMode/tire/circle_yellow.png"
                        } else if (DataSource.trackLrWheelColor === 3) {
                            "qrc:/images10_25/trackMode/tire/circle_red.png"
                        } else {
                            "qrc:/images10_25/trackMode/tire/circle_white.png"
                        }
                    }
                }
                Image {
                    id: lrLine
                    x:3
                    y:15
                    source: "qrc:/images10_25/trackMode/tire/back_left.png"
                    cache: false
                }
                Text {
                    font.bold:rootItemId.jiacu === 1
                    font.family: rootItemId.ziti
                    id: lrTireTempValue
                    text: DataSource.lrTireTempValue
                    anchors.left: lrLine.left
                    anchors.leftMargin: -5
                    anchors.bottom: lrLine.bottom
                    anchors.bottomMargin: 3
                    font.pixelSize: DataSource.trackLrTireTempColor === 3 ? 32 : 27
                    visible: (DataSource.trackTireDisplay === 1&&DataSource.trackLrTireTempColor !== 0) ? 1 : 0
                    states: [
                        State {
                            name: "white"
                            when: DataSource.trackLrTireTempColor === 1
                            PropertyChanges {
                                target: lrTireTempValue
                                color: "#ffffff"
                            }
                        },
                        State {
                            name: "yellow"
                            when: DataSource.trackLrTireTempColor === 2
                            PropertyChanges {
                                target: lrTireTempValue
                                color: "#ffbf00"
                            }
                        },
                        State {
                            name: "red"
                            when: DataSource.trackLrTireTempColor === 3
                            PropertyChanges {
                                target: lrTireTempValue
                                color: "#ff000e"
                            }
                        }
                    ]
                }
                Text {
                    font.bold:rootItemId.jiacu === 1
                    font.family: rootItemId.ziti
                    id: lrTireTempUnit
                    text: DataSource.tireTempUnit !== 1 ? "°C" : "°F"
                    anchors.bottom: lrTireTempValue.bottom
                    anchors.bottomMargin: 1
                    anchors.left: lrTireTempValue.right
                    anchors.leftMargin: 2
                    color: lrTireTempValue.color
                    font.pixelSize: 24
                    horizontalAlignment: Text.AlignHCenter
                    visible: lrTireTempValue.visible
                }
                Text {
                    font.bold:rootItemId.jiacu === 1
                    font.family: rootItemId.ziti
                    id: lrTireValue
                    text: DataSource.lrTirePressureValue
                    font.pixelSize: 30
                    anchors.left: parent.left
                    anchors.leftMargin: -5
                    anchors.top: lrLine.bottom
                    visible:(DataSource.trackTireDisplay === 1&&DataSource.lrTirePressureColor !== 0) ? 1 : 0
                    states: [
                        State {
                            name: "white"
                            when: DataSource.lrTirePressureColor === 1
                            PropertyChanges {
                                target: lrTireValue
                                color: "#ffffff"
                            }
                        },
                        State {
                            name: "yellow"
                            when: DataSource.lrTirePressureColor === 2
                            PropertyChanges {
                                target: lrTireValue
                                color: "#ffbf00"
                            }
                        },
                        State {
                            name: "red"
                            when: DataSource.lrTirePressureColor === 3
                            PropertyChanges {
                                target: lrTireValue
                                color: "#ff000e"
                            }
                        }
                    ]
                }
                Text {
                    font.bold:rootItemId.jiacu === 1
                    font.family: rootItemId.ziti
                    id: lrTireUnit
                    text: "kPa"
                    font.pixelSize: 24
                    anchors.left: lrTireValue.right
                    anchors.leftMargin: 4
                    anchors.bottom: lrTireValue.bottom
                    anchors.bottomMargin: 1
                    visible: lrTireValue.visible
                    color: lrTireValue.color
                    states: [
                        State {
                            name: "bar"
                            when: DataSource.tirePressureUnit === 1
                            PropertyChanges {
                                target: lrTireUnit
                                text: "bar"
                            }
                        },
                        State {
                            name: "psi"
                            when: DataSource.tirePressureUnit === 2
                            PropertyChanges {
                                target: lrTireUnit
                                text: "psi"
                            }
                        },
                        State {
                            name: "kPa"
                            when: DataSource.tirePressureUnit === 3
                            PropertyChanges {
                                target: lrTireUnit
                                text: "kPa"
                            }
                        }
                    ]
                }
            }
        }
        Item {
            id: rrTire
            visible: DataSource.rrTireNormal === 1 ? 1 : 0
            Image {
                id: rrWheel
                x: 181
                y: 172
                source: {
                    if (DataSource.trackRrWheelColor === 1) {
                        "qrc:/images10_25/trackMode/tire/wheel_green.png"
                    } else if (DataSource.trackRrWheelColor === 2) {
                        "qrc:/images10_25/trackMode/tire/wheel_yellow.png"
                    } else if (DataSource.trackRrWheelColor === 3) {
                        "qrc:/images10_25/trackMode/tire/wheel_red.png"
                    } else {
                        "qrc:/images10_25/trackMode/tire/wheel_white.png"
                    }
                }
                cache: false
            }

            Rectangle {
                width: 98
                height: 64
                y: 205
                x: 227
                color: "transparent"
                Image{
                    id:rrCircle
                    x:-12
                    y:-4
                    cache: false
                    source: {
                        if (DataSource.trackRrWheelColor === 1) {
                            "qrc:/images10_25/trackMode/tire/circle_green.png"
                        } else if (DataSource.trackRrWheelColor === 2) {
                            "qrc:/images10_25/trackMode/tire/circle_yellow.png"
                        } else if (DataSource.trackRrWheelColor === 3) {
                            "qrc:/images10_25/trackMode/tire/circle_red.png"
                        } else {
                            "qrc:/images10_25/trackMode/tire/circle_white.png"
                        }
                    }
                }
                Image {
                    id: rrLine
                    x:9
                    y:15
                    source: "qrc:/images10_25/trackMode/tire/back_right.png"
                    cache: false
                }
                Text {
                    font.bold:rootItemId.jiacu === 1
                    font.family: rootItemId.ziti
                    id: rrTireTempValue
                    anchors.bottom: rrLine.bottom
                    anchors.bottomMargin: 3
                    font.pixelSize: DataSource.trackRrTireTempColor === 3 ? 32 : 27
                    anchors.right: rrTireTempUnit.left
                    anchors.rightMargin: 2
                    text: DataSource.rrTireTempValue
                    visible: (DataSource.trackTireDisplay === 1&&DataSource.trackRrTireTempColor !== 0) ? 1 : 0
                    states: [
                        State {
                            name: "white"
                            when: DataSource.trackRrTireTempColor === 1
                            PropertyChanges {
                                target: rrTireTempValue
                                color: "#ffffff"
                            }
                        },
                        State {
                            name: "yellow"
                            when: DataSource.trackRrTireTempColor === 2
                            PropertyChanges {
                                target: rrTireTempValue
                                color: "#ffbf00"
                            }
                        },
                        State {
                            name: "red"
                            when: DataSource.trackRrTireTempColor === 3
                            PropertyChanges {
                                target: rrTireTempValue
                                color: "#ff000e"
                            }
                        }
                    ]
                }

                Text {
                    font.bold:rootItemId.jiacu === 1
                    font.family: rootItemId.ziti
                    id: rrTireTempUnit
                    text: DataSource.tireTempUnit !== 1 ? "°C" : "°F"
                    anchors.bottom: rrTireTempValue.bottom
                    anchors.bottomMargin: 1
                    anchors.right: parent.right
                    anchors.rightMargin: -5
                    font.pixelSize: 24
                    horizontalAlignment: Text.AlignHCenter
                    color: rrTireTempValue.color
                    visible: rrTireTempValue.visible
                }
                Text {
                    font.bold:rootItemId.jiacu === 1
                    font.family: rootItemId.ziti
                    id: rrTireValue
                    font.pixelSize: 30
                    anchors.right: rrTireUnit.left
                    anchors.rightMargin: 4
                    anchors.top: rrLine.bottom
                    visible: (DataSource.trackTireDisplay === 1&&DataSource.rrTirePressureColor !== 0) ? 1 : 0
                    text: DataSource.rrTirePressureValue
                    states: [
                        State {
                            name: "white"
                            when: DataSource.rrTirePressureColor === 1
                            PropertyChanges {
                                target: rrTireValue
                                color: "#ffffff"
                            }
                        },
                        State {
                            name: "yellow"
                            when: DataSource.rrTirePressureColor === 2
                            PropertyChanges {
                                target: rrTireValue
                                color: "#ffbf00"
                            }
                        },
                        State {
                            name: "red"
                            when: DataSource.rrTirePressureColor === 3
                            PropertyChanges {
                                target: rrTireValue
                                color: "#ff000e"
                            }
                        }
                    ]
                }

                Text {
                    font.bold:rootItemId.jiacu === 1
                    font.family: rootItemId.ziti
                    id: rrTireUnit
                    text: "kPa"
                    font.pixelSize: 24
                    anchors.right: rrLine.right
                    anchors.rightMargin: -5
                    anchors.bottom: rrTireValue.bottom
                    anchors.bottomMargin: 1
                    visible: rrTireValue.visible
                    color: rrTireValue.color
                    states: [
                        State {
                            name: "bar"
                            when: DataSource.tirePressureUnit === 1
                            PropertyChanges {
                                target: rrTireUnit
                                text: "bar"
                            }
                        },
                        State {
                            name: "psi"
                            when: DataSource.tirePressureUnit === 2
                            PropertyChanges {
                                target: rrTireUnit
                                text: "psi"
                            }
                        },
                        State {
                            name: "kPa"
                            when: DataSource.tirePressureUnit === 3
                            PropertyChanges {
                                target: rrTireUnit
                                text: "kPa"
                            }
                        }
                    ]
                }
            }
        }
        Image {
            id: lfAbnormal
            visible: (DataSource.trackTireDisplay === 1&&DataSource.lfTireNormal !== 1) ? 1 : 0
            width: 326
            cache: false
            Image {
                x: 85
                y: 36
                source: "qrc:/images10_25/trackMode/tire/wheel_yellow.png"
                cache: false
            }
            Image{
                x:70
                y:55
                cache: false
                source: "qrc:/images10_25/trackMode/tire/circle_yellow.png"
            }
            Image {
                id: line
                y:59
                x:2
                source:"qrc:/images10_25/trackMode/tire/front_left.png"
                cache: false
            }
            Text {
                font.bold:rootItemId.jiacu === 1
                font.family: rootItemId.ziti
                text: TranslateStr.driveInfo_tireSignalStr
                x: 0
                color: "#ffbf00"
                font.pixelSize: 20
                anchors.bottom: line.top
                anchors.bottomMargin: 3
            }
        }
        Image {
            id: rfAbnormal
            visible: (DataSource.trackTireDisplay === 1&&DataSource.rfTireNormal !== 1) ? 1 : 0
            width: 326
            cache: false
            Image {
                x: 181
                y: 36
                source: "qrc:/images10_25/trackMode/tire/wheel_yellow.png"
                cache: false
            }
            Image{
                x:215
                y:55
                cache: false
                source: "qrc:/images10_25/trackMode/tire/circle_yellow.png"
            }
            Image {
                id: line2
                y:59
                x:237
                source:"qrc:/images10_25/trackMode/tire/front_right.png"
                cache: false
            }
            Text {
                font.bold:rootItemId.jiacu === 1
                font.family: rootItemId.ziti
                id:text2
                text: TranslateStr.driveInfo_tireSignalStr
                color: "#ffbf00"
                font.pixelSize: 20
                //                x:326-text4.width
                anchors.right: parent.right
                anchors.bottom: line2.top
                anchors.bottomMargin: 3
            }
        }
        Image {
            id: lrAbnormal
            visible: (DataSource.trackTireDisplay === 1&&DataSource.lrTireNormal !== 1) ? 1 : 0
            width: 326
            cache: false
            Image {
                x: 85
                y: 172
                source: "qrc:/images10_25/trackMode/tire/wheel_yellow.png"
                cache: false
            }
            Image{
                x:70
                y:201
                cache: false
                source: "qrc:/images10_25/trackMode/tire/circle_yellow.png"
            }
            Image {
                id: line3
                y:220
                x:3
                source:"qrc:/images10_25/trackMode/tire/back_left.png"
                cache: false
            }
            Text {
                font.bold:rootItemId.jiacu === 1
                font.family: rootItemId.ziti
                text: TranslateStr.driveInfo_tireSignalStr
                x: 0
                color: "#ffbf00"
                font.pixelSize: 20
                anchors.bottom: line3.bottom
                anchors.bottomMargin: 3
            }
        }
        Image {
            id: rrAbnormal
            visible: (DataSource.trackTireDisplay === 1&&DataSource.rrTireNormal !== 1) ? 1 : 0
            width: 326
            cache: false
            Image {
                x: 181
                y: 172
                source: "qrc:/images10_25/trackMode/tire/wheel_yellow.png"
                cache: false
            }
            Image{
                x:215
                y:201
                cache: false
                source: "qrc:/images10_25/trackMode/tire/circle_yellow.png"
            }
            Image {
                id: line4
                y:220
                x:236
                source:"qrc:/images10_25/trackMode/tire/back_right.png"
                cache: false
            }
            Text {
                font.bold:rootItemId.jiacu === 1
                font.family: rootItemId.ziti
                id:text4
                text: TranslateStr.driveInfo_tireSignalStr
                color: "#ffbf00"
                font.pixelSize: 20
                anchors.right: parent.right
                anchors.bottom: line4.bottom
                anchors.bottomMargin: 3
            }
        }

    }
}
