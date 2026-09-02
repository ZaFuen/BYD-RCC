import QtQuick 2.15
import com.byd.DataSource 1.0
//import com.byd.BydPowerOnImage 1.0
import "qrc:/common/singleton"

Item{
    id:rootItemId
    z:CustomStyle.powerOnAnimationZ

    Component.onCompleted: {
        console.log("poweron anim qml create!")
        rootItemId.visible = false
        powerOnUpdate()
    }

    function powerOnUpdate(){
        if(DataSource.powerGear === 0x03){
            if(!DataSource.playAnim){
                console.log("[poweron anim] start to play ")
                updateFirstImage()
                rootItemId.visible = true
                palyTimerId.start()
                DataSource.sendPluginMsgInt(DataSource.RECV_MSG_ID_POWERON_ANIM,DataSource.POWER_ON_ANIM_START)
            }
        }else if(DataSource.powerGear === 0x01 || DataSource.powerGear === 0x02){
            rootItemId.visible = false
            palyTimerId.stop()
            animationImageId.imageIndex = 0
        }
    }

    signal powerOnAnimationFinish()


function getUrl(index){
    var paddedIndex = String(index).padStart(3, '0')
    return "qrc:/images10_25/poweron/IMG_" + paddedIndex + ".ktx"
}

    function updateFirstImage(){
        animationImageId.source = "qrc:/images10_25/poweron/IMG_000.ktx"
    }

    Rectangle{
        id:refreshRectId
        y:709
        width: 10
        height: 10
        color: "#ff0000"
    }
    Timer{
        id:osdFrameTimerId
        interval: 10
        running: palyTimerId.running
        repeat: true
        property bool isChange: false
        onTriggered: {
            if(!isChange){
                refreshRectId.color = "#00ff00"
            }else{
                refreshRectId.color = "#ff0000"
            }
            isChange = !isChange
        }
    }

    Image {
        id: animationImageId
        property int imageIndex: 0
        property int maxCount:60
    }

    Timer{
        id:palyTimerId
        repeat: true
        property real preTime: 0
        interval: 35
        onTriggered: {
            var curTimestamp =new Date().getTime()
            var timestampDiff = curTimestamp - preTime
            console.log(" poweron animation interval is "+timestampDiff)
            preTime = curTimestamp
            if(animationImageId.imageIndex === animationImageId.maxCount){
                palyTimerId.stop()
                powerOnAnimationFinish()
                console.log("emit powerOnAnimationFinish")
            }else{
                animationImageId.source = getUrl(animationImageId.imageIndex)
                console.log(animationImageId.source)
                animationImageId.imageIndex ++
            }

        }
    }

    Connections {
        target:DataSource
        function onPowerGearChanged(){
            powerOnUpdate()
        }
    }
}


