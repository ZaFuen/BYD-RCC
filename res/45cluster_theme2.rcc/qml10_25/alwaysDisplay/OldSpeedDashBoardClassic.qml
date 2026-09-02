import QtQuick 2.15
import QtGraphicalEffects 1.12
import com.byd.DataSource 1.0

Item {
    width: 400
    height: 400

    property alias speed:canvasId.progressValue

    Image {
        id: speedBgId
        anchors.centerIn: parent
        source: "qrc:/images10_25/display_always/day/speedBg.png"
    }
    Image {
        id: speedProgressId
        x:200
        width: 200
        height: 400
        anchors.verticalCenter: parent.verticalCenter
        source: "qrc:/images10_25/display_always/day/speedProgress.png"
        visible: false
    }

    Canvas{
        id:canvasId
        x:200
        anchors.verticalCenter: parent.verticalCenter
        property int progressValue:DataSource.speed
        width: speedProgressId.width
        height:speedProgressId.height
        onPaint: {
            var ctx = getContext("2d");
            ctx.fillStyle="red"
            ctx.strokeStyle = "red"
            ctx.lineWidth =38
            //ctx.fillRect(0,0,h,200)

            ctx.beginPath();
            ctx.fillStyle="transparent"
            ctx .clearRect(0,0,speedProgressId.width,speedProgressId.height);
            ctx.fillStyle="red"
            var value
            if(progressValue < 0)
            {
                value=Math.PI/2
            }else if(progressValue <120){
                value = Math.PI/2 - progressValue/120*Math.PI/2
            }else if(progressValue <=240){
                value = -(progressValue-120)/120*Math.PI/2
            }else if(progressValue > 240){
                value = -Math.PI/2
            }

            ctx.arc(0,400/2,200-38/2,Math.PI/2,value,true)
            ctx.stroke()

        }
        onProgressValueChanged: {
            requestPaint()
        }

        visible: false
    }

    Connections {
        target:DataSource
        function onDashbordTestModeChanged() {
            if(DataSource.dashbordTestMode === 0x01){
                speedValueTextId.text = Qt.binding(function(){ return canvasId.progressValue})
                //animationId.start()
                canvasId.progressValue = 0
                animationTimerId.start()
            }else{
                //animationId.stop()
                animationTimerId.stop()
                canvasId.progressValue = Qt.binding(function(){ return DataSource.speed})
                speedValueTextId.text = Qt.binding(function(){ return DataSource.speed})
            }
        }
        function onPluginMsgReceived(id,value){
            if(id === DataSource.SEND_MSG_ID_DASHBOARD_SELFCHECK){
                selfCheckAnimId.start()
            }
        }
    }

    PropertyAnimation{
        id:animationId
        target: canvasId
        properties: "progressValue"
        loops: Animation.Infinite
        from:0
        to:240
        duration: 5000
    }
    Timer {
        id:animationTimerId
        interval: 100; running: false; repeat: true
        onTriggered: {
            canvasId.progressValue += 3
            if(canvasId.progressValue > 240){
                canvasId.progressValue = 0
            }
        }
    }

    SequentialAnimation {
        id:selfCheckAnimId
        PropertyAnimation {
            target: canvasId
            properties: "progressValue"
            to: 240
            duration: 1000
        }
        PropertyAnimation {
            target: canvasId
            properties: "progressValue"
            to: 0
            duration: 1000
        }
        onFinished:{
            canvasId.progressValue = Qt.binding(function(){ return DataSource.speed})
            speedValueTextId.text = Qt.binding(function(){ return DataSource.speed})
        }
    }

    OpacityMask{
        anchors.fill: speedProgressId
        source: speedProgressId
        maskSource: canvasId
        //visible: false
    }

    Text {
        font.bold:rootItemId.jiacu === 1
        font.family: rootItemId.ziti
        id: speedValueTextId
        anchors.centerIn: parent
        text: DataSource.speed
        font.pixelSize: 154
        color: DataSource.dayNightMode === 0x02?"#fefefe":"#000000"
    }
    Text {
        font.bold:rootItemId.jiacu === 1
        font.family: rootItemId.ziti
        id:speedUnitTextId
        anchors.horizontalCenter:speedValueTextId.horizontalCenter
        anchors.top: speedValueTextId.bottom
        text: "km/h"
        font.pixelSize: 34
        color: DataSource.dayNightMode === 0x02?"#fefefe":"#000000"
    }

}
