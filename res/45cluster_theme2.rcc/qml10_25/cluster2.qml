import QtQuick 2.15
import QtQuick.Window 2.14
import QtQuick.Controls 2.5
import com.byd.DataSource 1.0
import com.byd.WarningLight 1.0
import com.byd.ScreenMode 1.0
import QtQuick3D 1.15


Rectangle {
    anchors.fill: parent
    color: "#E5000000"
    //    Image {
    //        id: bg_image_id
    //        //source: "qrc:/images10_25/bg.png"
    //    }
    //    Image {
    //        y:100
    //        anchors.horizontalCenter: parent.horizontalCenter
    //        id: image_id
    //        source: "qrc:/common/images/warninglight/rightTurnLight.png"
    //        visible: DataSource.vehicleType === 1?true:false
    //    }

    //    Image {
    //        anchors.centerIn: parent
    //        width: 100
    //        height: 100
    //        id: fengche_image_id
    //        source: "qrc:/images10_25/fengche.png"
    //    }
    //    Text {
    //        anchors.bottom:fengche_image_id.top
    //        anchors.horizontalCenter: parent.horizontalCenter
    //        id: text_id
    //        text: qsTr("0")
    //        font.pixelSize: 50
    //        color: "red"
    //    }
    //    Timer {
    //        property int testCount:0
    //        interval: 100; running: true; repeat: true
    //        onTriggered: {
    //            testCount++
    //            if(testCount > 10000){
    //                testCount = 0
    //            }
    //            text_id.text = testCount
    //            fengche_image_id.visible = fengche_image_id.visible == true?false:true
    //        }

    //    }
    //    anchors.centerIn: parent
    //    width: 80
    //    height: 155
    //    color: "red"

    //    Text {
    //        id: textId
    //        anchors.centerIn: parent
    //        text: qsTr("theme1 "+DataSource.theme)
    //    }
    //    Image {
    //        id: imageId
    //        cache: false
    //        anchors.top: textId.bottom
    //        anchors.topMargin: 5
    //        source: "qrc:/images10_25/absErrAlert.png"
    //    }
    //    CustomRect{
    //        anchors.top: imageId.bottom
    //        Image {

    //            source: "qrc:/images10_25/common/warninglight/beltAlert.png"
    //        }
    //    }

    ScreenMode{
        id:screenModeId
    }

    function screenModeChanged(){
        if(DataSource.powerGear === 3){
            screenModeId.screenMode = 2
        }else if(DataSource.powerGear === 1){
            console.log("leftTurnLightId.displayState = " + leftTurnLightId.displayState)
            console.log("rightTurnLightId.displayState = " + rightTurnLightId.displayState)
            if ((leftTurnLightId.displayState !== 0 && leftTurnLightId.displayState !== 2 )
                    || (rightTurnLightId.displayState !== 0 && rightTurnLightId.displayState !==2 )){
                screenModeId.screenMode = 2
            }else{
                screenModeId.screenMode = 0
            }
        }
    }

    property var imageChange: false
    Connections{
        target: DataSource

        onPowerGearChanged:{
            screenModeChanged()
        }

        onDirectionChanged:{

        }
        onPowerBatterySocChanged:{
            socBatteryChanged()
        }
        onOutsideTempChanged:{
        }

        onTempUnitChanged:{
        }
        onSpeedChanged:{
            speedChanged()

            if(imageChange){
               //bgId.source = "qrc:/images10_25/bg.png"
            }else{
                //bgId.source = "qrc:/images10_25/classic_light_bg.png"
            }
            imageChange = !imageChange
        }
        onSpeedUnitChanged:{
            speedChanged()
        }
        onPowerChanged:{
            powerChanged()
        }
        onPowerUnitChanged:{
            powerChanged()
        }

        onSocMileChanged:{
            socMileChanged()
        }

        onBatteryMileModeChanged:{
            socBatteryChanged()
            socMileChanged()
        }
        onFuelMileChanged:{
            fuelMileChanged()
        }

        onFuelPercentChanged:{
            fuelMileChanged()
        }
        onLowFuelAlarmChanged:{
            fuelMileChanged()
        }

        onEngineRpmChanged:{

        }
        onOdoIndexChanged:{
            odoChanged()
        }
        onTotalOdoChanged:{
            odoChanged()
        }
        onEvOdoChanged:{
            odoChanged()
        }
        onHevOdoChanged:{
            odoChanged()
        }
        onShortOdo1Changed:{
            odoChanged()
        }
        onShortOdo2Changed:{
            odoChanged()
        }
        onOdoUnitChanged:{
            odoChanged()
            socMileChanged()
        }
        onOdo1UnitChanged:{
            odoChanged()
        }
        onOdoEvUnitChanged:{
            odoChanged()
            fuelMileChanged()
        }
        onLeftTurnLightChanged:{
        }
        onLeftTurnLightColorChanged:{
        }
        onOnline_144Changed:{
            speedChanged()
            powerChanged()
        }
        onOnline_261Changed:{

        }
        onOnline_26fChanged:{
            odoChanged()
            socBatteryChanged()
            socMileChanged()
        }
        onOnline_4a5_02Changed:{
            odoChanged()
            socMileChanged()
        }
        onOnline_4a5_03Changed:{
            odoChanged()
        }
        onOnline_4a5_04Changed:{
            odoChanged()
            fuelMileChanged()
        }
        onOnline_4a5_05Changed:{
            socBatteryChanged()
        }
        onOnline_4a5_07Changed:{
            fuelMileChanged()
        }
        onOnline_4a5_09Changed:{

        }

    }

    function odoChanged(){
        if(DataSource.online_26f !==1 || (DataSource.odoIndex === 1 && DataSource.online_4a5_02 !== 1)
                ||(DataSource.odoIndex === 2 && DataSource.online_4a5_03 !== 1)
                ||(DataSource.odoIndex === 3 && DataSource.online_4a5_03 !== 1)
                ||(DataSource.odoIndex === 4 && DataSource.online_4a5_04 !== 1)
                ||(DataSource.odoIndex === 5 && DataSource.online_4a5_04 !== 1)){
            odoId.visible = 0
            odoValueId.visible = 0
            totalOdoUnitId.visible = 0
            odo1UnitId.visible = 0
            odoEvUnitId.visible =0
            return
        }

        var isDisplay = true;
        switch(DataSource.odoIndex){
        case 1:
            odoId.text = qsTr("总里程")
            if(DataSource.totalOdo >= 0 && DataSource.totalOdo <= 0x5F5E0FF){
                odoValueId.text = Math.floor(DataSource.totalOdo/10)
            }else{
                isDisplay = false
            }
            break
        case 2:
            odoId.text = qsTr("里程一")
            if(DataSource.shortOdo1 >= 0 && DataSource.shortOdo1 <= 0x1869F){
                odoValueId.text = DataSource.shortOdo1 / 10
            }else{
                isDisplay = false
            }
            break
        case 3:
            odoId.text = qsTr("里程二")
            if(DataSource.shortOdo2 >= 0 && DataSource.shortOdo2 <= 0x1869F){
                odoValueId.text = DataSource.shortOdo2 / 10
            }else{
                isDisplay = false
            }
            break
        case 4:
            odoId.text = qsTr("HEV里程")
            if(DataSource.hevOdo >= 0 && DataSource.hevOdo <= 0xF423F){
                odoValueId.text = DataSource.hevOdo
            }else{
                isDisplay = false
            }
            break
        case 5:
            odoId.text = qsTr("EV里程")
            if(DataSource.evOdo >= 0 && DataSource.evOdo <= 0xF423F){
                odoValueId.text = DataSource.evOdo
            }else{
                isDisplay = false
            }
            break
        default:
            isDisplay = false
            break;
        }
        if(DataSource.odoUnit === 1){
            totalOdoUnitId.text = "km"
        }else if(DataSource.odoUnit === 2){
            totalOdoUnitId.text = "mile"
        }
        if(DataSource.odo1Unit === 1){
            odo1UnitId.text ="km"
        }else if(DataSource.odo1Unit === 2){
            odo1UnitId.text ="mile"
        }
        if(DataSource.odoEvUnit === 1){
            odoEvUnitId.text ="km"
        }else if(DataSource.odoEvUnit === 2){
            odoEvUnitId.text ="mile"
        }

        if (isDisplay){
            odoId.visible = 1
            odoValueId.visible = 1
            if (DataSource.odoIndex === 1){
                totalOdoUnitId.visible = 1
                odo1UnitId.visible = 0
                odoEvUnitId.visible = 0
            }else if (DataSource.odoIndex === 2 || DataSource.odoIndex === 3){
                totalOdoUnitId.visible = 0
                odo1UnitId.visible = 1
                odoEvUnitId.visible = 0
            }else if(DataSource.odoIndex === 4 || DataSource.odoIndex === 5){
                totalOdoUnitId.visible = 0
                odo1UnitId.visible = 0
                odoEvUnitId.visible = 1
            }
        }else{
            odoId.visible = 0
            odoValueId.visible = 0
            totalOdoUnitId.visible = 0
            odo1UnitId.visible = 0
            odoEvUnitId.visible =0
        }

    }

    function fuelMileChanged(){
        if(DataSource.online_4a5_04 !== 1){
            fuelMileId.visible = 0
            fuelMileUnitId.visible = 0
            mileProgressId.value = 0
            return
        }

        var isDisplay = true
        if (DataSource.fuelMile >= 0x1F && DataSource.fuelMile <= 0x5DC){
            fuelMileId.text = DataSource.fuelMile
        }else if(DataSource.fuelMile === 0x7FE){
            fuelMileId.text = "---"
        }else{
            isDisplay = false
        }

        if (DataSource.odoEvUnit === 1){
            fuelMileUnitId.text = "km"
        }else if(DataSource.odoEvUnit === 2){
            fuelMileUnitId.text = "mile"
        }

        if(isDisplay){
            fuelMileId.visible = 1
            fuelMileUnitId.visible = 1
            if(DataSource.online_4a5_07 === 1 && (DataSource.fuelPercent >= 0 && DataSource.fuelPercent <=0x64)){
                mileProgressId.value = DataSource.fuelPercent/100
            }else{
                mileProgressId.value = 0
            }
        }else{
            fuelMileId.visible = 0
            fuelMileUnitId.visible = 0
            mileProgressId.value = 0
        }
    }

    function speedChanged(){
        if(DataSource.online_144 !== 1){
            speedProgessId.progress = 0
            speedProgessId.progressCanvas.requestPaint()
            speedValueId.visible = 0
            speedUnitId.visible = 0
            return
        }

        switch(DataSource.speedUnit){
        case 1:
            speedUnitId.text = "km/h"
            speedProgessId.unitType = 1
            break
        case 2:
            speedUnitId.text = "mph"
            speedProgessId.unitType = 2
            break
        }

        var isDisplay = true;
        if (speedProgessId.unitType === 1){
            if(DataSource.speed>= 0 && DataSource.speed<= 240){
                speedValueId.text = DataSource.speed
                speedProgessId.progress = DataSource.speed
            }else{
                isDisplay = false
            }
        }else if (speedProgessId.unitType === 2){
            if(DataSource.speed>= 0 && DataSource.speed<= 160){
                speedValueId.text = DataSource.speed
                speedProgessId.progress = DataSource.speed
            }else{
                isDisplay = false
            }
        }

        if (isDisplay){
            speedValueId.visible = 1
            speedUnitId.visible = 1
            speedProgessId.progressCanvas.requestPaint()
        }else{
            speedProgessId.progress = 0
            speedProgessId.progressCanvas.requestPaint()
            speedValueId.visible = 0
            speedUnitId.visible = 0
        }
    }

    function powerChanged(){
        if(DataSource.online_144 !== 1){
            powerValueId.visible = 0
            powerUnit.visible = 0
            return
        }

        if(DataSource.powerUnit === 1){
            powerUnit.text = "kW"
        }else if(DataSource.powerUnit === 2){
            powerUnit.text = "HP"
        }

        var isDisplay = true
        if(DataSource.power >= 0x2BC && DataSource.power <= 0x7D0){
            powerValueId.text = DataSource.power -1000
        }else{
            isDisplay = false
        }

        if (isDisplay){
            powerValueId.visible = 1
            powerUnit.visible = 1
        }else{
            powerValueId.visible = 0
            powerUnit.visible = 0
        }
    }

    function socBatteryChanged(){
        if(DataSource.online_26f !==1 || DataSource.online_4a5_05 !== 1){
            socVauleId.visible = 0
            socUnitId.visible = 0
            socProgressId.value = 0
            return
        }

        var isDisplay = true
        if(DataSource.powerBatterySoc >= 0 &&  DataSource.powerBatterySoc <= 0x3E8){
            socVauleId.text = Math.floor(DataSource.powerBatterySoc/10)
            socProgressId.value = DataSource.powerBatterySoc/1000
        }else if (DataSource.powerBatterySoc === 0xFFE){
            socVauleId.text = " "
            socProgressId.value = 0
        }else{
            isDisplay = false
        }
        if (isDisplay){
            if (DataSource.batteryMileMode=== 2){
                socVauleId.visible = 1
                socUnitId.visible = 1
            }else{
                socVauleId.visible = 0
                socUnitId.visible = 0
                if(DataSource.batteryMileMode !== 1){
                    socProgressId.value = 0
                }
            }
        }else{
            socVauleId.visible = 0
            socUnitId.visible = 0
            socProgressId.value = 0
        }
    }

    function socMileChanged(){
        if(DataSource.online_26f !==1 || DataSource.online_4a5_02 !== 1){
            socMileId.visible = 0
            socMileUnitId.visible = 0;
            return
        }
        var isDisplay = true
        if (DataSource.socMile >= 0 && DataSource.socMile <= 0x3E7){
            socMileId.text = DataSource.socMile
        }else if(DataSource.socMile === 0x3FE){
            socMileId.text = qsTr(" ")
        }else{
            isDisplay = false
        }

        if(DataSource.odoUnit === 1){
            socMileUnitId.text = "km"
        }else if(DataSource.odoUnit === 2){
            socMileUnitId.text = "mile"
        }

        if(isDisplay && DataSource.batteryMileMode === 1){
            socMileId.visible = 1
            socMileUnitId.visible = 1;
        }else{
            socMileId.visible = 0
            socMileUnitId.visible = 0;
        }
    }

    function currentDateTime(){
        return Qt.formatDateTime(new Date(), "hh:mm");
    }

    Item {
        id: alwaysDiaplayId
        width: parent.width
        height: parent.height
        visible: DataSource.powerGear === 3 ? 1 : 0

        Image {
            id: bgId
            source: "qrc:/images10_25/classic_light_bg.png"
        }
        Item {
            id: headInfoId
            x:454
            y:59
            width: 1013
            height: 37

            //时间显示
            Item{
                id: timeDisplayId
                x:77
                height: parent.height

                Text{
                    font.bold:rootItemId.jiacu === 1
                    font.family: rootItemId.ziti
                    id:currentTimeId
                    text: currentDateTime()
                    color: "#151616"
                    font.pixelSize: 34
                    anchors.bottom: parent.bottom
                    anchors.bottomMargin: -3
                }
                //                Text{
                //                    id:timeFormatId
                //                    color: "#ffcd00"
                //                    text: "下午"
                //                    anchors.bottom: parent.bottom
                //                    anchors.right: currentTimeId.left
                //                    anchors.rightMargin: 3
                //                    font.pixelSize: 26
                //                }

                Timer{
                    id:timerId
                    interval: 2000
                    repeat: true
                    running: true
                    onTriggered: {
                        currentTimeId.text =  currentDateTime()
                    }
                }
            }

            //挡位
            WarningLight{
                id: gearModeId
                x:489
                height: parent.height
                displayState:(DataSource.online_26f ===1 && (DataSource.gearMode >= 1 && DataSource.gearMode <=6))?DataSource.gearModeFlash:0
                Text {
                    font.bold:rootItemId.jiacu === 1
                    font.family: rootItemId.ziti
                    id: gearModeTextId
                    anchors.bottom: parent.bottom
                    anchors.bottomMargin: -3
                    color: "#1c1c1c"
                    font.pixelSize: 62
                    states:[
                        State {
                            name: "P"
                            when:(DataSource.gearMode === 1)
                            PropertyChanges {
                                target: gearModeTextId
                                text: "P"
                            }
                        },
                        State {
                            name: "R"
                            when:(DataSource.gearMode === 2)
                            PropertyChanges {
                                target: gearModeTextId
                                text: "R"
                            }
                        },
                        State {
                            name: "N"
                            when:(DataSource.gearMode === 3)
                            PropertyChanges {
                                target: gearModeTextId
                                text: "N"
                            }
                        },
                        State {
                            name: "D"
                            when:(DataSource.gearMode === 4)
                            PropertyChanges {
                                target: gearModeTextId
                                text: "D"
                            }
                        },
                        State {
                            name: "M"
                            when:(DataSource.gearMode === 5)
                            PropertyChanges {
                                target: gearModeTextId
                                text: "M"
                            }
                        },
                        State {
                            name: "S"
                            when:(DataSource.gearMode === 6)
                            PropertyChanges {
                                target: gearModeTextId
                                text: "S"
                            }
                        }
                    ]
                }
            }

            //ECO指示灯
            Image{
                id: ecoLightId
                x:354
                source: "qrc:/images10_25/ecoLight.png"
                anchors.bottom: parent.bottom
            }

            //HEV指示灯
            Image{
                id: hevLightId
                x:593
                anchors.bottom: parent.bottom
                source: "qrc:/images10_25/hevLight.png"
            }

            //方位
            Image{
                id: compassId
                x:782
                anchors.bottom: parent.bottom
                visible: directionTextId.visible
                source: "qrc:/images10_25/compass.png"
            }

            Text{
                font.bold:rootItemId.jiacu === 1
                font.family: rootItemId.ziti
                id:directionTextId
                visible: (DataSource.online_4a5_03 ===1 && (DataSource.direction >= 1 && DataSource.direction <= 8)) ? 1 : 0
                anchors.left: compassId.right
                anchors.leftMargin: 5
                anchors.bottom: parent.bottom
                anchors.bottomMargin: -3
                color: "#1c1c1c"
                font.pixelSize: 34
                states:[
                    State {
                        name: "N"
                        when:DataSource.direction === 1
                        PropertyChanges {
                            target: directionTextId
                            text: "北"
                        }
                    },
                    State {
                        name: "NE"
                        when:DataSource.direction === 2
                        PropertyChanges {
                            target: directionTextId
                            text: "东北"
                        }
                    },
                    State {
                        name: "E"
                        when:DataSource.direction === 3
                        PropertyChanges {
                            target: directionTextId
                            text: "东"
                        }
                    },
                    State {
                        name: "SE"
                        when:DataSource.direction === 4
                        PropertyChanges {
                            target: directionTextId
                            text: "东南"
                        }
                    },
                    State {
                        name: "S"
                        when:DataSource.direction === 5
                        PropertyChanges {
                            target: directionTextId
                            text: "南"
                        }
                    },
                    State {
                        name: "SW"
                        when:DataSource.direction === 6
                        PropertyChanges {
                            target: directionTextId
                            text: "西南"
                        }
                    },
                    State {
                        name: "W"
                        when:DataSource.direction === 7
                        PropertyChanges {
                            target: directionTextId
                            text: "西"
                        }
                    },
                    State {
                        name: "NW"
                        when:DataSource.direction === 8
                        PropertyChanges {
                            target: directionTextId
                            text: "西北"
                        }
                    }
                ]
            }

            //温度
            Item{
                id: outsideTempId
                x: 907
                height: parent.height
                visible: (DataSource.online_4a5_03 ===1 && ((DataSource.outsideTemp >= 0 && DataSource.outsideTemp <= 0xFD) || DataSource.outsideTemp === 0xFE)) ? 1 : 0
                Text {
                    font.bold:rootItemId.jiacu === 1
                    font.family: rootItemId.ziti
                    id: tempValueId
                    anchors.bottom: parent.bottom
                    anchors.bottomMargin: -3
                    color: "#1c1c1c"
                    font.pixelSize: 34
                    states:[
                        State {
                            name: "tempValue"
                            when:DataSource.outsideTemp >= 0 && DataSource.outsideTemp <= 0xFD
                            PropertyChanges {
                                target: tempValueId
                                text: DataSource.outsideTemp-60
                            }
                        },
                        State {
                            name: "temp---"
                            when:DataSource.outsideTemp === 0xFE
                            PropertyChanges {
                                target: tempValueId
                                text: "---"
                            }
                        }
                    ]
                }
                Text {
                    font.bold:rootItemId.jiacu === 1
                    font.family: rootItemId.ziti
                    id: tempUnitId
                    anchors.bottom: parent.bottom
                    anchors.bottomMargin: -3
                    anchors.left: tempValueId.right
                    color: "#1c1c1c"
                    font.pixelSize: 42
                    text: qsTr("℃")
                    states:[
                        State {
                            name: "centigrade"
                            when:DataSource.tempUnit === 0
                            PropertyChanges {
                                target: tempUnitId
                                text: "℃"
                            }
                        },
                        State {
                            name: "fahrenheit"
                            when:DataSource.tempUnit === 1
                            PropertyChanges {
                                target: tempUnitId
                                text: "℉"
                            }
                        }
                    ]
                }
            }
        }

        Image {
            id: headLineId
            y:108
            anchors.horizontalCenter: parent.horizontalCenter
            source: "qrc:/images10_25/headLine.png"
        }

        //速度
        Item {
            id: speedId
            width:435
            height:428
            x:192
            y:160
            Image{
                source: "qrc:/images10_25/speedOutCircle.png"
            }

            SpeedProgress{
                id:speedProgessId
                background_width:428
                background_height:428
                arcWidth:7
                style: 1
            }

            Text {
                font.bold:rootItemId.jiacu === 1
                font.family: rootItemId.ziti
                id: speedValueId
                y:(parent.height-height)/2
                anchors.horizontalCenter: parent.horizontalCenter
                font.pixelSize: 138
                color: "#ffda2e";
            }
            Text {
                font.bold:rootItemId.jiacu === 1
                font.family: rootItemId.ziti
                id: speedUnitId
                text: qsTr("km/h")
                anchors.horizontalCenter: parent.horizontalCenter
                anchors.top: speedValueId.bottom
                anchors.topMargin: 13
                font.pixelSize: 38
                color: "#adadad"
            }
            Component.onCompleted: {
                speedChanged()
            }
        }
        //功率
        Item {
            id: powerId
            width:435
            height:428
            x:1291
            y:160
            Image{
                source: "qrc:/images10_25/speedOutCircle.png"
            }

            Text {
                font.bold:rootItemId.jiacu === 1
                font.family: rootItemId.ziti
                id: powerValueId
                y:(parent.height-height)/2
                anchors.horizontalCenter: parent.horizontalCenter
                font.pixelSize: 138
                color: "#ffda2e";
            }

            Text {
                font.bold:rootItemId.jiacu === 1
                font.family: rootItemId.ziti
                id: powerUnit
                text: qsTr("kW")
                anchors.horizontalCenter: parent.horizontalCenter
                anchors.top: powerValueId.bottom
                anchors.topMargin: 13
                font.pixelSize: 38
                color: "#adadad";
            }
            Component.onCompleted: {
                powerChanged()
            }
        }

        Image {
            id: powerImgId
            x:1507
            y:139
            source: "qrc:/images10_25/power_power.png"
        }
        Image {
            id: ecoImgId
            x:1679
            y:218
            source: "qrc:/images10_25/power_eco.png"
        }
        Image {
            id: chargeImgId
            x:1507
            y:533
            source: "qrc:/images10_25/power_charge.png"
        }
        Image {
            id: powertxtImgId
            x:1562
            y:132
            source: "qrc:/images10_25/powe_power_txt.png"
        }
        Image {
            id: ecotxtImgId
            x:1749
            y:360
            source: "qrc:/images10_25/power_eco_txt.png"
        }
        Image {
            id: chargetxtImgId
            x:1568
            y:575
            source: "qrc:/images10_25/power_charge_txt.png"
        }

        Item {
            id: socMileInfoId
            width: 671
            height: 29
            y:578
            anchors.horizontalCenter: parent.horizontalCenter

            Text {
                font.bold:rootItemId.jiacu === 1
                font.family: rootItemId.ziti
                id: socMileId
                anchors.bottom: parent.bottom
                anchors.bottomMargin: -2
                font.pixelSize: 34
                color: "#4b4b4b"
            }
            Text {
                font.bold:rootItemId.jiacu === 1
                font.family: rootItemId.ziti
                id: socMileUnitId
                text: qsTr("km")
                visible: socMileId.visible
                anchors.left: socMileId.right
                font.pixelSize: 24
                anchors.leftMargin: 5
                color: "#adadad"
                anchors.bottom: parent.bottom
            }
            Text {
                font.bold:rootItemId.jiacu === 1
                font.family: rootItemId.ziti
                id: socVauleId
                anchors.bottom: parent.bottom
                font.pixelSize: 34
                color: "#4b4b4b"
            }

            Text {
                font.bold:rootItemId.jiacu === 1
                font.family: rootItemId.ziti
                id: socUnitId
                text: qsTr("%")
                visible: false
                anchors.left: socVauleId.right
                anchors.leftMargin: 5
                anchors.bottom: parent.bottom
                font.pixelSize: 34
                color: "#9e9e9e"
            }

            Image {
                id: batteryIconId
                x:209
                source: "qrc:/images10_25/batteryIcon.png"
                anchors.bottom: parent.bottom
            }

            Image {
                id: okImgId
                source: "qrc:/images10_25/okIcon.png"
                anchors.horizontalCenter: parent.horizontalCenter
                anchors.bottom: parent.bottom
            }
            Image {
                id: fuelIconId
                x:412
                anchors.bottom: parent.bottom
                source: "qrc:/images10_25/fuelIcon.png"
            }
            Text {
                font.bold:rootItemId.jiacu === 1
                font.family: rootItemId.ziti
                id: fuelMileUnitId
                text: qsTr("km")
                anchors.bottom: parent.bottom
                anchors.right: parent.right
                font.pixelSize: 24
                color: "#adadad"
            }
            Text {
                font.bold:rootItemId.jiacu === 1
                font.family: rootItemId.ziti
                id: fuelMileId
                text: qsTr("88")
                anchors.bottom: parent.bottom
                anchors.bottomMargin: -2
                anchors.right: fuelMileUnitId.left
                anchors.rightMargin: 5
                font.pixelSize: 34
                color: "#4b4b4b"
            }
            Component.onCompleted: {
                socBatteryChanged()
                socMileChanged()
                fuelMileChanged()
            }
        }

        ProgressBar{
            id: socProgressId
            x:609
            y:614
            width: 281
            height: 11
            background: Image {
                source: "qrc:/images10_25/mileProgressBg.png"
            }

            contentItem: Item{
                Rectangle {
                    width: socProgressId.visualPosition * parent.width
                    height: parent.height
                    radius: 3
                    color: DataSource.batteryAlarm === 1 ? "#00ab39":"#ff0000"
                }
            }
            Component.onCompleted: {
                socBatteryChanged()
            }
        }

        ProgressBar{
            id: mileProgressId
            x:1022
            y:614
            width: 281
            height: 11
            background: Image {
                source: "qrc:/images10_25/mileProgressBg.png"
            }

            contentItem: Item{
                Rectangle {
                    width: mileProgressId.visualPosition * parent.width
                    height: parent.height
                    radius: 3
                    color: DataSource.lowFuelAlarm === 1 ? "#00ab39":"#ff0000"
                }
            }

            Component.onCompleted: {
                fuelMileChanged()
            }
        }

        //转速
        Text {
            font.bold:rootItemId.jiacu === 1
            font.family: rootItemId.ziti
            id: rmpId
            x:246
            y:650
            font.pixelSize: 34
            color: "#292929"
            visible: (DataSource.online_144 ===1 && (DataSource.engineRpm >= 0 && DataSource.engineRpm <= 8000)) ? 1:0
            text: (DataSource.engineRpm/1000).toFixed(1) + "×1000r/min"
        }

        //里程
        Text {
            font.bold:rootItemId.jiacu === 1
            font.family: rootItemId.ziti
            id: odoId
            anchors.right: odoValueId.left
            anchors.rightMargin: 14
            font.pixelSize: 26
            color: "#292929"
            anchors.bottom: odoValueId.bottom
            Component.onCompleted: {
                odoChanged()
            }
        }

        Text {
            font.bold:rootItemId.jiacu === 1
            font.family: rootItemId.ziti
            id: odoValueId
            x:1572
            y:646
            font.pixelSize: 34
            color: "#292929"
            text: qsTr("260")
            Component.onCompleted: {
                odoChanged()
            }
        }

        Text {
            font.bold:rootItemId.jiacu === 1
            font.family: rootItemId.ziti
            id: totalOdoUnitId
            anchors.left: odoValueId.right
            anchors.leftMargin: 2
            font.pixelSize: 34
            color: "#292929"
            text: qsTr("km")
            anchors.bottom: odoValueId.bottom
            Component.onCompleted: {
                odoChanged()
            }
        }

        Text {
            font.bold:rootItemId.jiacu === 1
            font.family: rootItemId.ziti
            id: odo1UnitId
            anchors.left: odoValueId.right
            anchors.leftMargin: 2
            font.pixelSize: 34
            color: "#292929"
            text: qsTr("km")
            visible: false
            anchors.bottom: odoValueId.bottom
            Component.onCompleted: {
                odoChanged()
            }
        }

        Text {
            font.bold:rootItemId.jiacu === 1
            font.family: rootItemId.ziti
            id: odoEvUnitId
            anchors.left: odoValueId.right
            anchors.leftMargin: 2
            font.pixelSize: 34
            color: "#292929"
            text: qsTr("km")
            visible: false
            anchors.bottom: odoValueId.bottom
            Component.onCompleted: {
                odoChanged()
            }
        }
    }

    //左转向灯指示灯
    WarningLight{
        id: leftTurnLightId
        x:690
        y:59
        displayState:DataSource.leftTurnLight
        Image{
            source: "qrc:/images10_25/leftTurnLight.png"
        }
        Component.onCompleted: {
            screenModeChanged()
        }
        onDisplayStateChanged: {
            screenModeChanged()
        }
    }

    //右转向灯指示灯
    WarningLight{
        id: rightTurnLightId
        x:1147
        y:59
        displayState:DataSource.rightTurnLight
        Image{
            source: "qrc:/images10_25/rightTurnLight.png"
        }
        Component.onCompleted: {
            screenModeChanged()
        }
        onDisplayStateChanged: {
            screenModeChanged()
        }
    }

}
