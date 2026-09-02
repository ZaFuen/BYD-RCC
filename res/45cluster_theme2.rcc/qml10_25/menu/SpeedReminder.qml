import QtQuick 2.0
import com.byd.CenterChild 1.0
import com.byd.DataSource 1.0
import QtQml.Models 2.15
import "qrc:/common/singleton"

Item {
    height: 281
    y: 60+15+21
    x: 21
    width: 710
    visible: DataSource.speedReminder !== 0 ? true : false

    property var speedValue: DataSource.speedReminder
    property var pathView: pathView
    property var mode: listModel
    property var preSpeedValue: DataSource.speedReminderUnit !==2 ? 60 : 35

    Connections{
        target: DataSource
        function onSpeedReminderUnitChanged(){
            updateSpeedReminder()
        }

        function onDayNightModeChanged(){
            updateSpeedReminder()
        }
    }

    onSpeedValueChanged: {
        if(speedValue !== 241){
            preSpeedValue = speedValue
        }else{
            preSpeedValue = DataSource.speedReminderUnit !== 2 ? 60 : 35
        }
        updateSpeedReminder()
    }

    Rectangle{
        width: 296
        height: 77
        y: 123
        x: 238
        color: "transparent"

        Image {
            id:rect
            source: DataSource.dayNightMode === 0x02?"qrc:/images10_25/menu/night/speed_reminder_rect.png":"qrc:/images10_25/menu/day/speed_reminder_rect.png"
            anchors.verticalCenter: parent.verticalCenter
            cache: false
        }

        Text {
            font.bold:rootItemId.jiacu === 1
            font.family: rootItemId.ziti
            id: speedUnit
            text: DataSource.speedReminderUnit !== 2 ? "km/h" : "mph"
            anchors.verticalCenter: parent.verticalCenter
            anchors.right: parent.right
            font.pixelSize: 30
            color: DataSource.dayNightMode === 0x02?"#80ffffff":"#575757"
            visible: speedValue <= 150 ? true : false
        }
    }

    Rectangle {
        id: rectId
        width: 261
        height: 233
        anchors.horizontalCenter: parent.horizontalCenter
        y: 62-15
        color: "transparent"

        ListModel {
            id: listModel
            property bool completed:false
            Component.onCompleted: {
                append({text:speedValue === 241?TranslateStr.menu_colseStr:String(speedValue), vis:true, size:speedValue === 241?48:90, col:DataSource.dayNightMode === 0x02?"#ffffff":"#333333"})
                append({text:DataSource.speedReminderUnit !== 2?(speedValue<70?TranslateStr.menu_colseStr:String(speedValue-10)):(speedValue<45?TranslateStr.menu_colseStr:String(speedValue-5)),
                           vis:speedValue === 241?false:true, size:DataSource.speedReminderUnit !==2?(speedValue<70?36:55):(speedValue<45?36:55), col:DataSource.dayNightMode === 0x02?"#bfffffff":"#bf333333"})
                append({text:speedValue === 241?String(preSpeedValue):(DataSource.speedReminderUnit !== 2?String(speedValue+10):String(speedValue+5)),
                           vis: DataSource.speedReminderUnit !== 2?(speedValue > 140?false:true):(speedValue > 85?false:true), size:55, col:DataSource.dayNightMode === 0x02?"#bfffffff":"#bf333333"})
                completed = true
                console.log("speed reminder listModel completed")
            }
        }

        PathView {
            id: pathView
            width: 261; height: 233
            model: listModel
            clip: true
            pathItemCount: 3
            preferredHighlightBegin: 0.5
            preferredHighlightEnd: 0.5

            delegate: Item {
                id: textItem
                width: pathView.width
                height: pathView.height/pathView.pathItemCount

                Text {
                    font.bold:rootItemId.jiacu === 1
                    font.family: rootItemId.ziti
                    anchors.centerIn: parent;
                    font.pixelSize: model.size
                    text: model.text
                    color: model.col
                    visible: model.vis
                }
            }

            path: Path {
                startX: pathView.width/2;
                startY: -20;
                PathLine {x:pathView.width/2; y:pathView.height/2;}
                PathPercent {value:0.5}
                PathLine {
                    x:pathView.width/2;
                    y:pathView.height+25;}
                PathPercent {value:1}
            }
        }
    }

    function updateSpeedReminder(){
        if (!listModel.completed){
            return
        }
        timerId.start()
    }

    Timer{
        id: timerId
        interval: 150; running: false; repeat: false
        onTriggered: {

            listModel.setProperty(pathView.currentIndex, "size", 105)
            listModel.setProperty(pathView.currentIndex, "col", DataSource.dayNightMode === 0x02 ? "#ffffff" : "#333333")
            if(pathView.currentIndex === 0){
                listModel.setProperty(1, "size", 63)
                listModel.setProperty(2, "size", 63)
                listModel.setProperty(1, "col", DataSource.dayNightMode === 0x02 ? "#bfffffff" : "#bf333333")
                listModel.setProperty(2, "col", DataSource.dayNightMode === 0x02 ? "#bfffffff" : "#bf333333")
            }else if(pathView.currentIndex===1){
                listModel.setProperty(0, "size", 63)
                listModel.setProperty(2, "size", 63)
                listModel.setProperty(0, "col", DataSource.dayNightMode === 0x02 ? "#bfffffff" : "#bf333333")
                listModel.setProperty(2, "col", DataSource.dayNightMode === 0x02 ? "#bfffffff" : "#bf333333")
            }else if(pathView.currentIndex == 2){
                listModel.setProperty(0, "size", 63)
                listModel.setProperty(1, "size", 63)
                listModel.setProperty(0, "col", DataSource.dayNightMode === 0x02 ? "#bfffffff" : "#bf333333")
                listModel.setProperty(1, "col", DataSource.dayNightMode === 0x02 ? "#bfffffff" : "#bf333333")
            }

            if (speedValue === 241){
                listModel.setProperty(pathView.currentIndex, "text", TranslateStr.menu_colseStr)
                listModel.setProperty(pathView.currentIndex, "size", 48)

                if(pathView.currentIndex === 0){
                    listModel.setProperty(1, "vis", false)
                    listModel.setProperty(2, "vis", true)
                    listModel.setProperty(2, "text", (DataSource.speedReminderUnit !==2 ?"60":"35"))
                }else if(pathView.currentIndex===1){
                    listModel.setProperty(2, "vis", false)
                    listModel.setProperty(0, "vis", true)
                    listModel.setProperty(0, "text", (DataSource.speedReminderUnit !==2 ?"60":"35"))
                }else if(pathView.currentIndex === 2){
                    listModel.setProperty(0, "vis", false)
                    listModel.setProperty(1, "vis", true)
                    listModel.setProperty(1, "text", (DataSource.speedReminderUnit !==2 ?"60":"35"))
                }
                console.log("speedValue === 241")
            } else if((speedValue > 140 && DataSource.speedReminderUnit !== 2)
                      ||(speedValue > 85 && DataSource.speedReminderUnit === 2)){
                listModel.setProperty(pathView.currentIndex, "vis", true)
                listModel.setProperty(pathView.currentIndex, "text", String(speedValue))

                if(pathView.currentIndex === 0){
                    listModel.setProperty(1, "vis", true)
                    listModel.setProperty(2, "vis", false)
                    listModel.setProperty(1, "text", DataSource.speedReminderUnit !== 2 ? String(speedValue-10):String(speedValue-5))
                    listModel.setProperty(2, "text", DataSource.speedReminderUnit !== 2 ? String(speedValue+10):String(speedValue+5))
                }else if(pathView.currentIndex===1){
                    listModel.setProperty(2, "vis", true)
                    listModel.setProperty(0, "vis", false)
                    listModel.setProperty(2, "text", DataSource.speedReminderUnit !== 2 ? String(speedValue-10):String(speedValue-5))
                    listModel.setProperty(0, "text", DataSource.speedReminderUnit !== 2 ? String(speedValue+10):String(speedValue+5))
                }else if(pathView.currentIndex === 2){
                    listModel.setProperty(0, "vis", true)
                    listModel.setProperty(1, "vis", false)
                    listModel.setProperty(0, "text", DataSource.speedReminderUnit !== 2 ? String(speedValue-10):String(speedValue-5))
                    listModel.setProperty(1, "text", DataSource.speedReminderUnit !== 2 ? String(speedValue+10):String(speedValue+5))
                }
                console.log("speedValue > 140 || speedValue > 85")
            } else if((speedValue < 70 && DataSource.speedReminderUnit !== 2)
                      ||(speedValue < 40 && DataSource.speedReminderUnit === 2)){
                listModel.setProperty(0, "vis", true)
                listModel.setProperty(1, "vis", true)
                listModel.setProperty(2, "vis", true)

                listModel.setProperty(pathView.currentIndex, "text", String(speedValue))
                if(pathView.currentIndex === 0){
                    listModel.setProperty(1, "text", TranslateStr.menu_colseStr)
                    listModel.setProperty(2, "text", DataSource.speedReminderUnit !== 2 ? String(speedValue+10):String(speedValue+5))
                    listModel.setProperty(1, "size", 36)
                }else if(pathView.currentIndex === 1){
                    listModel.setProperty(2, "text", TranslateStr.menu_colseStr)
                    listModel.setProperty(0, "text", DataSource.speedReminderUnit !== 2 ? String(speedValue+10):String(speedValue+5))
                    listModel.setProperty(2, "size", 36)
                }else if(pathView.currentIndex === 2){
                    listModel.setProperty(0, "text", TranslateStr.menu_colseStr)
                    listModel.setProperty(1, "text", DataSource.speedReminderUnit !== 2 ? String(speedValue+10):String(speedValue+5))
                    listModel.setProperty(0, "size", 36)
                }
                console.log("speedValue < 70 || speedValue < 40")
            }else{
                listModel.setProperty(0, "vis", true)
                listModel.setProperty(1, "vis", true)
                listModel.setProperty(2, "vis", true)

                listModel.setProperty(pathView.currentIndex, "text", String(speedValue))
                if(pathView.currentIndex === 0){
                    listModel.setProperty(1, "text", DataSource.speedReminderUnit !== 2 ? String(speedValue-10):String(speedValue-5))
                    listModel.setProperty(2, "text", DataSource.speedReminderUnit !== 2 ? String(speedValue+10):String(speedValue+5))
                }else if(pathView.currentIndex === 1){
                    listModel.setProperty(2, "text", DataSource.speedReminderUnit !== 2 ? String(speedValue-10):String(speedValue-5))
                    listModel.setProperty(0, "text", DataSource.speedReminderUnit !== 2 ? String(speedValue+10):String(speedValue+5))
                }else if(pathView.currentIndex === 2){
                    listModel.setProperty(0, "text", DataSource.speedReminderUnit !== 2 ? String(speedValue-10):String(speedValue-5))
                    listModel.setProperty(1, "text", DataSource.speedReminderUnit !== 2 ? String(speedValue+10):String(speedValue+5))
                }
                console.log("speedValue normal")
            }
            console.log("speedValue: " + speedValue)
        }
    }
}
