import QtQuick 2.15
import com.byd.DataSource 1.0
import com.byd.CenterChild 1.0
import "qrc:/common/singleton"

CenterChild{
    id:rootId
    anchors.horizontalCenter: parent.horizontalCenter
    y:225
    width: 563
    height: 353

    Image {
        id: imageId
        anchors.horizontalCenter: parent.horizontalCenter
        y:177-imageId.height
        cache: false
        source: "qrc:/images10_25/warningInfo/1A-24-31-39-48-5F-61-151-152-153.png"
    }

    Text{
        font.bold:rootItemId.jiacu === 1
        font.family: rootItemId.ziti
        id:textId
        anchors.horizontalCenter:  parent.horizontalCenter
        anchors.top: imageId.bottom
        anchors.topMargin: 15
        anchors.leftMargin: 30
        anchors.rightMargin: 30
        font.pixelSize: 28
        horizontalAlignment: Text.AlignHCenter
    }


    Connections {
        target:DataSource
        function onCommonWarningInfoIdChanged() {
            updateWarningInfoId()
        }
        function onDayNightModeChanged() {
            updateWarningInfoId()
        }
        function onLanguageChanged() {
            //updateWarningInfoId()
        }
        function onTranslateLoadCompleteChanged(){
            updateWarningInfoId()
        }
    }
    function updateWarningInfoId(){
        switch (DataSource.commonWarningInfoId)
        {
        case 0x29:
            imageId.source=""
            textId.text = TranslateStr.warningInfoStr_0x29
            textId.color =  "#f18d00"
            break
        case 0x2A:
            imageId.source=""
            textId.text = TranslateStr.warningInfoStr_0x2A
            textId.color =  "#f18d00"
            break
        case 0x37:
            imageId.source=""
            textId.text = TranslateStr.warningInfoStr_0x37
            textId.color =  "#f18d00"
            break
        case 0x3D:
            imageId.source=""
            textId.text = TranslateStr.warningInfoStr_0x3D
            textId.color =  "#f18d00"
            break
        case 0x4D:
            //imageId.source=""
            textId.text = TranslateStr.warningInfoStr_0x4D
            textId.color =  "#f18d00"
            break
        case 0x4E:
            //imageId.source=""
            textId.text = TranslateStr.warningInfoStr_0x4E
            textId.color =  "#f18d00"
            break
        case 0x4F:
            //imageId.source=""
            textId.text = TranslateStr.warningInfoStr_0x4F
            textId.color =  "#f18d00"
            break
        case 0x50:
            //imageId.source=""
            textId.text = TranslateStr.warningInfoStr_0x50
            textId.color =  "#f18d00"
            break
        case 0x51:
            //imageId.source=""
            textId.text = TranslateStr.warningInfoStr_0x51
            textId.color =  "#f18d00"
            break
        case 0x52:
            //imageId.source=""
            textId.text = TranslateStr.warningInfoStr_0x52
            textId.color =  "#f18d00"
            break
        case 0x53:
            //imageId.source=""
            textId.text = TranslateStr.warningInfoStr_0x53
            textId.color =  "#f18d00"
            break
        case 0x54:
            //imageId.source=""
            textId.text = TranslateStr.warningInfoStr_0x54
            textId.color =  "#f18d00"
            break
        case 0x56:
            //imageId.source=""
            textId.text = TranslateStr.warningInfoStr_0x56
            textId.color =  "#f18d00"
            break
        case 0x57:
            //imageId.source=""
            textId.text = TranslateStr.warningInfoStr_0x57
            textId.color =  "#f18d00"
            break
        }
    }
}
