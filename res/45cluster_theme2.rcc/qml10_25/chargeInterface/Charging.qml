import QtQuick 2.15
import com.byd.DataSource 1.0
import "qrc:/common/singleton"
import QtGraphicalEffects 1.15

Item {
    width:1920
    height:720
	property int currentIndex:1
    property int currentPicId: 0
    property bool isInit:false
    Component.onCompleted: {
        if(0x03 === DataSource.chargeInterfaceIndex){
            timer.start()
        }else{
            timer.stop()
        }
        updateChargingTipsText()
    }
    Image{
        id:car
        x:544
        y:184
        source: {
            if (DataSource.dayNightMode === 0x02){
                if(DataSource.carBodyType === 0x1){
                    "qrc:/images10_25/chargeDischarge/night/SUV_night.png"
                }else{
                    "qrc:/images10_25/chargeDischarge/night/car_night.png"
                }
            }else{
                if(DataSource.carBodyType === 0x1){
                    "qrc:/images10_25/chargeDischarge/day/SUV_day.png"
                }else{
                    "qrc:/images10_25/chargeDischarge/day/car_day.png"
                }
            }
        }

        cache:false
    }

    Image{
        id:batBox
        source:"qrc:/images10_25/chargeDischarge/batteryBox.png"
        x:796
        y:343
        cache: false
    }

    //充电功率
    Item{
        id:chargePower
        width:234
        height:101
        x:102
        y:(DataSource.safetyBateryDisplay === 1 || DataSource.usingPlanDisplay === 1)?249:406
        visible: DataSource.chargePowerDisplay === 1?1:0
        Image{
            id:powerIcon
            anchors.left: chargePower.left
            anchors.top: chargePower.top
            cache:false
            source: DataSource.dayNightMode === 0x02?"qrc:/images10_25/chargeDischarge/night/chargePower_icon.png":"qrc:/images10_25/chargeDischarge/day/chargePower_icon.png"
        }
        Text{
            font.bold:rootItemId.jiacu === 1
            id:powerText
            anchors.left: powerIcon.right
            anchors.leftMargin: 17
            //anchors.top:powerIcon.top
            //anchors.topMargin: -3
            anchors.bottom: powerIcon.bottom
            anchors.bottomMargin: 1
            height:36
            verticalAlignment: Text.AlignVCenter
            font.pixelSize: 38
            horizontalAlignment: Text.AlignHCenter
            text: TranslateStr.charging_chargingPowerStr
			font.family: rootItemId.ziti
            color: DataSource.dayNightMode === 0x02?"white":"black"
            opacity: 0.7
        }
        Text{
            font.bold:rootItemId.jiacu === 1
            id:powerValue
            anchors.left: chargePower.left
            anchors.top: powerIcon.bottom
            //anchors.topMargin: 12
            anchors.topMargin: 20
            font.pixelSize: 68
            horizontalAlignment: Text.AlignHCenter
            text: DataSource.chargePower
			font.family: rootItemId.ziti
            color: DataSource.dayNightMode === 0x02?"white":"black"
        }
        Text{
            font.bold:rootItemId.jiacu === 1
            id:powerUnit
            anchors.left: powerValue.right
            anchors.leftMargin: 19
            anchors.bottom: powerValue.bottom
            anchors.bottomMargin: 9
            font.pixelSize: 30
            horizontalAlignment: Text.AlignHCenter
            text: DataSource.powerUnit === 0x01?"kW":"HP"
			font.family: rootItemId.ziti
            color: DataSource.dayNightMode === 0x02?"white":"black"
            opacity: 0.7
        }
    }

    //预计充满时间
    Item{
        id:chargeTime
        height:102
        x:1468
        y:chargePower.y
        visible:DataSource.chargeInterfaceIndex === 0x03?1:0
        Image{
            id:timeIcon
            anchors.left: chargeTime.left
            anchors.top: chargeTime.top
            source: DataSource.dayNightMode === 0x02?"qrc:/images10_25/chargeDischarge/night/reserveCharge_icon.png":"qrc:/images10_25/chargeDischarge/day/reserveCharge_icon.png"
            cache:false
            visible: (DataSource.chargeFullTime === 0x01||DataSource.chargeFullTime === 0x02)?1:0
        }
        Text{
            font.bold:rootItemId.jiacu === 1
            id:chargeFullTime
            text:TranslateStr.charging_remainTimeStr
			font.family: rootItemId.ziti
            anchors.left: timeIcon.right
            anchors.leftMargin: 18
            anchors.bottom: timeIcon.bottom
            anchors.bottomMargin: 1
            height:36
            verticalAlignment: Text.AlignVCenter
            font.pixelSize: 38
            horizontalAlignment: Text.AlignHCenter
            color: DataSource.dayNightMode === 0x02?"white":"black"
            opacity: 0.7
            visible: timeIcon.visible
        }
        Text{
            id:chargeTimeHour
            text: (DataSource.chargeTimeHour === 0xFF || DataSource.chargeTimeMin > 0x3B)?"":DataSource.chargeTimeHour
            anchors.left: chargeTime.left
			font.family: "HarmonyOS Sans SC Bold"
            anchors.top: timeIcon.bottom
            anchors.topMargin: 20
            font.pixelSize: 68
            horizontalAlignment: Text.AlignHCenter
            color: DataSource.dayNightMode === 0x02?"white":"black"
            visible: DataSource.chargeFullTime === 0x02 ?true:false
        }
        Text {
            font.bold:rootItemId.jiacu === 1
            id: chargeTimeHourText
            text: TranslateStr.charging_remainTimeHStr
			font.family: rootItemId.ziti
            anchors.left: chargeTimeHour.right
            anchors.leftMargin: 10
            anchors.bottom: parent.bottom
            anchors.bottomMargin: -15
            font.pixelSize: 30
            horizontalAlignment: Text.AlignHCenter
            color: DataSource.dayNightMode === 0x02?"white":"black"
            opacity: 0.7
            visible:chargeTimeHour.visible
        }
        Text{
            id:chargeTimeMin
            text: (DataSource.chargeTimeHour === 0xFF || DataSource.chargeTimeMin > 0x3B)?"":DataSource.chargeTimeMin
            anchors.left: chargeTimeHourText.right
			font.family: "HarmonyOS Sans SC Bold"
            anchors.leftMargin: 16
            anchors.top: timeIcon.bottom
            anchors.topMargin: 20
            font.pixelSize: 68
            horizontalAlignment: Text.AlignHCenter
            color: DataSource.dayNightMode === 0x02?"white":"black"
            visible:chargeTimeHour.visible
        }
        Text {
            font.bold:rootItemId.jiacu === 1
            id: chargeTimeMinText
            text: TranslateStr.charging_remainTimeMinStr
            anchors.left: chargeTimeMin.right
			font.family: rootItemId.ziti
            anchors.leftMargin: 13
            y:chargeTimeHourText.y
            font.pixelSize: 30
            horizontalAlignment: Text.AlignHCenter
            color: DataSource.dayNightMode === 0x02?"white":"black"
            opacity: 0.7
            visible:chargeTimeHour.visible
        }

        Text{
            font.bold:rootItemId.jiacu === 1
            id:caculateText
            visible:DataSource.chargeFullTime === 0x01?true:false
            anchors.left: chargeTime.left
            anchors.bottom: parent.bottom
            anchors.bottomMargin: -12
            height: 35
            verticalAlignment: Text.AlignVCenter
            text: TranslateStr.charging_caculateStr
			font.family: rootItemId.ziti
            font.pixelSize: 38
            horizontalAlignment: Text.AlignHCenter
            color: DataSource.dayNightMode === 0x02?"white":"black"
        }
    }

    //充电中电流动画
    ListModel{
        id:picList
    }

    Item {
        anchors.fill: parent
        Repeater{
            model: picList
            Image {
                id: anim_chargeCurrent
                //x:796
                //y:344
                x:batBox.x
                y:batBox.y
                source: "qrc:/images10_25/chargeDischarge/animRechargingCurrent/IMG_"+currentPicId+".ktx"
                visible: picVisible && (DataSource.chargeInterfaceIndex === 0x03?true:false)
            }
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
        id:timer
        repeat: true
        running: false
        interval:40
        onTriggered: {
            if(currentPicId > 70){
                currentPicId = 48
                isInit = true
            }
            if(!isInit){
                hidePics()
                picList.append({"picVisible":true})
                currentPicId++
            }else{
                hidePics()
                showPic(currentPicId++)
            }
        }
    }

    //充电电量
    Item{
        visible: DataSource.chargeBatSocDisplay === 1 ? 1:0
        Image{
            id:chargeSoc
            x:batBox.x-40
            y:344-100
            source: "qrc:/images10_25/chargeDischarge/animCharging/IMG_"+DataSource.chargeBatSoc+".ktx"
            cache: false
        }
        //充电电量值
        Text{
            font.bold:rootItemId.jiacu === 1
            id:socValue
            //x:car.x+car.width/2-50//58
            x:chargeSoc.x+(chargeSoc.width-socValue.width-6-socPercent.width)/2
            y:batBox.y-10
            text: DataSource.chargeBatSoc
			
			font.family: rootItemId.ziti
            font.pixelSize: 90
            color: "white"
            horizontalAlignment: Text.AlignHCenter
            opacity: 0.75
        }
        Text{
            font.bold:rootItemId.jiacu === 1
            id:socPercent
            y:batBox.y+20
            anchors.left: socValue.right
            anchors.leftMargin: 12
			font.family: rootItemId.ziti
            text: "%"
            font.pixelSize: 36
            color: DataSource.dayNightMode === 0x02?"white":"black"
            horizontalAlignment: Text.AlignHCenter
        }
        DropShadow {
            anchors.fill: socValue
            verticalOffset: 8
            radius: 8
            samples: 17
            color: "#000000"
            source: socValue
            visible: socValue.visible
        }
    }

    //安全电量
    Item{
        id:chargeSafeBatSoc
        width:203
        height:100
        x:chargePower.x
        y:406
        //anchors.left: chargePower.left
        //anchors.top: chargePower.bottom
        //anchors.topMargin: 56
        visible: (DataSource.chargeInterfaceIndex === 3 && DataSource.safetyBateryDisplay === 1)?1:0
        Image{
            id:safeSocIcon
            anchors.left: parent.left
            anchors.top: parent.top
            cache: false
            source: DataSource.dayNightMode === 0x02?"qrc:/images10_25/chargeDischarge/night/chargePower_icon.png":"qrc:/images10_25/chargeDischarge/day/chargePower_icon.png"
        }
        Text{
            font.bold:rootItemId.jiacu === 1
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
            horizontalAlignment: Text.AlignHCenter
            text: TranslateStr.charging_safeBatteryStr
			font.family: rootItemId.ziti
            color: DataSource.dayNightMode === 0x02?"white":"black"
            opacity: 0.7
        }
        Text{
            font.bold:rootItemId.jiacu === 1
            id:safeSocVal
            anchors.left: parent.left
            anchors.top: safeSocIcon.bottom
            anchors.topMargin: 20
            font.pixelSize: 68
            horizontalAlignment: Text.AlignHCenter
            text: DataSource.safetyBatterySoc
			font.family: rootItemId.ziti
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
            font.pixelSize: 30
            horizontalAlignment: Text.AlignHCenter
            font.family: rootItemId.ziti
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
        x:chargeTime.x
        y:chargeSafeBatSoc.y
        width: 351
        height: 100
        visible: (DataSource.chargeInterfaceIndex === 3 && DataSource.usingPlanDisplay === 1)?1:0
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
            id:usingPlanTimeText
            text: TranslateStr.charging_plannedCarTimeStr
			font.family: rootItemId.ziti
            anchors.left: usingPlanTimeIcon.right
            anchors.leftMargin: 18
            anchors.bottom: usingPlanTimeIcon.bottom
            anchors.bottomMargin: 1
            height:36
            verticalAlignment: Text.AlignVCenter
            font.pixelSize: 38
            opacity: 0.7
            color: DataSource.dayNightMode === 0x02?"white":"black"
        }
        //日期类型
        Text{
            font.bold:rootItemId.jiacu === 1
            id:usingPlanDateType1
            anchors.right: usingPlanTimeText.left
            anchors.rightMargin: -45
            anchors.bottom: usingPlanHour.bottom
            anchors.bottomMargin: DataSource.language === 0x1?13:10
			font.family: rootItemId.ziti
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
			font.family: "HarmonyOS Sans SC Bold"
            text: DataSource.language === 0x1?(usingPlanTime.usingPlanMonDay_zh_display?DataSource.usingPlanDateMonth+"月"+DataSource.usingPlanDateDay+"日":""):
                                               month_en(DataSource.usingPlanDateMonth,DataSource.usingPlanDateDay)+day_en(DataSource.usingPlanDateMonth,DataSource.usingPlanDateDay)
            color: DataSource.dayNightMode === 0x02?"white":"black"
            visible: (DataSource.usingPlanDateType === 0||DataSource.usingPlanDateType===3)?true:false
        }

        Text{
            font.bold:rootItemId.jiacu === 1
            id:usingPlanHour
            //            anchors.left: usingPlanTime.left
            //            anchors.leftMargin: 155
            anchors.left: (DataSource.usingPlanDateType === 1||DataSource.usingPlanDateType===2)?usingPlanTime.left:usingPlanDateType2.right
            anchors.leftMargin: (DataSource.usingPlanDateType === 1||DataSource.usingPlanDateType===2)?155:/*2*/11
            anchors.top: usingPlanTimeIcon.bottom
            anchors.topMargin: 20
			font.family: rootItemId.ziti
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
			font.family: rootItemId.ziti
            text: ":"
            font.pixelSize: 50
            color: DataSource.dayNightMode === 0x02?"white":"black"
            opacity: 0.7

        }
        Text{
            font.bold:rootItemId.jiacu === 1
            id:usingPlanMin
            y:usingPlanHour.y
            anchors.left: splitText.right
            anchors.leftMargin: /*15*/6
			font.family: rootItemId.ziti
            text: DataSource.usingPlanDateMin<10?qsTr("0"+DataSource.usingPlanDateMin):DataSource.usingPlanDateMin
            font.pixelSize: 68
            color: DataSource.dayNightMode === 0x02?"white":"black"
        }
    }

    //充电温馨提示
    Text{
        font.bold:rootItemId.jiacu === 1
        font.family: rootItemId.ziti
        id:tips
        width:900
        height:80
        anchors.top: parent.top
        anchors.topMargin:/*585*/580
        wrapMode: DataSource.language === 1 ? Text.NoWrap : Text.WordWrap
        verticalAlignment: Text.AlignVCenter
        anchors.horizontalCenter: parent.horizontalCenter
        horizontalAlignment: Text.AlignHCenter
        font.pixelSize: 33
        visible: (DataSource.chargeInterfaceIndex === 0x03 || DataSource.chargeInterfaceIndex === 0x05)?1:0
        lineHeightMode: DataSource.language === 1 ? Text.ProportionalHeight : Text.FixedHeight
        lineHeight: DataSource.language === 1 ? 1 : 35
        //text: updateChargingTipsText()
    }

    Connections{
        target: DataSource
        function onChargeTipChanged(){
            updateChargingTipsText();
        }
        function onChargeSuspendTipChanged(){
            updateChargingTipsText();
        }
        function onVehicleTypeChanged(){
            updateChargingTipsText();
        }
        function onDayNightModeChanged(){
            updateChargingTipsText();
        }
        function onPowerGearChanged(){
            updateChargingTipsText();
        }
        function onChargeInterfaceIndexChanged(){
            if(0x03 === DataSource.chargeInterfaceIndex){
                timer.start()
            }else{
                timer.stop()
            }
            updateChargingTipsText();
        }
        function onTranslateLoadCompleteChanged(){
            updateChargingTipsText()
        }
    }

    function updateChargingTipsText(){
        if(DataSource.chargeInterfaceIndex === 0x05){
            switch(DataSource.chargeSuspendTip){
            case 0x1:
                tips.text = TranslateStr.chargingSuspended_tip_0x1Str
                tips.color = DataSource.dayNightMode === 0x02?"white":"black"
                break
            case 0x2:
                tips.text = TranslateStr.chargingSuspended_tip_0x2Str
                tips.color = DataSource.dayNightMode === 0x02?"white":"black"
                break
            default:
                tips.text = ""
                break
            }
        }else{
            switch(DataSource.chargeTip){
            case 0x02:
                tips.text = DataSource.vehicleType === 0x01?TranslateStr.charging_ev_tips2Str:TranslateStr.charging_hev_tips2Str
                tips.color = DataSource.dayNightMode === 0x02?"white":"black"
                break
            case 0x03:
                tips.text = DataSource.vehicleType === 0x01?TranslateStr.charging_ev_tips3Str:TranslateStr.charging_hev_tips3Str
                tips.color = "#fff000"
                break
            case 0x04:
                tips.text = TranslateStr.charging_tips4Str
                tips.color = "#fff000"
                break
            case 0x05:
                tips.text = TranslateStr.charging_tips5Str
                tips.color = "#fff000"
                break
            case 0x06:
                tips.text = TranslateStr.charging_tips6Str
                tips.color = "#fff000"
                break
            case 0x07:
                tips.text = TranslateStr.charging_tips7Str
                tips.color = "#fff000"
                break
            case 0x08:
                tips.text = TranslateStr.charging_tips8Str
                tips.color = DataSource.dayNightMode === 0x02?"white":"black"
                break
            case 0x09:
                tips.text = TranslateStr.charging_tips9Str
                tips.color = DataSource.dayNightMode === 0x02?"white":"black"
                break
            case 0x0A:
                tips.text = TranslateStr.charging_tipsAStr
                tips.color = DataSource.dayNightMode === 0x02?"white":"black"
                break
            case 0x0B:
                tips.text = TranslateStr.charging_tipsBStr
                tips.color = DataSource.dayNightMode === 0x02?"white":"black"
                break
            case 0x0C:
                tips.text = TranslateStr.charging_tipsCStr
                tips.color = DataSource.dayNightMode === 0x02?"white":"black"
                break
            case 0x0D:
                tips.text = TranslateStr.charging_tipsDStr
                tips.color = DataSource.dayNightMode === 0x02?"white":"black"
                break
            default:
                tips.text = ""
                break
            }
        }
    }
Image {
    id: haoGe
	y:-80
    cache: false
    visible: DataSource.chargeInterfaceIndex === 0x03
}
function updateImage() {
        haoGe.source = "qrc:/images10_25/chargeDischarge/megaCharge/IMG_" + currentIndex.toString().padStart(3, '0') + ".png";
    }
    Timer {
	    id: zhangGe
        interval: 60
        running: DataSource.chargeInterfaceIndex === 0x03
        repeat: true
        onTriggered: {
        if (currentIndex < 23) {  
            currentIndex++;
            updateImage();
        } else {
            currentIndex = 1; 
        }
        }
    }		
}
