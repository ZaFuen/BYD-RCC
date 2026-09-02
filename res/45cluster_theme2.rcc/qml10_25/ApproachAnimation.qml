import QtQuick 2.15
import com.byd.DataSource 1.0
import com.byd.BydApproachImage 1.0
import "qrc:/common/singleton"


Item{
    id:approachRootItemId
    z:CustomStyle.approachAnimaionZ
    visible: true

    property int themeIndex: 0
    property int dayNightMode: 0

    Component.onCompleted: {
        themeIndex = DataSource.themeIndex
        dayNightMode = DataSource.dayNightMode
    }

    function powerOnUpdate(){
        if(DataSource.powerGear === 0x03){

        }else if(DataSource.powerGear === 0x01 || DataSource.powerGear === 0x02){
            approachRootItemId.visible = false
            bydApproachAnimTimer.stop()
        }
    }

    Connections{
        target:DataSource

        function onThemeIndexChanged(){
            themeIndex = DataSource.themeIndex
        }

        function onDayNightModeChanged(){
            dayNightMode = DataSource.dayNightMode
        }

        function onPowerGearChanged(){
            powerOnUpdate()
        }
    }

    function startApproachAnim()
    {
        bydApproachAnimTimer.start()
        bydApproachImageId.visible = true
    }

    signal approachAnimationFinished()

    //    BydApproachImage{
    //        id:bydApproachImageId
    //        z:CustomStyle.approachAnimaionZ
    //        width: parent.width
    //        height: parent.height
    //        visible: true
    //        themeIndex:DataSource.themeIndex
    //        dayNightMode:DataSource.dayNightMode
    //        interval: 32
    //        onPlayCompleted: {
    //            bydApproachImageId.visible = false
    //            approachAnimationFinished()
    //        }
    //    }

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
        running: bydApproachAnimTimer.running
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

    Image{
        id:bydApproachImageId
        z:CustomStyle.approachAnimaionZ
        width: parent.width
        height: parent.height
        visible: true
        source: "qrc:/images10_25/approach/day/classic/IMG_000.ktx"
    }

    Timer{
        id:bydApproachAnimTimer
        repeat: true
        interval:40
        property int maxVal: 32
        property int curVal: 0
        property int preTime: 0
        onTriggered:{
            var curTimestamp =new Date().getTime()
            var timestampDiff = curTimestamp - preTime
            preTime = curTimestamp
            console.log("Approach Timer triger : "+timestampDiff)
            if(curVal > 32){
                bydApproachAnimTimer.stop()
                approachAnimationFinished()
                curVal = 0
                return
            }
            if(themeIndex === 1){
                if(dayNightMode === 1){
                    if(curVal<10){
                        bydApproachImageId.source = "qrc:/images10_25/approach/day/classic/IMG_00"+curVal+".ktx"
                    }else{
                        bydApproachImageId.source = "qrc:/images10_25/approach/day/classic/IMG_0"+curVal+".ktx"
                    }
                }else{
                    if(curVal<10){
                        bydApproachImageId.source = "qrc:/images10_25/approach/night/classic/IMG_00"+curVal+".ktx"
                    }else{
                        bydApproachImageId.source = "qrc:/images10_25/approach/night/classic/IMG_0"+curVal+".ktx"
                    }
                }
            }else{
                if(dayNightMode === 1){
                    if(curVal<10){
                        bydApproachImageId.source = "qrc:/images10_25/approach/day/tec/IMG_00"+curVal+".ktx"
                    }else{
                        bydApproachImageId.source = "qrc:/images10_25/approach/day/tec/IMG_0"+curVal+".ktx"
                    }
                }else{
                    if(curVal<10){
                        bydApproachImageId.source = "qrc:/images10_25/approach/night/tec/IMG_00"+curVal+".ktx"
                    }else{
                        bydApproachImageId.source = "qrc:/images10_25/approach/night/tec/IMG_0"+curVal+".ktx"
                    }
                }
            }
            curVal+=1
        }
    }
}

