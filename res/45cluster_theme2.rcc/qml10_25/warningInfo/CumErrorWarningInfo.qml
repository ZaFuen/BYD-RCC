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
        visible: false//DataSource.powerGear === 0x03?true:false //DataSource.naviType === 4 ? true : false
        cache: false
    }
    Item {
        anchors.fill: parent
        anchors.horizontalCenter: bgImg.horizontalCenter
        anchors.top: bgImg.top
        anchors.topMargin: (bgImg.height-imageId.height-15-textId.height)/2
        Image {
            id: imageId
            anchors.horizontalCenter: parent.horizontalCenter
            source: "qrc:/images10_25/warningInfo/19-cummunError.png"
            cache: false
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
            font.pixelSize: 30
            horizontalAlignment: Text.AlignHCenter
            color: "red"
            text: DataSource.language === 0x02 ? "Communication Abnormal":"通讯异常"
        }
    }
}

