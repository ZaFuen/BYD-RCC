import QtQuick 2.12
import com.byd.DataSource 1.0
import com.byd.CenterChild 1.0
import QtQml.Models 2.15
import "qrc:/common/singleton"
/*
CenterChild{
    width: parent.width
    height: parent.height

    Image {
        id: tipIcon
        source: DataSource.dayNightMode === 0x02?"qrc:/images10_25/display_always/night/mapTip.png":"qrc:/images10_25/display_always/night/mapTip.png"
        anchors.horizontalCenter: parent.horizontalCenter
        y:331
    }

    Text {
        id: tipText
        text: TranslateStr.menu_mapTipStr
        anchors.horizontalCenter: parent.horizontalCenter
        anchors.top: tipIcon.bottom
        anchors.topMargin: 0
        font.pixelSize: 30
        color: DataSource.dayNightMode === 0x02?"#ffffff":"#333333"
    }
}
*/