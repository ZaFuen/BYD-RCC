import QtQuick 2.15
import com.byd.DataSource 1.0
import com.byd.CenterChild 1.0
import "qrc:/common/singleton/"
CenterChild {

    id: rootItem
    anchors.fill: parent
    visible:true

    Component.onCompleted: {
        updatecarBodyImg()
    }

    Image {
        id: backGroundImg
        visible: true
        source: {
            DataSource.dayNightMode === 0x01?
                        "qrc:/images10_25/journeyInfo/day/bg.png":"qrc:/images10_25/journeyInfo/night/bg.png"}
    }

    Text {
        font.bold:rootItemId.jiacu === 1
        font.family: rootItemId.ziti
        id: journeTitle
        text:TranslateStr.journeyInfoTitle
        x:887
        y:DataSource.language === 0x01? 20 - 8:20
        visible: true
        font.pixelSize: 36
        lineHeight: 64
        color:{
            DataSource.dayNightMode === 0x01?"#333333":"#ffffff"
        }
    }

    Image {
        id: carBodyImg
		height: 260
		fillMode: Image.PreserveAspectFit
        anchors.horizontalCenter: parent.horizontalCenter
        visible: true
    }

    Connections{
        target: DataSource

        function onDayNightModeChanged(){
            updatecarBodyImg()
        }

        function onCarNameTypeChanged(){
            updatecarBodyImg()
        }

        function onEkCarbodyColorChanged() {
            updatecarBodyImg()
        }
    }

    function updatecarBodyImg(){
    if (rootItemId.zdycar === 1) {
        carBodyImg.source = rootItemId.car
        carBodyImg.y = 207.5  
        return
    }		
        switch (DataSource.carNameType) {
        case 0x01:
            carBodyImg.source = "qrc:/images10_25/journeyInfo/night/car_0x5c.png"
            carBodyImg.y = 220
            break
        case 0x02:
            carBodyImg.source = "qrc:/images10_25/journeyInfo/night/car_0x79.png"
            carBodyImg.y = 220
            break
        case 0x06:
            carBodyImg.source = "qrc:/images10_25/journeyInfo/night/journey_car_SLH.png"
            carBodyImg.y = 127.83
            break
        case 0x07:
            carBodyImg.source = "qrc:/images10_25/journeyInfo/night/journey_car_SK2H.png"
            carBodyImg.y = 127.82
            break
        case 0x09:
            if (DataSource.ekCarbodyColor === 2) {
                carBodyImg.source = "qrc:/images10_25/journeyInfo/night/journey_car_ek_sport_green.png"
            } else {
                carBodyImg.source = "qrc:/images10_25/journeyInfo/night/journey_car_ek_sport_orange.png"
            }
            carBodyImg.y = 127.82
            break
        case 0x0A:
            carBodyImg.source = "qrc:/images10_25/journeyInfo/night/journey_car_ek_normal.png"
            carBodyImg.y = 17.63
            break
        case 0x0B:
            carBodyImg.source = "qrc:/images10_25/journeyInfo/night/journey_car_HA2E.png"
            carBodyImg.y = 127.82
            break
        case 0x0C:
            carBodyImg.source = "qrc:/images10_25/journeyInfo/night/journey_car_HA2H.png"
            carBodyImg.y = 127.82
            break
        case DataSource.CARNAME_EK23_10_25:
            carBodyImg.source = "qrc:/images10_25/journeyInfo/night/journey_car_ek_normal_23.png"
            carBodyImg.y = 127.82
            break
        case DataSource.CARNAME_SC3E_8_8:
            carBodyImg.source = "qrc:/images10_25/journeyInfo/night/journey_car_SC3E.png"
            carBodyImg.y = 127.82
            break
        case DataSource.CARNAME_SC2E_8_8:
            carBodyImg.source = "qrc:/images10_25/journeyInfo/night/journey_car_SC2E.png"
            carBodyImg.y = 127.82
            break
        case DataSource.CARNAME_HA3_8_8:
            carBodyImg.source = "qrc:/images10_25/journeyInfo/night/journey_car_HA3.png"
            carBodyImg.y = 127.82
            break
        case DataSource.CARNAME_HKHA_8_8:
            carBodyImg.source = "qrc:/images10_25/journeyInfo/night/journey_car_ek_sport_green.png"
            carBodyImg.y = 127.82
            break
        case DataSource.CARNAME_SA5H_10_25:
            carBodyImg.source = "qrc:/images10_25/journeyInfo/night/journey_car_SA5H.png"
            carBodyImg.y = 127.82
            break
        case DataSource.CARNAME_SA6H_8_8:
            carBodyImg.source = "qrc:/images10_25/journeyInfo/night/journey_car_SA6H.png"
            carBodyImg.y = 127.82
            break
        case DataSource.CARNAME_HXHK_8_8:
            carBodyImg.source = "qrc:/images10_25/journeyInfo/night/journey_car_HXHK.png"
            carBodyImg.y = 127.82
            break
        case DataSource.CARNAME_SL2H_8_8:
            carBodyImg.source = "qrc:/images10_25/journeyInfo/night/journey_car_SL2H.png"
            carBodyImg.y = 127.82
            break
        case DataSource.CARNAME_EWE_8_8:
            carBodyImg.source = "qrc:/images10_25/journeyInfo/night/journey_car_EWE.png"
            carBodyImg.y = 127.82
            break
        default:
            carBodyImg.source = rootItemId.car
            carBodyImg.y = 207.5
            break
        }
    }

    Image {
        id: topLineImg
        visible: true
        x:415
        y:75
        source: {
            DataSource.dayNightMode === 0x01?
                        "qrc:/images10_25/journeyInfo/day/top_line_light.png":"qrc:/images10_25/journeyInfo/night/top_line_night.png"}
    }

    Image {
        id: bottomLineImg
        visible: true
        x:349
        y:554
        source: {
            DataSource.dayNightMode === 0x01?
                        "qrc:/images10_25/journeyInfo/day/bottom_line_light.png":"qrc:/images10_25/journeyInfo/night/bottom_line_night.png"}
    }

    //行驶里程
    Item {
        id: journeyMileItem
        anchors.fill: parent
        visible: DataSource.journeyMileDisplay===DataSource.UI_DISPLAY?true:false

        Item {
            id: journeyMileItem1
            x: 361
            width: journeyMileTitle.width + journeyMileTitle.x

            Image {
                id: journeyMileIcon
                visible: true
                //x: 361
                y: 603
                anchors.left: parent.left
                source: {
                    DataSource.dayNightMode === 0x01 ?
                                "qrc:/images10_25/journeyInfo/day/journey_mile_icon_light.png" : "qrc:/images10_25/journeyInfo/night/journey_mile_icon_night.png"}
            }

            Text {
                font.bold:rootItemId.jiacu === 1
                font.family: rootItemId.ziti
                id: journeyMileTitle
                text:TranslateStr.journeyMileTitle
                //x:413
                x: 52
                y:DataSource.language === 0x01 ?599-8:599
                font.pixelSize: 30
                opacity: 0.7
                color:{
                    DataSource.dayNightMode === 0x01?"#333333":"#ffffff"
                }
            }
        }

        Item {
            anchors.horizontalCenter: journeyMileItem1.horizontalCenter
            width: journeyMileUint.width + journeyMileValue.width + 10

            Text {
                font.bold:rootItemId.jiacu === 1
                font.family: rootItemId.ziti
                id: journeyMileUint
                anchors.right: parent.right
                text: {
                    DataSource.language === 2 ? (DataSource.journeyMileUnit === 1 ? qsTr("km") : qsTr("miles"))
                                              : (DataSource.journeyMileUnit === 1 ? qsTr("公里") : qsTr("英里"))
                }
                //x: 503
                y: DataSource.language === 0x01 ? 669 - 8: 672
                lineHeight: 58
                font.pixelSize: 30
                opacity: 0.7
                color: {
                    DataSource.dayNightMode === 0x01 ? "#333333" : "#ffffff"
                }
            }

            Text {
                font.bold:rootItemId.jiacu === 1
                font.family: rootItemId.ziti
                id: journeyMileValue
                anchors.right: journeyMileUint.left
                anchors.rightMargin: 10
                lineHeight: 58
                y: 653
                font.pixelSize: 56
                visible: true
                color: {
                    DataSource.dayNightMode === 0x01 ? "#333333" : "#ffffff"
                }
                text: (DataSource.journeyMileText).toFixed(1)
            }
        }
    }

    //安全电量
    Item {
        id: journeySafeBatteryItem
        visible:DataSource.safetyBateryDisplay === DataSource.UI_DISPLAY ? true:false

        Item {
            id: journeySafeBatteryItem1
            x: 669
            width: journeySafeBatteryTitle.width + journeySafeBatteryTitle.x

            Image {
                id: journeySafeBatteryIcon
                visible: true
                //x:669
                y:598
                source: {
                    DataSource.dayNightMode === 0x01?
                                "qrc:/images10_25/journeyInfo/day/journey_battery_icon_light.png":"qrc:/images10_25/journeyInfo/night/journey_battery_icon_night.png"}
            }

            Text {
                font.bold:rootItemId.jiacu === 1
                font.family: rootItemId.ziti
                id: journeySafeBatteryTitle
                text: TranslateStr.charging_safeBatteryStr
                //x:712
                x: 43
                y:DataSource.language === 0x01 ?599-8:599
                font.pixelSize: 30
                opacity: 0.7
                color:{
                    DataSource.dayNightMode === 0x01?"#333333":"#ffffff"
                }
            }
        }

        Item {
            anchors.horizontalCenter: journeySafeBatteryItem1.horizontalCenter
            width: journeySafeBatteryValue.width + journeySafeBatteryUint.width + 10

            Text {
                font.bold:rootItemId.jiacu === 1
                font.family: rootItemId.ziti
                id: journeySafeBatteryValue
                font.pixelSize: 56
                lineHeight:58
                //anchors.left: journeySafeBatteryIcon.left
                anchors.left: parent.left
                anchors.rightMargin: 10
                y:654
                color:{
                    DataSource.dayNightMode === 0x01?"#333333":"#ffffff"
                }
                text: DataSource.safetyBatterySoc
            }

            Text {
                font.bold:rootItemId.jiacu === 1
                font.family: rootItemId.ziti
                id: journeySafeBatteryUint
                text:qsTr("%")
                x:747
                y:674
                font.pixelSize: 22
                lineHeight: 58
                opacity: 0.7
                color:{
                    DataSource.dayNightMode === 0x01?"#333333":"#ffffff"
                }
                anchors.left: journeySafeBatteryValue.right
                anchors.leftMargin: 10
            }
        }
    }

    property var monthStr: ["Jan.", "Feb.", "Mar.", "Apr.", "May ", "Jun.", "Jul.", "Aug.", "Sep.", "Oct.", "Nov.", "Dec."]

    function day_en(mon, day) {
        if ((day > 0 && day < 32) && (mon > 0 && mon < 13)) {
            return day + (['st', 'nd', 'rd'][day < 20 ? day - 1 : day % 10 - 1] || 'th')
        } else {
            return ""
        }
    }

    function month_en(mon,day) {
        if ((day > 0 && day < 32) && (mon > 0 && mon < 13)) {
            return monthStr[mon-1]
        } else {
            return ""
        }
    }

    //计划用车
    Item {
        id: journeyUsingPlanItem
        anchors.fill: parent
        visible:DataSource.usingPlanDisplay=== DataSource.UI_DISPLAY?true:false

        Item {
            id: journeyUsingPlanItem1
            x: 945
            width: journeyusingPlanTitle.width + journeyusingPlanTitle.x

            Image {
                id: journeyUsingPlanIcon
                visible: true
                //x:945
                y:598
                source: {
                    DataSource.dayNightMode === 0x01?
                                "qrc:/images10_25/journeyInfo/day/journey_time_icon.png":"qrc:/images10_25/journeyInfo/night/journey_time_icon_night.png"}
            }

            Text {
                font.bold:rootItemId.jiacu === 1
                font.family: rootItemId.ziti
                id: journeyusingPlanTitle
                text: TranslateStr.planToUseCarTitle
                //x:992
                x: 47
                y:DataSource.language === 0x01 ?599-8:599
                font.pixelSize: 30
                opacity: 0.7
                color:{
                    DataSource.dayNightMode === 0x01?"#333333":"#ffffff"
                }
            }
        }

        Item {
            anchors.horizontalCenter: journeyUsingPlanItem1.horizontalCenter
            width: {
                if (journeyDateMonthText.visible == true) {
                    journeyDateMonthText.width + journeyDateHourText.width
                            + journeyDateTimeSplitText.width + journeyDateMinText.width + 30
                } else if (journeyDateType1.visible == true) {
                    journeyDateType1.width + journeyDateHourText.width
                            + journeyDateTimeSplitText.width + journeyDateMinText.width + 30
                } else {
                    journeyDateHourText.width + journeyDateTimeSplitText.width + journeyDateMinText.width + 20
                }
            }

            //日期类型
            Text {
                font.bold:rootItemId.jiacu === 1
                font.family: rootItemId.ziti
                id: journeyDateType1
                visible:(DataSource.usingPlanDateType === 1||DataSource.usingPlanDateType===2)?true:false
                text: {
                    DataSource.usingPlanDateType ===1 ?TranslateStr.charging_todayStr:TranslateStr.charging_tomorrowStr
                }
                //width: 140
                //x:945
                anchors.left: parent.left
                y:DataSource.language === 0x01 ?667-8:672
                font.pixelSize: 30
                color:{
                    DataSource.dayNightMode === 0x01?"#333333":"#ffffff"
                }
            }

            Text {
                font.bold:rootItemId.jiacu === 1
                font.family: rootItemId.ziti
                id: journeyDateMonthText
                visible:DataSource.monthDateDisplay ===DataSource.UI_DISPLAY?true:false
                text: if (DataSource.language === 0x01) {
                          DataSource.usingPlanDateMonth + TranslateStr.journey_monthStr
                                  + DataSource.usingPlanDateDay + TranslateStr.journey_dayStr
                      } else {
                          month_en(DataSource.usingPlanDateMonth, DataSource.usingPlanDateDay)
                                  + day_en(DataSource.usingPlanDateMonth, DataSource.usingPlanDateDay)
                      }
                lineHeight: 58
                //width: 140
                //x:945
                anchors.left: parent.left
                y:DataSource.language === 0x01 ?667 - 8:672
                font.pixelSize: 30
                color:{
                    DataSource.dayNightMode === 0x01?"#333333":"#ffffff"
                }
            }

            Text {
                font.bold:rootItemId.jiacu === 1
                font.family: rootItemId.ziti
                id: journeyDateHourText
                text:DataSource.usingPlanDateHour<10?qsTr("0"+DataSource.usingPlanDateHour):DataSource.usingPlanDateHour
                anchors.left: {
                    if (journeyDateType1.visible == true)
                        journeyDateType1.right
                    else if (journeyDateMonthText.visible == true)
                        journeyDateMonthText.right
                    else
                        parent.left
                }
                anchors.leftMargin: (journeyDateType1.visible == true || journeyDateMonthText.visible == true) ? 10 : 0
                font.pixelSize: 56
                lineHeight: 58
                y:654
                visible: DataSource.usingPlanHourMinDisplay === DataSource.UI_DISPLAY?true:false
                color:{
                    DataSource.dayNightMode === 0x01?"#333333":"#ffffff"
                }
            }

            Text {
                font.bold:rootItemId.jiacu === 1
                font.family: rootItemId.ziti
                id: journeyDateTimeSplitText
                text:":"
                y:658
                opacity: 0.7
                anchors.left: journeyDateHourText.right
                anchors.leftMargin:10
                lineHeight: 58
                font.pixelSize: 45
                visible: DataSource.usingPlanHourMinDisplay === DataSource.UI_DISPLAY?true:false
                color:{
                    DataSource.dayNightMode === 0x01?"#333333":"#ffffff"
                }
            }

            Text {
                font.bold:rootItemId.jiacu === 1
                font.family: rootItemId.ziti
                id: journeyDateMinText
                text:DataSource.usingPlanDateMin<10?qsTr("0"+DataSource.usingPlanDateMin):DataSource.usingPlanDateMin
                anchors.left: journeyDateTimeSplitText.right
                anchors.leftMargin:10
                font.pixelSize: 56
                visible: DataSource.usingPlanHourMinDisplay === DataSource.UI_DISPLAY?true:false
                y:654
                color:{
                    DataSource.dayNightMode === 0x01?"#333333":"#ffffff"
                }
            }
        }
    }

    //行驶时间
    Item {
        id: journeyTimeItem
        visible:DataSource.journeyTimeDisplay ===DataSource.UI_DISPLAY?true:false

        Item {
            id: journeyTimeItem1
            x: 1344
            width: journeTimeTitle.width + journeTimeTitle.x

            Image {
                id: journeTimeIcon
                visible: true
                //x:1344
                y:598
                source: {
                    DataSource.dayNightMode === 0x01?
                                "qrc:/images10_25/journeyInfo/day/journey_time_icon.png":"qrc:/images10_25/journeyInfo/night/journey_time_icon_night.png"}
            }

            Text {
                font.bold:rootItemId.jiacu === 1
                font.family: rootItemId.ziti
                id: journeTimeTitle
                text: TranslateStr.driveInfo_driveTimeStr
                //x:1392
                x: 48
                y:DataSource.language === 0x01 ?599-8:599
                opacity: 0.7
                font.pixelSize: 30
                color:{
                    DataSource.dayNightMode === 0x01?"#333333":"#ffffff"
                }
            }
        }

        Item {
            anchors.horizontalCenter: journeyTimeItem1.horizontalCenter
            width: journeTimeUnit.width + journeTimeValue.width + 10

            Text {
                font.bold:rootItemId.jiacu === 1
                font.family: rootItemId.ziti
                id: journeTimeUnit
                anchors.right: parent.right
                text: TranslateStr.journey_timeUnitStr
                //x: 1473
                y: DataSource.language === 0x01 ? 669 - 8: 672
                lineHeight: 58
                opacity: 0.7
                font.pixelSize: 30
                color: {
                    DataSource.dayNightMode === 0x01 ? "#333333" : "#ffffff"
                }
            }

            Text {
                font.bold:rootItemId.jiacu === 1
                font.family: rootItemId.ziti
                id: journeTimeValue
                text: (DataSource.journeyTimeText).toFixed(1)
                anchors.right: journeTimeUnit.left
                lineHeight: 58
                y: 653
                anchors.rightMargin: 10
                font.pixelSize: 56
                color: {
                    DataSource.dayNightMode === 0x01 ? "#333333" : "#ffffff"
                }
            }
        }
    }

    //温馨提示
    Text{
        id:warmTipText
        visible:DataSource.warmTipDisplay === DataSource.UI_DISPLAY?true:false
        width: parent.width
        font.pixelSize:25
        y:515
        horizontalAlignment: Text.AlignHCenter
        color:{
            DataSource.dayNightMode === 0x01?"#333333":"#ffffff"
        }
        text: {
            if (DataSource.vehicleType === 0x01) {
                DataSource.warmTipText === 1?TranslateStr.journey_chargeStr1:DataSource.warmTipText === 2?TranslateStr.journey_chargeStr2:""
            } else {
                DataSource.warmTipText === 1?TranslateStr.journey_chargeStr3:DataSource.warmTipText === 2?TranslateStr.journey_chargeStr4:""
            }
        }
    }
    //特殊温馨提示 - AI能耗管理为您降低能耗X.XXL（省电X.XXkW·h、省油X.XXL）
    Item{
        id:warmTipAI
        visible:(DataSource.warmTipDisplay === DataSource.UI_DISPLAY&& DataSource.warmTipText === 3)?true:false
        anchors.horizontalCenter: parent.horizontalCenter
        width: imageAI.width+tipAI1.width+tipAI2.width+tipAI3.width+tipAI4.width+tipAI5.width+tipAI6.width+tipAI7.width

        Image{
            id: imageAI
            y:515-29
            width: 116
            height: 64
            source: {
                DataSource.language === 0x01 ?
                            "qrc:/images10_25/journeyInfo/night/save_ch.png":"qrc:/images10_25/journeyInfo/night/save_en.png"
            }
        }
        Text{
            font.bold:rootItemId.jiacu === 1
            font.family: rootItemId.ziti
            id: tipAI1
            anchors.left: imageAI.right
            anchors.bottom: imageAI.bottom
            anchors.bottomMargin: DataSource.language === 0x01 ? 2 : 5
            color: DataSource.dayNightMode === 0x01?"#333333":"#ffffff"
            font.pixelSize:24
            text: DataSource.language === 0x01 ? "管理为您降低能耗 ":"consumption by "
        }
        Text{
            font.bold:rootItemId.jiacu === 1
            font.family: rootItemId.ziti
            id: tipAI2
            anchors.left: tipAI1.right
            anchors.verticalCenter: tipAI1.verticalCenter
            color: DataSource.dayNightMode === 0x01?"#333333":"#ffffff"
            font.pixelSize:32
            text: DataSource.comSavePowerValue
        }
        Text{
            font.bold:rootItemId.jiacu === 1
            font.family: rootItemId.ziti
            id: tipAI3
            anchors.left: tipAI2.right
            anchors.bottom: tipAI1.bottom
            color: DataSource.dayNightMode === 0x01?"#333333":"#ffffff"
            font.pixelSize:24
            text:{
                if(DataSource.comSavePowerUnit===0x1){
                    " L" + (DataSource.language === 0x01 ? "（省电 ":" for you (Saving ")
                }else if(DataSource.comSavePowerUnit===0x2){
                    " Gal" + (DataSource.language === 0x01 ? "（省电 ":" for you (Saving ")
                }else{
                    " " + (DataSource.language === 0x01 ? "（省电 ":" for you (Saving ")
                }
            }
        }
        Text{
            font.bold:rootItemId.jiacu === 1
            font.family: rootItemId.ziti
            id: tipAI4
            anchors.left: tipAI3.right
            anchors.verticalCenter: tipAI1.verticalCenter
            color: DataSource.dayNightMode === 0x01?"#333333":"#ffffff"
            font.pixelSize:32
            text: DataSource.saveElecValue
        }
        Text{
            font.bold:rootItemId.jiacu === 1
            font.family: rootItemId.ziti
            id: tipAI5
            anchors.left: tipAI4.right
            anchors.bottom: tipAI1.bottom
            color: DataSource.dayNightMode === 0x01?"#333333":"#ffffff"
            font.pixelSize:24
            text:{
                if(DataSource.saveElecUnit===0x1){
                    " kW•h" + (DataSource.language === 0x01 ? "、省油 ":" of electricity and ")
                }else if(DataSource.saveElecUnit===0x2){
                    " HP" + (DataSource.language === 0x01 ? "、省油 ":" of electricity and ")
                }else{
                    " " + (DataSource.language === 0x01 ? "、省油 ":" of electricity and ")
                }
            }
        }
        Text{
            font.bold:rootItemId.jiacu === 1
            font.family: rootItemId.ziti
            id: tipAI6
            anchors.left: tipAI5.right
            anchors.verticalCenter: tipAI1.verticalCenter
            color: DataSource.dayNightMode === 0x01?"#333333":"#ffffff"
            font.pixelSize:32
            text: DataSource.saveFuelValue
        }
        Text{
            font.bold:rootItemId.jiacu === 1
            font.family: rootItemId.ziti
            id: tipAI7
            anchors.left: tipAI6.right
            anchors.bottom: tipAI1.bottom
            color: DataSource.dayNightMode === 0x01?"#333333":"#ffffff"
            font.pixelSize:24
            text:{
                if(DataSource.comSavePowerUnit===0x1){
                    " L" + (DataSource.language === 0x01 ? "）":" of fuel)")
                }else if(DataSource.comSavePowerUnit===0x2){
                    " Gal" + (DataSource.language === 0x01 ? "）":" of fuel)")
                }else{
                    " " + (DataSource.language === 0x01 ? "）":" of fuel)")
                }
            }
        }
    }

    Item {
        id: headInfoId
        anchors.horizontalCenter: parent.horizontalCenter
        width: 1020
        height: 124-12
        //时间显示
        Item{
            id: timeDisplayId
            height: 54

            Text{
                font.bold:rootItemId.jiacu === 1
                font.family: rootItemId.ziti
                id:timeFormatId
                color: DataSource.dayNightMode === 0x02 ?"#bfffffff":"#bf333333"
                text: "下午"
                anchors.baseline: currentTimeId.baseline
                anchors.baselineOffset: -3
                anchors.right: currentTimeId.left
                anchors.rightMargin: 6
                font.pixelSize: DataSource.language === 0x01 ? 30 : 44
                visible: DataSource.timeFormat === 1 && DataSource.language === 1 ? true : false
            }

            Text{
                font.bold:rootItemId.jiacu === 1
                font.family: rootItemId.ziti
                id:timeFormatId2
                color: DataSource.dayNightMode === 0x02 ?"#bfffffff":"#bf333333"
                text: "PM"
                anchors.baseline: currentTimeId.baseline
                anchors.left: currentTimeId.right
                anchors.leftMargin: 6
                font.pixelSize: DataSource.language === 0x01 ? 30 : 44
                visible: DataSource.timeFormat === 1 && DataSource.language !== 1 ? true : false
            }

            Text{
                font.bold:rootItemId.jiacu === 1
                font.family: rootItemId.ziti
                id:currentTimeId
                color: DataSource.dayNightMode === 0x02 ?"#ffffff":"#333333"
                font.pixelSize: 45
                anchors.bottom: parent.bottom
                anchors.bottomMargin: -8
                x: timeFormatId.visible === true ? 179 : 124
            }
            Timer{
                id:timerId
                interval: 1000
                repeat: true
                running: true
                onTriggered: {
                    currentTimeId.text =  currentDateTime()
                }
                triggeredOnStart: true
            }
        }
    }

    function currentDateTime(){
        if(DataSource.timeFormat === 2){
            return Qt.formatDateTime(new Date(), "hh:mm");
        }else if(DataSource.timeFormat === 1){
            var hour = Qt.formatDateTime(new Date(), "hh");
            if(hour < 1){
                timeFormatId.text = "上午"
                timeFormatId2.text = "AM"
                return "12:" + Qt.formatDateTime(new Date(), "mm")
            } else if (hour < 12){
                timeFormatId.text = "上午"
                timeFormatId2.text = "AM"
                return Qt.formatDateTime(new Date(), "h:mm");
            } else if(hour < 13) {
                timeFormatId.text = "下午"
                timeFormatId2.text = "PM"
                return Qt.formatDateTime(new Date(), "hh:mm");
            } else {
                timeFormatId.text = "下午"
                timeFormatId2.text = "PM"
                return (hour-12)+ ":" + Qt.formatDateTime(new Date(), "mm")
            }
        }
    }
}
