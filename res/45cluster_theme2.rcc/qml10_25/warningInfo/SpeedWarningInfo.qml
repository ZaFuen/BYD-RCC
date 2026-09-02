import QtQuick 2.15
import com.byd.DataSource 1.0
import com.byd.CenterChild 1.0
import "qrc:/common/singleton"

CenterChild{
    id:rootId
    anchors.horizontalCenter: parent.horizontalCenter
    y:197
    width: bgImg.width
    height: bgImg.height
    Image {
        id: bgImg
        source: DataSource.dayNightMode === 0x2?"qrc:/images10_25/warningInfo/night_bg.png":"qrc:/images10_25/warningInfo/day_bg.png"
        anchors.horizontalCenter: parent.horizontalCenter
        visible: DataSource.powerGear === 0x03?true:false //DataSource.naviType === 4 ? true : false
        cache: false
        opacity: 0.8
    }
    Item {
        anchors.fill: parent
        anchors.horizontalCenter: bgImg.horizontalAlignment
        anchors.top: bgImg.top
        anchors.topMargin: (bgImg.height-imageId.height-15-textId_warning.height)/2
        Image {
            id: imageId
            anchors.horizontalCenter: parent.horizontalCenter
            source: "qrc:/images10_25/warningInfo/mph.png"
            cache: false
        }
        Text{
            font.bold:rootItemId.jiacu === 1
            font.family: rootItemId.ziti
            id:textId
            x:imageId.x+61
            y:imageId.y+imageId.height-32
            font.pixelSize: 24
            color: "#f18d00"
        }
        Text{
            font.bold:rootItemId.jiacu === 1
            font.family: rootItemId.ziti
            id:textId_warning
            anchors.horizontalCenter:  parent.horizontalCenter
            anchors.top: imageId.bottom
            anchors.topMargin: 15
            anchors.leftMargin: 30
            anchors.rightMargin: 30
            font.pixelSize: 30
            horizontalAlignment: Text.AlignHCenter
            color: "#f18d00"
        }
    }

    Connections {
        target:DataSource
        function onCommonWarningInfoIdChanged() {
            updateSpeedWarningInfoId()
        }
        function onDayNightModeChanged() {
            updateSpeedWarningInfoId()
        }
        function onLanguageChanged() {
            updateSpeedWarningInfoId()
        }
        function onSpeedWarningUnitChanged(){
            updateSpeedWarningInfoId()
        }
        function onSpeedWarningValueChanged(){
            updateSpeedWarningInfoId()
        }
    }

    function updateSpeedWarningInfoId()
    {
        if(DataSource.commonWarningInfoId === 0x64){
            var speedValue = DataSource.speedWarningValue
            textId.text = speedValue + (DataSource.speedWarningUnit === 0x02?"mph":"km/h")
        }
        textId_warning.text = DataSource.language === 0x02 ?"Speed "+speedValue+
                                                             (DataSource.speedWarningUnit === 0x02?" mph":" km/h")+" Exceeded":"车速超过"+textId.text
    }
}
