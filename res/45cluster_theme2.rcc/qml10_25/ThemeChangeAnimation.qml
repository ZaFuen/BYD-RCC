import QtQuick 2.15
import com.byd.DataSource 1.0
//import com.byd.BydThemeImage 1.0
import "qrc:/common/singleton"

Item{
    id:rootItemId
    z:CustomStyle.bgZ

    Component.onCompleted: {
        console.log("theme qml create! " +DataSource.dayNightMode + " " + DataSource.themeIndex)
        rootItemId.visible = false
    }

    Connections{
        target:DataSource
        function onPluginMsgReceived(id,value){
            if(id === DataSource.SEND_MSG_ID_THEME_SWITCH_REQUEST){
                if(value === DataSource.THEME_SWITCH_REQUEST_TO_PLAY_SWITCH_ANIM){
                    console.log("[theme Animation] start to play change animation, z is ",rootItemId.z)
                    updateFirstImage()
                    rootItemId.visible = true
                    palyTimerId.start()
                }
            }
        }
    }

    signal themeAnimationFinish();

    function getUrl(index){
        var url
        if(DataSource.dayNightMode === DataSource.DAY_NIGHT_MODE_DAY){
            if(index < 10){
                url = "qrc:/images10_25/theme/day/IMG_00"+index + ".ktx"
            }else{
                url = "qrc:/images10_25/theme/day/IMG_0"+ index + ".ktx"
            }
        }else{
            if(index < 10){
                url = "qrc:/images10_25/theme/night/IMG_00"+index + ".ktx"
            }else{
                url = "qrc:/images10_25/theme/night/IMG_0"+ index +".ktx"
            }
        }
        return url
    }

    function updateFirstImage(){
        var index
        if(DataSource.themeIndex === DataSource.THEME_MODE_CLASSIC){
            index = 0
        }else{
            index = animationImageId.maxCount -  0 - 1
        }
        animationImageId.source = getUrl(index)
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
        property int maxCount:33
    }

    Timer{
        id:palyTimerId
        repeat: true
        property real preTime: 0
        interval: 30
        onTriggered: {
            var curTimestamp =new Date().getTime()
            var timestampDiff = curTimestamp - preTime
            console.log(" theme animation interval is "+timestampDiff)
            preTime = curTimestamp
            if(animationImageId.imageIndex === animationImageId.maxCount){
                palyTimerId.stop()
                themeAnimationFinish()
            }else{
                var index
                if(DataSource.themeIndex === DataSource.THEME_MODE_CLASSIC){
                    index = animationImageId.imageIndex
                }else{
                    index = animationImageId.maxCount -  animationImageId.imageIndex - 1
                }
                animationImageId.source = getUrl(index)
                console.log(animationImageId.source)
                animationImageId.imageIndex ++
            }

        }
    }


}


