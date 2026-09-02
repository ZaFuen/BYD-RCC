import QtQuick 2.15
import com.byd.DataSource 1.0
import "qrc:/common/singleton"
import QtGraphicalEffects 1.15
Item {
property int currentIndex:1
    width:1920
    height:720
    property int currentPicId: 0
    property bool isInit:false
    Component.onCompleted: {
        if(0x02 === DataSource.dischargeInterfaceIndex){
            timer.start()
		
        }else{
            timer.stop()
        }
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
        anchors.horizontalCenter: parent.horizontalCenter
    }

    //放电功率
    Item{
        id:dischargePower
        width:234
        height: 101
        x:102
        y:249
        visible: (DataSource.vehicleType === 0x02 && DataSource.dischargePowerDisplay === 1)?1:0
        Image{
            id:powerIcon
            anchors.left: dischargePower.left
            anchors.top: dischargePower.top
            cache: false
            source:DataSource.dayNightMode === 0x02?"qrc:/images10_25/chargeDischarge/night/chargePower_icon.png":"qrc:/images10_25/chargeDischarge/day/chargePower_icon.png"
        }
        Text{
            font.bold:rootItemId.jiacu === 1
            id:powerText
            anchors.left: powerIcon.right
            anchors.leftMargin: 15
            //anchors.top: powerIcon.top
            //anchors.topMargin: -3
            anchors.bottom: powerIcon.bottom
            anchors.bottomMargin: 1
            height: 36
            verticalAlignment:Text.AlignVCenter
            font.pixelSize: 38
            horizontalAlignment: Text.AlignHCenter
            text: DataSource.language === 0x02 ?"Discharge Power":"放电功率"
			font.family: rootItemId.ziti
            color: DataSource.dayNightMode === 0x02?"white":"black"
            opacity: 0.7
        }
        Text{
            font.bold:rootItemId.jiacu === 1
            id:powerValue
            anchors.left: dischargePower.left
            anchors.top: powerIcon.bottom
            anchors.topMargin: 20
            font.pixelSize: 68
            horizontalAlignment: Text.AlignHCenter
            text: DataSource.dischargePower
			font.family: rootItemId.ziti
            color: DataSource.dayNightMode === 0x02?"white":"black"
        }
        Text{
            font.bold:rootItemId.jiacu === 1
            id:powerUnit
            anchors.left: powerValue.right
            anchors.leftMargin: 19
            anchors.baseline: powerValue.baseline
            font.pixelSize: 30
            horizontalAlignment: Text.AlignHCenter
            text: DataSource.powerUnit === 0x01?"kW":"HP"
			font.family: rootItemId.ziti
            color: DataSource.dayNightMode === 0x02?"white":"black"
            opacity: 0.7
        }
    }

    //对外放电电量
    Item{
        id:exterDischargeEnergy
        width: 232
        height:98
        x:1457
        y:253
        visible: DataSource.exterEnergyDisplay === 1?1:0
        Text{
            font.bold:rootItemId.jiacu === 1
            id:exterEnergyText
            anchors.left: exterDischargeEnergy.left
            anchors.leftMargin: 1
            anchors.top: exterDischargeEnergy.top
            height: 35
            //verticalAlignment: Text.AlignVCenter
            verticalAlignment: Text.AlignBottom
            font.pixelSize: 38
            horizontalAlignment: Text.AlignHCenter
            text: DataSource.language === 0x02 ?"Power":"放电电量"
			font.family: rootItemId.ziti
            color: DataSource.dayNightMode === 0x02?"white":"black"
            opacity: 0.7
        }
        Text {
            font.bold:rootItemId.jiacu === 1
            id: exterEnergyVal
            anchors.left: exterDischargeEnergy.left
            anchors.top: exterEnergyText.bottom
            //anchors.topMargin: 10
            anchors.topMargin: 23
            font.pixelSize: 68
            horizontalAlignment: Text.AlignHCenter
            text: DataSource.externalDischargeEnergy
			font.family: rootItemId.ziti
            color: DataSource.dayNightMode === 0x02?"white":"black"
        }
        Text{
            font.bold:rootItemId.jiacu === 1
            id:exterEnergyUnit
            anchors.left: exterEnergyVal.right
            anchors.leftMargin: 21
            anchors.baseline: exterEnergyVal.baseline
            font.pixelSize: 30
            horizontalAlignment: Text.AlignHCenter
            text: DataSource.powerUnit === 0x02?"HP·h":"kW·h"
			font.family: rootItemId.ziti
            color: DataSource.dayNightMode === 0x02?"white":"black"
            opacity: 0.8
        }
    }
    //剩余放电时长
    Item{
        id:dischargeRemainTime
        width: 277
        height:101
        x:1468
        y:dischargePower.y
        visible: (0x02 === DataSource.dischargeInterfaceIndex && DataSource.vehicleType === 0x02 && DataSource.dischargeRemainTime === 0x01)?1:0
        Image{
            id:timeIcon
            anchors.left: dischargeRemainTime.left
            anchors.leftMargin: DataSource.language === 0x2? -85:0
            anchors.top: dischargeRemainTime.top
            source: DataSource.dayNightMode === 0x02?"qrc:/images10_25/chargeDischarge/night/reserveCharge_icon.png":"qrc:/images10_25/chargeDischarge/day/reserveCharge_icon.png"
            cache:false
        }
        Text{
            font.bold:rootItemId.jiacu === 1
            id:dischargeRemainTimeText
            text:TranslateStr.dischargeInterface_dischargingTimeStr
			font.family: rootItemId.ziti
            anchors.left: timeIcon.right
            anchors.leftMargin: 13
            //anchors.top: timeIcon.top
            anchors.bottom: timeIcon.bottom
            anchors.bottomMargin: 1
            height: 36
            verticalAlignment: Text.AlignVCenter
            font.pixelSize: 38
            horizontalAlignment: Text.AlignHCenter
            color: DataSource.dayNightMode === 0x02?"white":"black"
            opacity: 0.7
        }
        Text{
            font.bold:rootItemId.jiacu === 1
            id:dischargeTimeHour
            text:DataSource.chargeTimeHour
			font.family: rootItemId.ziti
            anchors.left: timeIcon.left
            anchors.top: timeIcon.bottom
            anchors.topMargin: 20
            font.pixelSize: 68
            horizontalAlignment: Text.AlignHCenter
            color: DataSource.dayNightMode === 0x02?"white":"black"
        }
        Text {
            font.bold:rootItemId.jiacu === 1
            id: dischargeTimeHourText
            text: TranslateStr.charging_remainTimeHStr
			font.family: rootItemId.ziti
            anchors.left: dischargeTimeHour.right
            anchors.leftMargin: 10
            //anchors.bottom: dischargeTimeHour.bottom
            //anchors.bottomMargin: 8.5
            anchors.baseline: dischargeTimeHour.baseline
            anchors.baselineOffset:DataSource.language === 0x2?0:-4
            font.pixelSize: 30
            horizontalAlignment: Text.AlignHCenter
            color: DataSource.dayNightMode === 0x02?"white":"black"
            opacity: 0.7
        }
        Text{
            font.bold:rootItemId.jiacu === 1
            id:dischargeTimeMin
            text:DataSource.chargeTimeMin
			font.family: rootItemId.ziti
            anchors.left: dischargeTimeHourText.right
            anchors.leftMargin: 16
            anchors.bottom: dischargeTimeHour.bottom
            font.pixelSize: 68
            horizontalAlignment: Text.AlignHCenter
            color: DataSource.dayNightMode === 0x02?"white":"black"
        }
        Text {
            font.bold:rootItemId.jiacu === 1
            id: dischargeTimeMinText
            text: TranslateStr.charging_remainTimeMinStr
			font.family: rootItemId.ziti
            anchors.left: dischargeTimeMin.right
            anchors.leftMargin: 13
            //anchors.bottom: dischargeTimeHour.bottom
            //anchors.bottomMargin: 8.5
            anchors.baseline: dischargeTimeHour.baseline
            anchors.baselineOffset:DataSource.language === 0x2?0:-4
            font.pixelSize: 30
            horizontalAlignment: Text.AlignHCenter
            color: DataSource.dayNightMode === 0x02?"white":"black"
            opacity: 0.7
        }
    }
    //放电中电流动画
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
                source: "qrc:/images10_25/chargeDischarge/animDischargingCurrent/IMG_"+currentPicId+".ktx"
                visible: picVisible && (DataSource.dischargeInterfaceIndex === 0x02?true:false)
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

Image {
    id: haoGe
	y:-80
    cache: false
    visible: DataSource.dischargeInterfaceIndex === 0x02?true:false
}
function updateImage() {
        haoGe.source = "qrc:/images10_25/chargeDischarge/megaCharge/IMG_" + currentIndex.toString().padStart(3, '0') + ".png";
    }
    Timer {
	    id: zhangGe
        interval: 60
        running: DataSource.dischargeInterfaceIndex === 0x02?true:false
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

    //当前电量
    Item{
        visible: DataSource.chargeBatSocDisplay === 1 ? 1:0
        Image{
            id:chargeSoc
            //x:batBox.x
            y:344-100
            x:batBox.x-40
            source: "qrc:/images10_25/chargeDischarge/animCharging/IMG_"+DataSource.chargeBatSoc+".ktx"
            cache: false
        }
        //当前电量值
        Text{
            font.bold:rootItemId.jiacu === 1
            id:socValue
            //x:car.x+car.width/2-50//58
            x:chargeSoc.x+(chargeSoc.width-socValue.width-12-socPercent.width)/2
            y:batBox.y-10
            text: DataSource.chargeBatSoc
			font.family: rootItemId.ziti
            font.pixelSize: 90
            color: "white"
            opacity: 0.75
            visible: (DataSource.dischargeInterfaceIndex === 0x02 ||DataSource.dischargeInterfaceIndex === 0x03 || DataSource.dischargeInterfaceIndex === 0x05) ?1:0
            horizontalAlignment: Text.AlignHCenter
        }
        Text{
            font.bold:rootItemId.jiacu === 1
            id:socPercent
            anchors.left: socValue.right
            anchors.leftMargin: 12
            y:batBox.y+20
            text: "%"
            font.pixelSize: 36
			font.family: rootItemId.ziti
            color: DataSource.dayNightMode === 0x02?"white":"black"
            horizontalAlignment: Text.AlignHCenter
            visible: socValue.visible
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
    Image{
        id:mainAlert
        source: "qrc:/images10_25/chargeDischarge/mainAlert.png"
        anchors.horizontalCenter: parent.horizontalCenter
        anchors.verticalCenter: parent.verticalCenter
        cache: false
        visible: DataSource.dischargeInterfaceIndex === 0x04?1:0
    }
    //放电温馨提示
    Text{
        id:tips
        anchors.horizontalCenter: parent.horizontalCenter
        width:840
        height:80
        anchors.top: parent.top
        anchors.topMargin:/*575*/585
        wrapMode: DataSource.language === 1 ? Text.NoWrap : Text.WordWrap
        verticalAlignment: Text.AlignVCenter
        horizontalAlignment: Text.AlignHCenter
        lineHeightMode: DataSource.language === 1 ? Text.ProportionalHeight : Text.FixedHeight
        lineHeight: DataSource.language === 1 ? 1 : 35
        font.pixelSize: 33
		font.family: "HarmonyOS Sans SC Bold"
        visible: (DataSource.vehicleType === 0x02 && DataSource.dischargeInterfaceIndex === 0x02)?1:0
        color: DataSource.dayNightMode === 0x02?"white":"black"
        text:{
            if(DataSource.dischargeTips === 0x01){
                TranslateStr.dischargeInterface_dischargingTipStr
            }else if(DataSource.dischargeTips === 0x02){
                TranslateStr.dischargeInterface_dischargingTip2Str
            }else if(DataSource.dischargeTips === 0x03){
                TranslateStr.dischargeInterface_dischargingTip3Str
            }else{
                ""
            }
        }
    }
    Connections{
        target: DataSource
        function onDischargeInterfaceIndexChanged(){
            if(0x02 === DataSource.dischargeInterfaceIndex){
                timer.start()
            }else{
                timer.stop()
            }
        }
    }
}
