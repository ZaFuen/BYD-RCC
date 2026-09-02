import QtQuick 2.15
import com.byd.DataSource 1.0
import com.byd.CenterChild 1.0
import QtQuick.Layouts 1.1
import com.byd.WarningLight 1.0
import "qrc:/common/singleton"

CenterChild{
    id:accelerationRootId
    anchors.fill: parent
    visible: true
    property int roadAnimPic: 0
    property int picIndex: 0
    Component.onCompleted: {
        accelerationRootId.opacity = 0
        timeDisplayId.currentTime = currentDateTime()
        onSpeedUpLoggerDisplayQuery()
        updateSpeedUpTipText()
        accelerationInterfaceEnterAnimId.start()
    }
    PropertyAnimation{
        id:accelerationInterfaceEnterAnimId
        target: accelerationRootId
        property: "opacity"
        from:0
        to:1
        duration: 500
    }

    Image {
        id: backGroundImg
        visible: true
        source: {
            DataSource.dayNightMode === 0x01?
                        "qrc:/images10_25/display_always/day/bg.ktx":"qrc:/images10_25/display_always/night/bg.ktx"}
    }

    Image {
        id:sportModeImg
        anchors.horizontalCenter: parent.horizontalCenter
        y:0
        source:"qrc:/images10_25/display_always/eco_sport_anim/sport.png"
    }

    //城市
    Image {
        id: bgCityImageId
        x:640
        y:142
        cache: false
        visible: DataSource.dayNightMode === 0x01 ?true :false
        source: DataSource.dayNightMode === 0x02?"qrc:/images10_25/display_always/night/bg_city.png":"qrc:/images10_25/display_always/day/bg_city.png"
    }

    Image {
        id: headLineId
        y:75
        anchors.horizontalCenter: parent.horizontalCenter
        source:"qrc:/images10_25/display_always/headLine.png"
    }
    Item {
        id: headInfoId
        anchors.horizontalCenter: parent.horizontalCenter
        width: 1920
        height: 65

        //档位
        WarningLight{
            id: gearModeId
            anchors.horizontalCenter: parent.horizontalCenter
            anchors.bottom: parent.bottom
            displayState:DataSource.gearMode > 0?DataSource.gearDisplayState:0
            Image {
                id: gearModeImageId
                anchors.horizontalCenter: parent.horizontalCenter
                anchors.bottom: parent.bottom
                cache: false
                source:{
                    if(DataSource.gearMode === 1){
                        DataSource.dayNightMode === 0x02?"qrc:/images10_25/display_always/night/P.png":"qrc:/images10_25/display_always/day/P.png"
                    }else if(DataSource.gearMode === 2){
                        DataSource.dayNightMode === 0x02?"qrc:/images10_25/display_always/night/R.png":"qrc:/images10_25/display_always/day/R.png"
                    }else if(DataSource.gearMode === 3){
                        source: DataSource.dayNightMode === 0x02?"qrc:/images10_25/display_always/night/N.png":"qrc:/images10_25/display_always/day/N.png"
                    }else if(DataSource.gearMode === 4){
                        source: DataSource.dayNightMode === 0x02?"qrc:/images10_25/display_always/night/D.png":"qrc:/images10_25/display_always/day/D.png"
                    }else if(DataSource.gearMode === 5){
                        source: DataSource.dayNightMode === 0x02?"qrc:/images10_25/display_always/night/M.png":"qrc:/images10_25/display_always/day/M.png"
                    }else if(DataSource.gearMode === 6){
                        source: DataSource.dayNightMode === 0x02?"qrc:/images10_25/display_always/night/S.png":"qrc:/images10_25/display_always/day/S.png"
                    }else{
                        ""
                    }
                }
            }

            Text {
                id: realGearTextId
                anchors.left: gearModeImageId.right
                anchors.leftMargin: 1
                anchors.bottom: parent.bottom
                anchors.bottomMargin: -8
                font.pixelSize: 46
                text: DataSource.realGear > 0 ? DataSource.realGear : ""
                color: DataSource.dayNightMode === 0x02 ?"#ffffff":"#333333"
            }
        }

        //标准回馈
        WarningLight{
            id:feedbackLight
            width: 205
            height: 28
            anchors.right: hevWarningLightId.right
            anchors.bottom:hevWarningLightId.bottom
            visible: ((DataSource.vehicleType === DataSource.CAR_TYPE_EV)&&(DataSource.energyFeedBackLight === 1||DataSource.energyFeedBackLight === 2))?true:false

            Text {
                font.bold:rootItemId.jiacu === 1
                id: feedbackImg
                text: DataSource.energyFeedBackLight === 1 ? (DataSource.language === 0x01 ? "标准回馈":"Standard") : (DataSource.language === 0x01 ? "较大回馈":"Larger")
                font.pixelSize: DataSource.language !== 0x01 ? 41 : 32
                color: "#17975f"
                font.family: rootItemId.ziti
                anchors.verticalCenter: parent.verticalCenter
                anchors.verticalCenterOffset: DataSource.language !== 0x01 ? 2 : -4
                anchors.right: parent.right
            }
        }
        //ECO
        WarningLight{
            id: ecoWarningLightId
            x: 1029
            y: 38
            width: 95
            height: 28
            visible: DataSource.modeLight === 0x01?true:false

            Text {
                font.bold:rootItemId.jiacu === 1
                id: ecoWarningLightImageId
                text: "ECO"
                font.pixelSize: 48
                color: "#17975f"
                font.family: rootItemId.ziti
                anchors.verticalCenter: parent.verticalCenter
                anchors.left : parent.left
            }
        }
        //SPORT
        WarningLight{
            id: sportWarningLightId
            width: 205
            height: 28
            anchors.left: ecoWarningLightId.left
            anchors.bottom:ecoWarningLightId.bottom
            visible: DataSource.modeLight === 0x02?true:false

            Text {
                font.bold:rootItemId.jiacu === 1
                id: sportWarningLightImageId
                text: "SPORT"
                font.pixelSize: 48
                color: "#17975f"
                font.family: rootItemId.ziti
                anchors.verticalCenter: parent.verticalCenter
                anchors.left : parent.left
            }
        }
        //NORMAL
        WarningLight{
            id: normalWarningLightId
            width: 205
            height: 28
            anchors.left: ecoWarningLightId.left
            anchors.bottom:ecoWarningLightId.bottom
            visible: DataSource.modeLight === 0x03?true:false

            Text {
                font.bold:rootItemId.jiacu === 1
                id: normalWarningLightImageId
                text: "NORMAL"
                font.pixelSize: 48
                color: "#17975f"
                font.family: rootItemId.ziti
                anchors.verticalCenter: parent.verticalCenter
                anchors.left : parent.left
            }
        }
        //EV
        WarningLight{
            id: evWarningLightId
            width: 60
            height: 28
            anchors.right: hevWarningLightId.right
            anchors.bottom:hevWarningLightId.bottom
            displayState: DataSource.evLight

            Text {
                font.bold:rootItemId.jiacu === 1
                id: evWarningLightImageId
                text: "EV"
                font.pixelSize: 48
                color: DataSource.evLightColor === 0x04?"#17975f":"#179be0"
                font.family: rootItemId.ziti
                anchors.verticalCenter: parent.verticalCenter
                anchors.right: parent.right
            }
        }
        //HEV
        WarningLight{
            id: hevWarningLightId
            x: 799
            y: 38
            width: 91
            height: 28
            displayState: DataSource.hevLight

            Text {
                font.bold:rootItemId.jiacu === 1
                id: hevWarningLightImageId
                text: "HEV"
                font.pixelSize: 48
                color: "#17975f"
                font.family: rootItemId.ziti
                anchors.verticalCenter: parent.verticalCenter
                anchors.right: parent.right
            }
        }
        //GRASS
        WarningLight{
            id: grassWarningLightId

            width: 205
            height: 28
            anchors.left: ecoWarningLightId.left
            anchors.bottom:ecoWarningLightId.bottom
            visible: DataSource.modeLight === 0x04?true:false
            Image{
                id: grassWarningLightImageId
                anchors.bottom:parent.bottom
                anchors.bottomMargin: 1
                source: "qrc:/images10_25/warninglight/grassLight.png"
            }
        }
        //MUDDY
        WarningLight{
            id: muddyWarningLightId
            width: 205
            height: 28
            anchors.left: ecoWarningLightId.left
            anchors.bottom:ecoWarningLightId.bottom

            visible: DataSource.modeLight === 0x05?true:false
            Image{
                id: muddyWarningLightImageId
                anchors.bottom:parent.bottom
                anchors.bottomMargin: 1
                source: "qrc:/images10_25/warninglight/muddyLight.png"
            }
        }
        //SANDY
        WarningLight{
            id: sandWarningLightId
            width: 205
            height: 28
            anchors.left: ecoWarningLightId.left
            anchors.bottom:ecoWarningLightId.bottom

            visible: DataSource.modeLight === 0x06?true:false
            Image{
                id: sandWarningLightImageId
                anchors.bottom:parent.bottom
                anchors.bottomMargin: 1
                source: "qrc:/images10_25/warninglight/sandLight.png"
            }
        }

        //时间显示
        Item{
            id: timeDisplayId
            height: parent.height
            visible: DataSource.timeDisplay === 0x01 ? true : false
            property bool isAm: true
            property string currentTime: ""

            Text{
                font.bold:rootItemId.jiacu === 1
                font.family: rootItemId.ziti
                x: 528
                y: 38
                width: 102
                height: 28
                text: timeDisplayId.currentTime
                horizontalAlignment: Text.AlignLeft
                verticalAlignment: Text.AlignVCenter
                color: DataSource.dayNightMode === 0x02 ?"#ffffff":"#333333"
                font.pixelSize: 45
                visible: DataSource.timeFormat === 2 ? true: false
            }

            Text{
                font.bold:rootItemId.jiacu === 1
                font.family: rootItemId.ziti
                anchors.left: timeFormatId.right
                anchors.leftMargin: 3
                anchors.bottom: timeFormatId.bottom
                anchors.bottomMargin: -9
                text: timeDisplayId.currentTime
                color: DataSource.dayNightMode === 0x02 ?"#ffffff":"#333333"
                font.pixelSize: 45
                visible: timeFormatId.visible && DataSource.language === 0x01 ? true: false
            }

            Text{
                font.bold:rootItemId.jiacu === 1
                font.family: rootItemId.ziti
                anchors.right: timeFormatId.left
                anchors.rightMargin: 8
                anchors.bottom: timeFormatId.bottom
                anchors.bottomMargin: -8
                text: timeDisplayId.currentTime
                color: DataSource.dayNightMode === 0x02 ?"#ffffff":"#333333"
                font.pixelSize: 45
                visible: timeFormatId.visible && DataSource.language !== 0x01 ? true: false
            }

            Text{
                font.bold:rootItemId.jiacu === 1
                font.family: rootItemId.ziti
                id:timeFormatId
                x: DataSource.language !== 0x01 ? 630 : 528
                y: DataSource.language !== 0x01 ? 39 : 38
                width: 62
                height: 28
                horizontalAlignment: Text.AlignHCenter
                verticalAlignment: Text.AlignVCenter
                color: DataSource.dayNightMode === 0x02 ?"#bfffffff":"#bf333333"
                text:  timeDisplayId.isAm ? (DataSource.language === 0x01?"上午":"AM") : (DataSource.language === 0x01?"下午":"PM")
                font.pixelSize: DataSource.language !== 0x01 ? 44 : 30
                visible: DataSource.timeFormat === 1 ? true: false
            }

            Timer{
                id:timerId
                interval: 1000
                repeat: true
                running: true
                onTriggered: {
                    timeDisplayId.currentTime = currentDateTime()
                }
            }
            Component.onCompleted: {
                    timeDisplayId.currentTime = currentDateTime()
                }
        }




        Rectangle {
            width: parent.width
            height: parent.height
            color: "transparent"

            //方位
            Image{
                id: compassId
                x:1499
                anchors.bottom: parent.bottom
                anchors.bottomMargin: 0
                visible: directionTextId.visible
                source: DataSource.dayNightMode === 0x02 ?"qrc:/images10_25/display_always/night/compass.png":"qrc:/images10_25/display_always/day/compass.png"
            }
            Text{
                font.bold:rootItemId.jiacu === 1
                font.family: rootItemId.ziti
                id:directionTextId
                visible: DataSource.direction !== 0 ? 1 : 0
                anchors.left: compassId.right
                anchors.leftMargin: 5
                anchors.bottom: parent.bottom
                anchors.bottomMargin: DataSource.language !== 0x01 ? -11 : -3
                color: DataSource.dayNightMode === 0x02 ?"#ffffff":"#333333"
                font.pixelSize: DataSource.language !== 0x01 ? 46 : 30
                text: "SE"
                states:[
                    State {
                        name: "N"
                        when:DataSource.direction === 1
                        PropertyChanges {
                            target: directionTextId
                            text:TranslateStr.alwyasDisplay_N_Str
                        }
                    },
                    State {
                        name: "NE"
                        when:DataSource.direction === 2
                        PropertyChanges {
                            target: directionTextId
                            text: TranslateStr.alwyasDisplay_NE_Str
                        }
                    },
                    State {
                        name: "E"
                        when:DataSource.direction === 3
                        PropertyChanges {
                            target: directionTextId
                            text: TranslateStr.alwyasDisplay_E_Str
                        }
                    },
                    State {
                        name: "SE"
                        when:DataSource.direction === 4
                        PropertyChanges {
                            target: directionTextId
                            text: TranslateStr.alwyasDisplay_SE_Str
                        }
                    },
                    State {
                        name: "S"
                        when:DataSource.direction === 5
                        PropertyChanges {
                            target: directionTextId
                            text: TranslateStr.alwyasDisplay_S_Str
                        }
                    },
                    State {
                        name: "SW"
                        when:DataSource.direction === 6
                        PropertyChanges {
                            target: directionTextId
                            text: TranslateStr.alwyasDisplay_SW_Str
                        }
                    },
                    State {
                        name: "W"
                        when:DataSource.direction === 7
                        PropertyChanges {
                            target: directionTextId
                            text: TranslateStr.alwyasDisplay_W_Str
                        }
                    },
                    State {
                        name: "NW"
                        when:DataSource.direction === 8
                        PropertyChanges {
                            target: directionTextId
                            text: TranslateStr.alwyasDisplay_NW_Str
                        }
                    }
                ]
            }
            //温度
            Item{
                id: outsideTempId
                width: 104
                height: parent.height
                x: 1341
                visible: DataSource.outsideTempDisplay !== 0 ? 1 : 0

                Image {
                    id: tempUnitId
                    anchors.bottom: parent.bottom
                    anchors.bottomMargin: 0
                    anchors.right: parent.right
                    cache: false
                    source:{
                        if (DataSource.dayNightMode === 0x02){
                            DataSource.outsideTempUnit === 0 ? "qrc:/images10_25/display_always/night/temp_c.png":"qrc:/images10_25/display_always/night/temp_F.png"
                        }else{
                            DataSource.outsideTempUnit === 0 ? "qrc:/images10_25/display_always/day/temp_c.png":"qrc:/images10_25/display_always/day/temp_F.png"
                        }
                    }
                }

                Text {
                    font.bold:rootItemId.jiacu === 1
                    font.family: rootItemId.ziti
                    id: tempValueId
                    anchors.bottom: parent.bottom
                    anchors.bottomMargin: -10
                    anchors.right: tempUnitId.left
                    anchors.rightMargin: 5
                    color: DataSource.dayNightMode === 0x02 ?"#ffffff":"#333333"
                    font.pixelSize: 44
                    text: DataSource.outsideTemp
                }
            }
        }
    }

    Image{
        id:carBody
        anchors.horizontalCenter: parent.horizontalCenter
        y:300
        source:{
            switch(DataSource.carNameType)
            {
            case 0x06:
                "qrc:/images10_25/accelerationTimer/car_sl.png"
                break
            case 0x07:
                "qrc:/images10_25/accelerationTimer/car_sk2.png"
                break
            case 0x09:
                DataSource.ekCarbodyColor === 2?"qrc:/images10_25/accelerationTimer/car_ek_sport_green.png":"qrc:/images10_25/accelerationTimer/car_ek_sport_orange.png"
                break
            case 0x0A:
                "qrc:/images10_25/accelerationTimer/car_ek_normal.png"
                break
            case 0x0B:
                "qrc:/images10_25/accelerationTimer/car_HA2E.png"
                break
            case 0x0C:
                "qrc:/images10_25/accelerationTimer/car_HA2H.png"
                break
            case DataSource.CARNAME_EK23_10_25:
                "qrc:/images10_25/accelerationTimer/car_ek_normal_23.png"
                break
            case DataSource.CARNAME_SC3E_8_8:
                "qrc:/images10_25/accelerationTimer/car_SC3E.png"
                break
            case DataSource.CARNAME_HA3_8_8:
                "qrc:/images10_25/accelerationTimer/car_HA3.png"
                break
            case DataSource.CARNAME_HKHA_8_8:
                "qrc:/images10_25/accelerationTimer/car_HKH.png"
                break
            case DataSource.CARNAME_SA5H_10_25:
                "qrc:/images10_25/accelerationTimer/car_SA5H.png"
                break
            case DataSource.CARNAME_SA6H_8_8:
                "qrc:/images10_25/accelerationTimer/car_SA6H.png"
                break
            case DataSource.CARNAME_HXHK_8_8:
                "qrc:/images10_25/accelerationTimer/car_HXHK.png"
                break
            case DataSource.CARNAME_SL2H_8_8:
                "qrc:/images10_25/accelerationTimer/car_SL2H.png"
                break
            case DataSource.CARNAME_EWE_8_8:
                "qrc:/images10_25/accelerationTimer/car_EWE.png"
                break
            case DataSource.CARNAME_SC2E_8_8:
                "qrc:/images10_25/accelerationTimer/car_SC2E.png"
                break
            default:
                "qrc:/images10_25/accelerationTimer/car_sl.png"
                break
            }
        }
    }

    Text {
        font.bold:rootItemId.jiacu === 1
        font.family: rootItemId.ziti
        id: speedValue
        text: DataSource.speed
        anchors.horizontalCenter: parent.horizontalCenter
        y:132
        visible: (DataSource.speedUpSpeedValueDisplay === DataSource.UI_DISPLAY  && DataSource.speed!==-1) ? true:false
        font.pixelSize: 160
        color:{
            DataSource.dayNightMode === 0x01?"#333333":"#ffffff"
        }
    }

    Text {
        font.bold:rootItemId.jiacu === 1
        font.family: rootItemId.ziti
        id: speedUnit
        text:DataSource.speedUpSpeedUnit===1?"km/h":"mph"
        anchors.horizontalCenter: parent.horizontalCenter
        y:278
        visible: speedValue.visible
        font.pixelSize: 36
        color:{
            DataSource.dayNightMode === 0x01?"#575757":"#ffffff"
        }
    }

    Text {
        font.bold:rootItemId.jiacu === 1
        font.family: rootItemId.ziti
        id: speedUpSecond
        text: DataSource.speedUpChronoSeconds.toFixed(2)
        x:1453
        y:349
        visible: DataSource.speedUpChronoDisplay === DataSource.UI_DISPLAY ? true:false
        font.pixelSize: 98
        color:{
            DataSource.dayNightMode === 0x01?"#333333":"#ffffff"
        }
    }

    Text {
        font.bold:rootItemId.jiacu === 1
        font.family: rootItemId.ziti
        id: speedUpUnit
        text: "s"
        y:379
        anchors.left: speedUpSecond.right
        anchors.leftMargin: 12
        visible: DataSource.speedUpChronoDisplay === DataSource.UI_DISPLAY ? true:false
        font.pixelSize: 60
        color:{
            DataSource.dayNightMode === 0x01?"#333333":"#ffffff"
        }
    }

    Text {
        font.bold:rootItemId.jiacu === 1
        font.family: rootItemId.ziti
        id: speedUpTip
        width:460
        height:256
        x:70
        y:222
        visible: DataSource.speedUpTipDisplay === DataSource.UI_DISPLAY ? true:false
        font.pixelSize: 42
        wrapMode:Text.WordWrap
        color:{
            DataSource.dayNightMode === 0x01?"#333333":"#fefefe"
        }
        horizontalAlignment: Text.AlignHCenter
        verticalAlignment: Text.AlignVCenter
    }

    //时间记录
    Item {
        id: accelerationTimerLogItem
        visible:false
        width: 868
        height: 264
        y:356
        z:5
        Image {
            id: logerBgImg
            source: DataSource.dayNightMode === 0x01?
                        "qrc:/images10_25/accelerationTimer/tip_remote_day.png"
                      :"qrc:/images10_25/accelerationTimer/tip_remote_night.png"
        }
        Text {
            font.bold:rootItemId.jiacu === 1
            font.family: rootItemId.ziti
            id: speedTitle
            text: TranslateStr.acceleration_timelog_speed
            font.pixelSize: 30
            wrapMode:Text.WordWrap
            y:39
            x:21
            width: 206.5
            horizontalAlignment: Text.AlignHCenter
            opacity: 0.75
            color:{
                DataSource.dayNightMode === 0x01?"#333333":"#fefefe"
            }
        }
        Text {
            font.bold:rootItemId.jiacu === 1
            font.family: rootItemId.ziti
            id: bestTitle
            text: TranslateStr.acceleration_timelog_best
            y:39
            width: 206.5
            horizontalAlignment: Text.AlignHCenter
            anchors.left:speedTitle.right
            wrapMode:Text.WordWrap
            font.pixelSize: 30
            opacity: 0.75
            color:{
                DataSource.dayNightMode === 0x01?"#333333":"#fefefe"
            }
        }
        Text {
            font.bold:rootItemId.jiacu === 1
            font.family: rootItemId.ziti
            id: lastLog
            text: TranslateStr.acceleration_timelog_last
            y: 39
            width: 206.5
            horizontalAlignment: Text.AlignHCenter
            anchors.left:bestTitle.right
            wrapMode:Text.WordWrap
            font.pixelSize: 30
            opacity: 0.75
            color:{
                DataSource.dayNightMode === 0x01?"#333333":"#fefefe"
            }
        }

        Text {
            font.bold:rootItemId.jiacu === 1
            font.family: rootItemId.ziti
            id: thisTimeLogTitle
            text: TranslateStr.acceleration_timelog_current
            width: 206.5
            wrapMode: Text.Wrap
            horizontalAlignment: Text.AlignHCenter
            anchors.bottom: parent.bottom
            anchors.bottomMargin: 182
            anchors.left:lastLog.right
            font.pixelSize: 30
            opacity: 0.75
            color:{
                DataSource.dayNightMode === 0x01?"#333333":"#fefefe"
            }
        }

        Item {
            id: speedUp50kmItem
            height: 33
            x:45
            y:92
            visible: true
            Text {
                font.bold:rootItemId.jiacu === 1
                font.family: rootItemId.ziti
                id: speedUp50kmItemValue
                anchors.left: parent.left
                text:DataSource.speedUpSpeedUnit===1?"50":"31"
                font.pixelSize: 56
                color:{
                    DataSource.dayNightMode === 0x01?"#333333":"#fefefe"
                }
            }
            Text {
                font.bold:rootItemId.jiacu === 1
                font.family: rootItemId.ziti
                id: speedUp50kmItemUnit
                anchors.left: speedUp50kmItemValue.right
                anchors.leftMargin: 18
                anchors.baseline: speedUp50kmItemValue.baseline
                text:DataSource.speedUpSpeedUnit===1?"km/h":"mph"
                font.pixelSize: 32
                color:{
                    DataSource.dayNightMode === 0x01?"#575757":"#fefefe"
                }
            }
        }


        Item {
            id: speedUp100kmItem
            width:217
            height: 33
            x:33
            y:157
            visible: true
            Text {
                font.bold:rootItemId.jiacu === 1
                font.family: rootItemId.ziti
                id: speedUp100kmItemValue
                anchors.left: parent.left
                text:DataSource.speedUpSpeedUnit===1?"100":"62"
                font.pixelSize: 56
                color:{
                    DataSource.dayNightMode === 0x01?"#333333":"#fefefe"
                }
            }
            Text {
                font.bold:rootItemId.jiacu === 1
                font.family: rootItemId.ziti
                id: speedUp100kmItemUnit
                anchors.left: speedUp100kmItemValue.right
                anchors.baseline: speedUp100kmItemValue.baseline
                anchors.leftMargin: 9
                text:DataSource.speedUpSpeedUnit===1?"km/h":"mph"
                font.pixelSize: 32
                color:{
                    DataSource.dayNightMode === 0x01?"#575757":"#fefefe"
                }
            }
        }

        Item {
            id: speedUp50kmBestItem
            width:200
            height: 33
            x:276
            y:92
            visible: DataSource.speedUp50kmBestTimeSecDisplay ===DataSource.UI_DISPLAY?true:false
            Text {
                font.bold:rootItemId.jiacu === 1
                font.family: rootItemId.ziti
                id: speedUp50kmBestItemValue
                anchors.left: parent.left
                font.pixelSize: 56
                text: DataSource.speedUp50kmBestTimeSec === 0x3FE ?"--.-":(DataSource.speedUp50kmBestTimeSec*0.1).toFixed(1)
                color:{
                    DataSource.dayNightMode === 0x01?"#333333":"#fefefe"
                }
            }
            Text {
                font.bold:rootItemId.jiacu === 1
                font.family: rootItemId.ziti
                id: speedUp50kmBestItemUnit
                anchors.left: speedUp50kmBestItemValue.right
                anchors.leftMargin: 12
                anchors.baseline: speedUp50kmBestItemValue.baseline
                text: "s"
                font.pixelSize: 32
                color:{
                    DataSource.dayNightMode === 0x01?"#575757":"#fefefe"
                }
            }
        }

        //100km历史最佳
        Item {
            id: speedUp100kmBestItem
            width:200
            height: 33
            x:276
            y:157
            visible: DataSource.speedUp100kmBestTimeSecDisplay ===DataSource.UI_DISPLAY?true:false
            Text {
                font.bold:rootItemId.jiacu === 1
                font.family: rootItemId.ziti
                id: speedUp100kmBestItemValue
                anchors.left: parent.left
                text: DataSource.speedUp100kmBestTimeSec === 0x3FE ?"--.-":(DataSource.speedUp100kmBestTimeSec*0.1).toFixed(1)
                font.pixelSize: 56
                color:{
                    DataSource.dayNightMode === 0x01?"#333333":"#fefefe"
                }
            }
            Text {
                font.bold:rootItemId.jiacu === 1
                font.family: rootItemId.ziti
                id: speedUp100kmBestItemUnit
                anchors.left: speedUp100kmBestItemValue.right
                anchors.leftMargin: 12
                anchors.baseline: speedUp100kmBestItemValue.baseline
                text: "s"
                font.pixelSize: 32
                color:{
                    DataSource.dayNightMode === 0x01?"#575757":"#fefefe"
                }
            }
        }

        //上次记录
        Item {
            id: speedUp50kmLastItem
            width:200
            height: 33
            x:495
            y:92
            visible: DataSource.speedUp50kmLastTimeSecDisplay ===DataSource.UI_DISPLAY?true:false
            Text {
                font.bold:rootItemId.jiacu === 1
                font.family: rootItemId.ziti
                id: speedUp50kmLastItemVlaue
                anchors.left: parent.left
                text: DataSource.speedUp50kmLastTimeSec === 0x3FE ?"--.-":(DataSource.speedUp50kmLastTimeSec*0.1).toFixed(1)
                font.pixelSize: 56
                color:{
                    DataSource.dayNightMode === 0x01?"#333333":"#fefefe"
                }
            }
            Text {
                font.bold:rootItemId.jiacu === 1
                font.family: rootItemId.ziti
                id: speedUp50kmLastItemUnit
                anchors.left: speedUp50kmLastItemVlaue.right
                anchors.leftMargin: 12
                anchors.baseline: speedUp50kmLastItemVlaue.baseline
                text: "s"
                font.pixelSize: 32
                color:{
                    DataSource.dayNightMode === 0x01?"#575757":"#fefefe"
                }
            }
        }

        //100km上次记录
        Item {
            id: speedUp100kmLastItem
            width:200
            height: 33
            x:495
            y:157
            visible: DataSource.speedUp100kmLastTimeSecDisplay ===DataSource.UI_DISPLAY?true:false
            Text {
                font.bold:rootItemId.jiacu === 1
                font.family: rootItemId.ziti
                id: speedUp100kmLastItemValue
                anchors.left: parent.left
                text: DataSource.speedUp100kmLastTimeSec === 0x3FE ?"--.-":(DataSource.speedUp100kmLastTimeSec*0.1).toFixed(1)
                font.pixelSize: 56
                color:{
                    DataSource.dayNightMode === 0x01?"#333333":"#fefefe"
                }
            }
            Text {
                font.bold:rootItemId.jiacu === 1
                font.family: rootItemId.ziti
                id: speedUp100kmLastItemUnit
                anchors.left: speedUp100kmLastItemValue.right
                anchors.leftMargin: 12
                anchors.baseline: speedUp100kmLastItemValue.baseline
                text: "s"
                font.pixelSize: 32
                color:{
                    DataSource.dayNightMode === 0x01?"#575757":"#fefefe"
                }
            }
        }


        //当前记录
        Item {
            id: speedUp50kmCurrentItem
            width:201
            height: 33
            x:687
            y:92
            visible: DataSource.speedUp50kmThisTimeSecDisplay ===DataSource.UI_DISPLAY?true:false
            Text {
                font.bold:rootItemId.jiacu === 1
                font.family: rootItemId.ziti
                id: speedUp50kmCurrentItemValue
                anchors.left: parent.left
                text: DataSource.speedUp50kmThisTimeSec === 0x3FE ?"--.-":(DataSource.speedUp50kmThisTimeSec*0.1).toFixed(1)
                font.pixelSize: 56
                color:{
                    DataSource.dayNightMode === 0x01?"#333333":"#fefefe"
                }
            }
            Text {
                font.bold:rootItemId.jiacu === 1
                font.family: rootItemId.ziti
                id: speedUp50kmCurrentItemUnit
                anchors.left: speedUp50kmCurrentItemValue.right
                anchors.baseline: speedUp50kmCurrentItemValue.baseline
                anchors.leftMargin: 12
                text: "s"
                font.pixelSize: 32
                color:{
                    DataSource.dayNightMode === 0x01?"#575757":"#fefefe"
                }
            }
        }

        Item {
            id: speedUp100kmCurrentItem
            width:201
            height: 33
            x:687
            y:157
            visible: DataSource.speedUp100kmThisTimeSecDisplay ===DataSource.UI_DISPLAY?true:false
            Text {
                font.bold:rootItemId.jiacu === 1
                font.family: rootItemId.ziti
                id: speedUp100kmCurrentItemValue
                text: DataSource.speedUp100kmThisTimeSec === 0x3FE ?"--.-":(DataSource.speedUp100kmThisTimeSec*0.1).toFixed(1)
                font.pixelSize: 56
                color:{
                    DataSource.dayNightMode === 0x01?"#333333":"#fefefe"
                }
            }
            Text {
                font.bold:rootItemId.jiacu === 1
                font.family: rootItemId.ziti
                id: speedUp100kmCurrentItemUnit
                anchors.left: speedUp100kmCurrentItemValue.right
                anchors.baseline: speedUp100kmCurrentItemValue.baseline
                text: "s"
                anchors.leftMargin: 12
                font.pixelSize: 32
                color:{
                    DataSource.dayNightMode === 0x01?"#575757":"#fefefe"
                }
            }
        }
    }

    ParallelAnimation{
        id:numberAnim
        running: false
        NumberAnimation{
            target: accelerationTimerLogItem
            properties: "opacity"
            from:0.5
            to:1
            duration: 500
        }

        NumberAnimation{
            target: accelerationTimerLogItem
            properties: "x"
            from:600
            to:526
            duration: 500
        }
    }

    ListModel{
        id: picList
        ListElement {
            picVisible: true
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
    Repeater {
        model: picList
        Image {
            x:196
            y:259
            source: "qrc:/images10_25/accelerationTimer/AnimRoadLine/IMG_00"+index+".png"
            visible: picVisible
        }
    }
    function hidePics(){
        for(var i=0; i < picList.count; ++i){
            picList.setProperty(i, "picVisible", false)
        }
    }

    function showPic(index){
        picList.setProperty(index, "picVisible", true)
    }

    Timer{
        id: timer
        repeat: true
        running: (DataSource.speedUpAnimStatus===0x1) ?true:false
        interval: 25
        onTriggered: {
            if(picIndex > 6){
                picIndex = 0
            }
            hidePics()
            showPic(picIndex++)
        }
    }


    function onSpeedUpLoggerDisplayQuery(){
        if(DataSource.speedUpLoggerDisplay === DataSource.UI_DISPLAY)
        {
            accelerationTimerLogItem.visible = true
            numberAnim.start()
        }else{
            accelerationTimerLogItem.visible = false
        }
    }


    function updateSpeedUpTipText(){
        switch(DataSource.speedUpTipText){
        case 1:
            speedUpTip.text = TranslateStr.accelerationTip_0x1
            break
        case 2:
            speedUpTip.text = TranslateStr.accelerationTip_0x2
            break
        case 3:
            speedUpTip.text = TranslateStr.accelerationTip_0x3
            break
        case 4:
            speedUpTip.text = TranslateStr.accelerationTip_0x4
            break
        case 5:
            speedUpTip.text = TranslateStr.accelerationTip_0x5
            break
        case 6:
            speedUpTip.text=TranslateStr.accelerationTip_0x6
            break
        case 7:
            speedUpTip.text=TranslateStr.accelerationTip_0x7
            break
        }
    }

    function currentDateTime(){
        if(DataSource.timeFormat === 2){
            return Qt.formatDateTime(new Date(), "hh:mm");
        }else if(DataSource.timeFormat === 1){
            var hour = Qt.formatDateTime(new Date(), "hh");
            if(hour < 1){
                if(!timeDisplayId.isAm)
                    timeDisplayId.isAm = true
                return "12:" + Qt.formatDateTime(new Date(), "mm")
            } else if (hour < 12){
                if(!timeDisplayId.isAm)
                    timeDisplayId.isAm = true
                return Qt.formatDateTime(new Date(), "h:mm");
            } else if(hour < 13) {
                if(timeDisplayId.isAm)
                    timeDisplayId.isAm = false
                return Qt.formatDateTime(new Date(), "hh:mm");
            } else {
                if(timeDisplayId.isAm)
                    timeDisplayId.isAm = false
                return (hour-12)+ ":" + Qt.formatDateTime(new Date(), "mm")
            }
        }
    }
    WarningLight{
        id: batteryWarningLightId
        x: 589
        y: 666
        displayState: DataSource.lowPowerBatLight
        Image{
            id: batteryWarningLightImageId
            source: "qrc:/images10_25/warninglight/lowBat.png"
        }
    }
    WarningLight{
        id: fuelWarningLightId
        x: 1259
        y: 667
        displayState: DataSource.lowFuelLight
        Image{
            id: fuelWarningLightImageId
            source: "qrc:/images10_25/warninglight/lowFuelLight.png"
        }
    }
    Connections {
        target:DataSource

        function onSpeedUpTipTextChanged(){
            updateSpeedUpTipText()
        }

        function onSpeedUpLoggerDisplayChanged(){
            if(DataSource.speedUpLoggerDisplay === DataSource.UI_DISPLAY)
            {
                accelerationTimerLogItem.visible = true
                numberAnim.start()
            }else{
                accelerationTimerLogItem.visible = false
            }
        }

        function onSpeedUpAnimStatusChanged(){
            timer.running = DataSource.speedUpAnimStatus === 1 ?true :false
        }
        function onTranslateLoadCompleteChanged(){
            updateSpeedUpTipText()
        }

        function onTimeFormatChanged(){
            timeDisplayId.currentTime = currentDateTime()
        }

    }
}
