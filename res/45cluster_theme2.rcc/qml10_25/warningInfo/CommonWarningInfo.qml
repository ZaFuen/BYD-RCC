import QtQuick 2.15
import com.byd.DataSource 1.0
import com.byd.CenterChild 1.0
import "qrc:/common/singleton"

CenterChild {
    opacity: 0.8
    id: rootId
    anchors.horizontalCenter: parent.horizontalCenter
    y: 197
    width: bgImg.width
    height: bgImg.height
    Component.onCompleted: {
        updateWarningInfoId()
        updateWarningInfoId2()
    }

    Image {
        id: bgImg
        source: DataSource.dayNightMode === 0x2 ? "qrc:/images10_25/warningInfo/night_bg.png" : "qrc:/images10_25/warningInfo/day_bg.png"
        anchors.horizontalCenter: parent.horizontalCenter
        visible: false//DataSource.powerGear === 0x03?true:false //((imageId.source != "" || imageId2.source != "" ||childWarningInfo2.visible===true) && DataSource.naviType === 4) ? true : false
        cache: false
        opacity: 0.8
    }

    Item {
        id: warningInfoItemId
        anchors.fill: parent
        anchors.horizontalCenter: bgImg.horizontalCenter
        anchors.top: bgImg.top
        anchors.topMargin: (bgImg.height-imageId.height-15-textId.height)/2
        Image {
            id: imageId
            anchors.horizontalCenter: parent.horizontalCenter
            cache: false
        }
        Text{
            font.bold:rootItemId.jiacu === 1
            font.family: rootItemId.ziti
            id: textId
            anchors.horizontalCenter: parent.horizontalCenter
            anchors.top: imageId.bottom
            anchors.topMargin: 15
            anchors.leftMargin: 30
            anchors.rightMargin: 30
            font.pixelSize: 30
            horizontalAlignment: Text.AlignHCenter
            textFormat: Text.RichText
        }

        //dms central image
        Image {
            id: dmsCentralImage
            anchors.horizontalCenter: imageId.horizontalCenter
            anchors.verticalCenter: imageId.verticalCenter
            scale: 0.8
            cache: false
            visible: DataSource.powerGear === 0x03 && (DataSource.commonWarningInfoId === 0x15B
                                                       || DataSource.commonWarningInfoId === 0x196
                                                       || DataSource.commonWarningInfoId === 0x197
                                                       || DataSource.commonWarningInfoId === 0x1A1)
        }
    }

    //dms title
    //    Text{
    //        id:dmsTitleInfo
    //        anchors.top: bgImg.top
    //        anchors.topMargin: 19
    //        anchors.horizontalCenter: parent.horizontalCenter
    //        font.pixelSize: 30
    //        horizontalAlignment: Text.AlignHCenter
    //        color: "#3ea8d4"
    //        text: ""
    //        visible: DataSource.powerGear === 0x03&&(DataSource.commonWarningInfoId === 0x194
    //                                                 ||DataSource.commonWarningInfoId === 0x196
    //                                                 ||DataSource.commonWarningInfoId === 0x197
    //                                                 ||DataSource.commonWarningInfoId === 0x1A1)
    //    }
    Text{
        font.bold:rootItemId.jiacu === 1
        font.family: rootItemId.ziti
        id: warningInfoC2TextId
        anchors.horizontalCenter: parent.horizontalCenter
        anchors.leftMargin: 30
        anchors.rightMargin: 30
        font.pixelSize: 24
        horizontalAlignment: Text.AlignHCenter
        textFormat: Text.RichText
        text: TranslateStr.warningInfoStr_0xC2_1
        y: 276
        color: DataSource.dayNightMode === 0x02 ? "#ffffff":"#717171"
        visible: DataSource.commonWarningInfoId === 0xC2
        opacity: DataSource.dayNightMode === 0x02 ? 0.2 : 1
    }

    //0x238 低电量预警
    Item {
        id: childWarningInfo2
        visible:DataSource.commonWarningInfoId === 0x238 &&
                (DataSource.commonWarningInfoColor === 1 || DataSource.commonWarningInfoColor === 2 || DataSource.commonWarningInfoColor === 3)
        anchors.horizontalCenter: bgImg.horizontalCenter
        y:34
        height: 336
        width: 454

        Image {
            id:lowBatteryWarningImage
            anchors.horizontalCenter: parent.horizontalCenter
            source:{
                switch(DataSource.commonWarningInfoColor){
                case 1:
                    "qrc:/images10_25/warningInfo/0x238-white.png";break;
                case 2:
                    "qrc:/images10_25/warningInfo/0x238-yellow.png";break;
                case 3:
                    "qrc:/images10_25/warningInfo/0x238-red.png";break;
                default:
                    "";break;
                }
            }

        }
        //电量数值
        Text {
            id: batteryText
            x:206
            y:DataSource.powerBatterySoc === 0x64 ? 99 : 96
            height: 39
            width: 55
            font.pixelSize:DataSource.powerBatterySoc === 0x64 ? 23 : 27  //电量为100%时  字体缩小
            color: {
                switch(DataSource.commonWarningInfoColor){
                case 1:
                    "#717171";break;
                case 2:
                    "#F18D00";break;
                case 3:
                    "#E60404";break;
                default:
                    "";break;
                }
            }
            text: DataSource.powerBatterySoc === 0xFFE ? "  " : (DataSource.powerBatterySoc === 101 ? "0%" : (DataSource.powerBatterySoc + "%"))
        }
        Text {
            id: lowBatteryWarningText
            anchors.horizontalCenter: parent.horizontalCenter
            width: 406
            y:202
            font.pixelSize:30
            color: {
                switch(DataSource.commonWarningInfoColor){
                case 1:
                    "#717171";break;
                case 2:
                    "#F18D00";break;
                case 3:
                    "#E60404";break;
                default:
                    "";break;
                }
            }
            horizontalAlignment: Text.AlignHCenter
            text: TranslateStr.warningInfoStr_0x238
            wrapMode: DataSource.language === 1 ? Text.NoWrap : Text.WordWrap
        }
    }
    //AdasWarningInfo
    Item {
        id: warningInfoItemId2
        anchors.fill: parent
        anchors.horizontalCenter: parent.horizontalCenter
        Image {
            id: imageId2
            anchors.horizontalCenter: parent.horizontalCenter
            y: DataSource.naviType === 4 ? 51 : 61
            cache: false
        }
        Text {
            font.bold:rootItemId.jiacu === 1
            font.family: rootItemId.ziti
            id: textId2
            anchors.horizontalCenter: parent.horizontalCenter
            anchors.top: imageId2.top
            anchors.topMargin: 275
            font.pixelSize: 20
            horizontalAlignment: Text.AlignHCenter
            textFormat: Text.RichText
        }
    }

    PropertyAnimation {
        id: warningInfoSwitchAnimId
        target: warningInfoItemId
        property: "opacity"
        from:0
        to:1.0
        duration: 240
    }

    PropertyAnimation {
        id: warningInfoSwitchAnimId2
        target: warningInfoItemId2
        property: "opacity"
        from: 0
        to: 1.0
        duration: 240
    }

    Connections {
        target: DataSource
        function onCommonWarningInfoIdChanged() {
            warningInfoSwitchAnimId.stop()
            warningInfoItemId.opacity = 0
            updateWarningInfoId()
            warningInfoSwitchAnimId.start()

            warningInfoSwitchAnimId2.stop()
            warningInfoItemId2.opacity = 0
            updateWarningInfoId2()
            warningInfoSwitchAnimId2.start()
        }

        function onDayNightModeChanged() {
            updateWarningInfoId()
            updateWarningInfoId2()
        }
        function onLanguageChanged() {
            updateWarningInfoId()
            updateWarningInfoId2()
        }
        function onCommonWarningInfoCountryChanged() {
            updateWarningInfoId()
            updateWarningInfoId2()
        }
        function onCarBodyTypeChanged() {
            updateWarningInfoId()
            updateWarningInfoId2()
        }
        function onPowerGearChanged() {
            updateWarningInfoId()
            updateWarningInfoId2()
        }
        function onTireInterfaceChanged() {
            updateWarningInfoId()
            updateWarningInfoId2()
        }
        function onTranslateLoadCompleteChanged() {
            updateWarningInfoId()
            updateWarningInfoId2()
        }
        function onDmsUserNameChanged() {
            updateWarningInfoId()
            updateWarningInfoId2()
        }
        function onVehicleTypeChanged() {
            updateWarningInfoId()
            updateWarningInfoId2()
        }
        function onCarNameTypeChanged() {
            updateWarningInfoId()
            updateWarningInfoId2()
        }
        function onSpeedUnitChanged() {
            updateWarningInfoId()
            updateWarningInfoId2()
        }
        function onEkCarbodyColorChanged() {
            updateWarningInfoId()
            updateWarningInfoId2()
        }
    }

    function updateWarningInfoId()
    {
        switch (DataSource.commonWarningInfoId)
        {
        case 0x19:
            imageId.source = "qrc:/images10_25/warningInfo/19-cummunError.png"
            textId.text = TranslateStr.warningInfoStr_0x19
            textId.color = "red"
            break
        case 0x1A:
            imageId.source = "qrc:/images10_25/warningInfo/1A.png"
            textId.text = TranslateStr.warningInfoStr_0x1A
            textId.color = "#f18d00"
            break
        case 0x1B:
            imageId.source = "qrc:/images10_25/warningInfo/1B-1C-2B-45-62.png"
            textId.text = TranslateStr.warningInfoStr_0x1B
            textId.color = "red"
            break
        case 0x1C:
            imageId.source = "qrc:/images10_25/warningInfo/1B-1C-2B-45-62.png"
            textId.text = TranslateStr.warningInfoStr_0x1C
            textId.color = "red"
            break
        case 0x1D:
            imageId.source = "qrc:/images10_25/warningInfo/1D.png"
            textId.text = TranslateStr.warningInfoStr_0x1D
            textId.color = "red"
            break
        case 0x1E:
            imageId.source = "qrc:/images10_25/warningInfo/1E-1F-3E.png"
            textId.text = TranslateStr.warningInfoStr_0x1E
            textId.color = "red"
            break
        case 0x1F:
            imageId.source = "qrc:/images10_25/warningInfo/1E-1F-3E.png"
            textId.text = TranslateStr.warningInfoStr_0x1F
            textId.color = "red"
            break
        case 0x20:
            imageId.source = "qrc:/images10_25/warningInfo/20.png"
            textId.text = TranslateStr.warningInfoStr_0x20
            textId.color = "red"
            break
        case 0x21:
            imageId.source = DataSource.carBodyType === 0x01 ? "qrc:/images10_25/warningInfo/21-28-122_SUV.png" : "qrc:/images10_25/warningInfo/21-28-122_Car.png"
            textId.text = TranslateStr.warningInfoStr_0x21
            textId.color = "red"
            break
        case 0x22:
            imageId.source = "qrc:/images10_25/warningInfo/2D-22-23.png"
            textId.text = TranslateStr.warningInfoStr_0x22
            textId.color = "red"
            break
        case 0x23:
            imageId.source = "qrc:/images10_25/warningInfo/2D-22-23.png"
            textId.text = DataSource.vehicleType === 0x01 ? TranslateStr.warningInfoStr_0x23_ev : TranslateStr.warningInfoStr_0x23_hev
            textId.color = "red"
            break
        case 0x24:
            imageId.source = "qrc:/images10_25/warningInfo/1A.png"
            textId.text = TranslateStr.warningInfoStr_0x24
            textId.color = "#f18d00"
            break
        case 0x25:
            imageId.source = "qrc:/images10_25/warningInfo/25-32.png"
            textId.text = TranslateStr.warningInfoStr_0x25
            textId.color = "#f18d00"
            break
        case 0x26:
            imageId.source = "qrc:/images10_25/warningInfo/26.png"
            textId.text = TranslateStr.warningInfoStr_0x26
            textId.color = "red"
            break
        case 0x27:
            imageId.source = "qrc:/images10_25/warningInfo/27-5B-78-79-AB-AC.png"
            textId.text = TranslateStr.warningInfoStr_0x27
            textId.color = "#f18d00"
            break
        case 0x28:
            imageId.source = DataSource.carBodyType === 0x01 ? "qrc:/images10_25/warningInfo/21-28-122_SUV.png" : "qrc:/images10_25/warningInfo/21-28-122_Car.png"
            textId.text = TranslateStr.warningInfoStr_0x28
            textId.color = "red"
            break
        case 0x2B:
            imageId.source = "qrc:/images10_25/warningInfo/1B-1C-2B-45-62.png"
            textId.text = TranslateStr.warningInfoStr_0x2B
            textId.color = "red"
            break
        case 0x2C:
            imageId.source = "qrc:/images10_25/warningInfo/2C.png"
            textId.text = TranslateStr.warningInfoStr_0x2C
            textId.color = "red"
            break
        case 0x2D:
            imageId.source = "qrc:/images10_25/warningInfo/2D-22-23.png"
            textId.text = TranslateStr.warningInfoStr_0x2D
            textId.color = "red"
            break
        case 0x2E:
            imageId.source = "qrc:/images10_25/warningInfo/2D-22-23.png"
            textId.text = TranslateStr.warningInfoStr_0x2E
            textId.color = "red"
            break
        case 0x2F:
            imageId.source = "qrc:/images10_25/warningInfo/2F.png"
            textId.text = TranslateStr.warningInfoStr_0x2F
            textId.color = "#717171"
            break
        case 0x30:
            imageId.source = "qrc:/images10_25/warningInfo/30.png"
            textId.text = TranslateStr.warningInfoStr_0x30
            textId.color = "#f18d00"
            break
        case 0x31:
            imageId.source = "qrc:/images10_25/warningInfo/1A.png"
            textId.text = TranslateStr.warningInfoStr_0x31
            textId.color = "#f18d00"
            break
        case 0x32:
            imageId.source ="qrc:/images10_25/warningInfo/25-32.png"
            textId.text = TranslateStr.warningInfoStr_0x32
            textId.color = "#f18d00"
            break
        case 0x33:
            imageId.source = "qrc:/images10_25/warningInfo/33.png"
            textId.text = TranslateStr.warningInfoStr_0x33
            textId.color = "red"
            break
        case 0x34:
            imageId.source = "qrc:/images10_25/warningInfo/34.png"
            textId.text = TranslateStr.warningInfoStr_0x34
            textId.color = "red"
            break
        case 0x35:
            imageId.source = "qrc:/images10_25/warningInfo/35.png"
            textId.text = TranslateStr.warningInfoStr_0x35
            textId.color = "red"
            break
        case 0x37:
            imageId.source = "qrc:/images10_25/warningInfo/190.png"
            if (DataSource.speedUnit === 0x02) {
                textId.text = TranslateStr.warningInfoStr_0x190_2
            } else {
                textId.text = TranslateStr.warningInfoStr_0x190_1
            }
            textId.color = "#717171"
            break
        case 0x38:
            imageId.source = "qrc:/images10_25/warningInfo/1A.png"
            textId.text = TranslateStr.warningInfoStr_0x38
            textId.color = "#f18d00"
            break
        case 0x39:
            imageId.source = "qrc:/images10_25/warningInfo/1A.png"
            textId.text = TranslateStr.warningInfoStr_0x39
            textId.color = "#f18d00"
            break
        case 0x3D:
            imageId.source = "qrc:/images10_25/warningInfo/190.png"
            textId.text = TranslateStr.warningInfoStr_0x191
            textId.color = "#717171"
            break
        case 0x3E:
            imageId.source = "qrc:/images10_25/warningInfo/1E-1F-3E.png"
            textId.text = TranslateStr.warningInfoStr_0x3E
            textId.color = "red"
            break
        case 0x3F:
            imageId.source = "qrc:/images10_25/warningInfo/3F.png"
            textId.text = TranslateStr.warningInfoStr_0x3F
            textId.color ="#f18d00"
            break
        case 0x40:
            imageId.source = "qrc:/images10_25/warningInfo/40-41-42.png"
            textId.text = TranslateStr.warningInfoStr_0x40
            textId.color = "#f18d00"
            break
        case 0x41:
            imageId.source = "qrc:/images10_25/warningInfo/40-41-42.png"
            textId.text = TranslateStr.warningInfoStr_0x41
            textId.color = "#f18d00"
            break
        case 0x42:
            imageId.source = "qrc:/images10_25/warningInfo/40-41-42.png"
            textId.text = TranslateStr.warningInfoStr_0x42
            textId.color = "#f18d00"
            break
        case 0x43:
            imageId.source = "qrc:/images10_25/warningInfo/43-44.png"
            textId.text = TranslateStr.warningInfoStr_0x43
            textId.color = "#f18d00"
            break
        case 0x44:
            imageId.source = "qrc:/images10_25/warningInfo/43-44.png"
            textId.text = TranslateStr.warningInfoStr_0x44
            textId.color = "#f18d00"
            break
        case 0x45:
            imageId.source = "qrc:/images10_25/warningInfo/1B-1C-2B-45-62.png"
            textId.text = TranslateStr.warningInfoStr_0x45
            textId.color = "red"
            break
        case 0x46:
            imageId.source = "qrc:/images10_25/warningInfo/46.png"
            textId.text = TranslateStr.warningInfoStr_0x46
            textId.color = "#f18d00"
            break
        case 0x47:
            imageId.source = "qrc:/images10_25/warningInfo/47.png"
            textId.text = TranslateStr.warningInfoStr_0x47
            textId.color = "#f18d00"
            break
        case 0x48:
            imageId.source = "qrc:/images10_25/warningInfo/1A.png"
            textId.text = TranslateStr.warningInfoStr_0x48
            textId.color = "#f18d00"
            break
        case 0x49:
            if(DataSource.commonWarningInfoCountry === 0x01){//南美
                imageId.source = "qrc:/images10_25/warningInfo/49.png"
            }else{
                imageId.source = "qrc:/images10_25/warningInfo/49_HA3HE_HA2HF.png"
            }
            textId.text = TranslateStr.warningInfoStr_0x49
            textId.color = "#f18d00"
            break
        case 0x4A:
            imageId.source = "qrc:/images10_25/warningInfo/4A.png"
            textId.text = TranslateStr.warningInfoStr_0x4A
            textId.color = "#f18d00"
            break
        case 0x4B:
            imageId.source = "qrc:/images10_25/warningInfo/1A.png"
            textId.text = TranslateStr.warningInfoStr_0x4B
            textId.color = "#f18d00"
            break
        case 0x4C:
            imageId.source = "qrc:/images10_25/warningInfo/1B-1C-2B-45-62.png"
            textId.text = TranslateStr.warningInfoStr_0x4C
            textId.color = "red"
            break
        case 0x4D:
            imageId.source = "qrc:/images10_25/warningInfo/4D.png"
            textId.text = TranslateStr.warningInfoStr_0x4D
            textId.color = "#f18d00"
            break
        case 0x4E:
            imageId.source = "qrc:/images10_25/warningInfo/4E.png"
            textId.text = TranslateStr.warningInfoStr_0x4E
            textId.color = "#f18d00"
            break
        case 0x4F:
            imageId.source = "qrc:/images10_25/warningInfo/4F.png"
            textId.text = TranslateStr.warningInfoStr_0x4F
            textId.color = "#f18d00"
            break
        case 0x52:
            imageId.source = "qrc:/images10_25/warningInfo/52.png"
            textId.text = TranslateStr.warningInfoStr_0x52
            textId.color = "#f18d00"
            break
        case 0x53:
            imageId.source = "qrc:/images10_25/warningInfo/53.png"
            textId.text = TranslateStr.warningInfoStr_0x53
            textId.color = "#f18d00"
            break
        case 0x54:
            imageId.source = "qrc:/images10_25/warningInfo/54.png"
            textId.text = TranslateStr.warningInfoStr_0x54
            textId.color = "#f18d00"
            break
        case 0x55:
            imageId.source = "qrc:/images10_25/warningInfo/55.png"
            textId.text = TranslateStr.warningInfoStr_0x55
            textId.color = "#f18d00"
            break
        case 0x56:
            imageId.source = "qrc:/images10_25/warningInfo/56.png"
            textId.text = TranslateStr.warningInfoStr_0x56
            textId.color = "#717171"
            break
        case 0x57:
            imageId.source = "qrc:/images10_25/warningInfo/57.png"
            textId.text = TranslateStr.warningInfoStr_0x57
            textId.color = "#f18d00"
            break
        case 0x58:
            imageId.source = "qrc:/images10_25/warningInfo/1A.png"
            textId.text = TranslateStr.warningInfoStr_0x58
            textId.color = "#f18d00"
            break
        case 0x59:
            imageId.source = "qrc:/images10_25/warningInfo/1A.png"
            textId.text = TranslateStr.warningInfoStr_0x59
            textId.color = "#f18d00"
            break
        case 0x5A:
            imageId.source = "qrc:/images10_25/warningInfo/1A.png"
            textId.text = TranslateStr.warningInfoStr_0x5A
            textId.color = "#f18d00"
            break
        case 0x5B:
            imageId.source = "qrc:/images10_25/warningInfo/5B.png"
            textId.text = TranslateStr.warningInfoStr_0x5B
            textId.color = "#717171"
            break
        case 0x5C:
            imageId.source = "qrc:/images10_25/warningInfo/5B.png"
            textId.text = TranslateStr.warningInfoStr_0x5C
            textId.color = "#717171"
            break
        case 0x5D:
            imageId.source = "qrc:/images10_25/warningInfo/27-5B-78-79-AB-AC.png"
            textId.text = TranslateStr.warningInfoStr_0x5D
            textId.color = "#f18d00"
            break
        case 0x5F:
            imageId.source = "qrc:/images10_25/warningInfo/1A.png"
            textId.text = TranslateStr.warningInfoStr_0x5F
            textId.color = "#f18d00"
            break
        case 0x60:
            imageId.source = "qrc:/images10_25/warningInfo/C0.png"
            textId.text = TranslateStr.warningInfoStr_0x60
            textId.color = "#f18d00"
            break
        case 0x61:
            imageId.source = "qrc:/images10_25/warningInfo/1A.png"
            textId.text = TranslateStr.warningInfoStr_0x61
            textId.color = "#f18d00"
            break
        case 0x62:
            imageId.source = "qrc:/images10_25/warningInfo/1B-1C-2B-45-62.png"
            textId.text = TranslateStr.warningInfoStr_0x62
            textId.color = "red"
            break
        case 0x63:
            imageId.source = "qrc:/images10_25/warningInfo/63-A5.png"
            textId.text = TranslateStr.warningInfoStr_0x63
            textId.color = "red"
            break
        case 0x77:
            imageId.source = "qrc:/images10_25/warningInfo/77.png"
            textId.text = TranslateStr.warningInfoStr_0x77
            textId.color = "#f18d00"
            break
        case 0x78:
            imageId.source = "qrc:/images10_25/warningInfo/0x78.png"
            textId.text = TranslateStr.warningInfoStr_0x78_1
            textId.color = "#f18d00"
            break
        case 0x79:
            imageId.source = "qrc:/images10_25/warningInfo/27-5B-78-79-AB-AC.png"
            textId.text = TranslateStr.warningInfoStr_0x79
            textId.color = "#f18d00"
            break
        case 0x7A:
            imageId.source ="qrc:/images10_25/warningInfo/7A-7B-7D.png"
            textId.text = TranslateStr.warningInfoStr_0x7A
            textId.color = "#f18d00"
            break
        case 0x7B:
            imageId.source = "qrc:/images10_25/warningInfo/7A-7B-7D.png"
            textId.text = TranslateStr.warningInfoStr_0x7B
            textId.color = "#f18d00"
            break
        case 0x7C:
            imageId.source = "qrc:/images10_25/warningInfo/7C.png"
            textId.text = TranslateStr.warningInfoStr_0x7C
            textId.color ="#f18d00"
            break
        case 0x7D:
            imageId.source ="qrc:/images10_25/warningInfo/7A-7B-7D.png"
            textId.text = TranslateStr.warningInfoStr_0x7D
            textId.color = "#f18d00"
            break
        case 0x7E:
            imageId.source ="qrc:/images10_25/warningInfo/7E-9B.png"
            textId.text = TranslateStr.warningInfoStr_0x7E
            textId.color = "#f18d00"
            break
        case 0x7F:
            imageId.source = "qrc:/images10_25/warningInfo/7E-9B.png"
            textId.text = TranslateStr.warningInfoStr_0x7F
            textId.color = "#f18d00"
            break
        case 0x80:
            imageId.source ="qrc:/images10_25/warningInfo/7E-9B.png"
            textId.text = TranslateStr.warningInfoStr_0x80
            textId.color = "#f18d00"
            break
        case 0x81:
            imageId.source ="qrc:/images10_25/warningInfo/7E-9B.png"
            textId.text = TranslateStr.warningInfoStr_0x81
            textId.color = "#f18d00"
            break
        case 0x82:
            imageId.source = "qrc:/images10_25/warningInfo/7E-9B.png"
            textId.text = TranslateStr.warningInfoStr_0x82
            textId.color = "#f18d00"
            break
        case 0x83:
            imageId.source = "qrc:/images10_25/warningInfo/7E-9B.png"
            textId.text = TranslateStr.warningInfoStr_0x83
            textId.color = "#f18d00"
            break
        case 0x84:
            imageId.source = "qrc:/images10_25/warningInfo/7E-9B.png"
            textId.text = TranslateStr.warningInfoStr_0x84
            textId.color = "#f18d00"
            break
        case 0x85:
            imageId.source = "qrc:/images10_25/warningInfo/7E-9B.png"
            textId.text = TranslateStr.warningInfoStr_0x85
            textId.color = "#f18d00"
            break
        case 0x86:
            imageId.source = "qrc:/images10_25/warningInfo/7E-9B.png"
            textId.text = TranslateStr.warningInfoStr_0x86
            textId.color ="#f18d00"
            break
        case 0x87:
            imageId.source = "qrc:/images10_25/warningInfo/7E-9B.png"
            textId.text = TranslateStr.warningInfoStr_0x87
            textId.color = "#f18d00"
            break
        case 0x88:
            imageId.source = "qrc:/images10_25/warningInfo/7E-9B.png"
            textId.text = TranslateStr.warningInfoStr_0x88
            textId.color = "#f18d00"
            break
        case 0x89:
            imageId.source = "qrc:/images10_25/warningInfo/7E-9B.png"
            textId.text = TranslateStr.warningInfoStr_0x89
            textId.color = "#f18d00"
            break
        case 0x8A:
            imageId.source = "qrc:/images10_25/warningInfo/7E-9B.png"
            textId.text = TranslateStr.warningInfoStr_0x8A
            textId.color = "#f18d00"
            break
        case 0x8B:
            imageId.source = "qrc:/images10_25/warningInfo/7E-9B.png"
            textId.text = TranslateStr.warningInfoStr_0x8B
            textId.color = "#f18d00"
            break
        case 0x8C:
            imageId.source = "qrc:/images10_25/warningInfo/7E-9B.png"
            textId.text = TranslateStr.warningInfoStr_0x8C
            textId.color = "#f18d00"
            break
        case 0x8D:
            imageId.source = "qrc:/images10_25/warningInfo/7E-9B.png"
            textId.text = TranslateStr.warningInfoStr_0x8D
            textId.color = "#f18d00"
            break
        case 0x8E:
            imageId.source = "qrc:/images10_25/warningInfo/7E-9B.png"
            textId.text = TranslateStr.warningInfoStr_0x8E
            textId.color = "#f18d00"
            break
        case 0x8F:
            imageId.source = "qrc:/images10_25/warningInfo/7E-9B.png"
            textId.text = TranslateStr.warningInfoStr_0x8F
            textId.color = "#f18d00"
            break
        case 0x90:
            imageId.source = "qrc:/images10_25/warningInfo/7E-9B.png"
            textId.text = TranslateStr.warningInfoStr_0x90
            textId.color = "#f18d00"
            break
        case 0x91:
            imageId.source = "qrc:/images10_25/warningInfo/7E-9B.png"
            textId.text = TranslateStr.warningInfoStr_0x91
            textId.color = "#f18d00"
            break
        case 0x92:
            imageId.source = "qrc:/images10_25/warningInfo/7E-9B.png"
            textId.text = TranslateStr.warningInfoStr_0x92
            textId.color ="#f18d00"
            break
        case 0x93:
            imageId.source = "qrc:/images10_25/warningInfo/7E-9B.png"
            textId.text = TranslateStr.warningInfoStr_0x93
            textId.color = "#f18d00"
            break
        case 0x94:
            imageId.source ="qrc:/images10_25/warningInfo/7E-9B.png"
            textId.text = TranslateStr.warningInfoStr_0x94
            textId.color = "#f18d00"
            break
        case 0x95:
            imageId.source = "qrc:/images10_25/warningInfo/7E-9B.png"
            textId.text = TranslateStr.warningInfoStr_0x95
            textId.color ="#f18d00"
            break
        case 0x96:
            imageId.source = "qrc:/images10_25/warningInfo/7E-9B.png"
            textId.text = TranslateStr.warningInfoStr_0x96
            textId.color = "#f18d00"
            break
        case 0x97:
            imageId.source = "qrc:/images10_25/warningInfo/7E-9B.png"
            textId.text = TranslateStr.warningInfoStr_0x97
            textId.color = "#f18d00"
            break
        case 0x98:
            imageId.source = "qrc:/images10_25/warningInfo/7E-9B.png"
            textId.text = TranslateStr.warningInfoStr_0x98
            textId.color = "#f18d00"
            break
        case 0x99:
            imageId.source = "qrc:/images10_25/warningInfo/7E-9B.png"
            textId.text = TranslateStr.warningInfoStr_0x99
            textId.color ="#f18d00"
            break
        case 0x9A:
            imageId.source = "qrc:/images10_25/warningInfo/7E-9B.png"
            textId.text = TranslateStr.warningInfoStr_0x9A
            textId.color = "#f18d00"
            break
        case 0x9B:
            imageId.source ="qrc:/images10_25/warningInfo/7E-9B.png"
            textId.text = TranslateStr.warningInfoStr_0x9B
            textId.color = "#f18d00"
            break
        case 0x9C:
            imageId.source = "qrc:/images10_25/warningInfo/9C.png"
            textId.text = TranslateStr.warningInfoStr_0x9C
            textId.color = "#f18d00"
            break
        case 0x9D:
            imageId.source = "qrc:/images10_25/warningInfo/77.png"
            textId.text = TranslateStr.warningInfoStr_0x9D
            textId.color = "#f18d00"
            break
        case 0x9E:
            imageId.source = "qrc:/images10_25/warningInfo/9E.png"
            textId.text = TranslateStr.warningInfoStr_0x9E
            textId.color = "#f18d00"
            break
        case 0x9F:
            imageId.source = "qrc:/images10_25/warningInfo/9F.png"
            textId.text = TranslateStr.warningInfoStr_0x9F
            textId.color = "#f18d00"
            break
        case 0xA5:
            imageId.source = "qrc:/images10_25/warningInfo/63-A5.png"
            textId.text = TranslateStr.warningInfoStr_0xA5
            textId.color = "red"
            break
        case 0xA6:
            imageId.source = "qrc:/images10_25/warningInfo/A6.png"
            textId.text = TranslateStr.warningInfoStr_0xA6
            textId.color = "#717171"
            break
        case 0xA7:
            imageId.source = "qrc:/images10_25/warningInfo/A7-A8.png"
            textId.text = TranslateStr.warningInfoStr_0xA7
            textId.color = "#717171"
            break
        case 0xA8:
            imageId.source = "qrc:/images10_25/warningInfo/A7-A8.png"
            textId.text = TranslateStr.warningInfoStr_0xA8
            textId.color = "#717171"
            break
        case 0xA9:
            imageId.source = "qrc:/images10_25/warningInfo/1A.png"
            textId.text = TranslateStr.warningInfoStr_0xA9
            textId.color = "#f18d00"
            break
        case 0xAA:
            imageId.source = "qrc:/images10_25/warningInfo/1A.png"
            textId.text = TranslateStr.warningInfoStr_0xAA
            textId.color = "#f18d00"
            break
        case 0xAB:
            imageId.source ="qrc:/images10_25/warningInfo/27-5B-78-79-AB-AC.png"
            textId.text = TranslateStr.warningInfoStr_0xAB
            textId.color = "#f18d00"
            break
        case 0xAC:
            imageId.source = "qrc:/images10_25/warningInfo/27-5B-78-79-AB-AC.png"
            textId.text = TranslateStr.warningInfoStr_0xAC
            textId.color = "#f18d00"
            break
        case 0xAD:
            imageId.source = "qrc:/images10_25/warningInfo/27-5B-78-79-AB-AC.png"
            textId.text = TranslateStr.warningInfoStr_0xAD
            textId.color = "#f18d00"
            break
        case 0xAF:
            imageId.source = "qrc:/images10_25/warningInfo/AF.png"
            textId.text = TranslateStr.warningInfoStr_0xAF
            textId.color = "#f18d00"
            break
        case 0xB6:
            if (DataSource.commonWarningInfoCountry === 0x01) {
                if (DataSource.language === 0x01) {
                    imageId.source = "qrc:/images10_25/warningInfo/B6_SA.png"
                } else {
                    imageId.source = "qrc:/images10_25/warningInfo/B6_SA_EN.png"
                }
            } else {
                if (DataSource.language === 0x01) {
                    imageId.source = "qrc:/images10_25/warningInfo/B6.png"
                } else {
                    imageId.source = "qrc:/images10_25/warningInfo/B6_EN.png"
                }
            }
            textId.text = TranslateStr.warningInfoStr_0xB6
            textId.color = "#717171"
            break
        case 0xB7:
            if(DataSource.commonWarningInfoCountry === 0x01){
                imageId.source = "qrc:/images10_25/warningInfo/B7_SA.png"
            }else{
                imageId.source = "qrc:/images10_25/warningInfo/B7.png"
            }
            textId.text = TranslateStr.warningInfoStr_0xB7
            textId.color = "#717171"
            break
        case 0xB8:
            imageId.source = "qrc:/images10_25/warningInfo/B8.png"
            textId.text = TranslateStr.warningInfoStr_0xB8
            textId.color = "#717171"
            break
        case 0xB9:
            imageId.source = "qrc:/images10_25/warningInfo/B9.png"
            textId.text = TranslateStr.warningInfoStr_0xB9
            textId.color = "#717171"
            break
        case 0xBA:
            if(DataSource.commonWarningInfoCountry === 0x01){
                imageId.source = "qrc:/images10_25/warningInfo/BA_SA.png"
            }else{
                imageId.source = "qrc:/images10_25/warningInfo/BA.png"
            }
            textId.text = TranslateStr.warningInfoStr_0xBA
            textId.color = "#717171"
            break
        case 0xBF:
            imageId.source = "qrc:/images10_25/warningInfo/BF.png"
            textId.text = TranslateStr.warningInfoStr_0xBF
            textId.color = "#717171"
            break
        case 0xC0:
            imageId.source = "qrc:/images10_25/warningInfo/C0.png"
            textId.text = TranslateStr.warningInfoStr_0xC0
            textId.color = "#f18d00"
            break
        case 0xC1:
            imageId.source ="qrc:/images10_25/warningInfo/C1-C2-E0-E8-E9-154-155-162.png"
            textId.text = TranslateStr.warningInfoStr_0xC1
            textId.color = "#717171"
            break
        case 0xC2:
            imageId.source = ""
            textId.text = ""
            textId.color = ""
            break
        case 0xC3:
            switch (DataSource.carNameType) {
            case 0x06:
                imageId.source = "qrc:/images10_25/warningInfo/C3_SLH.png"
                break
            case 0x07:
                imageId.source = "qrc:/images10_25/warningInfo/C3_SK2H.png"
                break
            case 0x0B:
            case 0x0C:
                imageId.source = "qrc:/images10_25/warningInfo/C3_HA2E_HA2H.png"
                break
            default:
                imageId.source = "qrc:/images10_25/warningInfo/C3.png"
                break
            case DataSource.CARNAME_SC3E_8_8:
                imageId.source = "qrc:/images10_25/warningInfo/car/SC3E/C3_SC3E.png"
                break
            case DataSource.CARNAME_SC2E_8_8:
                imageId.source = "qrc:/images10_25/warningInfo/car/SC2E/C3_SC2E.png"
                break
            case DataSource.CARNAME_HA3_8_8:
                imageId.source = "qrc:/images10_25/warningInfo/car/HA3/C3_HA3.png"
                break
            case DataSource.CARNAME_HKHA_8_8:
                imageId.source = "qrc:/images10_25/warningInfo/car/HKH/C3_HKH.png"
                break
            case DataSource.CARNAME_SA5H_10_25:
                imageId.source = "qrc:/images10_25/warningInfo/car/SA5H/C3_SA5H.png"
                break
            case DataSource.CARNAME_SA6H_8_8:
                imageId.source = "qrc:/images10_25/warningInfo/car/SA6H/C3_SA6H.png"
                break
            case DataSource.CARNAME_HXHK_8_8:
                imageId.source = "qrc:/images10_25/warningInfo/car/HXHK/C3_HXHK.png"
                break
            case DataSource.CARNAME_SL2H_8_8:
                imageId.source = "qrc:/images10_25/warningInfo/car/SL2H/C3_SL2H.png"
                break
            case DataSource.CARNAME_EWE_8_8:
                imageId.source = "qrc:/images10_25/warningInfo/car/EWE/C3_EWE.png"
                break
            }
            textId.text = TranslateStr.warningInfoStr_0xC3
            textId.color = "#717171"
            break
        case 0xC4:
            if (DataSource.powerGear === 0x01) {
                switch (DataSource.carNameType) {
                case 0x06:
                    imageId.source = "qrc:/images10_25/warningInfo/C4_SLH.png"
                    break
                case 0x07:
                    imageId.source = "qrc:/images10_25/warningInfo/C4_SK2H.png"
                    break
                case 0x09:
                    if (DataSource.ekCarbodyColor === 2) {
                        imageId.source = "qrc:/images10_25/warningInfo/C4_ek_sport_green.png"
                    } else {
                        imageId.source = "qrc:/images10_25/warningInfo/C4_ek_sport_orange.png"
                    }
                    break
                case 0x0A:
                    imageId.source = "qrc:/images10_25/warningInfo/C4_ek_normal.png"
                    break
                case 0x0B:
                    imageId.source = "qrc:/images10_25/warningInfo/C4_HA2E.png"
                    break
                case 0x0C:
                    imageId.source = "qrc:/images10_25/warningInfo/C4_HA2H.png"
                    break
                case DataSource.CARNAME_EK23_10_25:
                    imageId.source = "qrc:/images10_25/warningInfo/C4_ek_normal_23.png"
                    break
                default:
                    imageId.source = "qrc:/images10_25/warningInfo/C4.png"
                    break
                case DataSource.CARNAME_SC3E_8_8:
                    imageId.source = "qrc:/images10_25/warningInfo/car/SC3E/C4_SC3E.png"
                    break
                case DataSource.CARNAME_SC2E_8_8:
                    imageId.source = "qrc:/images10_25/warningInfo/car/SC2E/C4_SC2E.png"
                    break
                case DataSource.CARNAME_HA3_8_8:
                    imageId.source = "qrc:/images10_25/warningInfo/car/HA3/C4_HA3.png"
                    break
                case DataSource.CARNAME_HKHA_8_8:
                    imageId.source = "qrc:/images10_25/warningInfo/car/HKH/C4_HKH.png"
                    break
                case DataSource.CARNAME_SA5H_10_25:
                    imageId.source = "qrc:/images10_25/warningInfo/car/SA5H/C4_SA5H.png"
                    break
                case DataSource.CARNAME_SA6H_8_8:
                    imageId.source = "qrc:/images10_25/warningInfo/car/SA6H/C4_SA6H.png"
                    break
                case DataSource.CARNAME_HXHK_8_8:
                    imageId.source = "qrc:/images10_25/warningInfo/car/HXHK/C4_HXHK.png"
                    break
                case DataSource.CARNAME_SL2H_8_8:
                    imageId.source = "qrc:/images10_25/warningInfo/car/SL2H/C4_SL2H.png"
                    break
                case DataSource.CARNAME_EWE_8_8:
                    imageId.source = "qrc:/images10_25/warningInfo/car/EWE/C4_EWE.png"
                    break
                }
            } else {
                imageId.source = ""
            }
            textId.text = DataSource.powerGear === 0x01?TranslateStr.warningInfoStr_0xC4:""
            textId.color = DataSource.powerGear === 0x01?"#717171":""
            break
        case 0xC5:
            if(DataSource.language === 0x01){
                imageId.source = "qrc:/images10_25/warningInfo/C5.png"
            }else{
                imageId.source = "qrc:/images10_25/warningInfo/C5_EN.png"
            }
            textId.text = TranslateStr.warningInfoStr_0xC5
            textId.color = "#717171"
            break
        case 0xC6:
            if(DataSource.commonWarningInfoCountry === 0x01){
                imageId.source = (DataSource.language === 0x01) ? "qrc:/images10_25/warningInfo/C6_SA.png" : "qrc:/images10_25/warningInfo/C6_SA_EN.png"
            }else{
                imageId.source = (DataSource.language === 0x01) ? "qrc:/images10_25/warningInfo/C6_HA2HE_HA2HF.png" : "qrc:/images10_25/warningInfo/C6_HA2HE_HA2HF_EN.png"
            }
            textId.text = TranslateStr.warningInfoStr_0xC6
            textId.color = "#717171"
            break
        case 0xC7:
            if(DataSource.commonWarningInfoCountry === 0x01){
                imageId.source =(DataSource.language === 0x01) ?"qrc:/images10_25/warningInfo/C6-C7_SA.png":"qrc:/images10_25/warningInfo/C6-C7_SA_EN.png"
            }else{
                imageId.source = (DataSource.language === 0x01) ? "qrc:/images10_25/warningInfo/C6-C7_HA2HE_HA2HF.png":"qrc:/images10_25/warningInfo/C6-C7_HA2HE_HA2HF_EN.png"
            }
            textId.text = TranslateStr.warningInfoStr_0xC7
            textId.color = "#717171"
            break
        case 0xC8:
            imageId.source = "qrc:/images10_25/warningInfo/C8-C9.png"
            textId.text = TranslateStr.warningInfoStr_0xC8
            textId.color = "#717171"
            break
        case 0xC9:
            imageId.source = "qrc:/images10_25/warningInfo/C8-C9.png"
            textId.text = TranslateStr.warningInfoStr_0xC9
            textId.color = "#717171"
            break
        case 0xCA:
            if(DataSource.commonWarningInfoCountry === 0x01){
                imageId.source = "qrc:/images10_25/warningInfo/CA_SA.png"
            }else{
                imageId.source = "qrc:/images10_25/warningInfo/CA.png"
            }
            textId.text = TranslateStr.warningInfoStr_0xCA
            textId.color = "#717171"
            break
        case 0xCF:
            imageId.source = "qrc:/images10_25/warningInfo/CF.png"
            textId.text = TranslateStr.warningInfoStr_0xCF
            textId.color = "#717171"
            break
        case 0xD0:
            imageId.source = "qrc:/images10_25/warningInfo/D0.png"
            textId.text = TranslateStr.warningInfoStr_0xD0
            textId.color = "#717171"
            break
        case 0xD1:
            imageId.source = "qrc:/images10_25/warningInfo/D1.png"
            textId.text = TranslateStr.warningInfoStr_0xD1
            textId.color = "#717171"
            break
        case 0xD2:
            imageId.source = "qrc:/images10_25/warningInfo/D2.png"
            textId.text = TranslateStr.warningInfoStr_0xD2
            textId.color = "#717171"
            break
        case 0xD3:
            imageId.source = "qrc:/images10_25/warningInfo/D3.png"
            textId.text = TranslateStr.warningInfoStr_0xD3
            textId.color = "#717171"
            break
        case 0xD4:
            imageId.source = "qrc:/images10_25/warningInfo/D4.png"
            textId.text = TranslateStr.warningInfoStr_0xD4
            textId.color = "#717171"
            break
        case 0xD5:
            imageId.source = "qrc:/images10_25/warningInfo/D5.png"
            textId.text = TranslateStr.warningInfoStr_0xD5
            textId.color = "#f18d00"
            break
        case 0xD6:
            imageId.source = "qrc:/images10_25/warningInfo/D6-D7.png"
            textId.text = TranslateStr.warningInfoStr_0xD6
            textId.color = "#717171"
            break
        case 0xD7:
            imageId.source = "qrc:/images10_25/warningInfo/D6-D7.png"
            textId.text = TranslateStr.warningInfoStr_0xD7
            textId.color = "#717171"
            break
        case 0xD8:
            imageId.source = "qrc:/images10_25/warningInfo/D8.png"
            textId.text = TranslateStr.warningInfoStr_0xD8
            textId.color = "#f18d00"
            break
        case 0xD9:
            imageId.source = "qrc:/images10_25/warningInfo/D9.png"
            textId.text = TranslateStr.warningInfoStr_0xD9
            textId.color = "#717171"
            break
        case 0xDA:
            imageId.source = "qrc:/images10_25/warningInfo/DA.png"
            textId.text = TranslateStr.warningInfoStr_0xDA
            textId.color = "#717171"
            break
        case 0xDB:
            imageId.source = "qrc:/images10_25/warningInfo/43-44.png"
            textId.text = TranslateStr.warningInfoStr_0xDB
            textId.color = "#f18d00"
            break
        case 0xDC:
            imageId.source = "qrc:/images10_25/warningInfo/43-44.png"
            textId.text = TranslateStr.warningInfoStr_0xDC
            textId.color = "#f18d00"
            break
        case 0xDD:
            imageId.source = "qrc:/images10_25/warningInfo/43-44.png"
            textId.text = TranslateStr.warningInfoStr_0xDD
            textId.color = "#f18d00"
            break
        case 0xDE:
            imageId.source = "qrc:/images10_25/warningInfo/1A.png"
            textId.text = TranslateStr.warningInfoStr_0xDE
            textId.color = "#f18d00"
            break
        case 0xDF:
            imageId.source = "qrc:/images10_25/warningInfo/1A.png"
            textId.text = TranslateStr.warningInfoStr_0xDF
            textId.color = "#f18d00"
            break
        case 0xE0:
            imageId.source = "qrc:/images10_25/warningInfo/B8.png"
            textId.text = TranslateStr.warningInfoStr_0xE0
            textId.color = "#717171"
            break
        case 0xE1:
            imageId.source = "qrc:/images10_25/warningInfo/B8.png"
            textId.text = TranslateStr.warningInfoStr_0xE1
            textId.color = "#717171"
            break
        case 0xE2:
            imageId.source = "qrc:/images10_25/warningInfo/E2.png"
            textId.text = TranslateStr.warningInfoStr_0xE2
            textId.color = "#717171"
            break
        case 0xE3:
            imageId.source = "qrc:/images10_25/warningInfo/E3.png"
            textId.text = TranslateStr.warningInfoStr_0xE3
            textId.color = "#717171"
            break
        case 0xE4:
            imageId.source = "qrc:/images10_25/warningInfo/E3.png"
            textId.text = TranslateStr.warningInfoStr_0xE4
            textId.color = "#717171"
            break
        case 0xE6:
            imageId.source = "qrc:/images10_25/warningInfo/E6-E7.png"
            textId.text = TranslateStr.warningInfoStr_0xE6
            textId.color = "#717171"
            break
        case 0xE7:
            imageId.source = "qrc:/images10_25/warningInfo/E6-E7.png"
            textId.text = TranslateStr.warningInfoStr_0xE7
            textId.color = "#717171"
            break
        case 0xE8:
            imageId.source = "qrc:/images10_25/warningInfo/C1-C2-E0-E8-E9-154-155-162.png"
            textId.text = TranslateStr.warningInfoStr_0xE8
            textId.color = "#717171"
            break
        case 0xE9:
            imageId.source = "qrc:/images10_25/warningInfo/C1-C2-E0-E8-E9-154-155-162.png"
            textId.text = TranslateStr.warningInfoStr_0xE9
            textId.color = "#717171"
            break
        case 0xEA:
            imageId.source = "qrc:/images10_25/warningInfo/C1-C2-E0-E8-E9-154-155-162.png"
            textId.text = TranslateStr.warningInfoStr_0xEA
            textId.color = "#717171"
            break
        case 0xEF:
            imageId.source = "qrc:/images10_25/warningInfo/EF.png"
            textId.text = TranslateStr.warningInfoStr_0xEF
            textId.color = "#717171"
            break
        case 0xF2:
            imageId.source = "qrc:/images10_25/warningInfo/F2-120.png"
            textId.text = TranslateStr.warningInfoStr_0xF2
            textId.color = "#717171"
            break
        case 0xF3:
            imageId.source = DataSource.language === 0x02?"qrc:/images10_25/warningInfo/F3_EN.png":"qrc:/images10_25/warningInfo/F3.png"
            textId.text =TranslateStr.warningInfoStr_0xF3
            textId.color = "#717171"
            break
        case 0xF4:
            imageId.source = DataSource.language === 0x02?"qrc:/images10_25/warningInfo/F3_EN.png":"qrc:/images10_25/warningInfo/F3.png"
            textId.text = TranslateStr.warningInfoStr_0xF4
            textId.color = "#717171"
            break
        case 0xF5:
            imageId.source = DataSource.language === 0x02?"qrc:/images10_25/warningInfo/F3_EN.png":"qrc:/images10_25/warningInfo/F3.png"
            textId.text = TranslateStr.warningInfoStr_0xF5
            textId.color = "#717171"
            break
        case 0xF6:
            imageId.source = DataSource.language === 0x02?"qrc:/images10_25/warningInfo/F6_EN.png":"qrc:/images10_25/warningInfo/F6.png"
            textId.text = TranslateStr.warningInfoStr_0xF6
            textId.color = "#717171"
            break
        case 0xF7:
            imageId.source = DataSource.language === 0x02?"qrc:/images10_25/warningInfo/F7_EN.png":"qrc:/images10_25/warningInfo/F7.png"
            textId.text = TranslateStr.warningInfoStr_0xF7
            textId.color = "#717171"
            break
        case 0xF8:
            mLightModeLXH = 0x1
            imageId.source = "qrc:/images10_25/warningInfo/F8-F9.png"
            textId.text = TranslateStr.warningInfoStr_0xF8
            textId.color = "#717171"
            break
        case 0xF9:
            mLightModeLXH = 0x1
            imageId.source = "qrc:/images10_25/warningInfo/F8-F9.png"
            textId.text = TranslateStr.warningInfoStr_0xF9
            textId.color = "#717171"
            break
        case 0xFA:
            mLightModeLXH = 0x2
            imageId.source = "qrc:/images10_25/warningInfo/FA-FD.png"
            textId.text = TranslateStr.warningInfoStr_0xFA
            textId.color = "#717171"
            break
        case 0xFB:
            mLightModeLXH = 0x3
            imageId.source = "qrc:/images10_25/warningInfo/FB-FE.png"
            textId.text = TranslateStr.warningInfoStr_0xFB
            textId.color = "#717171"
            break
        case 0xFC:
            mLightModeLXH = 0x0
            imageId.source = "qrc:/images10_25/warningInfo/FC.png"
            textId.text = TranslateStr.warningInfoStr_0xFC
            textId.color = "#717171"
            break
        case 0xFD:
            mLightModeLXH = 0x2
            imageId.source = "qrc:/images10_25/warningInfo/FA-FD.png"
            textId.text = TranslateStr.warningInfoStr_0xFD
            textId.color = "#717171"
            break
        case 0xFE:
            mLightModeLXH = 0x3
            imageId.source = "qrc:/images10_25/warningInfo/FB-FE.png"
            textId.text = TranslateStr.warningInfoStr_0xFE
            textId.color = "#717171"
            break
        case 0xFF:
            imageId.source = "qrc:/images10_25/warningInfo/FF.png"
            textId.text = TranslateStr.warningInfoStr_0xFF
            textId.color = "#717171"
            break
        case 0x100:
            imageId.source = "qrc:/images10_25/warningInfo/100.png"
            textId.text = TranslateStr.warningInfoStr_0x100
            textId.color = "#717171"
            break
        case 0x101:
            imageId.source = "qrc:/images10_25/warningInfo/101.png"
            textId.text = TranslateStr.warningInfoStr_0x101
            textId.color = "#717171"
            break
        case 0x102:
            imageId.source = "qrc:/images10_25/warningInfo/102.png"
            textId.text = TranslateStr.warningInfoStr_0x102
            textId.color = "#717171"
            break
        case 0x103:
            imageId.source = "qrc:/images10_25/warningInfo/103.png"
            textId.text = TranslateStr.warningInfoStr_0x103
            textId.color = "#717171"
            break
        case 0x104:
            imageId.source = "qrc:/images10_25/warningInfo/104.png"
            textId.text = TranslateStr.warningInfoStr_0x104
            textId.color = "#717171"
            break
        case 0x105:
            imageId.source = "qrc:/images10_25/warningInfo/105.png"
            textId.text = TranslateStr.warningInfoStr_0x105
            textId.color = "#717171"
            break
        case 0x106:
            imageId.source = "qrc:/images10_25/warningInfo/106.png"
            textId.text = TranslateStr.warningInfoStr_0x106
            textId.color = "#717171"
            break
        case 0x107:
            imageId.source = "qrc:/images10_25/warningInfo/107.png"
            textId.text = TranslateStr.warningInfoStr_0x107
            textId.color = "#717171"
            break
        case 0x108:
            imageId.source = "qrc:/images10_25/warningInfo/108-123.png"
            textId.text = TranslateStr.warningInfoStr_0x108
            textId.color = "#717171"
            break
        case 0x109:
            imageId.source = "qrc:/images10_25/warningInfo/109-124.png"
            textId.text = TranslateStr.warningInfoStr_0x109
            textId.color = "#717171"
            break
        case 0x10A:
            imageId.source = "qrc:/images10_25/warningInfo/10A-125.png"
            textId.text = TranslateStr.warningInfoStr_0x10A
            textId.color = "#717171"
            break
        case 0x10B:
            imageId.source = "qrc:/images10_25/warningInfo/10B-126.png"
            textId.text = TranslateStr.warningInfoStr_0x10B
            textId.color = "#717171"
            break
        case 0x10C:
            imageId.source ="qrc:/images10_25/warningInfo/10C.png"
            textId.text = TranslateStr.warningInfoStr_0x10C
            textId.color = "#717171"
            break
        case 0x10D:
            imageId.source = "qrc:/images10_25/warningInfo/10D.png"
            textId.text = TranslateStr.warningInfoStr_0x10D
            textId.color = "#717171"
            break
        case 0x10E:
            imageId.source = "qrc:/images10_25/warningInfo/10E.png"
            textId.text = TranslateStr.warningInfoStr_0x10E
            textId.color = "#717171"
            break
        case 0x10F:
            imageId.source = "qrc:/images10_25/warningInfo/10F.png"
            textId.text = TranslateStr.warningInfoStr_0x10F
            textId.color = "#717171"
            break
        case 0x110:
            imageId.source = "qrc:/images10_25/warningInfo/110.png"
            textId.text = TranslateStr.warningInfoStr_0x110
            textId.color = "#717171"
            break
        case 0x111:
            imageId.source = "qrc:/images10_25/warningInfo/111.png"
            textId.text = TranslateStr.warningInfoStr_0x111
            textId.color = "#717171"
            break
        case 0x112:
            imageId.source = "qrc:/images10_25/warningInfo/112.png"
            textId.text = TranslateStr.warningInfoStr_0x112
            textId.color = "#717171"
            break
        case 0x113:
            imageId.source = "qrc:/images10_25/warningInfo/113.png"
            textId.text = TranslateStr.warningInfoStr_0x113
            textId.color = "#717171"
            break
        case 0x114:
            imageId.source = "qrc:/images10_25/warningInfo/C1-C2-E0-E8-E9-154-155-162.png"
            textId.text = TranslateStr.warningInfoStr_0x114
            textId.color = "#717171"
            break
        case 0x115:
            imageId.source = "qrc:/images10_25/warningInfo/115.png"
            textId.text = TranslateStr.warningInfoStr_0x115
            textId.color = "#717171"
            break
        case 0x116:
            imageId.source = "qrc:/images10_25/warningInfo/C1-C2-E0-E8-E9-154-155-162.png"
            textId.text = TranslateStr.warningInfoStr_0x116
            textId.color = "#717171"
            break
        case 0x118:
            imageId.source =  "qrc:/images10_25/warningInfo/118.png"
            textId.text = TranslateStr.warningInfoStr_0x118
            textId.color = "#717171"
            break
        case 0x11A:
            imageId.source =  "qrc:/images10_25/warningInfo/0x11A.png"
            textId.text = TranslateStr.warningInfoStr_0x11A
            textId.color = "#717171"
            break
        case 0x11B:
            imageId.source =  "qrc:/images10_25/warningInfo/0x11B.png"
            textId.text = TranslateStr.warningInfoStr_0x11B
            textId.color = "#717171"
            break
        case 0x11C:
            imageId.source =  "qrc:/images10_25/warningInfo/0x11C.png"
            textId.text = TranslateStr.warningInfoStr_0x11C_1
            textId.color = "#717171"
            break
        case 0x120:
            imageId.source = "qrc:/images10_25/warningInfo/F2-120.png"
            textId.text = TranslateStr.warningInfoStr_0x120
            textId.color = "#717171"
            break
        case 0x121:
            imageId.source = "qrc:/images10_25/warningInfo/C1-C2-E0-E8-E9-154-155-162.png"
            textId.text = TranslateStr.warningInfoStr_0x121
            textId.color = "#717171"
            break
        case 0x122:
            imageId.source = DataSource.carBodyType === 0x01 ? "qrc:/images10_25/warningInfo/21-28-122_SUV.png" : "qrc:/images10_25/warningInfo/21-28-122_Car.png"
            textId.text = TranslateStr.warningInfoStr_0x122
            textId.color = "red"
            break
        case 0x123:
            imageId.source = "qrc:/images10_25/warningInfo/108-123.png"
            textId.text = TranslateStr.warningInfoStr_0x123
            textId.color = "#717171"
            break
        case 0x124:
            imageId.source = "qrc:/images10_25/warningInfo/109-124.png"
            textId.text = TranslateStr.warningInfoStr_0x124
            textId.color = "#717171"
            break
        case 0x125:
            imageId.source = "qrc:/images10_25/warningInfo/10A-125.png"
            textId.text = TranslateStr.warningInfoStr_0x125
            textId.color = "#717171"
            break
        case 0x126:
            imageId.source = "qrc:/images10_25/warningInfo/10B-126.png"
            textId.text = TranslateStr.warningInfoStr_0x126
            textId.color = "#717171"
            break
        case 0x12D:
            imageId.source = "qrc:/images10_25/warningInfo/C1-C2-E0-E8-E9-154-155-162.png"
            textId.text = TranslateStr.warningInfoStr_0x12D
            textId.color = "#717171"
            break
        case 0x12E:
            imageId.source = "qrc:/images10_25/warningInfo/C1-C2-E0-E8-E9-154-155-162.png"
            textId.text = TranslateStr.warningInfoStr_0x12E
            textId.color = "#717171"
            break
        case 0x12F:
            imageId.source = "qrc:/images10_25/warningInfo/12F.png"
            textId.text = TranslateStr.warningInfoStr_0x12F
            textId.color = "#717171"
            break
        case 0x130:
            imageId.source = "qrc:/images10_25/warningInfo/130.png"
            textId.text = TranslateStr.warningInfoStr_0x130
            textId.color = "#717171"
            break
        case 0x140:
            imageId.source = "qrc:/images10_25/warningInfo/140-14C-142.png"
            textId.text = TranslateStr.warningInfoStr_0x140
            textId.color = "#717171"
            break
        case 0x141:
            imageId.source = "qrc:/images10_25/warningInfo/141.png"
            textId.text = TranslateStr.warningInfoStr_0x141
            textId.color = "#717171"
            break
        case 0x142:
            imageId.source = "qrc:/images10_25/warningInfo/140-14C-142.png"
            textId.text = TranslateStr.warningInfoStr_0x142
            textId.color = "#717171"
            break
        case 0x143:
            imageId.source = "qrc:/images10_25/warningInfo/141.png"
            textId.text = TranslateStr.warningInfoStr_0x143
            textId.color = "#717171"
            break
        case 0x144:
            imageId.source = "qrc:/images10_25/warningInfo/141.png"
            textId.text = TranslateStr.warningInfoStr_0x144
            textId.color = "#717171"
            break
        case 0x145:
            imageId.source = "qrc:/images10_25/warningInfo/141.png"
            textId.text = TranslateStr.warningInfoStr_0x145
            textId.color = "#717171"
            break
        case 0x146:
            imageId.source = "qrc:/images10_25/warningInfo/141.png"
            textId.text = TranslateStr.warningInfoStr_0x146
            textId.color = "#717171"
            break
        case 0x147:
            imageId.source = "qrc:/images10_25/warningInfo/141.png"
            textId.text = TranslateStr.warningInfoStr_0x147
            textId.color = "#717171"
            break
        case 0x148:
            imageId.source = "qrc:/images10_25/warningInfo/141.png"
            textId.text = TranslateStr.warningInfoStr_0x148
            textId.color = "#717171"
            break
        case 0x149:
            imageId.source = "qrc:/images10_25/warningInfo/141.png"
            textId.text = TranslateStr.warningInfoStr_0x149
            textId.color = "#717171"
            break
        case 0x14A:
            imageId.source = "qrc:/images10_25/warningInfo/14D-14E-14A.png"
            textId.text = TranslateStr.warningInfoStr_0x14A
            textId.color = "#f18d00"
            break
        case 0x14B:
            imageId.source = "qrc:/images10_25/warningInfo/141.png"
            textId.text = TranslateStr.warningInfoStr_0x14B
            textId.color = "#717171"
            break
        case 0x14C:
            imageId.source = "qrc:/images10_25/warningInfo/140-14C-142.png"
            textId.text = TranslateStr.warningInfoStr_0x14C
            textId.color = "#717171"
            break
        case 0x14D:
            imageId.source = "qrc:/images10_25/warningInfo/14D-14E-14A.png"
            textId.text = TranslateStr.warningInfoStr_0x14D
            textId.color = "#f18d00"
            break
        case 0x14E:
            imageId.source = "qrc:/images10_25/warningInfo/14D-14E-14A.png"
            textId.text = TranslateStr.warningInfoStr_0x14E
            textId.color = "#f18d00"
            break
        case 0x14F:
            imageId.source = "qrc:/images10_25/warningInfo/140-14C-142.png"
            textId.text = TranslateStr.warningInfoStr_0x14F
            textId.color = "#717171"
            break
        case 0x150:
            imageId.source = "qrc:/images10_25/warningInfo/150.png"
            textId.text = TranslateStr.warningInfoStr_0x150
            textId.color = "#f18d00"
            break
        case 0x151:
            imageId.source = "qrc:/images10_25/warningInfo/1A.png"
            textId.text = TranslateStr.warningInfoStr_0x151
            textId.color = "#f18d00"
            break
        case 0x152:
            imageId.source = "qrc:/images10_25/warningInfo/1A.png"
            textId.text = TranslateStr.warningInfoStr_0x152
            textId.color = "#f18d00"
            break
        case 0x153:
            imageId.source = "qrc:/images10_25/warningInfo/1A.png"
            textId.text = TranslateStr.warningInfoStr_0x153
            textId.color = "#f18d00"
            break
        case 0x154:
            imageId.source = "qrc:/images10_25/warningInfo/C1-C2-E0-E8-E9-154-155-162.png"
            textId.text = TranslateStr.warningInfoStr_0x154
            textId.color = "#717171"
            break
        case 0x155:
            imageId.source = "qrc:/images10_25/warningInfo/C1-C2-E0-E8-E9-154-155-162.png"
            textId.text = TranslateStr.warningInfoStr_0x155
            textId.color = "#717171"
            break
        case 0x15B:
            imageId.source = "qrc:/images10_25/warningInfo/15B.png"
            dmsCentralImage.source = "qrc:/images10_25/warningInfo/1A1.png"
            textId.text = TranslateStr.warningInfoStr_0x15B
            textId.color = "#3ea8d4"
            break
        case 0x15E:
            imageId.source = "qrc:/images10_25/warningInfo/15E-15F.png"
            textId.text = TranslateStr.warningInfoStr_0x15E
            textId.color = "#f18d00"
            break
        case 0x162:
            imageId.source = "qrc:/images10_25/warningInfo/C1-C2-E0-E8-E9-154-155-162.png"
            textId.text = TranslateStr.warningInfoStr_0x162
            textId.color = "#717171"
            break
        case 0x163:
            imageId.source = "qrc:/images10_25/warningInfo/163.png"
            textId.text = TranslateStr.warningInfoStr_0x163
            textId.color = "#717171"
            break
        case 0x164:
            imageId.source = "qrc:/images10_25/warningInfo/164.png"
            textId.text = TranslateStr.warningInfoStr_0x164
            textId.color = "#717171"
            break
        case 0x168:
            imageId.source = "qrc:/images10_25/warningInfo/3F.png"
            textId.text = TranslateStr.warningInfoStr_0x168
            textId.color = "#f18d00"
            break
        case 0x169:
            imageId.source = "qrc:/images10_25/warningInfo/169.png"
            textId.text = TranslateStr.warningInfoStr_0x169
            textId.color = "#717171"
            break
        case 0x16A:
            imageId.source = "qrc:/images10_25/warningInfo/16A.png"
            textId.text = TranslateStr.warningInfoStr_0x16A
            textId.color = "#717171"
            break
        case 0x16E:
            imageId.source = "qrc:/images10_25/warningInfo/16E.png"
            textId.text = TranslateStr.warningInfoStr_0x16E
            textId.color = "#717171"
            break
        case 0x16F:
            imageId.source = "qrc:/images10_25/warningInfo/C1-C2-E0-E8-E9-154-155-162.png"
            textId.text = TranslateStr.warningInfoStr_0x16F
            textId.color = "#717171"
            break
        case 0x170:
            imageId.source = "qrc:/images10_25/warningInfo/1A.png"
            textId.text = TranslateStr.warningInfoStr_0x170
            textId.color = "#f18d00"
            break
        case 0x171:
            imageId.source = "qrc:/images10_25/warningInfo/171-20A.png"
            textId.text = TranslateStr.warningInfoStr_0x171
            textId.color = "#f18d00"
            break
        case 0x172:
            if (DataSource.language === 0x01) {
                imageId.source = "qrc:/images10_25/warningInfo/172.png"
            } else {
                imageId.source = "qrc:/images10_25/warningInfo/172_EN.png"
            }
            textId.text = TranslateStr.warningInfoStr_0x172
            textId.color = "#717171"
            break
        case 0x174:
            imageId.source = "qrc:/images10_25/warningInfo/174.png"
            textId.text = TranslateStr.warningInfoStr_0x174
            textId.color = "#717171"
            break
        case 0x176:
            imageId.source = "qrc:/images10_25/warningInfo/176.png"
            textId.text = TranslateStr.warningInfoStr_0x176
            textId.color = "#717171"
            break
        case 0x177:
            imageId.source = "qrc:/images10_25/warningInfo/60.png"
            textId.text = TranslateStr.warningInfoStr_0x177
            textId.color = "red"
            break
        case 0x178:
            imageId.source = "qrc:/images10_25/warningInfo/178-1A0.png"
            textId.text = TranslateStr.warningInfoStr_0x178
            textId.color = "#f18d00"
            break
        case 0x179:
            imageId.source = "qrc:/images10_25/warningInfo/179-180-181-182-183-184-185-186.png"
            textId.text = TranslateStr.warningInfoStr_0x179
            textId.color = "#f18d00"
            break
        case 0x180:
            imageId.source = "qrc:/images10_25/warningInfo/179-180-181-182-183-184-185-186.png"
            textId.text = TranslateStr.warningInfoStr_0x180
            textId.color = "#f18d00"
            break
        case 0x181:
            imageId.source = "qrc:/images10_25/warningInfo/179-180-181-182-183-184-185-186.png"
            textId.text = TranslateStr.warningInfoStr_0x181
            textId.color = "#f18d00"
            break
        case 0x182:
            imageId.source = "qrc:/images10_25/warningInfo/179-180-181-182-183-184-185-186.png"
            textId.text = TranslateStr.warningInfoStr_0x182
            textId.color = "#f18d00"
            break
        case 0x183:
            imageId.source = "qrc:/images10_25/warningInfo/179-180-181-182-183-184-185-186.png"
            textId.text = TranslateStr.warningInfoStr_0x183
            textId.color = "#f18d00"
            break
        case 0x184:
            imageId.source = "qrc:/images10_25/warningInfo/179-180-181-182-183-184-185-186.png"
            textId.text = TranslateStr.warningInfoStr_0x184
            textId.color = "#f18d00"
            break
        case 0x185:
            imageId.source = "qrc:/images10_25/warningInfo/179-180-181-182-183-184-185-186.png"
            textId.text = TranslateStr.warningInfoStr_0x185
            textId.color = "#f18d00"
            break
        case 0x186:
            imageId.source = "qrc:/images10_25/warningInfo/179-180-181-182-183-184-185-186.png"
            textId.text = TranslateStr.warningInfoStr_0x186
            textId.color = "#f18d00"
            break
        case 0x192:
            imageId.source = "qrc:/images10_25/warningInfo/C1-C2-E0-E8-E9-154-155-162.png"
            textId.text = TranslateStr.warningInfoStr_0x192
            textId.color = "#717171"
            break
        case 0x193:
            imageId.source = "qrc:/images10_25/warningInfo/C1-C2-E0-E8-E9-154-155-162.png"
            textId.text = TranslateStr.warningInfoStr_0x193
            textId.color = "#717171"
            break
        case 0x194:
            //            imageId.source = DataSource.powerGear === 0x03?"qrc:/images10_25/warningInfo/194-19C.png":""
            //            textId.text = DataSource.powerGear === 0x03?TranslateStr.warningInfoStr_0x194:""
            //            textId.color = DataSource.powerGear === 0x03?"#717171":""
            //            dmsTitleInfo.text = TranslateStr.warnigInfoStr_dmsTitle1
            //            dmsTitleInfo.color = "#3ea8d4"
            imageId.source = "qrc:/images10_25/warningInfo/15B.png"
            textId.text = TranslateStr.warningInfoStr_0x194
            textId.color = "#3ea8d4"
            break
        case 0x196:
            //            imageId.source = DataSource.powerGear === 0x03?"qrc:/images10_25/warningInfo/196-197.png":""
            //            textId.text = DataSource.powerGear === 0x03?TranslateStr.warningInfoStr_0x196:""
            //            textId.color = DataSource.powerGear === 0x03?"#717171":""
            //            dmsTitleInfo.text = TranslateStr.warnigInfoStr_dmsTitle3
            //            dmsTitleInfo.color = "#3ea8d4"
            imageId.source = "qrc:/images10_25/warningInfo/15B.png"
            dmsCentralImage.source = "qrc:/images10_25/warningInfo/196-197.png"
            textId.text = TranslateStr.warningInfoStr_0x196
            textId.color = "#3ea8d4"
            break
        case 0x197:
            //            imageId.source = DataSource.powerGear === 0x03?"qrc:/images10_25/warningInfo/196-197.png":""
            //            textId.text = DataSource.powerGear === 0x03?(DataSource.dmsUserName+TranslateStr.warningInfoStr_0x197):""
            //            textId.color = DataSource.powerGear === 0x03?"#717171":""
            //            dmsTitleInfo.text = TranslateStr.warnigInfoStr_dmsTitle4
            //            dmsTitleInfo.color = "#3ea8d4"
            imageId.source = "qrc:/images10_25/warningInfo/15B.png"
            dmsCentralImage.source = "qrc:/images10_25/warningInfo/196-197.png"
            textId.text = DataSource.dmsUserName + TranslateStr.warningInfoStr_0x197
            textId.color = "#3ea8d4"
            break
        case 0x19D:
            imageId.source = "qrc:/images10_25/warningInfo/19D.png"
            textId.text = TranslateStr.warningInfoStr_0x19D_1
            textId.color = "#F18D00"
            break
        case 0x19F:
            imageId.source = "qrc:/images10_25/warningInfo/19F.png"
            textId.text = TranslateStr.warningInfoStr_0x19F
            textId.color = "red"
            break
        case 0x1A0:
            imageId.source = "qrc:/images10_25/warningInfo/178-1A0.png"
            textId.text = TranslateStr.warningInfoStr_0x1A0
            textId.color = "#f18d00"
            break
        case 0x1A1:
            //            imageId.source = DataSource.powerGear === 0x03?"qrc:/images10_25/warningInfo/1A1.png":""
            //            textId.text = DataSource.powerGear === 0x03?TranslateStr.warningInfoStr_0x1A1:""
            //            textId.color = DataSource.powerGear === 0x03?"#717171":""
            //            dmsTitleInfo.text = TranslateStr.warnigInfoStr_dmsTitle6
            //            dmsTitleInfo.color = "red"
            imageId.source = "qrc:/images10_25/warningInfo/15B.png"
            dmsCentralImage.source = "qrc:/images10_25/warningInfo/1A1.png"
            textId.text = TranslateStr.warningInfoStr_0x1A1
            textId.color = "red"
            break
        case 0x1A3:
            imageId.source = "qrc:/images10_25/warningInfo/1A3.png"
            textId.text = TranslateStr.warningInfoStr_0x1A3
            textId.color = "#717171"
            break
        case 0x1A5:
            imageId.source = "qrc:/images10_25/warningInfo/1A5.png"
            textId.text = TranslateStr.warningInfoStr_0x1A5
            textId.color = "#717171"
            break
        case 0x1AA:
            imageId.source = "qrc:/images10_25/warningInfo/1AA.png"
            textId.text = TranslateStr.warningInfoStr_0x1AA
            textId.color = "#f18d00"
            break
        case 0x1AB:
            imageId.source = "qrc:/images10_25/warningInfo/BF.png"
            textId.text = TranslateStr.warningInfoStr_0x1AB
            textId.color = "#717171"
            break
        case 0x1AC:
            imageId.source = "qrc:/images10_25/warningInfo/BF.png"
            textId.text = TranslateStr.warningInfoStr_0x1AC
            textId.color = "#717171"
            break
        case 0x1B1:
            imageId.source = "qrc:/images10_25/warningInfo/20B.png"
            textId.text = TranslateStr.warningInfoStr_0x1B1
            textId.color = "#717171"
            break
        case 0x1B2:
            imageId.source = "qrc:/images10_25/warningInfo/0x1B2.png"
            textId.text = TranslateStr.warningInfoStr_0x1B2
            textId.color = "#f18d00"
            break
        case 0x1B3:
            imageId.source = "qrc:/images10_25/warningInfo/0x1B3.png"
            textId.text = TranslateStr.warningInfoStr_0x1B3
            textId.color = "#717171"
            break
        case 0x1C4:
            imageId.source = "qrc:/images10_25/warningInfo/0x1C4.png"
            textId.text = TranslateStr.warningInfoStr_0x1C4
            textId.color = "#717171"
            break
        case 0x1DF:
            imageId.source = DataSource.language === 0x02 ? "qrc:/images10_25/warningInfo/1DF_EN.png"
                                                          : "qrc:/images10_25/warningInfo/1DF.png"
            textId.text = TranslateStr.warningInfoStr_0x1DF
            textId.color = "#717171"
            break
        case 0x1E0:
            imageId.source = "qrc:/images10_25/warningInfo/0x1E0.png"
            textId.text = TranslateStr.warningInfoStr_0x1E0
            textId.color = "#717171"
            break
        case 0x20A:
            imageId.source = "qrc:/images10_25/warningInfo/171-20A.png"
            textId.text = TranslateStr.warningInfoStr_0x20A
            textId.color = "#f18d00"
            break
        case 0x20B:
            imageId.source = "qrc:/images10_25/warningInfo/20B.png"
            textId.text = TranslateStr.warningInfoStr_0x20B
            textId.color = "#717171"
            break
        case 0x215:
            imageId.source = "qrc:/images10_25/warningInfo/0x215.png"
            textId.text = TranslateStr.warningInfoStr_0x215
            textId.color = "#717171"
            break
        case 0x216:
            imageId.source = "qrc:/images10_25/warningInfo/216.png"
            textId.text = TranslateStr.warningInfoStr_0x216
            textId.color = "#f18d00"
            break
        case 0x221:
            imageId.source = "qrc:/images10_25/warningInfo/0x221.png"
            textId.text = TranslateStr.warningInfoStr_0x221
            textId.color = "#717171"
            break
        case 0x22A:
            imageId.source = "qrc:/images10_25/warningInfo/0x22A.png"
            textId.text = TranslateStr.warningInfoStr_0x22A
            textId.color = "#717171"
            break
        case 0x232:
             imageId.source = "qrc:/images10_25/warningInfo/0x232.png"
             textId.text = TranslateStr.warningInfoStr_0x232
             textId.color = "#f18d00"
             break
         case 0x233:
             imageId.source = "qrc:/images10_25/warningInfo/0x233.png"
             textId.text = TranslateStr.warningInfoStr_0x233
             textId.color = "#f18d00"
             break
         case 0x235:
             imageId.source = "qrc:/images10_25/warningInfo/0x235.png"
             textId.text = TranslateStr.warningInfoStr_0x235
             textId.color = "#f18d00"
             break
         case 0x236:
             imageId.source = DataSource.carBodyType === 0x01 ? "qrc:/images10_25/warningInfo/0x236-SUV.png" : "qrc:/images10_25/warningInfo/0x236-SEDAN.png"
             textId.text = TranslateStr.warningInfoStr_0x236
             textId.color = "#717171"
             break
         case 0x237:
             imageId.source = "qrc:/images10_25/warningInfo/0x237.png"
             textId.text = TranslateStr.warningInfoStr_0x237
             textId.color = "#717171"
             break
         case 0x239:
             imageId.source = DataSource.language === 0x01 ? "qrc:/images10_25/warningInfo/0x239.png" : "qrc:/images10_25/warningInfo/0x239-en.png"
             textId.text = TranslateStr.warningInfoStr_0x239
             textId.color = "#717171"
             break
         case 0x23A:
             imageId.source = "qrc:/images10_25/warningInfo/0x23A.png"
             textId.text = TranslateStr.warningInfoStr_0x23A
             textId.color = "#717171"
             break
         case 0x23C:
             imageId.source = DataSource.carBodyType === 0x01 ? "qrc:/images10_25/warningInfo/0x23C-SUV.png" : "qrc:/images10_25/warningInfo/0x23C-SEDAN.png"
             textId.text = TranslateStr.warningInfoStr_0x23C
             textId.color = "#717171"
             break
         case 0x23D:
             imageId.source = DataSource.carBodyType === 0x01 ? "qrc:/images10_25/warningInfo/0x23D-SUV.png" : "qrc:/images10_25/warningInfo/0x23D-SEDAN.png"
             textId.text = TranslateStr.warningInfoStr_0x23D
             textId.color = "#717171"
             break
        case 0x243:
            imageId.source = "qrc:/images10_25/warningInfo/0x243.png"
            textId.text = TranslateStr.warningInfoStr_0x243
            textId.color = "red"
            break
        default:
            imageId.source = ""
            textId.text = ""
            textId.color = ""
            break
        }
    }

    function updateWarningInfoId2() {
        switch (DataSource.commonWarningInfoId) {
        case 0x3A:
            switch (DataSource.carNameType) {
            case 0x0B:
            case 0x0C:
                imageId2.source = "qrc:/images10_25/warningInfo/3A_HA2E_HA2H.png"
                break
            default:
                imageId2.source = "qrc:/images10_25/warningInfo/3A.png"
                break
            }
            textId2.text = TranslateStr.warningInfoStr_0x3A
            textId2.color = "red"
            break
        case 0x3B:
            switch (DataSource.carNameType) {
            case 0x0B:
            case 0x0C:
                imageId2.source = "qrc:/images10_25/warningInfo/3B_HA2E_HA2H.png"
                break
            default:
                imageId2.source = "qrc:/images10_25/warningInfo/3B.png"
                break
            }
            textId2.text = TranslateStr.warningInfoStr_0x3B
            textId2.color = "red"
            break
        case 0x3C:
            switch (DataSource.carNameType) {
            case 0x0B:
            case 0x0C:
                imageId2.source = "qrc:/images10_25/warningInfo/3A_HA2E_HA2H.png"
                break
            default:
                imageId2.source = "qrc:/images10_25/warningInfo/3A.png"
                break
            }
            textId2.text = TranslateStr.warningInfoStr_0x3C
            textId2.color = "red"
            break
        case 0x117:
            switch (DataSource.carNameType) {
            case 0x0B:
            case 0x0C:
                imageId2.source = "qrc:/images10_25/warningInfo/117_HA2E_HA2H.png"
                break
            default:
                imageId2.source = "qrc:/images10_25/warningInfo/117"
                break
            }
            textId2.text = TranslateStr.warningInfoStr_0x117
            textId2.color = DataSource.dayNightMode === 0x01 ? "black" : "white"
            break
        default:
            imageId2.source = ""
            textId2.text = ""
            textId2.color = ""
            break
        }
    }
}
