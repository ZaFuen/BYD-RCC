import QtQuick 2.0
import com.byd.DataSource 1.0
import com.byd.CenterChild 1.0
import QtQml.Models 2.15
import "qrc:/common/singleton"

Item{
    id:dmsCollectItem
    anchors.horizontalCenter: parent.horizontalCenter
    y: (396-dmsCollectBgImg.height-15-textId.height)/2
    visible: DataSource.commonWarningInfoId === 0x195|| DataSource.commonWarningInfoId === 0x19C
    property int picIndex:0
    property bool reverse:false
    Component.onCompleted: {
        timer.start()
//        title.visible = true
    }

    ListModel{
        id:listModel
        ListElement {
            picVisible: false
        }
        ListElement {
            picVisible: false
        }
        ListElement {
            picVisible: false
        }
        ListElement {
            picVisible: false
        }
        ListElement {
            picVisible: false
        }
        ListElement {
            picVisible: false
        }
        ListElement {
            picVisible: false
        }
        ListElement {
            picVisible: false
        }
        ListElement {
            picVisible: false
        }
        ListElement {
            picVisible: false
        }
        ListElement {
            picVisible: false
        }
        ListElement {
            picVisible: false
        }
        ListElement {
            picVisible: false
        }
        ListElement {
            picVisible: false
        }
        ListElement {
            picVisible: false
        }
        ListElement {
            picVisible: false
        }
        ListElement {
            picVisible: false
        }
        ListElement {
            picVisible: false
        }
        ListElement {
            picVisible: false
        }
        ListElement {
            picVisible: false
        }
        ListElement {
            picVisible: false
        }
        ListElement {
            picVisible: false
        }
        ListElement {
            picVisible: false
        }
        ListElement {
            picVisible: false
        }
        ListElement {
            picVisible: false
        }

    }
//    Text{
//        id:title
//        anchors.top: parent.top
//        anchors.topMargin: -51
//        anchors.horizontalCenter: parent.horizontalCenter
//        font.pixelSize: 30
//        horizontalAlignment: Text.AlignHCenter
//        color: DataSource.commonWarningInfoId === 0x195?"red":"#3ea8d4"
//        text: DataSource.commonWarningInfoId === 0x195?TranslateStr.warnigInfoStr_dmsTitle2:(DataSource.commonWarningInfoId === 0x19C?TranslateStr.warnigInfoStr_dmsTitle5:"")
//        visible: false
//    }
    Image{
        id:dmsCollectBgImg
        anchors.horizontalCenter: parent.horizontalCenter
        cache: false
        source: "qrc:/images10_25/warningInfo/15B.png"
    }
    Text{
        font.bold:rootItemId.jiacu === 1
        font.family: rootItemId.ziti
        id:textId
        anchors.horizontalCenter: parent.horizontalCenter
        anchors.top: dmsCollectBgImg.bottom
        anchors.topMargin: 15
        anchors.leftMargin: 30
        anchors.rightMargin: 30
        font.pixelSize: 30
        color: DataSource.commonWarningInfoId === 0x195 ? "red" : "#3ea8d4"
        horizontalAlignment: Text.AlignHCenter
        text: DataSource.commonWarningInfoId === 0x195 ? TranslateStr.warningInfoStr_0x195 : TranslateStr.warningInfoStr_0x19C
    }
    Repeater{
        model:listModel
        Image{
            id:dmsCollectImg
            anchors.horizontalCenter: parent.horizontalCenter
            anchors.bottom: dmsCollectBgImg.bottom
            anchors.bottomMargin: 30
            source: "qrc:/images10_25/warningInfo/dms/DmsCollect_195/IMG_"+index+".png"
            visible: picVisible
        }
    }
    function hideListModel(){
        for(var i=0; i < listModel.count; ++i){
            listModel.setProperty(i, "picVisible", false)
        }
    }

    function showPic(index){
        listModel.setProperty(index, "picVisible", true)
    }

    Timer{
        id:timer
        repeat: true
        running: false
        interval: 50
        triggeredOnStart: true
        onTriggered: {
            if(picIndex<24 && !reverse){
                hideListModel()
                showPic(picIndex++)
            }else{
                reverse = true
                hideListModel()
                showPic(picIndex--)
                if(picIndex === 0){
                    reverse = false
                }
            }
        }
    }
}
