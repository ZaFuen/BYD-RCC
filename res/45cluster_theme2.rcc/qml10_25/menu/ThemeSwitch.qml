import QtQuick 2.12
import QtQml.Models 2.15
import com.byd.DataSource 1.0
import "qrc:/common/singleton"

Item {
    id:themeId
    height: 322
    y: 90+6
    x: 14
    width: 710
    clip: true

    property alias c2tThemeAnim: c2tThemeAnimId
    property alias t2cThemeAnim: t2cThemeAnimId
    property alias upReboundAnim: upReboundAnimId1
    property alias downReboundAnim: downReboundAnimId1
    property int switchAnimDuration: 240
    property int upDownAnimDuration: 240
    property int easeType:Easing.OutCirc
    property int pageEaseType:Easing.OutQuad
    property int reboundEaseType1:Easing.InCubic
    property int reboundEaseType2:Easing.OutCubic
    property int themeIndex: DataSource.themeIndex
    property bool isUpAnimPlay: false
    property bool isDownAnimPlay: false
    property bool isUpReboundAnimPlay: false
    property bool isDownReboundAnimPlay: false

    Item {
        id:classicThemeId
        y: themeIndex ===1 ? 35:-240
        width: parent.width
        Image {
            id: classImgId
            source: {
                if(DataSource.vehicleType === 0x01){
                    DataSource.dayNightMode === 0x02?"qrc:/images10_25/menu/night/theme_classic_ev.png":"qrc:/images10_25/menu/day/theme_classic_ev.png"
                }else{
                    DataSource.dayNightMode === 0x02?"qrc:/images10_25/menu/night/theme_classic_hev.png":"qrc:/images10_25/menu/day/theme_classic_hev.png"
                }
            }
            anchors.horizontalCenter: parent.horizontalCenter

        }
        Text {
            font.bold:rootItemId.jiacu === 1
            font.family: rootItemId.ziti
            id: classTextId
            anchors.top: classImgId.bottom
            anchors.topMargin: 0
            color: DataSource.dayNightMode === 0x02?"#ffffff":"#333333"
            font.pixelSize: 27
            text: TranslateStr.menu_themeClassicStr
            anchors.horizontalCenter: parent.horizontalCenter
        }
    }

    Item {
        id:techThemeId
         y:themeIndex ===2 ? 35:343
        width: parent.width
        Image {
            id: techImgId
            source: {
                if(DataSource.vehicleType === 0x01){
                    DataSource.dayNightMode === 0x02?"qrc:/images10_25/menu/night/theme_simple_ev.png":"qrc:/images10_25/menu/day/theme_simple_ev.png"
                }else{
                    DataSource.dayNightMode === 0x02?"qrc:/images10_25/menu/night/theme_simple_hev.png":"qrc:/images10_25/menu/day/theme_simple_hev.png"
                }
            }

            anchors.horizontalCenter: parent.horizontalCenter
        }
        Text {
            font.bold:rootItemId.jiacu === 1
            font.family: rootItemId.ziti
            id:techTextId
            anchors.top: techImgId.bottom
            anchors.topMargin: 0
            color: DataSource.dayNightMode === 0x02?"#ffffff":"#333333"
            font.pixelSize: 27
            text: TranslateStr.menu_themeSimpleStr
            anchors.horizontalCenter: parent.horizontalCenter
        }
    }

    Image {
        id: lineImg
        source: DataSource.dayNightMode === 0x02?"qrc:/images10_25/menu/night/theme_line.png":"qrc:/images10_25/menu/day/theme_line.png"
        anchors.right: parent.right
        anchors.rightMargin: 23
        cache: false

        Image {
            id: pageImg
            source: DataSource.dayNightMode === 0x02?"qrc:/images10_25/menu/night/theme_page.png":"qrc:/images10_25/menu/day/theme_page.png"
            anchors.horizontalCenter: parent.horizontalCenter
            y: themeIndex ===1 ? 0 : 154
            cache: false
        }
    }

    //经典切换科技
    ParallelAnimation{
        id:c2tThemeAnimId
        PropertyAnimation{
            target: classicThemeId
            property: "opacity"
            from:1
            to:0
            easing.type: easeType
            duration: switchAnimDuration
        }
        PropertyAnimation{
            target: classicThemeId
            property: "y"
            from:35
            to:-240
            easing.type: easeType
            duration: switchAnimDuration
        }

        PropertyAnimation{
            target: techThemeId
            property: "opacity"
            from:0
            to:1
            easing.type: easeType
            duration: switchAnimDuration
        }
        PropertyAnimation{
            target: techThemeId
            property: "y"
            from:308
            to:35
            easing.type: easeType
            duration: switchAnimDuration
        }
        PropertyAnimation{
            target: pageImg
            property: "y"
            from:0
            to:154
            easing.type: pageEaseType
            duration: switchAnimDuration
        }
        onFinished: {
            techThemeId.opacity = 1
            themeIndex = 2
            isDownAnimPlay = false
        }
    }

    //科技切换经典
    ParallelAnimation{
        id:t2cThemeAnimId
        PropertyAnimation{
            target: classicThemeId
            property: "opacity"
            from:0
            to:1
            easing.type: easeType
            duration: switchAnimDuration
        }
        PropertyAnimation{
            target: classicThemeId
            property: "y"
            from:-240
            to:35
            easing.type: easeType
            duration: switchAnimDuration
        }

        PropertyAnimation{
            target: techThemeId
            property: "opacity"
            from:1
            to:0
            easing.type: easeType
            duration: switchAnimDuration
        }
        PropertyAnimation{
            target: techThemeId
            property: "y"
            from:35
            to:308
            easing.type: easeType
            duration: switchAnimDuration
        }
        PropertyAnimation{
            target: pageImg
            property: "y"
            from:154
            to:0
            easing.type: pageEaseType
            duration: pageEaseType
        }
        onFinished: {
            classicThemeId.opacity = 1
            themeIndex = 1
            isUpAnimPlay = false
        }
    }

    //按上键回弹前
    ParallelAnimation{
        id:upReboundAnimId1
        PropertyAnimation{
            target: classicThemeId
            property: "opacity"
            from:1
            to:0.3
            easing.type: reboundEaseType1
            duration: upDownAnimDuration
        }
        PropertyAnimation{
            target: classicThemeId
            property: "y"
            from:35
            to:211
            easing.type: reboundEaseType1
            duration: upDownAnimDuration
        }
        PropertyAnimation{
            target: pageImg
            property: "height"
            from:154
            to:154/2
            easing.type: reboundEaseType1
            duration: upDownAnimDuration
        }
        onFinished: {
            classicThemeId.opacity = 0.3
            upReboundAnimId2.start()
        }
    }
    //按上键回弹后
    ParallelAnimation{
        id:upReboundAnimId2
        PropertyAnimation{
            target: classicThemeId
            property: "opacity"
            from:0.3
            to:1
            easing.type: reboundEaseType2
            duration: upDownAnimDuration
        }
        PropertyAnimation{
            target: classicThemeId
            property: "y"
            from:211
            to:35
            easing.type: reboundEaseType2
            duration: upDownAnimDuration
        }
        PropertyAnimation{
            target: pageImg
            property: "height"
            from:154/2
            to:154
            easing.type: reboundEaseType2
            duration: upDownAnimDuration
        }
        onFinished: {
            classicThemeId.opacity = 1
            isUpReboundAnimPlay = false
        }
    }

    //按下键回弹前
    ParallelAnimation{
        id:downReboundAnimId1
        PropertyAnimation{
            target: techThemeId
            property: "opacity"
            from:1
            to:0.3
            easing.type: reboundEaseType1
            duration: upDownAnimDuration
        }
        PropertyAnimation{
            target: techThemeId
            property: "y"
            from:35
            to:-100
            easing.type: reboundEaseType1
            duration: upDownAnimDuration
        }
        PropertyAnimation{
            target: pageImg
            property: "y"
            from:154
            to:154+77
            easing.type: reboundEaseType1
            duration: upDownAnimDuration
        }
        PropertyAnimation{
            target: pageImg
            property: "height"
            from:154
            to:154/2
            easing.type: reboundEaseType1
            duration: upDownAnimDuration
        }
        onFinished: {
            techThemeId.opacity = 0.3
            downReboundAnimId2.start()
        }
    }
    //按下键回弹后
    ParallelAnimation{
        id:downReboundAnimId2
        PropertyAnimation{
            target: techThemeId
            property: "opacity"
            from:0.3
            to:1
            easing.type: reboundEaseType2
            duration: upDownAnimDuration
        }
        PropertyAnimation{
            target: techThemeId
            property: "y"
            from:-100
            to:35
            easing.type: reboundEaseType2
            duration: upDownAnimDuration
        }
        PropertyAnimation{
            target: pageImg
            property: "y"
            from:154+77
            to:154
            easing.type: reboundEaseType2
            duration:upDownAnimDuration
        }
        PropertyAnimation{
            target: pageImg
            property: "height"
            from:154/2
            to:154
            easing.type: reboundEaseType2
            duration: upDownAnimDuration
        }
        onFinished: {
            techThemeId.opacity = 1
            isDownReboundAnimPlay = false
        }
    }

}
