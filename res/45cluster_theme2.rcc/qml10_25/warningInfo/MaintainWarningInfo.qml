import QtQuick 2.15
import com.byd.DataSource 1.0
import com.byd.CenterChild 1.0
import "qrc:/common/singleton"

CenterChild{
    id: rootId
    anchors.horizontalCenter: parent.horizontalCenter
    y: 197
    width: bgImg.width
    height: bgImg.height
    Image {
        id: bgImg
        source: DataSource.dayNightMode === 0x2?"qrc:/images10_25/warningInfo/night_bg.png":"qrc:/images10_25/warningInfo/day_bg.png"
        anchors.horizontalCenter: parent.horizontalCenter
        visible: false//DataSource.powerGear === 0x03?true:false //DataSource.naviType === 4 ? true : false
        cache: false
        opacity: 0.8
    }
    Item {
        anchors.fill: parent
        anchors.horizontalCenter: bgImg.horizontalCenter
        anchors.top: bgImg.top
        anchors.topMargin: (bgImg.height-imageId.height-15-textId.height)/2
        Image {
            id: imageId
            anchors.horizontalCenter: parent.horizontalCenter
            source: "qrc:/images10_25/warningInfo/165.png"
            cache: false
        }

        Text{
            font.bold:rootItemId.jiacu === 1
            font.family: rootItemId.ziti
            id:textId
            anchors.horizontalCenter: parent.horizontalCenter
            anchors.top: imageId.bottom
            anchors.topMargin: 15
            anchors.leftMargin: 30
            anchors.rightMargin: 30
            font.pixelSize: 30
            horizontalAlignment: Text.AlignHCenter
            color: "#717171"
        }
    }
    Connections {
        target:DataSource
        function onCommonWarningInfoIdChanged() {
            updateMaintainWarningInfoTextId()
        }
        function onLanguageChanged() {
            updateMaintainWarningInfoTextId()
        }
        function onMaintainDayChanged(){
            updateMaintainWarningInfoTextId()
        }
        function onMaintainDistanceValueChanged(){
            updateMaintainWarningInfoTextId()
        }
        function onMaintainDistanceUnitChanged(){
            updateMaintainWarningInfoTextId()
        }
    }

    function updateMaintainWarningInfoTextId()
    {
        if(DataSource.commonWarningInfoId === 0x165){
            if(DataSource.maintainDay === -1){
                textId.text = ""
            }else{
                textId.text = DataSource.language === 0x02 ?("Service in "+DataSource.maintainDay+" Days"):("离保养还有"+DataSource.maintainDay+"天")
            }
        }else if(DataSource.commonWarningInfoId === 0x166){
            if(DataSource.maintainDistanceValue === -1){
                textId.text = ""
            }else{
                if(DataSource.maintainDistanceUnit === 0x00){
                    textId.text = DataSource.language === 0x02 ?("Service in "+DataSource.maintainDistanceValue+" km"):("离保养还有"+DataSource.maintainDistanceValue+" km")
                }else{
                    textId.text = DataSource.language === 0x02 ?("Service in "+DataSource.maintainDistanceValue+" miles"):("离保养还有"+DataSource.maintainDistanceValue+" miles")
                }
            }
        }else{
            if(DataSource.maintainDay === -1 || DataSource.maintainDistanceValue === -1){
                textId.text = ""
            }else{
                if(DataSource.maintainDistanceUnit === 0x00){
                    textId.text = DataSource.language === 0x02 ?("Service in "+DataSource.maintainDay+" Days "+DataSource.maintainDistanceValue+" km"):("离保养还有"+DataSource.maintainDay+"天"+DataSource.maintainDistanceValue+" km")
                }else{
                    textId.text = DataSource.language === 0x02 ?("Service in "+DataSource.maintainDay+" Days "+DataSource.maintainDistanceValue+" miles"):("离保养还有"+DataSource.maintainDay+"天"+DataSource.maintainDistanceValue+" miles")
                }
            }
        }

    }

}
