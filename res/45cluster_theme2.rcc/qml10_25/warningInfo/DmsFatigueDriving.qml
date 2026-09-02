import QtQuick 2.0
import com.byd.DataSource 1.0
import com.byd.CenterChild 1.0
import QtQml.Models 2.15
import "qrc:/common/singleton"

Item{
    id:fatigueDrivingItem
    anchors.horizontalCenter: parent.horizontalCenter
    anchors.top: parent.top
    anchors.topMargin: (396-fatigueDrivingImg.height-15-fatigueText.height)/2
    Component.onCompleted: {
        updateAnim()
    }

    Image{
        id:fatigueDrivingImg
        anchors.horizontalCenter: parent.horizontalCenter
        cache: false
        source: {
            if(DataSource.commonWarningInfoId === 0x156 || DataSource.commonWarningInfoId === 0x160){
                "qrc:/images10_25/warningInfo/156-160.png"
            }else if(DataSource.commonWarningInfoId === 0x157 || DataSource.commonWarningInfoId === 0x19E){
                "qrc:/images10_25/warningInfo/157-19E.png"
            }
        }
    }
    Rectangle{
        id:rect
        width: 330
        height:15*2+fatigueText.height
        anchors.horizontalCenter: parent.horizontalCenter
        anchors.top: fatigueDrivingImg.bottom
        anchors.topMargin: 15
        color: "transparent"
        border.color: "#f18d00"
        border.width: 3
        radius: 11
        visible: DataSource.language === 0x02?true:false
    }
    Text{
        font.bold:rootItemId.jiacu === 1
        font.family: rootItemId.ziti
        id:fatigueText
        anchors.horizontalCenter: parent.horizontalCenter
        anchors.top: rect.top
        anchors.topMargin: 15
        font.pixelSize: 30
        color:{
            if(DataSource.commonWarningInfoId === 0x156 || DataSource.commonWarningInfoId === 0x19E || DataSource.commonWarningInfoId === 0x157 || DataSource.commonWarningInfoId === 0x160){
                "#F18D00"
            }else{
                "#717171"
            }
        }
        text: {
            if(DataSource.commonWarningInfoId === 0x156){
                TranslateStr.warningInfoStr_0x156
            }else if(DataSource.commonWarningInfoId === 0x157){
                TranslateStr.warningInfoStr_0x157
            }else if(DataSource.commonWarningInfoId === 0x160){
                TranslateStr.warningInfoStr_0x160
            }else if(DataSource.commonWarningInfoId === 0x19E){
                TranslateStr.warningInfoStr_0x19E_1
            }
        }
    }
    SequentialAnimation{
        id:rectAnim1
        loops:Animation.Infinite
        running: false
        PropertyAnimation{
            target: rect
            property: "opacity"
            from:0
            to:1
            easing.type: Easing.InOutBack
            duration: 100
        }
        PropertyAnimation{
            target: rect
            duration: 30
        }
        PropertyAnimation{
            target: rect
            property: "opacity"
            from:1
            to:0
            easing.type: Easing.InOutBack
            duration: 100
        }
    }
    SequentialAnimation{
        id:rectAnim2
        loops:Animation.Infinite
        running: false
        PropertyAnimation{
            target: rect
            property: "opacity"
            from:0
            to:1
            easing.type: Easing.InOutBack
            duration:200
        }
        PropertyAnimation{
            target: rect
            duration: 200
        }
        PropertyAnimation{
            target: rect
            property: "opacity"
            from:1
            to:0
            easing.type: Easing.InOutBack
            duration: 200
        }
    }
    Connections{
        target: DataSource
        function onLanguageChanged(){
            updateAnim()
        }
        function onCommonWarningInfoIdChanged(){
            updateAnim()
        }
    }

    function updateAnim(){
        if(DataSource.language === 0x02){
            if(DataSource.commonWarningInfoId === 0x156||DataSource.commonWarningInfoId === 0x19E){
                rectAnim2.stop()
                rectAnim1.start()
            }else{
                rectAnim1.stop()
                rectAnim2.start()
            }
        }else{
            rectAnim1.stop()
            rectAnim2.stop()
        }
    }
}
