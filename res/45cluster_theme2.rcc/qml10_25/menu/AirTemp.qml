import QtQuick 2.0
import com.byd.DataSource 1.0
import "qrc:/common/singleton"

Item {
    height: 329
    y: 96
    x: 14
    width: 710
    visible: DataSource.acOpenState === 0 ? false : true

    property var tempValue: DataSource.acTemperature
    property bool acVentilationFlag:DataSource.acVentilation !== 0?true:false
    onTempValueChanged: {
        displayTempValue()
    }
    onAcVentilationFlagChanged: {
        displayTempValue()
    }
    Connections{
        target: DataSource
        function onAcTemperatureUnitChanged(){
            displayTempValue()
        }
        function onAcTypeChanged(){
            displayTempValue()
        }
        function onAcVentilationChanged(){
            if(DataSource.acVentilation !== 0){
                acVentilationFlag = true
            }else{
                acVentilationFlag = false
            }

            displayTempValue()
        }
    }

    Item {
        id: acOpenItem
        anchors.fill: parent
        visible: DataSource.acOpenState === 1 ? true : false

        Image {
            id: tempBg
            source: "qrc:/images10_25/menu/day/air_temp_bg.png"
            anchors.left: parent.left
            anchors.leftMargin: 307
            cache: false

            Image {
                id: tempBar
                source: "qrc:/images10_25/menu/day/air_temp_bar.png"
                //  anchors.centerIn: parent
                anchors.horizontalCenter: parent.horizontalCenter
                y:30
                cache: false

                Image {
                    id: tempDot
                    source: "qrc:/images10_25/menu/day/air_temp_dot.png"
                    anchors.horizontalCenter: parent.horizontalCenter
                    y: tempBar.height - height
                    cache: false

                    Component.onCompleted: {
                        displayTempValue()
                    }
                }
            }
        }

        Text {
            font.bold:rootItemId.jiacu === 1
            font.family: rootItemId.ziti
            id: hiText
            text: qsTr("Hi")
            anchors.right: tempBg.left
            y: 18
            color: "#ff3b00"
            font.pixelSize: 28
            visible: DataSource.acType !== 2 ? 1 : 0
        }

        Text {
            font.bold:rootItemId.jiacu === 1
            font.family: rootItemId.ziti
            id: lowText
            text: qsTr("Lo")
            anchors.right: tempBg.left
            y: 261
            color: "#3c8efd"
            font.pixelSize: 28
            visible: DataSource.acType !== 2 ? 1 : 0
        }

        Text {
            font.bold:rootItemId.jiacu === 1
            font.family: rootItemId.ziti
            id: tempId
            x: 406
            y: 128
            color: DataSource.dayNightMode === 0x02?"#ffffff":"#333333"
            font.pixelSize: acVentilationFlag=== true ? 48 : 60
            Component.onCompleted: {
                displayTempValue()
            }
        }

        Text {
            font.bold:rootItemId.jiacu === 1
            font.family: rootItemId.ziti
            id: tempUnit
            text: DataSource.acTemperatureUnit === 0 ? "°C" : "°F"
            anchors.left: tempId.right
            anchors.bottom: tempId.bottom
            anchors.bottomMargin: 6
            font.pixelSize: 26
            color: DataSource.dayNightMode === 0x02?"#ffffff":"#333333"
            visible: DataSource.acType !== 2 ? tempId.visible :0
        }
    }

    function displayTempValue(){
        if(acVentilationFlag){
            tempId.visible = 1
            tempUnit.visible = 0
            tempDot.visible = 0
            tempId.text = TranslateStr.menu_acVentilationStr
        }else{
            if (DataSource.acType !== 2){
                if (DataSource.acTemperatureUnit === 0){
                    if (tempValue < 17){
                        tempDot.visible = 0
                        tempId.visible = 0
                        tempUnit.visible = 0
                    } else if (tempValue === 17){
                        tempDot.y = tempBar.height - 31
                        tempId.visible = 1
                        tempUnit.visible = 0
                        tempDot.visible = 1
                        tempId.text = "Lo"
                    } else if (tempValue < 33) {
                        tempDot.y = tempBar.height - 31-(tempValue- 17)*240/16
                        tempId.visible = 1
                        tempUnit.visible = 1
                        tempDot.visible = 1
                        tempId.text = tempValue
                    } else if(tempValue === 33){
                        tempDot.y = tempBar.height - 31-(33- 17)*240/16
                        tempId.visible = 1
                        tempUnit.visible = 0
                        tempDot.visible = 1
                        tempId.text = "Hi"
                    }
                }else {
                    if (tempValue < 64){
                        tempId.visible = 0
                        tempUnit.visible = 0
                        tempDot.visible = 0
                    } else if(tempValue === 64){
                        tempDot.y = tempBar.height - 31-(tempValue- 64)*240/27
                        tempId.visible = 1
                        tempUnit.visible = 0
                        tempDot.visible = 1
                        tempId.text = "Lo"
                    } else if (tempValue < 91) {
                        tempDot.y = tempBar.height - 31-(tempValue- 64)*240/27
                        tempId.visible = 1
                        tempUnit.visible = 1
                        tempDot.visible = 1
                        tempId.text = tempValue
                    } else if(tempValue === 91){
                        tempDot.y = tempBar.height -31-(tempValue- 64)*240/27
                        tempId.visible = 1
                        tempUnit.visible = 0
                        tempDot.visible = 1
                        tempId.text = "Hi"
                    }
                }
            }else{
                tempUnit.visible = 0
                if (tempValue < 17){
                    tempId.visible = 0
                    tempDot.visible = 0
                } else if(tempValue < 26) {
                    tempDot.y = tempBar.height -(tempValue- 16)*15-16
                    tempId.visible = 1
                    tempDot.visible = 1
                    tempId.text = qsTr("L" + (tempValue-16))
                } else if (tempValue < 34) {
                    tempDot.y = tempBar.height - (tempValue- 16)*15-16
                    tempId.visible = 1
                    tempDot.visible = 1
                    tempId.text = qsTr("H" + (tempValue-25))
                }
            }
        }
    }

    Text {
        font.bold:rootItemId.jiacu === 1
        font.family: rootItemId.ziti
        id: acClose
        text: TranslateStr.menu_colseStr
        anchors.horizontalCenter: parent.horizontalCenter
        y:98
        color: DataSource.dayNightMode === 0x02?"#ffffff":"#333333"
        font.pixelSize: 54
        visible: DataSource.acOpenState === 2 ? true : false
    }
}
