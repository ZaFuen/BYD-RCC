import QtQuick 2.15
import com.byd.DataSource 1.0
import "qrc:/common/singleton"
Item {
    width:1920
    height:720
    property int picIndex: 0
    property bool isInit:false

    ListModel{
        id:picList
    }
    Item{
        anchors.fill: parent
        Repeater{
            model: picList
            Image{
                x:375
                y:230
                source: {
                    if(DataSource.dayNightMode === 0x02){
                        "qrc:/images10_25/chargeDischarge/night/animDischargeConnect/IMG_"+picIndex+".ktx"
                    }else{
                        "qrc:/images10_25/chargeDischarge/day/animDischargeConnect/IMG_"+picIndex+".ktx"
                    }
                }
                visible: picVisible
            }
        }
    }
    function hidePics(){
        for(var i=0;i<picList.count;++i){
            picList.setProperty(i,"picVisible",false)
        }
    }
    function showPics(index){
        picList.setProperty(index,"picVisible",true)
    }
    Component.onCompleted: {
        timer.start()
    }
    Timer{
        id:timer
        repeat: true
        running: false
        interval: 40
        onTriggered: {
            if(picIndex>119){
                picIndex = 83
                isInit = true
            }else if(isInit === true && picIndex>101){
                picIndex = 83
            }
            if(!isInit){
                hidePics()
                picList.append({"picVisible":true})
                picIndex++
            }else{
                hidePics()
                showPics(picIndex++)
            }
        }
    }
}
