import QtQuick 2.0
import com.byd.DataSource 1.0
import com.byd.WarningLight 1.0

Item {
    //指示灯 begin
    property var rootItemRef: null

    //充放电加速计时器界面
    property bool chargeDischargeSpeedupFlag:(DataSource.chargeNeedDisplay===1||DataSource.dischargeNeedDisplay===1||DataSource.speedUpTimerInterfaceDisplay===1||DataSource.journeyInterfaceDisplay===1)
    property bool trackModeFlag:(DataSource.trackModeNeedDisplay === 1)?true:false
    //全屏导航界面显示
    property bool navigationFlag: (DataSource.dilinkName===0x01&&DataSource.naviType===0x04)?true:false
	
        WarningLight{
            id: trafficSignRecognitionId2
            x: (DataSource.naviType === 0x04 ? 1072 + rootItemRef.trafficSign2X : (DataSource.themeIndex === 0x01 ? 1650 + rootItemRef.trafficSign2X : 1072 + rootItemRef.trafficSign2X))
            y: (DataSource.naviType === 0x04 ? 5 + rootItemRef.trafficSign2Y : (DataSource.themeIndex === 0x01 ? 151 + rootItemRef.trafficSign2Y : 7 + rootItemRef.trafficSign2Y))
            visible: valueTwo > 0 && !(weilai === 1 && (DataSource.naviTypeStore === 1 || DataSource.naviTypeStore === 0) && DataSource.themeIndex === 0x02)
            Image{
                id:trafficBorderImg2
                visible: true
                source: "qrc:/images10_25/adas2d/trafic_border.png"
            }
        Text {
            font.bold:rootItemId.jiacu === 1
            width: trafficBorderImg2.width
            height: trafficBorderImg2.height
            horizontalAlignment: Text.AlignHCenter
            verticalAlignment: Text.AlignVCenter
            visible: true
            text: valueTwo
			font.family: rootItemId.ziti
            font.pixelSize:36
            y:28-5-22
            color:"#151515"
        }
    }	
Rectangle {
    id: gearModeIndicator
    x: 1150
    y: 685
    width: 120
    height: 35
    color: "transparent"
    visible: false//DataSource.themeIndex === 0x2 && haoGe === 0 && DataSource.powerGear === 3
    Row {
        id: gearLettersRow
        anchors.fill: parent
        spacing: 8
        Text {
            id: letterP
            width: parent.width / 4
            height: parent.height
            anchors.bottom: parent.bottom
            anchors.bottomMargin: DataSource.gearMode === 1 ? -8:0			
            text: "P"
			font.family: rootItemId.ziti
            font.pixelSize: {
                if (DataSource.gearMode === 1) {
                    return 60
                } else {
                    return 35
                }
            }
            color: DataSource.dayNightMode === 0x02 ? "#ffffff" : "#333333"
            font.bold:rootItemId.jiacu === 1
            verticalAlignment: Text.AlignBottom
            horizontalAlignment: Text.AlignHCenter
            Behavior on font.pixelSize {
                NumberAnimation {
                    duration: 300
                    easing.type: Easing.InOutQuad
                }
            }
            
            Behavior on color {
                ColorAnimation {
                    duration: 300
                    easing.type: Easing.InOutQuad
                }
            }
        }
        Text {
            id: letterR
            width: parent.width / 4
            height: parent.height
            anchors.bottom: parent.bottom
            anchors.bottomMargin: DataSource.gearMode === 2 ? -8:0			
			font.family: rootItemId.ziti
            text: "R"
            font.pixelSize: {
                if (DataSource.gearMode === 2) {
                    return 60
                } else {
                    return 35
                }
            }
            color: {
                if (DataSource.gearMode === 2) {
                    return "#FF3B30" 
                } else {
                    return DataSource.dayNightMode === 0x02 ? "#ffffff" : "#333333"
                }
            }
            font.bold:rootItemId.jiacu === 1
            verticalAlignment: Text.AlignBottom
            horizontalAlignment: Text.AlignHCenter
            Behavior on font.pixelSize {
                NumberAnimation {
                    duration: 300
                    easing.type: Easing.InOutQuad
                }
            }
            
            Behavior on color {
                ColorAnimation {
                    duration: 300
                    easing.type: Easing.InOutQuad
                }
            }
        }		

        Text {
            id: letterN
            width: parent.width / 4
            height: parent.height
            anchors.bottom: parent.bottom
            anchors.bottomMargin: DataSource.gearMode === 3 ? -8:0			
			font.family: rootItemId.ziti
            text: "N"
            font.pixelSize: {
                if (DataSource.gearMode === 3) {
                    return 60
                } else {
                    return 35
                }
            }
            color: {
                if (DataSource.gearMode === 3) {
                    return "#FF9500" 
                } else {
                    return DataSource.dayNightMode === 0x02 ? "#ffffff" : "#333333"
                }
            }
            font.bold:rootItemId.jiacu === 1
            verticalAlignment: Text.AlignBottom
            horizontalAlignment: Text.AlignHCenter
            Behavior on font.pixelSize {
                NumberAnimation {
                    duration: 300
                    easing.type: Easing.InOutQuad
                }
            }
            Behavior on color {
                ColorAnimation {
                    duration: 300
                    easing.type: Easing.InOutQuad
                }
            }
        }
        Text {
            id: letterD
            width: parent.width / 4
            height: parent.height
            anchors.bottom: parent.bottom
            anchors.bottomMargin: DataSource.gearMode === 4 ? -8:0			
			font.family: rootItemId.ziti
            text: "D"
            font.pixelSize: {
                if (DataSource.gearMode === 4) {
                    return 60
                } else {
                    return 35
                }
            }
            color: {
                if (DataSource.gearMode === 4) {
                    return "#4CAF50" 
                } else {
                    return DataSource.dayNightMode === 0x02 ? "#ffffff" : "#333333"
                }
            }
            font.bold:rootItemId.jiacu === 1
            verticalAlignment: Text.AlignBottom
            horizontalAlignment: Text.AlignHCenter
            Behavior on font.pixelSize {
                NumberAnimation {
                    duration: 300
                    easing.type: Easing.InOutQuad
                }
            }
            
            Behavior on color {
                ColorAnimation {
                    duration: 300
                    easing.type: Easing.InOutQuad
                }
            }
        }		
    }
}	
    //远光灯 有报文，设计文档中无定义
    WarningLight{
        id: highBeamLightId
        x: (weilai === 1 && DataSource.naviTypeStore !== 2 && DataSource.themeIndex === 0x02 ? 689 + rootItemRef.highBeamFutureX : 689 + rootItemRef.highBeamX)
        y: (weilai === 1 && DataSource.naviTypeStore !== 2 && DataSource.themeIndex === 0x02 ? 101 + rootItemRef.highBeamFutureY : 101 + rootItemRef.highBeamY)
        displayState:DataSource.highBeamLight
        Image{
            source: "qrc:/images10_25/warninglight/highBeamLight.png"
        }
    }

    //近光灯指示灯
    WarningLight{
        id: lowBeamLight
        x: (weilai === 1 && DataSource.naviTypeStore !== 2 && DataSource.themeIndex === 0x02) ? 400 + rootItemRef.lowBeamFutureX : (trackModeFlag || chargeDischargeSpeedupFlag) ? 407 + rootItemRef.lowBeamX : (DataSource.themeIndex === 0x02 ? 479 + rootItemRef.lowBeamX : 545 + rootItemRef.lowBeamX)
        y: (weilai === 1 && DataSource.naviTypeStore !== 2 && DataSource.themeIndex === 0x02) ? 200 + rootItemRef.lowBeamFutureY : 97 + rootItemRef.lowBeamY
        displayState: (DataSource.hmaFarNearIndicatorLight !== 2 && DataSource.highBeamLight !== 1 && DataSource.smallOrSwitchLight && mLightModeLXH !== 2) ? DataSource.smallOrSwitchLight:DataSource.lowBeamLight
        Image{
            id: lowBeamLightImageId
            source: "qrc:/images10_25/warninglight/lowBeamLight.png"
        }
    }

    //小灯 有报文，设计文档中无定义
    //灯光总开关 有报文，设计文档中无定义
    WarningLight{
        id: smallOrSwitchLightId
        x:{
            var futureCondition = (weilai === 1 && DataSource.naviTypeStore !== 2 && DataSource.themeIndex === 0x02);
            if (futureCondition) {
                if (DataSource.smallOrSwitchLightColor === 0x04) {
                    return (trackModeFlag === true ? 618 + rootItemRef.smallLightFutureX : (chargeDischargeSpeedupFlag === true ? 613 + rootItemRef.smallLightFutureX : (DataSource.naviType === 4 ? 628 + rootItemRef.smallLightFutureX : (DataSource.themeIndex === 0x01 ? 613 + rootItemRef.smallLightFutureX : 623 + rootItemRef.smallLightFutureX))));
                } else {
                    return (trackModeFlag === true ? 624 + rootItemRef.smallLightFutureX : (chargeDischargeSpeedupFlag === true ? 619 + rootItemRef.smallLightFutureX : (DataSource.naviType === 4 ? 634 + rootItemRef.smallLightFutureX : (DataSource.themeIndex === 0x01 ? 619 + rootItemRef.smallLightFutureX : 625 + rootItemRef.smallLightFutureX))));
                }
            } else {
                if (DataSource.smallOrSwitchLightColor === 0x04) {
                   return (trackModeFlag === true ? 618 + rootItemRef.smallLightX : (chargeDischargeSpeedupFlag === true ? 613 + rootItemRef.smallLightX : (DataSource.naviType === 4 ? 628 + rootItemRef.smallLightX : (DataSource.themeIndex === 0x01 ? 613 + rootItemRef.smallLightX : 623 + rootItemRef.smallLightX))));
                } else {
                    return (trackModeFlag === true ? 624 + rootItemRef.smallLightX : (chargeDischargeSpeedupFlag === true ? 619 + rootItemRef.smallLightX : (DataSource.naviType === 4 ? 634 + rootItemRef.smallLightX : (DataSource.themeIndex === 0x01 ? 619 + rootItemRef.smallLightX : 625 + rootItemRef.smallLightX))));
                }
            }
        }
        y: {
            var futureCondition = (weilai === 1 && DataSource.naviTypeStore !== 2 && DataSource.themeIndex === 0x02);
            if (DataSource.smallOrSwitchLightColor === 0x04) {
                return (futureCondition ? 99 + rootItemRef.smallLightFutureY : 99 + rootItemRef.smallLightY);
            } else {
                return (futureCondition ? 98 + rootItemRef.smallLightFutureY : 98 + rootItemRef.smallLightY);
            }
        }
        displayState:DataSource.smallOrSwitchLight
        Image{
            source: DataSource.smallOrSwitchLightColor === 0x04?"qrc:/images10_25/warninglight/smallLight.png":"qrc:/images10_25/warninglight/switchLight.png"
        }
    }

    //全天候灯 有报文，设计文档中无定义
    WarningLight{
        id: weatherLightId
        x:trackModeFlag === true?480:((chargeDischargeSpeedupFlag===true)?480:(DataSource.naviType === 4?1419:(DataSource.themeIndex === 0x01?480:335)))
        y:(DataSource.naviType === 4)?95:97//(DataSource.themeIndex === 0x01?97:133)
        displayState:DataSource.weatherLight
        Image{
            source: "qrc:/images10_25/warninglight/weatherLight.png"
        }
    }

    //前雾灯 无报文，设计文档中无定义
    WarningLight{
        id: frontFogLightId
        x:(chargeDischargeSpeedupFlag===true || trackModeFlag === true)?483:(DataSource.naviType === 4?1422:(DataSource.themeIndex === 0x01?483:406))
        y:(DataSource.naviType === 4)?92:94
        Image{
            source: "qrc:/images10_25/warninglight/frontFogLight.png"
        }
    }

    //左转向灯指示灯
    WarningLight{
        id: leftTurnLightId
        x: (trackModeFlag === true ? 549 + rootItemRef.leftTurnX : ((chargeDischargeSpeedupFlag === true) ? 541 + rootItemRef.leftTurnX : (DataSource.naviType === 4 ? 554 + rootItemRef.leftTurnX : (DataSource.themeIndex === 0x01 ? 541 + rootItemRef.leftTurnX : 554 + rootItemRef.leftTurnX))))
        y: (trackModeFlag === true ? 92 + rootItemRef.leftTurnY : ((chargeDischargeSpeedupFlag === true) ? 92 + rootItemRef.leftTurnY : (DataSource.naviType === 4 ? 92 + rootItemRef.leftTurnY : (DataSource.themeIndex === 0x01 ? 92 + rootItemRef.leftTurnY : 91 + rootItemRef.leftTurnY))))
        displayState:DataSource.leftTurnLight
        Image{
            source: "qrc:/images10_25/warninglight/leftTurnLight.png"
        }
    }

    //SRS指示灯
    WarningLight{
        id: srsLightId
        x:trackModeFlag === true?109:((chargeDischargeSpeedupFlag===true)?117:(DataSource.naviType === 4?(DataSource.themeIndex === 0x01?351:700):(DataSource.themeIndex === 0x01?221:700)))
        y:trackModeFlag === true?339:((chargeDischargeSpeedupFlag===true)?92:(DataSource.naviType === 4?(DataSource.themeIndex === 0x01?27:135):(DataSource.themeIndex === 0x01?227:144)))
        displayState:DataSource.srsLight
        Image{
            source: "qrc:/images10_25/warninglight/srsLight.png"
        }
    }

    //驾驶员安全带指示灯
    WarningLight{
        id: seatBeltLightId
        x: 40 + rootItemRef.seatBeltX
        y: 25 + rootItemRef.seatBeltY
        displayState:DataSource.seatBeltLight
        Image{
            source: "qrc:/images10_25/warninglight/seatBeltLight.png"
        }
    }

    //动力系统故障警告灯
    WarningLight{
        id: powerSysFaultLightId
        x:trackModeFlag === true?14:((chargeDischargeSpeedupFlag===true)?157:(DataSource.naviType === 4?15:(DataSource.themeIndex === 0x01?207:289)))
        y:trackModeFlag === true?222:((chargeDischargeSpeedupFlag===true)?613:(DataSource.naviType === 4?178:(DataSource.themeIndex === 0x01?473:164)))
        displayState:DataSource.powerSysFaultLight
        Image{
            source :DataSource.carBodyType ===0x0 ?"qrc:/images10_25/warninglight/powerSysFaultLight.png" :"qrc:/images10_25/warninglight/powerSysFaultLight-suv.png"
        }
    }

    //动力电池充电连接指示灯
    WarningLight{
        id: chargeConnectLightId
        x:trackModeFlag === true?360:((chargeDischargeSpeedupFlag===true)?193:(DataSource.naviType === 4?(DataSource.themeIndex === 0x01?273:22):(DataSource.themeIndex === 0x01?379:210)))
        y:trackModeFlag === true?26:((chargeDischargeSpeedupFlag===true)?33:(DataSource.naviType === 4?(DataSource.themeIndex === 0x01?30:135):(DataSource.themeIndex === 0x01?29:166)))
        displayState:DataSource.chargeConnectLight
        Image{
            source: "qrc:/images10_25/warninglight/chargeConnectLight.png"
        }
    }

    //放电指示灯
    WarningLight{
        id: dischargeLightId
        x:trackModeFlag === true?437:((chargeDischargeSpeedupFlag===true)?30:(DataSource.naviType === 4?30:(DataSource.themeIndex === 0x01?310:30)))
        y:trackModeFlag === true?24:((chargeDischargeSpeedupFlag===true)?34:(DataSource.naviType === 4?27:(DataSource.themeIndex === 0x01?30:166)))
        displayState:DataSource.dischargeLight
        Image{
            source: "qrc:/images10_25/warninglight/dischargeLight.png"
        }
    }

    //动力电池过热指示灯
    WarningLight{
        id: powerBattaryOverheatLightId
        x:trackModeFlag === true?25:((chargeDischargeSpeedupFlag===true)?85:(DataSource.naviType === 4?15:(DataSource.themeIndex === 0x01?85:26)))
        y:trackModeFlag === true?273:((chargeDischargeSpeedupFlag===true)?604:(DataSource.naviType === 4?528:(DataSource.themeIndex === 0x01?604:222)))
        displayState:DataSource.powerBattaryOverheatLight
        Image{
            source: "qrc:/images10_25/warninglight/powerBattaryOverheatLight.png"
        }
    }

    //PAB故障警告指示灯
    /*    WarningLight{
        id: pabLightId
        x:trackModeFlag === true?109:((chargeDischargeSpeedupFlag===true)?206:(DataSource.naviType === 4?469:(DataSource.themeIndex === 0x01?155:303)))
        y:trackModeFlag === true?402:((chargeDischargeSpeedupFlag===true)?159:(DataSource.naviType === 4?25:(DataSource.themeIndex === 0x01?282:222)))
        displayState:2 //DataSource.pabLight
        Image{
            source: "qrc:/images10_25/warninglight/pabLight.png"
        }
    }
*/

    //动力电池故障警告灯
    WarningLight{
        id: powerBattaryFaultLightId
        x:trackModeFlag === true?26:((chargeDischargeSpeedupFlag===true)?13:(DataSource.naviType === 4?18:(DataSource.themeIndex === 0x01?13:29)))
        y:trackModeFlag === true?530:((chargeDischargeSpeedupFlag===true)?525:(DataSource.naviType === 4?589:(DataSource.themeIndex === 0x01?525:313)))
        displayState:DataSource.powerBattaryFaultLight
        Image{
            source: "qrc:/images10_25/warninglight/powerBattaryFaultLight.png"
        }
    }

    //电机冷却液温度过高警告灯 无报文，设计文档中无定义
    WarningLight{
        id: motorcoolantLightId
        x:trackModeFlag === true?18:((chargeDischargeSpeedupFlag===true)?70:(DataSource.naviType === 4?70:(DataSource.themeIndex === 0x01?10:18)))
        y:trackModeFlag === true?345:((chargeDischargeSpeedupFlag===true)?528:(DataSource.naviType === 4?(DataSource.themeIndex === 0x01?594:528):(DataSource.themeIndex === 0x01?167:159)))
        Image{
            source: "qrc:/images10_25/warninglight/motorcoolantLight.png"
        }
    }

    //电机过热警告灯
    WarningLight{
        id: motorOverheatLightId
        x:trackModeFlag === true?19:((chargeDischargeSpeedupFlag===true)?13:(DataSource.naviType === 4?(DataSource.themeIndex === 0x01?12:76):(DataSource.themeIndex === 0x01?13:24)))
        y:trackModeFlag === true?597:((chargeDischargeSpeedupFlag===true)?597:(DataSource.naviType === 4?(DataSource.themeIndex === 0x01?645:43):(DataSource.themeIndex === 0x01?597:401)))
        displayState:DataSource.motorOverheatLight
        Image{
            source: "qrc:/images10_25/warninglight/motorOverheatLight.png"
        }
    }

    //电机故障警告灯 无报文，设计文档中无定义
    WarningLight{
        id: motorFaultLightId
        x:trackModeFlag === true?22:((chargeDischargeSpeedupFlag===true)?15:(DataSource.naviType === 4?72:(DataSource.themeIndex === 0x01?15:26)))
        y:trackModeFlag === true?409:((chargeDischargeSpeedupFlag===true)?661:(DataSource.naviType === 4?640:(DataSource.themeIndex === 0x01?661:482)))
        Image{
            source: "qrc:/images10_25/warninglight/motorFaultLight.png"
        }
    }

    //机油压力低警告灯
    WarningLight{
        id: engineOilLowLightId
        x:trackModeFlag === true?393:((chargeDischargeSpeedupFlag===true)?82:(DataSource.naviType === 4?130:(DataSource.themeIndex === 0x01?232:222)))
        y:trackModeFlag === true?393:((chargeDischargeSpeedupFlag===true)?675:(DataSource.naviType === 4?(DataSource.themeIndex === 0x01?676:528):(DataSource.themeIndex === 0x01?672:552)))
        displayState:DataSource.engineOilLowLight
        Image{
            source: "qrc:/images10_25/warninglight/engineOilLowLight.png"
        }
    }

    //冷却液温度过高警告灯
    WarningLight{
        id: coolantLightId
        x:trackModeFlag === true?27:((chargeDischargeSpeedupFlag===true)?17:(DataSource.naviType === 4?283:(DataSource.themeIndex === 0x01?92:121)))
        y:trackModeFlag === true?471:((chargeDischargeSpeedupFlag===true)?461:(DataSource.naviType === 4?(DataSource.themeIndex === 0x01?670:528):(DataSource.themeIndex === 0x01?662:226)))
        displayState:DataSource.coolantLight
        Image{
            source: "qrc:/images10_25/warninglight/coolantLight.png"
        }
    }

    //低速提示音关闭指示灯
    /*WarningLight{
        id: beepOffLightId
        x:trackModeFlag === true?1835:((chargeDischargeSpeedupFlag===true)?1785:(DataSource.naviType === 4?605:(DataSource.themeIndex === 0x01?1840:389)))
        y:trackModeFlag === true?177:((chargeDischargeSpeedupFlag===true)?664:(DataSource.naviType === 4?670:(DataSource.themeIndex === 0x01?615:490)))
        displayState:DataSource.beepOffLight
        Image{
            source: "qrc:/common/images/warninglight/beepOffLight.png"
        }
    }*/

    //驱动功率限制指示灯
    WarningLight{
        id: powerLimitLightId
        x:trackModeFlag === true?106:((chargeDischargeSpeedupFlag===true)?249:(DataSource.naviType === 4?140:(DataSource.themeIndex === 0x01?292:129)))
        y:trackModeFlag === true?596:((chargeDischargeSpeedupFlag===true)?615:(DataSource.naviType === 4?80:(DataSource.themeIndex === 0x01?473:484)))
        displayState:DataSource.powerLimitLight
        Image{
            source:{
                switch(DataSource.powerLimitLightColor){
                case 1:
                    "qrc:/images10_25/warninglight/powerLimitLight_white.png"
                    break
                case 2:
                    "qrc:/images10_25/warninglight/powerLimitLight.png"
                    break
                default:
                    ""
                    break
                }
            }

        }
    }

    //ESPOFF警告灯
    WarningLight{
        id: espOffLightId
        x:trackModeFlag === true?109:((chargeDischargeSpeedupFlag===true)?211:(DataSource.naviType === 4?1860:(DataSource.themeIndex === 0x01?426:1860)))
        y:trackModeFlag === true?528:((chargeDischargeSpeedupFlag===true)?536:(DataSource.naviType === 4?649:(DataSource.themeIndex === 0x01?466:526)))
        displayState:DataSource.espOffLight
        Image{
            source: "qrc:/images10_25/warninglight/espOffLight.png"
        }
    }

    //发动机故障警告灯
    WarningLight{
        id: engineLightId
        x:trackModeFlag === true?393:((chargeDischargeSpeedupFlag===true)?1710:(DataSource.naviType === 4?35:(DataSource.themeIndex === 0x01?1572:35)))
        y:trackModeFlag === true?393:((chargeDischargeSpeedupFlag===true)?608:(DataSource.naviType === 4?570:(DataSource.themeIndex === 0x01?492:570)))
        displayState:DataSource.engineLight
        Image{ 
            source: "qrc:/images10_25/warninglight/engineLight.png"
        }
    }

    //制动片磨损警告灯
    /*WarningLight{
        id: brakeWearLightId
        x:trackModeFlag === true?1751:((chargeDischargeSpeedupFlag===true)?1852:(DataSource.naviType === 4?273:(DataSource.themeIndex === 0x01?1845:1697)))
        y:trackModeFlag === true?181:((chargeDischargeSpeedupFlag===true)?608:(DataSource.naviType === 4?81:(DataSource.themeIndex === 0x01?543:102)))
        displayState:DataSource.brakeWearLight
        Image{
            source: "qrc:/images10_25/warninglight/brakeWearLight.png"
        }
    }*/

    //BSD状态指示灯 ADAS 后碰预警
    WarningLight{
        id: bsdModeLightId
        x:trackModeFlag === true?1759:((chargeDischargeSpeedupFlag===true)?1779:(DataSource.naviType === 4?18:(DataSource.themeIndex === 0x01?1330:18)))
        y:trackModeFlag === true?244:((chargeDischargeSpeedupFlag===true)?22:(DataSource.naviType === 4?494:(DataSource.themeIndex === 0x01?264:494)))
        visible:DataSource.bsdIndicatorLight !== 0 ? true : false
        Image{
            source: {
                switch(DataSource.bsdIndicatorLight){
                case 1:
                    "qrc:/images10_25/warninglight/bsd_gary.png"
                    break
                case 2:
                    "qrc:/images10_25/warninglight/bsdModeLight_green.png"
                    break
                case 3:
                    "qrc:/images10_25/warninglight/bsdModeLight.png"
                    break
                default:
                    ""
                    break
                }
            }
        }
    }

    //机油寿命监测指示灯
    WarningLight{
        id: oilLifeDetectLightId
        x:(chargeDischargeSpeedupFlag===true)?159:(DataSource.naviType === 4?210:(DataSource.themeIndex === 0x01?159:129))
        y:(chargeDischargeSpeedupFlag===true)?675:(DataSource.naviType === 4?(DataSource.themeIndex === 0x01?676:528):(DataSource.themeIndex === 0x01?672:552))
        displayState:DataSource.oilLifeDetectLight
        Image{
            source: "qrc:/images10_25/warninglight/oilLifeDetectLight.png"
        }
    }
    //汽油机颗粒捕集器指示灯(GPF)
    WarningLight{
        id: gpfLightId
        x:trackModeFlag === true?1840:((chargeDischargeSpeedupFlag===true)?1710:(DataSource.naviType === 4?18:(DataSource.themeIndex === 0x01?1759:225)))
        y:trackModeFlag === true?361:((chargeDischargeSpeedupFlag===true)?664:(DataSource.naviType === 4?405:(DataSource.themeIndex === 0x01?624:147)))
        displayState:DataSource.gpfLight
        Image{
            source: DataSource.gpfLightColor === 0x04?"qrc:/images10_25/warninglight/gpfLight_Green.png":"qrc:/images10_25/warninglight/gpfLight_Yellow.png"
        }
    }

    //主告警指示灯
    WarningLight{
        id: masterAlertId
        x:trackModeFlag === true?110:((chargeDischargeSpeedupFlag===true)?335:(DataSource.naviType === 4?412:(DataSource.themeIndex === 0x01?495:119)))
        y:trackModeFlag === true?157:((chargeDischargeSpeedupFlag===true)?92:(DataSource.naviType === 4?(DataSource.themeIndex === 0x01?670:528):(DataSource.themeIndex === 0x01?285:96)))
        displayState:DataSource.masterAlert
        Image{
            source: "qrc:/images10_25/warninglight/masterAlert.png"
        }
    }

    //定速巡航主指示灯
    WarningLight{
        id: cruiseMainLightId
        x: (trackModeFlag === true ? 1189 + rootItemRef.cruiseMainX : ((chargeDischargeSpeedupFlag === true) ? 1618 + rootItemRef.cruiseMainX : (DataSource.naviType === 4 ? 1300 + rootItemRef.cruiseMainX : (DataSource.themeIndex === 0x01 ? 1413 + rootItemRef.cruiseMainX : 1300 + rootItemRef.cruiseMainX))))
        y: (trackModeFlag === true ? 161 + rootItemRef.cruiseMainY : ((chargeDischargeSpeedupFlag === true) ? 613 + rootItemRef.cruiseMainY : (DataSource.naviType === 4 ? 25 + rootItemRef.cruiseMainY : (DataSource.themeIndex === 0x01 ? 278 + rootItemRef.cruiseMainY : 25 + rootItemRef.cruiseMainY))))
        visible:DataSource.cruiseMainLight === 1 && !(weilai === 1 && DataSource.naviTypeStore === 1)
        Image{
            source: "qrc:/images10_25/warninglight/cruiseMainLight.png"
        }
    }

    //ACC指示灯 ADAS
    WarningLight{
        id: accLightId
        x:trackModeFlag === true?1307:((chargeDischargeSpeedupFlag===true)?1504:(DataSource.naviType === 4?(DataSource.themeIndex === 0x02 ? 695:1860):(DataSource.themeIndex === 0x01?1593:695)))
        y:trackModeFlag === true?219:((chargeDischargeSpeedupFlag===true)?152:(DataSource.naviType === 13?(DataSource.themeIndex === 0x02 ? 13:72):(DataSource.themeIndex === 0x01?260:13)))
        visible:DataSource.accIndicatorLight && !(weilai === 1 && (DataSource.naviTypeStore === 1 || DataSource.naviTypeStore === 0) && DataSource.themeIndex === 0x02)
        Image{
            id:accLightImg
            source:{
                if (DataSource.themeIndex === 0x02) {
                    if(DataSource.accIndicatorLight === 0x01){
                        "qrc:/images10_25/warninglight/acc_grey_LXH.png"
                    }else if(DataSource.accIndicatorLight === 0x03){
                        "qrc:/images10_25/warninglight/acc_yellow_LXH.png"
                    }else{
                        "qrc:/images10_25/warninglight/acc_green_LXH.png"
                    }
                } else {
                    if(DataSource.accIndicatorLight === 0x01){
                        "qrc:/images10_25/warninglight/acc_grey.png"
                    }else if(DataSource.accIndicatorLight === 0x03){
                        "qrc:/images10_25/warninglight/acc_yellow.png"
                    }else{
                        "qrc:/images10_25/warninglight/acc_green.png"
                    }
                }
            }
        }
    }

    //AVH指示灯(自动驻车)
    WarningLight{
        id: avhLightId
        x: (trackModeFlag === true ? 582 + rootItemRef.autoHoldX : (chargeDischargeSpeedupFlag === true ? 414 + rootItemRef.autoHoldX : (DataSource.themeIndex === 0x01 ? 352 + rootItemRef.autoHoldX : 1250 + rootItemRef.autoHoldX)))
        y: (trackModeFlag === true ? 163 + rootItemRef.autoHoldY : (chargeDischargeSpeedupFlag === true ? 164 + rootItemRef.autoHoldY : (DataSource.themeIndex === 0x01 ? 285 + rootItemRef.autoHoldY : 92 + rootItemRef.autoHoldY)))
        visible:DataSource.avhLight === 1 && !(weilai === 1 && (DataSource.naviTypeStore === 1 || DataSource.naviTypeStore === 0) && DataSource.themeIndex === 0x02)
        Image{
            source: DataSource.avhLightColor === 0x01 ? "qrc:/images10_25/warninglight/avhLight_White.png":"qrc:/images10_25/warninglight/avhLight_Green.png"
        }
    }

    //胎压系统故障警告灯
    WarningLight{
        id: tireFaultLightId
        x:trackModeFlag === true?1848:((chargeDischargeSpeedupFlag===true)?1867:(DataSource.naviType === 4?25:(DataSource.themeIndex === 0x01?1651:1835)))
        y:trackModeFlag === true?418:((chargeDischargeSpeedupFlag===true)?667:(DataSource.naviType === 4?343:(DataSource.themeIndex === 0x01?486:350)))
        displayState:DataSource.tireFaultLight
        Image{
            source: "qrc:/images10_25/warninglight/tireFaultLight.png"
        }
    }

    //ABS 故障警告灯
    WarningLight{
        id: absLightId
        x:{
            if(DataSource.absLightColor === 0x02){
                trackModeFlag === true?1456:((chargeDischargeSpeedupFlag===true)?1456:(DataSource.naviType === 4?1851:(DataSource.themeIndex === 0x01?421:1461+380)))
            }else{
                trackModeFlag === true?1454:((chargeDischargeSpeedupFlag===true)?1454:(DataSource.naviType === 4?1849:(DataSource.themeIndex === 0x01?419:1459+380)))
            }
        }
        y:{
            if(DataSource.absLightColor === 0x02){
                trackModeFlag === true?99:((chargeDischargeSpeedupFlag===true)?99:(DataSource.naviType === 4?346:(DataSource.themeIndex === 0x01?287:96+35)))
            }else{
                trackModeFlag === true?112:((chargeDischargeSpeedupFlag===true)?112:(DataSource.naviType === 4?359:(DataSource.themeIndex === 0x01?300:109+35)))
            }
        }
        displayState:DataSource.absLight
        Image{
            source: DataSource.absLightColor === 0x02?"qrc:/images10_25/warninglight/absLight.png":"qrc:/images10_25/warninglight/absLight_USA.png"
        }
    }

    //陡坡缓降指示灯、陡坡缓降车速指示灯(无报文和设计文档定义)、陡坡缓降故障指示灯(无报文和设计文档定义)
    WarningLight{
        id: steepDescentLightId
        x:trackModeFlag === true?1837:((chargeDischargeSpeedupFlag===true)?1779:(DataSource.naviType === 4?1846:(DataSource.themeIndex === 0x01?1696:1850)))
        y:trackModeFlag === true?593:((chargeDischargeSpeedupFlag===true)?600:(DataSource.naviType === 4?538:(DataSource.themeIndex === 0x01?435:474)))
        displayState:DataSource.steepDescentLight
        Image{
            source: "qrc:/images10_25/warninglight/steepDescentLight.png"
        }
    }

    //制动系统故障警告灯
    WarningLight{
        id: brakeFaultLightId
        x:{
            if(DataSource.brakeFaultLightColor === 0x03){
                trackModeFlag === true?1560:((chargeDischargeSpeedupFlag===true)?1560:(DataSource.naviType === 4?1844:(DataSource.themeIndex === 0x01?1343:1748)))
            }else{
                trackModeFlag === true?1537:((chargeDischargeSpeedupFlag===true)?1537:(DataSource.naviType === 4?1810:(DataSource.themeIndex === 0x01?1320:1725)))
            }
        }
        y:{
            if(DataSource.brakeFaultLightColor === 0x03){
                trackModeFlag === true?104:((chargeDischargeSpeedupFlag===true)?104:(DataSource.naviType === 4?240:(DataSource.themeIndex === 0x01?384:564)))
            }else{
                trackModeFlag === true?115:((chargeDischargeSpeedupFlag===true)?115:(DataSource.naviType === 4?251:(DataSource.themeIndex === 0x01?395:575)))
            }
        }
        displayState:DataSource.brakeFaultLight
        Image{
            source: DataSource.brakeFaultLightColor === 0x03?"qrc:/images10_25/warninglight/brakeFaultLight.png":"qrc:/images10_25/warninglight/brakeFaultLight_USA.png"
        }
    }

    //转向系统故障警告灯(eps故障)
    WarningLight{
        id: epsFaultLightId
        x:trackModeFlag === true?190:((chargeDischargeSpeedupFlag===true)?190:(DataSource.naviType === 4?1855:(DataSource.themeIndex === 0x01?292:1860)))
        y:trackModeFlag === true?95:((chargeDischargeSpeedupFlag===true)?95:(DataSource.naviType === 4?466:(DataSource.themeIndex === 0x01?223:642)))
        displayState:DataSource.epsFaultLight
        Image{
            source: "qrc:/images10_25/warninglight/epsFaultLight.png"
        }
    }

    //电子驻车状态指示灯
    WarningLight{
        id: epbStatusLightId
        x: (trackModeFlag === true ? 506 + rootItemRef.epbX : ((chargeDischargeSpeedupFlag === true) ? 343 + rootItemRef.epbX : (DataSource.naviType === 4 ? 1760 + rootItemRef.epbX : (DataSource.themeIndex === 0x01 ? 282 + rootItemRef.epbX : 1760 + rootItemRef.epbX))))
        y: (trackModeFlag === true ? 162 + rootItemRef.epbY : ((chargeDischargeSpeedupFlag === true) ? 163 + rootItemRef.epbY : (DataSource.naviType === 4 ? 30 + rootItemRef.epbY : (DataSource.themeIndex === 0x01 ? 284 + rootItemRef.epbY : 30 + rootItemRef.epbY))))
        visible:DataSource.epbStatusLight === 1 && !(weilai === 1 && (DataSource.naviTypeStore === 1 || DataSource.naviTypeStore === 0) && DataSource.themeIndex === 0x02)
        Image{
            source: "qrc:/images10_25/warninglight/epbStatusLight.png"
        }
    }

    //智能钥匙系统警告灯
    WarningLight{
        id: smartKeyLightId
        x:trackModeFlag === true?1844:((chargeDischargeSpeedupFlag===true)?1704:(DataSource.naviType === 4?1852:(DataSource.themeIndex === 0x01?1852:1835)))
        y:trackModeFlag === true?239:((chargeDischargeSpeedupFlag===true)?32:(DataSource.naviType === 4?186:(DataSource.themeIndex === 0x01?177:281)))
        displayState:DataSource.smartKeyLight
        Image{
            source: "qrc:/images10_25/warninglight/smartKeyLight.png"
        }
    }

    //防盗指示灯
    WarningLight{
        id: guardLightId
        x:trackModeFlag === true?1836:((chargeDischargeSpeedupFlag===true)?1627:(DataSource.naviType === 4?365:(DataSource.themeIndex === 0x01?1627:206)))
        y:trackModeFlag === true?294:((chargeDischargeSpeedupFlag===true)?27:(DataSource.naviType === 4?79:(DataSource.themeIndex === 0x01?27:223)))
        displayState:DataSource.guardLight
        Image{
            source: "qrc:/images10_25/warninglight/guardLight.png"
        }
    }

    //低压供电系统警告灯
    WarningLight{
        id: lvpsLightId
        x:trackModeFlag === true?25:((chargeDischargeSpeedupFlag===true)?271:(DataSource.naviType === 4?18:(DataSource.themeIndex === 0x01?217:387)))
        y:trackModeFlag === true?166:((chargeDischargeSpeedupFlag===true)?167:(DataSource.naviType === 4?288:(DataSource.themeIndex === 0x01?294:167)))
        displayState:DataSource.lvpsLight
        Image{
            source: "qrc:/images10_25/warninglight/lvpsLight.png"
        }
    }

    //ESP故障警告灯
    WarningLight{
        id: espFaultLightId
        x:trackModeFlag === true?107:((chargeDischargeSpeedupFlag===true)?148:(DataSource.naviType === 4?1857:(DataSource.themeIndex === 0x01?357:1841)))
        y:trackModeFlag === true?466:((chargeDischargeSpeedupFlag===true)?536:(DataSource.naviType === 4?593:(DataSource.themeIndex === 0x01?473:202)))
        displayState:DataSource.espFaultLight
        Image{
            source: "qrc:/images10_25/warninglight/espFaultLight.png"
        }
    }

    //自动紧急制动指示灯 ==>ADAS AEB指示灯
    WarningLight{
        id: aebLightId
        x:trackModeFlag === true?1657:((chargeDischargeSpeedupFlag===true)?1657:(DataSource.naviType === 4?1849:(DataSource.themeIndex === 0x01?1332:1846)))
        y:trackModeFlag === true?102:((chargeDischargeSpeedupFlag===true)?102:(DataSource.naviType === 4?289:(DataSource.themeIndex === 0x01?328:591)))
        //displayState:DataSource.aebLight
        visible: DataSource.aebIndicatorLight
        Image{
            source:{
                if(DataSource.aebIndicatorLight === 0x03){
                    "qrc:/images10_25/warninglight/aebLight_Yellow.png"
                }else if(DataSource.aebIndicatorLight === 0x02){
                    "qrc:/images10_25/warninglight/aebLight_Red.png"
                }else{
                    "qrc:/images10_25/warninglight/aebLight_Green.png"
                }
            }
        }
    }

//TJA/ICA待机/激活状态指示灯 ==>ADAS ICC智能领航指示灯
WarningLight{
    id: tjaIcaStandbyActiveLightId
    x:((chargeDischargeSpeedupFlag===true)?1573:(DataSource.naviType === 4?(DataSource.themeIndex === 0x02 ? 1162:1752):(DataSource.themeIndex === 0x01?1491:1162)))
    y:trackModeFlag === true?281:((chargeDischargeSpeedupFlag===true)?165:(DataSource.naviType === 4?(DataSource.themeIndex === 0x02 ? 30:85):(DataSource.themeIndex === 0x01?234:30)))
    visible: !(weilai === 1 && (DataSource.naviTypeStore === 1 || DataSource.naviTypeStore === 0) && DataSource.themeIndex === 0x02)
    Image{
        source: {
            if (DataSource.iccSmartLeadIndicatorLight === 0 && DataSource.lkaIndicatorLight === 1 && DataSource.accIndicatorLight === 0x02) {
                return "qrc:/images10_25/warninglight/定速巡航.png"
            }			
            if (DataSource.iccSmartLeadIndicatorLight === 3 || DataSource.lkaIndicatorLight === 2) {
                return "qrc:/images10_25/warninglight/故障.png"
            }
            else if (DataSource.iccSmartLeadIndicatorLight === 2) {
                return "qrc:/images10_25/warninglight/acc激活.png"
            }
            else if (DataSource.iccSmartLeadIndicatorLight === 0 && DataSource.lkaIndicatorLight === 1) {
                return "qrc:/images10_25/warninglight/领航关车道开.png"
            }
            else if (DataSource.iccSmartLeadIndicatorLight === 1 && DataSource.lkaIndicatorLight === 1) {
                return "qrc:/images10_25/warninglight/领航开车道开.png"
            }
            else if (DataSource.iccSmartLeadIndicatorLight === 1 && DataSource.lkaIndicatorLight === 0) {
                return "qrc:/images10_25/warninglight/领航开车道关.png"
            }
            else {
                return ""
            }
        }
    }
}

    //定速巡航控制指示灯
    WarningLight{
        id: cruiseSetLightId
        x: (trackModeFlag === true ? 1192 + rootItemRef.cruiseSetX : ((chargeDischargeSpeedupFlag === true) ? 1394 + rootItemRef.cruiseSetX : (DataSource.naviType === 4 ? 1200 + rootItemRef.cruiseSetX : (DataSource.themeIndex === 0x01 ? 1478 + rootItemRef.cruiseSetX : 1200 + rootItemRef.cruiseSetX))))
        y: (trackModeFlag === true ? 222 + rootItemRef.cruiseSetY : ((chargeDischargeSpeedupFlag === true) ? 172 + rootItemRef.cruiseSetY : (DataSource.naviType === 4 ? 41 + rootItemRef.cruiseSetY : (DataSource.themeIndex === 0x01 ? 288 + rootItemRef.cruiseSetY : 41 + rootItemRef.cruiseSetY))))
        visible: DataSource.cruiseSetLight === 1 && !(weilai === 1 && DataSource.naviTypeStore === 1)
        Image{
            source: "qrc:/images10_25/warninglight/cruiseSetLight.png"
        }
    }

    //ACC巡航车速   三个数据项：ACC巡航车速值、ACC巡航车速显示状态、ACC巡航车速颜色
    WarningLight{
        id: accSpeedLightId
        x:DataSource.themeIndex === 0x01 ? (accLightId.x-25):(accLightId.x+10)
        y:DataSource.themeIndex === 0x01 ? (accLightId.y+21):(accLightId.y+20)
        visible: accLightId.visible
        
        Text {
            font.bold:rootItemId.jiacu === 1
            id: accSpeedValue
            width: 61
            text: DataSource.accSpeedValue
			font.family: rootItemId.ziti
            visible: DataSource.accSpeedStatus === DataSource.UI_DISPLAY ?true:false
            font.pixelSize: DataSource.themeIndex === 0x02 ? 33:40 //37
            horizontalAlignment: DataSource.themeIndex === 0x02 ? Text.AlignHCenter:Text.AlignRight
            color: {
                if(DataSource.accIndicatorLight === 0x01){
                    "#717171"
                }else if(DataSource.accIndicatorLight === 0x03){
                    "#f18d00"
                }else{
                    "#007FFF"
                }
            }
        }
    }

    //交通标志识别 两个数据项：交通标志识别值、交通标志识别显示状态 ADAS 限速
    WarningLight{
        id: trafficSignRecognitionId
        x:trackModeFlag === true?684:((chargeDischargeSpeedupFlag===true)?1682:(DataSource.naviType === 4?765:(DataSource.themeIndex === 0x01?1650:765)))
        y:trackModeFlag === true?308:((chargeDischargeSpeedupFlag===true)?161:(DataSource.naviType === 4?7:(DataSource.themeIndex === 0x01?231:7)))
displayState:DataSource.limitTrafficSignRecognition && !(weilai === 1 && (DataSource.naviTypeStore === 1 || DataSource.naviTypeStore === 0) && DataSource.themeIndex === 0x02)

        flashCount: 10+1
        flashCompletedShow: true
        Image{
            id:trafficBorderImg
            visible: true
            source: "qrc:/images10_25/adas2d/trafic_border.png"
        }
        Text {
            font.bold:rootItemId.jiacu === 1
            width: trafficBorderImg.width
            height: trafficBorderImg.height
            horizontalAlignment: Text.AlignHCenter
            verticalAlignment: Text.AlignVCenter
            visible: true
            text: DataSource.limitTrafficSymbolValue
			font.family: rootItemId.ziti
            font.pixelSize:36
            y:28-5-22
            color:"#151515"
        }
    }
    //右转向灯指示灯
    WarningLight{
        id: rightTurnLightId
        x: (trackModeFlag === true ? 1302 + rootItemRef.rightTurnX : ((chargeDischargeSpeedupFlag === true) ? 1322 + rootItemRef.rightTurnX : (DataSource.naviType === 4 ? 1317 + rootItemRef.rightTurnX : (DataSource.themeIndex === 0x01 ? 1322 + rootItemRef.rightTurnX : 1317 + rootItemRef.rightTurnX))))
        y: (trackModeFlag === true ? 93 + rootItemRef.rightTurnY : ((chargeDischargeSpeedupFlag === true) ? 93 + rootItemRef.rightTurnY : (DataSource.naviType === 4 ? 89 + rootItemRef.rightTurnY : (DataSource.themeIndex === 0x01 ? 93 + rootItemRef.rightTurnY : 91 + rootItemRef.rightTurnY))))
        displayState:DataSource.rightTurnLight
        Image{
            source: "qrc:/images10_25/warninglight/rightTurnLight.png"
        }
    }

    //预约充电、预约充电关闭
    WarningLight{
        id: appointChargeLightId
        x:trackModeFlag === true?559:((chargeDischargeSpeedupFlag===true)?60:(DataSource.naviType === 4?211:(DataSource.themeIndex === 0x01?249:1627)))
        y:trackModeFlag === true?16:((chargeDischargeSpeedupFlag===true)?22:(DataSource.naviType === 4?21:(DataSource.themeIndex === 0x01?15:98)))
        Image{
            source: "qrc:/images10_25/warninglight/appointChargeLight.png"
        }
    }

    //前照灯故障警告灯(外部照明故障)
    WarningLight{
        id:headLampLightId
        x:trackModeFlag === true?1230:((chargeDischargeSpeedupFlag===true)?1246:(DataSource.naviType === 4?1226:(DataSource.themeIndex === 0x01?1246:1182)))
        y:trackModeFlag === true?94:((chargeDischargeSpeedupFlag===true)?94:(DataSource.naviType === 4?92:(DataSource.themeIndex === 0x01?94:95)))
        displayState:DataSource.headLampLight
        Image{
            source: DataSource.headLampLightColor === 0x02?"qrc:/images10_25/warninglight/headLampLight.png":"qrc:/images10_25/warninglight/headLampLight_Red.png"
        }
    }

    //后雾灯 有报文设计文档无定义
    WarningLight{
        id:rearFogLightId
        x:1387 + rootItemRef.rearFogX
        y:94 + rootItemRef.rearFogY
        displayState:DataSource.rearFogLight
        Image{
            source: "qrc:/images10_25/warninglight/rearFogLight.png"
        }
    }
    //dms指示灯
    WarningLight{
        id:dmsLightId
        x:trackModeFlag === true?110:((chargeDischargeSpeedupFlag===true)?488:(DataSource.naviType === 4?(DataSource.themeIndex === 0x01?340:536):(DataSource.themeIndex === 0x01?422:1860)))
        y:trackModeFlag === true?220:((chargeDischargeSpeedupFlag===true)?164:(DataSource.naviType === 4?(DataSource.themeIndex === 0x01?665:528):(DataSource.themeIndex === 0x01?652:95)))
        displayState:DataSource.dmsLight
        Image{
            source: "qrc:/images10_25/warninglight/dmsLight.png"
        }
    }
    //智能远近光灯 有报文设计文档无定义     ==>ADAS HMA指示灯
    WarningLight{
        id:smartLightId
        x:weilai === 1 && (DataSource.naviTypeStore === 2 || DataSource.naviTypeStore === 0) && DataSource.themeIndex === 0x02 ? 405+1050:trackModeFlag === true?1158:((chargeDischargeSpeedupFlag===true)?1173:(DataSource.naviType === 4?1158:(DataSource.themeIndex === 0x01?1173:405)))
        y:trackModeFlag === true?99:((chargeDischargeSpeedupFlag===true)?99:(DataSource.naviType === 4?98:(DataSource.themeIndex === 0x01?99:96)))
        //displayState:DataSource.smartLight
        visible:DataSource.hmaFarNearIndicatorLight
        Image{
            source:{
                switch(DataSource.hmaFarNearIndicatorLight){
                case 1:
                    "qrc:/images10_25/warninglight/smartLight_White.png"
                    break
                case 2:
                    "qrc:/images10_25/warninglight/smartLight_Blue.png"
                    break
                case 3:
                    "qrc:/images10_25/warninglight/smartLight_Yellow.png"
                    break
                default:
                    ""
                    break
                }
            }
        }
    }
    //ok指示灯
    WarningLight{
        id: okWarningLightId
        x: (trackModeFlag === true ? 924 + rootItemRef.okX : 
        ((chargeDischargeSpeedupFlag === true) ? 937 + rootItemRef.okX : 550 + rootItemRef.okX))
        y: (trackModeFlag === true ? 632 + rootItemRef.okY : 
        ((chargeDischargeSpeedupFlag === true) ? 620 + rootItemRef.okY : 25 + rootItemRef.okY))
        visible: DataSource.okLight === 1 && !(weilai === 1 && (DataSource.naviTypeStore === 1 || DataSource.naviTypeStore === 0) && DataSource.themeIndex === 0x02)
        Image{
            id: okWarningLightImageId
            //source: ""
            source: DataSource.themeIndex === 0x02 ? "qrc:/images10_25/warninglight/okLight.png":""
        }
    }

    WarningLight{
        id: alcIndicatorLight
        x:trackModeFlag === true?1184:((chargeDischargeSpeedupFlag===true)?1184:(DataSource.naviType === 4?1752:(DataSource.themeIndex === 0x01?1491:1817)))
        y: (DataSource.ilcIndicatorLight == 0x1 || DataSource.ilcIndicatorLight == 0x2)
           ?(chargeDischargeSpeedupFlag===true)?165:(DataSource.naviType === 4?97:(trackModeFlag === true?281:(DataSource.themeIndex === 0x01?231:417)))
           :(chargeDischargeSpeedupFlag===true)?159:(DataSource.naviType === 4?97:(trackModeFlag === true?281:(DataSource.themeIndex === 0x01?234:411)))
        visible: DataSource.ilcIndicatorLight !== 0 ? true:false
        Image{
            id: alcIndicatorLightImageId
            source: {
                switch(DataSource.ilcIndicatorLight){
                case 1:
                    "qrc:/images10_25/warninglight/wheelTurnLeft.png"
                    break
                case 2:
                    "qrc:/images10_25/warninglight/wheelTurnRight.png"
                    break
                case 3:
                    "qrc:/images10_25/warninglight/iclaLeft.png"
                    break
                case 4:
                    "qrc:/images10_25/warninglight/iclaRight.png"
                    break
                default:
                    ""
                    break
                }
            }
        }
    }

    //室内展车模式指示灯
    WarningLight{
        id: indoorShowLight
        x: trackModeFlag === true?1841:((chargeDischargeSpeedupFlag===true)?1841:(DataSource.naviType === 4?24:(DataSource.themeIndex === 0x01?1836:1544)))
        y: trackModeFlag === true?475:((chargeDischargeSpeedupFlag===true)?475:(DataSource.naviType === 4?67:(DataSource.themeIndex === 0x01?664:568)))
        displayState: DataSource.indoorShowCarLight
        Image{
            id: indoorShowLightImageId
            source: "qrc:/images10_25/warninglight/indoorShowLight.png"
        }
    }

    //室外展车模式指示灯
    WarningLight{
        id: outdoorShowLight
        x: trackModeFlag === true?1826:((chargeDischargeSpeedupFlag===true)?1826:(DataSource.naviType === 4?9:(DataSource.themeIndex === 0x01?1822:1529)))
        y: trackModeFlag === true?475:((chargeDischargeSpeedupFlag===true)?475:(DataSource.naviType === 4?67:(DataSource.themeIndex === 0x01?664:568)))
        displayState: DataSource.outdoorShowCarLight
        Image{
            id: outdoorShowLightImageId
            source: "qrc:/images10_25/warninglight/outdoorShowLight.png"
        }
    }

    //游戏模式指示灯
    WarningLight{
        id: gameModeLight
        x: trackModeFlag === true?110:((chargeDischargeSpeedupFlag===true)?557:(DataSource.naviType === 4?(DataSource.themeIndex === 0x01?477:477):(DataSource.themeIndex === 0x01?366:55)))
        y: trackModeFlag === true?286:((chargeDischargeSpeedupFlag===true)?171:(DataSource.naviType === 4?(DataSource.themeIndex === 0x01?677:528):(DataSource.themeIndex === 0x01?664:101)))
        displayState: DataSource.gameModeLight
        Image{
            id: gameModeLightImageId
            source: "qrc:/images10_25/warninglight/gameModeLight.png"
        }
    }	
	
	

    //AI能耗指示灯
    WarningLight{
        id: pemLight
        x: DataSource.themeIndex === 0x01 ? 600:10 + rootItemRef.pemLightX
        y: DataSource.themeIndex === 0x01 ? 652:10 + rootItemRef.pemLightY
        displayState: (chargeDischargeSpeedupFlag === true || trackModeFlag === true) ? 2 : DataSource.pemLight
        Image{
            source: DataSource.language === 0x02 ? "qrc:/images10_25/warninglight/pemLightEn.png"
                                                 : "qrc:/images10_25/warninglight/pemLight.png"
        }
    }

    //cpd指示灯
    /*WarningLight{
        id:cpdLight
        x: trackModeFlag === true?1761:((chargeDischargeSpeedupFlag===true)?261:(DataSource.naviType === 4?(DataSource.themeIndex === 0x01?1700:1730):(DataSource.themeIndex === 0x01?356:309)))
        y: trackModeFlag === true?599:((chargeDischargeSpeedupFlag===true)?532:(DataSource.naviType === 4?149:(DataSource.themeIndex === 0x01?526:543)))
        displayState: DataSource.cpdLight
        Image{
            source:"qrc:/images10_25/warninglight/cpdLight.png"
        }
    }*/

    //交通指示灯
    Item{
        x:1039+70
        y:231
        width: 58
        height: 23
        z:2
        visible: DataSource.trafficSignalStatus === 0x1?true:false
        Image{
            source:"qrc:/images10_25/warninglight/lightBg.png"
        }
        Image{
            source:"qrc:/images10_25/warninglight/light.png"
        }
        WarningLight{
            id:trafficLightLeftId
            visible: true
            x:5
            y:5.83
            displayState: DataSource.leftSignalDisplayStatus === 0x2 || DataSource.leftSignalDisplayStatus === 0x3 ? 6 : DataSource.leftSignalDisplayStatus
            flashCompletedShow: DataSource.leftSignalDisplayStatus === 0x2 ? true : false
            flashCount: 2
            Image{
                source: {
                    switch(DataSource.leftSignalStatus)
                    {
                    case 1:
                        "qrc:/images10_25/warninglight/greenLeft.png"
                        break
                    case 2:
                        "qrc:/images10_25/warninglight/yellowLeft.png"
                        break
                    case 3:
                        "qrc:/images10_25/warninglight/redLeft.png"
                        break
                    default:
                        ""
                        break
                    }
                }
            }
        }
        WarningLight{
            id:trafficLightStraightId
            visible: true
            x:21
            y:4.83
            displayState: DataSource.straightSignalDisplayStatus === 0x2 || DataSource.straightSignalDisplayStatus === 0x3 ? 6 : DataSource.straightSignalDisplayStatus
            flashCompletedShow: DataSource.straightSignalDisplayStatus === 0x2 ? true : false
            flashCount: 2
            Image{
                source: {
                    switch(DataSource.straightSignalStatus)
                    {
                    case 1:
                        "qrc:/images10_25/warninglight/greenLight.png"
                        break
                    case 2:
                        "qrc:/images10_25/warninglight/yellowLight.png"
                        break
                    case 3:
                        "qrc:/images10_25/warninglight/redLight.png"
                        break
                    default:
                        ""
                        break
                    }
                }
            }
        }
        WarningLight{
            id:trafficLightRightId
            visible: true
            x:36.81
            y:5.83
            displayState: DataSource.rightSignalDisplayStatus === 0x2 || DataSource.rightSignalDisplayStatus === 0x3 ? 6 : DataSource.rightSignalDisplayStatus
            flashCompletedShow: DataSource.rightSignalDisplayStatus === 0x2 ? true : false
            flashCount: 2
            Image{
                source: {
                    switch(DataSource.rightSignalStatus)
                    {
                    case 1:
                        "qrc:/images10_25/warninglight/greenRight.png"
                        break
                    case 2:
                        "qrc:/images10_25/warninglight/yellowRight.png"
                        break
                    case 3:
                        "qrc:/images10_25/warninglight/redRight.png"
                        break
                    default:
                        ""
                        break
                    }
                }
            }
        }
    }

    //交通标志
    WarningLight{
        id: trafficSymbolId
        x:trackModeFlag === true?1200:((chargeDischargeSpeedupFlag===true)?1785:(DataSource.naviType === 4?1564:(DataSource.themeIndex === 0x01?1320:1318)))
        y:trackModeFlag === true?335:((chargeDischargeSpeedupFlag===true)?163:(DataSource.naviType === 4?147:(DataSource.themeIndex === 0x01?154:187)))
        visible: DataSource.traficSymbolDisplay
        z:2
        Image{
            id:trafficSymbolImg
            visible: true
            source: {
                switch(DataSource.traficSymbolDisplay)
                {
                case 1:
                    "qrc:/images10_25/warninglight/noEntry.png"
                    break
                case 2:
                    "qrc:/images10_25/warninglight/noMotorVehicles.png"
                    break
                case 3:
                    "qrc:/images10_25/warninglight/temporaryLongParkingIsProhibited.png"
                    break
                case 4:
                    "qrc:/images10_25/warninglight/noStopping.png"
                    break
                case 5:
                    "qrc:/images10_25/warninglight/NoOvertaking.png"
                    break
                case 6:
                    "qrc:/images10_25/warninglight/noOvertakingCance.png"
                    break
                case 7:
                    "qrc:/images10_25/warninglight/noLeftTurn.png"
                    break
                case 8:
                    "qrc:/images10_25/warninglight/noRightTurn.png"
                    break
                case 9:
                    "qrc:/images10_25/warninglight/NoU-bend.png"
                    break
                case 0xA:
                    "qrc:/images10_25/warninglight/stop.png"
                    break
                case 0xB:
                    "qrc:/images10_25/warninglight/giveWay.png"
                    break
                case 0xC:
                    "qrc:/images10_25/warninglight/childrenMakeWay.png"
                    break
                case 0xD:
                    "qrc:/images10_25/warninglight/jaywalk.png"
                    break
                case 0xE:
                    "qrc:/images10_25/warninglight/roadWork.png"
                    break
                case 0xF:
                    "qrc:/images10_25/warninglight/Righthandvehiclein.png"
                    break
                case 0x10:
                    "qrc:/images10_25/warninglight/highSpeedRoadStart.png"
                    break
                case 0x11:
                    "qrc:/images10_25/warninglight/highSpeedRoadEnd.png"
                    break
                case 0x12:
                    "qrc:/images10_25/warninglight/rightTurn.png"
                    break
                case 0x13:
                    "qrc:/images10_25/warninglight/leftTurn.png"
                    break
                case 0x14:
                    "qrc:/images10_25/warninglight/prolongedParkingIsProhibited.png"
                    break
                default:
                    ""
                    break
                }
            }
        }
    }

    /**  3R1V ADAS begin */
    //ACC指示灯
    WarningLight{
        id: accLight3R1VId
        x:trackModeFlag === true?1307:((chargeDischargeSpeedupFlag===true)?1504:(DataSource.naviType === 4?1687:(DataSource.themeIndex === 0x01?1593:1696)))
        y:trackModeFlag === true?219:((chargeDischargeSpeedupFlag===true)?152:(DataSource.naviType === 4?81:(DataSource.themeIndex === 0x01?260:189)))
        displayState:DataSource.accLight
        Image{
            id:accLightImg3R1V
            source:{
                if(DataSource.accLightColor === 0x01){
                    "qrc:/images10_25/warninglight/acc_grey.png"
                }else if(DataSource.accLightColor === 0x02){
                    "qrc:/images10_25/warninglight/acc_yellow.png"
                }else{
                    "qrc:/images10_25/warninglight/acc_green.png"
                }
            }
        }
    }

    //ACC巡航车速   三个数据项：ACC巡航车速值、ACC巡航车速显示状态、ACC巡航车速颜色
    WarningLight{
        id: accSpeedLight3R1VId
        x:accLight3R1VId.x -25
        y:accLight3R1VId.y + 21
        displayState:DataSource.accSpeedLight
        Text {
            font.bold:rootItemId.jiacu === 1
            id: accSpeedValue3R1V
            width: 61
            text: DataSource.accSpeed
			font.family: rootItemId.ziti
            font.pixelSize: 40
            wrapMode: Text.WordWrap
            horizontalAlignment: Text.AlignRight
            transformOrigin: Item.TopRight
            lineHeight:25
            color: {
                if(DataSource.accSpeedLightColor === 0x01){
                    "#717171"
                }else if(DataSource.accSpeedLightColor === 0x02){
                    "#f18d00"
                }else{
                    "#17975f"
                }
            }
        }
    }

    WarningLight{
        id: tjaIcaLightId
        x:trackModeFlag === true?1184:((chargeDischargeSpeedupFlag===true)?1573:(DataSource.naviType === 4?1752:(DataSource.themeIndex === 0x01?1491:1817)))
        y:trackModeFlag === true?281:((chargeDischargeSpeedupFlag===true)?165:(DataSource.naviType === 4?85:(DataSource.themeIndex === 0x01?234:417)))
        displayState: DataSource.tjaLight
        Image{
            source: {
                switch(DataSource.tjaLightColor)
                {
                case 1:
                    "qrc:/images10_25/warninglight/tjaIcaStandbyLight.png"
                    break
                case 2:
                    "qrc:/images10_25/warninglight/tja_yellow.png"

                    break
                case 4:
                    "qrc:/images10_25/warninglight/tjaIcaActiveLight.png"
                    break
                default:
                    ""
                    break
                }
            }
        }
    }

    //自动紧急制动指示灯 ==>ADAS AEB指示灯
    WarningLight{
        id: aebLight3R1VId
        x:trackModeFlag === true?1657:((chargeDischargeSpeedupFlag===true)?1657:(DataSource.naviType === 4?1849:(DataSource.themeIndex === 0x01?1332:1846)))
        y:trackModeFlag === true?102:((chargeDischargeSpeedupFlag===true)?102:(DataSource.naviType === 4?289:(DataSource.themeIndex === 0x01?328:561)))
        displayState:DataSource.pcwLight
        Image{
            source:{
                if(DataSource.pcwLightColor === 0x02){
                    "qrc:/images10_25/warninglight/aebLight_Yellow.png"
                }else if(DataSource.pcwLightColor === 0x03){
                    "qrc:/images10_25/warninglight/aebLight_Red.png"
                }else{
                    "qrc:/images10_25/warninglight/aebLight_Green.png"
                }
            }
        }
    }

    //BSD状态指示灯
    WarningLight{
        id: bsdModeLight3R1VId
        x:trackModeFlag === true?1759:((chargeDischargeSpeedupFlag===true)?1779:(DataSource.naviType === 4?18:(DataSource.themeIndex === 0x01?1330:18)))
        y:trackModeFlag === true?244:((chargeDischargeSpeedupFlag===true)?22:(DataSource.naviType === 4?494:(DataSource.themeIndex === 0x01?264:494)))
        displayState: DataSource.bsdLight
        Image{
            source: {
                switch(DataSource.bsdLightColor){
                case 2:
                    "qrc:/images10_25/warninglight/bsdModeLight.png"
                    break
                case 4:
                    "qrc:/images10_25/warninglight/bsdModeLight_green.png"
                    break
                default:
                    ""
                    break
                }
            }
        }
    }

    //交通标志识别 两个数据项：交通标志识别值、交通标志识别显示状态
    WarningLight{
        id: trafficSignRecognition3R1VId
        x:trackModeFlag === true?684:((chargeDischargeSpeedupFlag===true)?1682:(DataSource.naviType === 4?1456:(DataSource.themeIndex === 0x01?1650:1397)))
        y:trackModeFlag === true?308:((chargeDischargeSpeedupFlag===true)?161:(DataSource.naviType === 4?147:(DataSource.themeIndex === 0x01?231:172)))
        displayState:DataSource.trafficSign
        Image{
            id:trafficBorder3R1VImg
            visible: true
            source: "qrc:/images10_25/adas2d/trafic_border.png"
        }
        Text {
            font.bold:rootItemId.jiacu === 1
            width: trafficBorder3R1VImg.width
            height: trafficBorder3R1VImg.height
            horizontalAlignment: Text.AlignHCenter
            verticalAlignment: Text.AlignHCenter
            visible: true
            text: DataSource.trafficSignValue
			font.family: rootItemId.ziti
            font.pixelSize:36
            y:28
            color:"#151515"
        }
    }

    //智能远近光灯
    WarningLight{
        id:smartLight3R1VId
        x:trackModeFlag === true?1158:((chargeDischargeSpeedupFlag===true)?1173:(DataSource.naviType === 4?1158:(DataSource.themeIndex === 0x01?1173:1163)))
        y:trackModeFlag === true?99:((chargeDischargeSpeedupFlag===true)?99:(DataSource.naviType === 4?98:(DataSource.themeIndex === 0x01?99:102)))
        displayState:DataSource.hmaLight
        Image{
            source:{
                switch(DataSource.hmaLightColor){
                case 1:
                    "qrc:/images10_25/warninglight/smartLight_White.png"
                    break
                case 2:
                    "qrc:/images10_25/warninglight/smartLight_Yellow.png"
                    break
                case 5:
                    "qrc:/images10_25/warninglight/smartLight_Blue.png"
                    break
                default:
                    ""
                    break
                }
            }
        }
    }
    /**  3R1V ADAS end*/
    //指示灯 end
}
