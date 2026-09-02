import QtQuick 2.0
import com.byd.DataSource 1.0
import "qrc:/common/singleton"

Item {
    width: 710
    height: 318
    y: 100
    x: 30
    visible: DataSource.acVolumeLevel === 8 ? false : true

    property var volumeValue:DataSource.acVolumeLevel
    onVolumeValueChanged: {
        acVolumeInfo()
    }

    Image {
        id: bg
        source: DataSource.dayNightMode === 0x02?"qrc:/images10_25/menu/night/air_volume_bg.png":"qrc:/images10_25/menu/day/air_volume_bg.png"
        x: 296
        cache: false
    }

    Text {
        font.bold:rootItemId.jiacu === 1
        font.family: rootItemId.ziti
        id: seven
        text: qsTr("7")
        x: 269
        y: 27
        color: DataSource.dayNightMode === 0x02?"#ffffff":"#333333"
        font.pixelSize: 30
    }

    Text {
        font.bold:rootItemId.jiacu === 1
        font.family: rootItemId.ziti
        id: one
        text: qsTr("1")
        x: 275
        y: 225
        color: DataSource.dayNightMode === 0x02?"#ffffff":"#333333"
        font.pixelSize: 30
    }

    Text {
        font.bold:rootItemId.jiacu === 1
        font.family: rootItemId.ziti
        id: close
        text: TranslateStr.menu_colseStr
        x: 253
        y: 261
        color: DataSource.dayNightMode === 0x02?"#ffffff":"#333333"
        font.pixelSize: 24
    }

    Text {
        font.bold:rootItemId.jiacu === 1
        font.family: rootItemId.ziti
        id: volumeId
        text: volumeValue
        x: 404
        y: 132
        color: DataSource.dayNightMode === 0x02?"#ffffff":"#333333"
        font.pixelSize: 75
        visible: (volumeValue>=1 && volumeValue<= 7) ? 1: 0
    }

    Text {
        font.bold:rootItemId.jiacu === 1
        font.family: rootItemId.ziti
        id: volumeGrar
        text: volumeValue ===0?TranslateStr.menu_colseStr:TranslateStr.menu_acGearStr
        anchors.left: volumeId.right
        anchors.leftMargin: volumeValue ===0?-50:4
        anchors.bottom: volumeId.bottom
        anchors.bottomMargin: 12
        font.pixelSize: 30
        color: DataSource.dayNightMode === 0x02?"#ffffff":"#333333"
    }

    Image {
        id: volume0
        source: DataSource.dayNightMode === 0x02?"qrc:/images10_25/menu/night/air_volume_0.png":"qrc:/images10_25/menu/day/air_volume_0.png"
        y: DataSource.screenSize === 0x01 ? 233 : 230
        anchors.left: parent.left
        anchors.leftMargin: 340
        cache: false
    }

    Column {
        id:volumeCol
        anchors.left: parent.left
        anchors.leftMargin: 340
        y: if (DataSource.screenSize === 0x01) {
               volumeValue === 7 ? 233 - 33 * (volumeValue - 1 - 1)- 1.5 * (volumeValue - 1 - 1) :
                                (233 - 33 * (volumeValue - 1) - 1.5 * (volumeValue-1))
           } else {
               volumeValue === 7 ? 230 - 34 * (volumeValue - 1 - 1) : 230 - 34 * (volumeValue - 1)
           }
        spacing: DataSource.screenSize === 0x01 ? 1.5 : 1
        Repeater{
            id:volumeRepeater
            Image{
                id:img
                source: DataSource.dayNightMode === 0x02?"qrc:/images10_25/menu/night/air_volume_1.png":"qrc:/images10_25/menu/day/air_volume_1.png"
                cache: false
            }
            Component.onCompleted: {
                acVolumeInfo()
            }
        }
    }

    Image{
        id:imgTop
        anchors.left: parent.left
        anchors.leftMargin: 340
        y: 26
        source: DataSource.dayNightMode === 0x02?"qrc:/images10_25/menu/night/air_volume_2.png":"qrc:/images10_25/menu/day/air_volume_2.png"
        cache: false
        visible: volumeValue === 7 ? true : false
    }
    Image {
        id: volumeDot
        source: DataSource.dayNightMode === 0x02?"qrc:/images10_25/menu/night/air_volume_dot.png":"qrc:/images10_25/menu/day/air_volume_dot.png"
        anchors.left: parent.left
        anchors.leftMargin: 339
        visible: volumeValue ===0?true:false
        cache: false
        y:273
    }

    function acVolumeInfo(){
        if (volumeValue < 1){
            volumeRepeater.model = 0
            volume0.visible = 0
        }else if(volumeValue< 7) {
            volumeRepeater.model = volumeValue-1
            volume0.visible = 1
        }else if(volumeValue === 7){
            volumeRepeater.model = volumeValue-2
            volume0.visible = 1
        }else {
            volumeRepeater.model = 0
            volume0.visible = 0
        }
    }
}
