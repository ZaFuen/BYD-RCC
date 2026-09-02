import QtQuick 2.15
import com.byd.DataSource 1.0
import com.byd.CenterChild 1.0
import "qrc:/common/singleton"

CenterChild {
    id: rootId
    anchors.horizontalCenter: parent.horizontalCenter
    y: 197
    width: bgImg.width
    height: bgImg.height
    property int picIndex1: 0
    property int picIndex2: 0
    property int picIndex3: 0
    property int picIndex4: 0
    property int picIndex5: 0
    property int picIndex6: 0
    property int picIndex7: 0
    property int picIndex8: 0
    property int picIndex9: 0
    property int picIndexA: 0
    property int picIndexB: 0
    property int picIndexC: 0
    property int picIndexD: 0
    property int picIndexE: 0
    Component.onCompleted: {
        updateCarKeyWarningInfoDisplay()
    }

    Image {
        id: bgImg
        //涉及换肤，修改需同步换肤
        source: DataSource.dayNightMode === 0x02 ? "qrc:/images10_25/warningInfo/night_bg.png" : "qrc:/images10_25/warningInfo/day_bg.png"
        anchors.horizontalCenter: parent.horizontalCenter
        visible: false//DataSource.powerGear === 0x03?true:false //DataSource.naviType === 4 ? true : false
        cache: false
    }
    Item {
        anchors.fill: parent
        anchors.horizontalCenter: bgImg.horizontalCenter
        anchors.top: bgImg.top
        anchors.topMargin: if (DataSource.carKeyWarningInfoDisplay === 1) {
                               (bgImg.height - imageId1.height - 15 - textId.height) / 2
                           } else if (DataSource.carKeyWarningInfoDisplay === 2){
                               (bgImg.height - imageId2.height - 15 - textId.height) / 2
                           } else if (DataSource.carKeyWarningInfoDisplay === 3){
                               (bgImg.height - imageId3.height - 15 - textId.height) / 2
                           }else {
                                40
                           }
        //其他车型
        Image {
            id: imageId1
            anchors.horizontalCenter: parent.horizontalCenter
            source: "qrc:/images10_25/warningInfo/175_3.png"
            visible: DataSource.carKeyWarningInfoDisplay === 1
            cache: false
        }
        //0x79,0x87,0xB0,0xB1 汉车型
        Image {
            id: imageId2
            anchors.horizontalCenter: parent.horizontalCenter
            source: "qrc:/images10_25/warningInfo/175_" + picIndex2 + ".png"
            visible: DataSource.carKeyWarningInfoDisplay === 2
            cache: false
        }
        //0x81 sk2h
        Image {
            id: imageId3
            anchors.horizontalCenter: parent.horizontalCenter
            visible: DataSource.carKeyWarningInfoDisplay === 3
            cache: false
        }
        //0x5A 宋pro车型
        Image {
            id: imageId4
            anchors.horizontalCenter: parent.horizontalCenter
            visible: DataSource.carKeyWarningInfoDisplay === 4
            cache: false
        }
        //0x8A,0xA5,0xCD EK车型
        Image {
            id: imageId5
            anchors.horizontalCenter: parent.horizontalCenter
            visible: DataSource.carKeyWarningInfoDisplay === 5
            cache: false
        }
        //0x93,0xA2,0xAD 宋plus车型
        Image {
            id: imageId6
            anchors.horizontalCenter: parent.horizontalCenter
            visible: DataSource.carKeyWarningInfoDisplay === 6
            cache: false
        }
        //0x73 唐车型
        Image {
            id: imageId7
            anchors.horizontalCenter: parent.horizontalCenter
            visible: DataSource.carKeyWarningInfoDisplay === 7
            cache: false
        }
        //0xA0 SC3EA/B 元Pro型
        Image {
            id: imageId8
            anchors.horizontalCenter: parent.horizontalCenter
            visible: DataSource.carKeyWarningInfoDisplay === 8
            cache: false
        }
        //0xBC HKH驱逐舰06车型
        Image {
            id: imageId9
            anchors.horizontalCenter: parent.horizontalCenter
            visible: DataSource.carKeyWarningInfoDisplay === 9
            cache: false
        }
        //0xCC HA3纯电秦L
        Image {
            id: imageIdA
            anchors.horizontalCenter: parent.horizontalCenter
            visible: DataSource.carKeyWarningInfoDisplay === 0xA
            cache: false
        }
        //0xA1 SA5H 宋
        Image {
            id: imageIdB
            anchors.horizontalCenter: parent.horizontalCenter
            visible: DataSource.carKeyWarningInfoDisplay === 0xB
            cache: false
        }
        //0xEA SA6HA/B/C 宋Pro
        Image {
            id: imageIdC
            anchors.horizontalCenter: parent.horizontalCenter
            visible: DataSource.carKeyWarningInfoDisplay === 0xC
            cache: false
        }
        //0xE2 SL2H 护卫舰03
        Image {
            id: imageIdD
            anchors.horizontalCenter: parent.horizontalCenter
            visible: DataSource.carKeyWarningInfoDisplay === 0xD
            cache: false
        }
        //0xE9 HXHK 海豹Dmi-24款
        Image {
            id: imageIdE
            anchors.horizontalCenter: parent.horizontalCenter
            visible: DataSource.carKeyWarningInfoDisplay === 0xE
            cache: false
        }
        Text {
            font.bold:rootItemId.jiacu === 1
            font.family: rootItemId.ziti
            id: textId
            anchors.horizontalCenter: parent.horizontalCenter
            visible: (DataSource.carKeyWarningInfoDisplay >= 0x1 && DataSource.carKeyWarningInfoDisplay <= 0xF)
            anchors.top: if (DataSource.carKeyWarningInfoDisplay === 3) {
                             imageId3.bottom
                         } else if(DataSource.carKeyWarningInfoDisplay === 4){
                             imageId4.bottom
                         } else if(DataSource.carKeyWarningInfoDisplay === 5){
                             imageId5.bottom
                         } else if(DataSource.carKeyWarningInfoDisplay === 6){
                             imageId6.bottom
                         }else if (DataSource.carKeyWarningInfoDisplay === 7){
                             imageId7.bottom
                         }else if (DataSource.carKeyWarningInfoDisplay === 8){
                             imageId8.bottom
                         }else if (DataSource.carKeyWarningInfoDisplay === 9){
                             imageId9.bottom
                         }else if (DataSource.carKeyWarningInfoDisplay === 0xA){
                             imageIdA.bottom
                         }else if (DataSource.carKeyWarningInfoDisplay === 0xB){
                             imageIdB.bottom
                         }else if (DataSource.carKeyWarningInfoDisplay === 0xC){
                             imageIdC.bottom
                         }else if (DataSource.carKeyWarningInfoDisplay === 0xD){
                             imageIdD.bottom
                         }else if (DataSource.carKeyWarningInfoDisplay === 0xE){
                             imageIdE.bottom
                         }else{
                             imageId1.bottom
                         }
            anchors.topMargin: (DataSource.carKeyWarningInfoDisplay >= 1&& DataSource.carKeyWarningInfoDisplay <= 3)? 8:0
            anchors.leftMargin: 30
            anchors.rightMargin: 30
            font.pixelSize: 30
            horizontalAlignment: Text.AlignHCenter
            color: "#717171"
            text: {
                if (DataSource.carKeyWarningInfoDisplay === 2) {
                    TranslateStr.warningInfoStr_0x175_1
                } else if (DataSource.carKeyWarningInfoDisplay === 1) {
                    TranslateStr.warningInfoStr_0x175_2
                } else if (DataSource.carKeyWarningInfoDisplay === 3) {
                    TranslateStr.warningInfoStr_0x175_4
                } else if (DataSource.carKeyWarningInfoDisplay === 7){
                    TranslateStr.warningInfoStr_0x175_5
                } else {
                    TranslateStr.warningInfoStr_0x175_6
                }
            }
        }
    }
    Connections {
        target: DataSource
        function onCarKeyWarningInfoDisplayChanged() {
            updateCarKeyWarningInfoDisplay()
        }
    }
    function updateCarKeyWarningInfoDisplay() {
        console.log("DataSource.carKeyWarningInfoDisplay:" + DataSource.carKeyWarningInfoDisplay)
        if (DataSource.carKeyWarningInfoDisplay === 2) {
            timer2.start()
        } else {
            timer2.stop()
        }
        if (DataSource.carKeyWarningInfoDisplay === 3) {
            timer3.start()
        } else {
            timer3.stop()
        }
        if (DataSource.carKeyWarningInfoDisplay === 4) {
            timer4.start()
        } else {
            timer4.stop()
        }
        if (DataSource.carKeyWarningInfoDisplay === 5) {
            timer5.start()
        } else {
            timer5.stop()
        }
        if (DataSource.carKeyWarningInfoDisplay === 6) {
            timer6.start()
        } else {
            timer6.stop()
        }
        if (DataSource.carKeyWarningInfoDisplay === 7) {
            timer7.start()
        } else {
            timer7.stop()
        }
        if (DataSource.carKeyWarningInfoDisplay === 8) {
            timer8.start()
        } else {
            timer8.stop()
        }
        if (DataSource.carKeyWarningInfoDisplay === 9) {
            timer9.start()
        } else {
            timer9.stop()
        }
        if (DataSource.carKeyWarningInfoDisplay === 0xA) {
            timerA.start()
        } else {
            timerA.stop()
        }
        if (DataSource.carKeyWarningInfoDisplay === 0xB) {
            timerB.start()
        } else {
            timerB.stop()
        }
        if (DataSource.carKeyWarningInfoDisplay === 0xC) {
            timerC.start()
        } else {
            timerC.stop()
        }
        if (DataSource.carKeyWarningInfoDisplay === 0xD) {
            timerD.start()
        } else {
            timerD.stop()
        }
        if (DataSource.carKeyWarningInfoDisplay === 0xE) {
            timerE.start()
        } else {
            timerE.stop()
        }
    }

    Timer {
        id: timer2
        running: false
        repeat: true
        interval: 500
        onTriggered: {
            if (picIndex2 === 0) {
                picIndex2 = 1
            } else {
                picIndex2 = 0
            }
        }
    }
    Timer {
        id: timer3
        repeat: true
        running: false
        interval: 45
        onTriggered: {
            imageId3.source = "qrc:/images10_25/warningInfo/carKey/SK2H/IMG_" + pad(picIndex3, 3) + ".png"
            picIndex3 = picIndex3 === 74 ? 0 : picIndex3 + 1
        }
    }
    Timer {
        id: timer4
        repeat: true
        running: false
        interval: 67
        onTriggered: {
            imageId4.source = "qrc:/images10_25/warningInfo/carKey/SPRO/IMG_" + pad(picIndex4, 3) + ".png"
            picIndex4 = picIndex4 === 29 ? 0 : picIndex4 + 1
        }
    }
    Timer {
        id: timer5
        repeat: true
        running: false
        interval: 67
        onTriggered: {
            imageId5.source = "qrc:/images10_25/warningInfo/carKey/EK/IMG_" + pad(picIndex5, 3) + ".png"
            picIndex5 = picIndex5 === 29 ? 0 : picIndex5 + 1
        }
    }
    Timer {
        id: timer6
        repeat: true
        running: false
        interval: 67
        onTriggered: {
            imageId6.source = "qrc:/images10_25/warningInfo/carKey/SPLUS/IMG_" + pad(picIndex6, 3) + ".png"
            picIndex6 = picIndex6 === 29 ? 0 : picIndex6 + 1
        }
    }
    Timer {
        id: timer7
        repeat: true
        running: false
        interval: 55
        onTriggered: {
            imageId7.source = "qrc:/images10_25/warningInfo/carKey/ST22/IMG_" + pad(picIndex7, 3) + ".png"
            picIndex7 = picIndex7 === 74 ? 0 : picIndex7 + 1
        }
    }
    Timer {
        id: timer8
        repeat: true
        running: false
        interval: 67
        onTriggered: {
            imageId8.source = "qrc:/images10_25/warningInfo/carKey/SC3E/IMG_" + pad(picIndex8, 3) + ".png"
            picIndex8 = picIndex8 === 29 ? 0 : picIndex8 + 1
        }
    }
    Timer {
        id: timer9
        repeat: true
        running: false
        interval: 67
        onTriggered: {
            imageId9.source = "qrc:/images10_25/warningInfo/carKey/HKH/IMG_" + pad(picIndex9, 3) + ".png"
            picIndex9 = picIndex9 === 29 ? 0 : picIndex9 + 1
        }
    }
    Timer {
        id: timerA
        repeat: true
        running: false
        interval: 67
        onTriggered: {
            imageIdA.source = "qrc:/images10_25/warningInfo/carKey/HA3/IMG_" + pad(picIndexA, 3) + ".png"
            picIndexA = picIndexA === 29 ? 0 : picIndexA + 1
        }
    }
    Timer {
        id: timerB
        repeat: true
        running: false
        interval: 67
        onTriggered: {
            imageIdB.source = "qrc:/images10_25/warningInfo/carKey/SA5/IMG_" + pad(picIndexB, 3) + ".png"
            picIndexB = picIndexB === 29 ? 0 : picIndexB + 1
        }
    }
    Timer {
        id: timerC
        repeat: true
        running: false
        interval: 67
        onTriggered: {
            imageIdC.source = "qrc:/images10_25/warningInfo/carKey/SA6/IMG_" + pad(picIndexC, 3) + ".png"
            picIndexC = picIndexC === 29 ? 0 : picIndexC + 1
        }
    }
    Timer {
        id: timerD
        repeat: true
        running: false
        interval: 67
        onTriggered: {
            imageIdD.source = "qrc:/images10_25/warningInfo/carKey/SL2H/" + picIndexD + ".png"
            picIndexD = picIndexD === 29 ? 0 : picIndexD + 1
        }
    }
    Timer {
        id: timerE
        repeat: true
        running: false
        interval: 67
        onTriggered: {
            imageIdE.source = "qrc:/images10_25/warningInfo/carKey/HXHK/IMG_" + pad(picIndexE, 3) + ".png"
            picIndexE = picIndexE === 29 ? 0 : picIndexE + 1
        }
    }
    //质朴长存法补零
    function pad(num, n) {
        let len = num.toString().length;
        while(len < n) {
            num = "0" + num;
            len++;
        }
        return num;
    }
}
