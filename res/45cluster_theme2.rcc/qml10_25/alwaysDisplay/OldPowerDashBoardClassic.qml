import QtQuick 2.15
import QtGraphicalEffects 1.12
import com.byd.DataSource 1.0

Item {
    width: 506
    height: 506

    property alias power:canvasId.progressValue

    Image {
        id:powerBgId
        anchors.centerIn: parent
        source: "qrc:/images10_25/display_always/day/powerBg.png"
    }
    //    Image {
    //        id:powerChargeId
    //        x: 107
    //        y: 400
    //        source: "qrc:/images10_25/display_always/power_charge.png"
    //    }
    //    Image {
    //        id:powerEcoId
    //        x: 48
    //        y: 37+167
    //        source: "qrc:/images10_25/display_always/power_eco.png"
    //    }
    Image {
        id:powerPowerId
        x: 48
        y: 37
        source: "qrc:/images10_25/display_always/power_power.png"
    }
    Image {
        id:powerProgressId
        x:74
        width: 185
        height: 185*2
        anchors.verticalCenter: parent.verticalCenter
        source: "qrc:/images10_25/display_always/day/powerProgress.png"
        visible: false
    }

    Canvas{
        id:canvasId
        x:74
        anchors.verticalCenter: parent.verticalCenter
        property int progressValue:DataSource.power
        width:powerProgressId.width
        height:powerProgressId.height
        onPaint: {
            var ctx = getContext("2d");
            ctx.fillStyle="red"
            ctx.strokeStyle = "red"
            ctx.lineWidth =38
            //ctx.fillRect(0,0,h,200)

            ctx.beginPath();
            ctx.fillStyle="transparent"
            ctx .clearRect(0,0,powerProgressId.width,powerProgressId.height);
            ctx.fillStyle="red"
            var value = progressValue
            if(value > 300){
                value = 300
            }else if(value < -100){
                value = -100
            }
            ctx.arc(186,369/2,186-38/2,Math.PI/2,Math.PI/2+(value+100)/400*Math.PI,false)
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
                powerValueTextId.text = Qt.binding(function(){ return canvasId.progressValue})
                //animationId.start()
                canvasId.progressValue = -100
                animationTimerId.start()
            }else{
                //animationId.stop()
                animationTimerId.stop()
                canvasId.progressValue = Qt.binding(function(){ return DataSource.power})
                powerValueTextId.text = Qt.binding(function(){ return DataSource.power})
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
        from:-100
        to:300
        duration: 5000
    }
    Timer {
        id:animationTimerId
        interval: 100; running: false; repeat: true
        onTriggered: {
            canvasId.progressValue += 5
            if(canvasId.progressValue > 300){
                canvasId.progressValue = -100
            }
        }
    }
    SequentialAnimation {
        id:selfCheckAnimId
        PropertyAnimation {
            target: canvasId
            properties: "progressValue"
            to: 300
            duration: 1000
        }
        PropertyAnimation {
            target: canvasId
            properties: "progressValue"
            to: -100
            duration: 1000
        }
        onFinished:{
            canvasId.progressValue = Qt.binding(function(){ return DataSource.power})
            powerValueTextId.text = Qt.binding(function(){ return DataSource.power})
        }
    }

    OpacityMask{
        anchors.fill:powerProgressId
        source:powerProgressId
        maskSource: canvasId
        //visible: false
    }

    Text {
        font.bold:rootItemId.jiacu === 1
        font.family: rootItemId.ziti
        id:powerValueTextId
        anchors.centerIn: parent
        text: DataSource.power
        font.pixelSize: 108
        color: DataSource.dayNightMode === 0x02?"#fefefe":"#000000"
    }
    Text {
        font.bold:rootItemId.jiacu === 1
        font.family: rootItemId.ziti
        id:powerUnitTextId
        anchors.horizontalCenter:powerValueTextId.horizontalCenter
        anchors.top: powerValueTextId.bottom
        text: "kW"
        font.pixelSize: 34
        color: DataSource.dayNightMode === 0x02?"#fefefe":"#000000"
    }

}
