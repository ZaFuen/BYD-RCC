import QtQuick 2.15
import com.byd.DataSource 1.0
import com.byd.CenterChild 1.0
import "qrc:/qml10_25/driveInfo"

CenterChild {
    anchors.horizontalCenter: parent.horizontalCenter
    y: 197
    width: bgImg.width
    height: bgImg.height
    Image {
        id: bgImg
        source: DataSource.dayNightMode === 0x2 ? "qrc:/images10_25/warningInfo/night_bg.png" : "qrc:/images10_25/warningInfo/day_bg.png"
        anchors.horizontalCenter: parent.horizontalCenter
        visible: DataSource.powerGear === 0x03?true:false //DataSource.naviType === 4 ? true : false
        cache: false
    }

    TireInfo{
        anchors.horizontalCenter: parent.horizontalCenter
        y:229-197
    }
}
