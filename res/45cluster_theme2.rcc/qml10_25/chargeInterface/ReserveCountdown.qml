import QtQuick 2.0
import com.byd.DataSource 1.0
import "qrc:/common/singleton"

Item {
    width:1920
    height:720
    //预约充电开始时间
    Rectangle{
        id:reserveStartMid
        anchors.horizontalCenter: parent.horizontalCenter
        y:303
        width:444
        height:198
        color: "transparent"
        //visible: DataSource.reserveCountDownFlag === 2 ? 1 : 0
        Text{
            font.bold:rootItemId.jiacu === 1
            font.family: rootItemId.ziti
            id:startText
            height: 36
            verticalAlignment:Text.AlignVCenter
            //anchors.left: reserveStartMid.left
            //anchors.leftMargin: 72
            anchors.horizontalCenter: parent.horizontalCenter
            anchors.top: reserveStartMid.top
            visible: (DataSource.reserveCountDownFlag === 2||DataSource.reserveCountDownFlag === 3) ? 1 : 0
            text: TranslateStr.charging_chargingStartTimeStr
            font.pixelSize: 38
            color: DataSource.dayNightMode === 0x02?"white":"black"
            opacity: 0.7
        }
        Text {
            font.bold:rootItemId.jiacu === 1
            font.family: rootItemId.ziti
            id: startHour
            x:startText.x + (startText.width-startHour.width-splitText0.width-startMin.width-21-21)/2
            y:73
            //anchors.top: startText.bottom
            //anchors.topMargin: 7
            text: DataSource.reserveStartHour<10?qsTr("0"+DataSource.reserveStartHour):DataSource.reserveStartHour
            font.pixelSize: 105
            color: DataSource.dayNightMode === 0x02?"white":"black"
            visible: DataSource.reserveCountDownFlag === 2 ? true:(DataSource.reserveCountDownFlag === 3?
                                                                       ((DataSource.reserveStartMin>=0 && DataSource.reserveStartMin<=59 &&
                                                                         DataSource.reserveStartHour>=0 && DataSource.reserveStartHour<=23)? true:false):false)
        }
        Text{
            font.bold:rootItemId.jiacu === 1
            id:splitText0
            //anchors.bottom: startHour.bottom
            //anchors.bottomMargin: -10
            anchors.baseline: startHour.baseline
            anchors.baselineOffset: -6
            anchors.left: startHour.right
            anchors.leftMargin: 21
            text: ":"
            font.family: rootItemId.ziti
            //font.pixelSize: 105
            font.pixelSize: 85
            color: DataSource.dayNightMode === 0x02?"white":"black"
            opacity: 0.7
            visible:startHour.visible

        }
        Text{
            font.bold:rootItemId.jiacu === 1
            font.family: rootItemId.ziti
            id:startMin
            anchors.left: splitText0.right
            anchors.leftMargin:21
            anchors.baseline: startHour.baseline
            text: DataSource.reserveStartMin<10?qsTr("0"+DataSource.reserveStartMin):DataSource.reserveStartMin
            font.pixelSize: 105
            color: DataSource.dayNightMode === 0x02?"white":"black"
            visible:startHour.visible
        }
        //日期类型 今天/明天
        Text{
            font.bold:rootItemId.jiacu === 1
            font.family: rootItemId.ziti
            id:reserveStartDateType1
            anchors.horizontalCenter: startText.horizontalCenter
            y:/*175*/170
            text: DataSource.reserveStartDateType ===1 ?TranslateStr.charging_todayStr:TranslateStr.charging_tomorrowStr
            font.pixelSize: 36
            color: DataSource.dayNightMode === 0x02?"white":"black"
            opacity: 0.7
            //visible: (DataSource.reserveStartDateType === 1||DataSource.reserveStartDateType===2)?true:false
            visible: (DataSource.reserveCountDownFlag === 2)&&(DataSource.reserveStartDateType === 1||DataSource.reserveStartDateType===2)
        }

        //日期类型 *月*日
        Item{
            id:reserveStartDateType2
            height: 28
            //            anchors.bottom: reserveStartMid.bottom
            //            anchors.bottomMargin: 30
            y:170
            visible: {//月、日显示条件
                if(DataSource.reserveCountDownFlag === 3){//纯电且日月或时分至少一个有效
                    if(DataSource.reserveStartMonth<1 || DataSource.reserveStartMonth>12 ||
                            DataSource.reserveStartDay<1 || DataSource.reserveStartDay>31){//日，月数字无效则不显示
                        false
                    }else{
                        true
                    }
                }else if(DataSource.reserveCountDownFlag === 2 && (DataSource.reserveStartDateType === 0 || DataSource.reserveStartDateType === 3)
                         && 1<=DataSource.reserveStartMonth && DataSource.reserveStartMonth<=12
                         && 1<=DataSource.reserveStartDay && DataSource.reserveStartDay<=31){
                    true
                }else{//当DataSource.reserveCountDownFlag = 0
                    false
                }
            }
            Item{
                id:monthDay_zh
                visible: DataSource.language === 0x1
                height: 28
                Text{
                    font.bold:rootItemId.jiacu === 1
                    font.family: rootItemId.ziti
                    id:reserveStartMonth
                    font.pixelSize: 48
                    color: DataSource.dayNightMode === 0x02?"white":"black"
                    text:DataSource.reserveStartMonth
                    x: startText.x + (startText.width-reserveStartMonth.width-reserveStartMonthText.width-reserveStartDay.width-reserveStartDayText.width-12-12-24)/2
                }
                Text{
                    font.bold:rootItemId.jiacu === 1
                    font.family: rootItemId.ziti
                    id:reserveStartMonthText
                    anchors.left: reserveStartMonth.right
                    anchors.leftMargin: 12
                    anchors.baseline: reserveStartMonth.baseline
                    font.pixelSize: 18
                    color: DataSource.dayNightMode === 0x02?"white":"black"
                    text: "月"
                    opacity: 0.7
                }
                Text{
                    font.bold:rootItemId.jiacu === 1
                    font.family: rootItemId.ziti
                    id:reserveStartDay
                    anchors.left: reserveStartMonthText.right
                    anchors.leftMargin: 24
                    anchors.baseline: reserveStartMonth.baseline
                    font.pixelSize: 48
                    color: DataSource.dayNightMode === 0x02?"white":"black"
                    text:DataSource.reserveStartDay
                }
                Text{
                    font.bold:rootItemId.jiacu === 1
                    font.family: rootItemId.ziti
                    id:reserveStartDayText
                    anchors.left: reserveStartDay.right
                    anchors.leftMargin: 12
                    anchors.baseline: reserveStartDay.baseline
                    font.pixelSize: 18
                    color: DataSource.dayNightMode === 0x02?"white":"black"
                    text: "日"
                    opacity: 0.7
                }

            }

            Text{
                font.bold:rootItemId.jiacu === 1
                font.family: rootItemId.ziti
                id:monthDay_en
                x: startText.x + (startText.width - monthDay_en.width)/2
                text: DataSource.reserveStartMonth === 5?
                          month_en(DataSource.reserveStartMonth,DataSource.reserveStartDay)+day_en(DataSource.reserveStartMonth,DataSource.reserveStartDay)
                        :month_en(DataSource.reserveStartMonth,DataSource.reserveStartDay)+" "+day_en(DataSource.reserveStartMonth,DataSource.reserveStartDay)
                font.pixelSize: 35
                color: DataSource.dayNightMode === 0x02?"white":"black"
                visible: DataSource.language !== 0x1

            }
        }
    }

    //计划更新中，请稍候
    Rectangle{
        id:planUpdateMid
        anchors.horizontalCenter: parent.horizontalCenter
        y:302
        width:246
        height: 131
        color: "transparent"
        visible: DataSource.reserveCountDownFlag === 1 ? 1 : 0
        Text{
            font.bold:rootItemId.jiacu === 1
            font.family: rootItemId.ziti
            id:text1
            anchors.horizontalCenter: planUpdateMid.horizontalCenter
            anchors.top: planUpdateMid.top
            height: 34
            verticalAlignment: Text.AlignVCenter
            text: TranslateStr.charging_chargingPlanStr
            font.pixelSize: 36
            color: DataSource.dayNightMode === 0x02?"white":"black"
            opacity: 0.7
        }
        Text{
            font.bold:rootItemId.jiacu === 1
            font.family: rootItemId.ziti
            anchors.horizontalCenter: planUpdateMid.horizontalCenter
            //anchors.top: text1.bottom
            //anchors.topMargin: 40
            anchors.bottom: parent.bottom
            height: 57
            verticalAlignment: Text.AlignVCenter
            text: TranslateStr.charging_chargingHoldOnStr
            font.pixelSize: 62
            color: DataSource.dayNightMode === 0x02?"white":"black"
        }
    }
    //安全电量
    Item{
        id:chargeSafeBatSoc
        width:203
        height:100
        x:101
        y:406
        //visible: DataSource.safetyBateryDisplay === 1?1:0
        visible: (DataSource.vehicleType === 2 && DataSource.safetyBateryDisplay === 1)?1:0
        Image{
            id:safeSocIcon
            anchors.left: parent.left
            anchors.top: parent.top
            cache: false
            source: DataSource.dayNightMode === 0x02?"qrc:/images10_25/chargeDischarge/night/chargePower_icon.png":"qrc:/images10_25/chargeDischarge/day/chargePower_icon.png"
        }
        Text{
            font.bold:rootItemId.jiacu === 1
            font.family: rootItemId.ziti
            id:safeSocText
            anchors.left: safeSocIcon.right
            anchors.leftMargin: 17
            //anchors.top: safeSocIcon.top
            //anchors.topMargin: -3
            anchors.bottom: safeSocIcon.bottom
            anchors.bottomMargin: 1
            height:36
            verticalAlignment: Text.AlignVCenter
            font.pixelSize: 38
            text: TranslateStr.charging_safeBatteryStr
            color: DataSource.dayNightMode === 0x02?"white":"black"
            opacity: 0.7
        }
        Text{
            font.bold:rootItemId.jiacu === 1
            font.family: rootItemId.ziti
            id:safeSocVal
            anchors.left: parent.left
            anchors.top: safeSocIcon.bottom
            anchors.topMargin: 20
            font.pixelSize: 68
            horizontalAlignment: Text.AlignHCenter
            text: DataSource.safetyBatterySoc
            color: DataSource.dayNightMode === 0x02?"white":"black"
        }
        Text{
            font.bold:rootItemId.jiacu === 1
            anchors.left: safeSocVal.right
            anchors.leftMargin: 13
            anchors.baseline: safeSocVal.baseline
            anchors.baselineOffset: -4
            //anchors.bottom: safeSocVal.bottom
            //anchors.bottomMargin: 13
            font.family: rootItemId.ziti
            font.pixelSize: 30
            horizontalAlignment: Text.AlignHCenter
            text: "%"
            opacity: 0.7
            color: DataSource.dayNightMode === 0x02?"white":"black"
        }
    }

    property var monthStr: ["Jan.","Feb.","Mar.","Apr.","May ", "Jun.","Jul.","Aug.","Sep.","Oct.", "Nov.","Dec."]
    function day_en (mon,day) {
        if((day>0 && day<32) && (mon>0 && mon <13)){
            return day + (['st', 'nd', 'rd'][day < 20 ? day - 1 : day % 10 - 1] || 'th')
        }
        else{
            return ""
        }

    }

    function month_en(mon,day){
        if((day>0 && day<32) && (mon>0 && mon <13)){
            return monthStr[mon-1]
        }else{
            return ""
        }
    }

    //计划用车时间
    Item{
        id:usingPlanTime
        x:1467
        y:chargeSafeBatSoc.y
        width: 351
        height: 100
        visible: (DataSource.vehicleType === 2 && DataSource.usingPlanDisplay === 1)?1:0
        property bool usingPlanMonDay_zh_display: (DataSource.usingPlanDateMonth >= 1 && DataSource.usingPlanDateMonth<= 12 && DataSource.usingPlanDateDay>= 1 && DataSource.usingPlanDateDay<=31)
        Image{
            id:usingPlanTimeIcon
            anchors.left: parent.left
            anchors.top: parent.top
            cache: false
            source: DataSource.dayNightMode === 0x02?"qrc:/images10_25/chargeDischarge/night/reserveCharge_icon.png":"qrc:/images10_25/chargeDischarge/day/reserveCharge_icon.png"
        }
        Text{
            font.bold:rootItemId.jiacu === 1
            font.family: rootItemId.ziti
            id:usingPlanTimeText
            anchors.bottom: usingPlanTimeIcon.bottom
            anchors.bottomMargin: 1
            anchors.left: usingPlanTimeIcon.right
            anchors.leftMargin: 18
            height:36
            verticalAlignment: Text.AlignVCenter
            text: TranslateStr.charging_plannedCarTimeStr
            font.pixelSize: 38
            opacity: 0.7
            color: DataSource.dayNightMode === 0x02?"white":"black"
        }
        //日期类型
        Text{
            font.bold:rootItemId.jiacu === 1
            font.family: rootItemId.ziti
            id:usingPlanDateType1
            anchors.right: usingPlanTimeText.left
            anchors.rightMargin: -45
            anchors.bottom: usingPlanHour.bottom
            anchors.bottomMargin:  DataSource.language === 0x1?13:10
            font.pixelSize: /*38*/35
            text: DataSource.usingPlanDateType ===1 ?TranslateStr.charging_todayStr:TranslateStr.charging_tomorrowStr
            color: DataSource.dayNightMode === 0x02?"white":"black"
            visible: (DataSource.usingPlanDateType === 1||DataSource.usingPlanDateType===2)?true:false
        }
        Text{
            id:usingPlanDateType2
            anchors.left: parent.left
            anchors.bottom: usingPlanHour.bottom
            anchors.bottomMargin:  DataSource.language === 0x1?13:10
            font.pixelSize: /*38*/35
            text: DataSource.language === 0x1?(usingPlanTime.usingPlanMonDay_zh_display?DataSource.usingPlanDateMonth+"月"+DataSource.usingPlanDateDay+"日":""):
                                               month_en(DataSource.usingPlanDateMonth,DataSource.usingPlanDateDay)+day_en(DataSource.usingPlanDateMonth,DataSource.usingPlanDateDay)
            color: DataSource.dayNightMode === 0x02?"white":"black"
            visible: (DataSource.usingPlanDateType === 0||DataSource.usingPlanDateType===3)?true:false
        }

        Text{
            font.bold:rootItemId.jiacu === 1
            font.family: rootItemId.ziti
            id:usingPlanHour
            //            anchors.left: usingPlanTime.left
            //            anchors.leftMargin: 155
            anchors.left: (DataSource.usingPlanDateType === 1||DataSource.usingPlanDateType===2)?usingPlanTime.left:usingPlanDateType2.right
            anchors.leftMargin: (DataSource.usingPlanDateType === 1||DataSource.usingPlanDateType===2)?155:/*2*/11
            anchors.top: usingPlanTimeIcon.bottom
            anchors.topMargin: 20
            text: DataSource.usingPlanDateHour<10?qsTr("0"+DataSource.usingPlanDateHour):DataSource.usingPlanDateHour
            font.pixelSize: 68
            color: DataSource.dayNightMode === 0x02?"white":"black"
        }
        Text{
            font.bold:rootItemId.jiacu === 1
            id:splitText
            //anchors.baseline: usingPlanHour.baseline
            //y:usingPlanHour.y+(usingPlanHour.height-splitText.height)/2
            anchors.baseline: usingPlanHour.baseline
            anchors.baselineOffset: -6
            anchors.left: usingPlanHour.right
            anchors.leftMargin: /*9*/6
            text: ":"
            font.family: rootItemId.ziti
            font.pixelSize: 50
            color: DataSource.dayNightMode === 0x02?"white":"black"
            opacity: 0.7

        }
        Text{
            font.bold:rootItemId.jiacu === 1
            font.family: rootItemId.ziti
            id:usingPlanMin
            y:usingPlanHour.y
            anchors.left: splitText.right
            anchors.leftMargin: /*15*/6
            text: DataSource.usingPlanDateMin<10?qsTr("0"+DataSource.usingPlanDateMin):DataSource.usingPlanDateMin
            font.pixelSize: 68
            color: DataSource.dayNightMode === 0x02?"white":"black"
        }
    }

    //温馨提示
    Text{
        font.bold:rootItemId.jiacu === 1
        font.family: rootItemId.ziti
        width:800
        anchors.top: parent.top
        anchors.topMargin:/*575*/585
        wrapMode: DataSource.language === 1 ? Text.NoWrap : Text.WordWrap
        verticalAlignment: Text.AlignVCenter
        horizontalAlignment: Text.AlignHCenter
        height:80
        anchors.horizontalCenter: parent.horizontalCenter
        lineHeightMode: DataSource.language === 1 ? Text.ProportionalHeight : Text.FixedHeight
        lineHeight: DataSource.language === 1 ? 1 : 35
        text: DataSource.vehicleType === 0x01?TranslateStr.reserve_ev_tipStr:TranslateStr.reserve_hev_tipStr
        font.pixelSize: 33
        color: DataSource.dayNightMode === 0x02?"white":"black"
    }
}
