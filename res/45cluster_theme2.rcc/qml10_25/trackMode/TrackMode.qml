import QtQuick 2.15
import com.byd.DataSource 1.0
import QtQuick.Controls 2.15
import com.byd.WarningLight 1.0
import com.byd.CenterChild 1.0
import QtGraphicalEffects 1.12
import "qrc:/common/singleton"
CenterChild {
    id:trackModeId
    width:1920
    height:720
    property real prePonintX
    property real prePonintY
    property int picIndex:0
    property int speedApproachIndex:0 //入场速度线索引
    property int speedLineAnimIndex:0 //速度线动画索引
    property bool isInitSpeedLineAnim:false //速度线动画图片加载
    property bool isInitSpeedApproach:false //速度线入场图片加载
    Component.onCompleted:{
        redLightOpacityAnim.start()
        approachAdimTimer.start()
    }
    onPicIndexChanged: {
        if(picIndex>18){
            approachAdimTimer.stop()
            if(DataSource.speed !== -1 && DataSource.speed !== 0){
                if(!speedAnimTimer.running && !speedApproachAdimTimer.running){
                    speedApproachAdimTimer.start()
                }
            }
            opacityAnimId.start()
        }
    }

    onSpeedApproachIndexChanged: {
        if(speedApproachIndex >9){
            speedLineAnimIndex = 0
            speedAnimTimer.start()
            speedApproachAdimTimer.stop()
            hidePics2()
            speedApproachIndex = 0
            isInitSpeedApproach = true
        }
    }

    //入场动画
    //两侧赛道入场图片
    ListModel{
        id:trackApproachPicList
    }
    //速度线入场图片
    ListModel{
        id:speedApproachPicList
    }
    //速度线动画图片
    ListModel{
        id:speedLineAnimList
    }

    function hidePics(){
        for(var i=0; i < trackApproachPicList.count; ++i){
            trackApproachPicList.setProperty(i, "picVisible", false)
        }
    }
    function showPics(index){
        trackApproachPicList.setProperty(index, "picVisible", true)
    }
    function hidePics2(){
        for(var i=0; i < speedApproachPicList.count; ++i){
            speedApproachPicList.setProperty(i, "picVisible", false)
        }
    }
    function showPics2(index){
        speedApproachPicList.setProperty(index, "picVisible", true)
    }
    function hidePics3(){
        for(var i=0; i < speedLineAnimList.count; ++i){
            speedLineAnimList.setProperty(i, "picVisible", false)
        }
    }
    function showPics3(index){
        speedLineAnimList.setProperty(index, "picVisible", true)
    }

    Timer{
        id:approachAdimTimer
        running: false
        repeat: true
        interval: 33
        onTriggered: {
            if(picIndex<=18){
                hidePics()
                trackApproachPicList.append({"picVisible":true})
                showPics(picIndex)
                picIndex++
            }
        }
    }
    Timer{
        id:speedApproachAdimTimer
        running: false
        repeat: true
        interval: 33
        onTriggered: {
            if(speedApproachIndex<=9){
                hidePics2()
                if(!isInitSpeedApproach){
                    speedApproachPicList.append({"picVisible":true})
                }
                showPics2(speedApproachIndex)
                speedApproachIndex++
            }
        }
    }
    Timer{
        id:speedAnimTimer
        running: false
        repeat: true
        interval: 33
        triggeredOnStart: true
        onTriggered: {
            if(speedLineAnimIndex > 19){
                speedLineAnimIndex = 0
                isInitSpeedLineAnim = true
            }
            if(!isInitSpeedLineAnim){
                hidePics3()
                speedLineAnimList.append({"picVisible":true})
                showPics3(speedLineAnimIndex)
                speedLineAnimIndex++
            }else{
                hidePics3()
                showPics3(speedLineAnimIndex)
                speedLineAnimIndex++
            }
        }
        onRunningChanged: {
            if(speedAnimTimer.running){
                trackImgOpacityAnim.start()
            }else{
                trackEntryItem.opacity = 1
            }

        }
    }
    Item{
        id:bg
        anchors.fill: parent
        //z:10
        Image{
            anchors.fill: parent
            source: "qrc:/images10_25/trackMode/bg.png"
            cache: false
        }
        //地面z:9
        Image {
            y:411
            cache: false
            source: "qrc:/images10_25/trackMode/ground_9.png"
        }
        //速度线z:8
        //速度线入场
        Repeater{
            id:speedLineId
            model: speedApproachPicList
            Image{
                id:speedEntryImg
                x:0
                y:340
                source: "qrc:/images10_25/trackMode/speedLineEntryAdim/IMG_"+index+".ktx"
                cache: false
                visible:picVisible
            }
        }
        //速度线动画
        Repeater{
            id:speedAnimId
            model: speedLineAnimList
            Image{
                x:0
                y:340
                source: "qrc:/images10_25/trackMode/speedLineAdim/IMG_"+index+".ktx"
                cache: false
                visible:DataSource.speed !== -1  && DataSource.speed !== 0 && picVisible
            }
        }
        //红光z:7
        Image{
            id:redLightId
            y:267
            cache: false
            source: "qrc:/images10_25/trackMode/redLight_7.png"
            opacity: 0
        }
        //两侧造型z:6
        Item{
            id:trackEntryItem
            Repeater{
                model: trackApproachPicList
                Image{
                    id:trackEntryImg
                    x:0
                    y:382
                    source: "qrc:/images10_25/trackMode/trackEntryAdim/IMG_"+index+".ktx"
                    cache: false
                    visible: picVisible
                }
            }
        }
        //中心光源z:5
        Image{
            y: 229
            x:830
            cache: false
            source: "qrc:/images10_25/trackMode/lightSource_5.png"
        }
        //地板灯光z:4
        Image {
            y: 438
            anchors.horizontalCenter: parent.horizontalCenter
            cache: false
            source: "qrc:/images10_25/trackMode/groundLight_4.png"
        }
        //circle z:3
        Image{
            id:circleAreaId
            y: 556
            anchors.horizontalCenter: parent.horizontalCenter
            cache: false
            source: "qrc:/images10_25/trackMode/circle_3.png"
            opacity: 0
        }
        //车体 z:2
        Image{
            y:447
            anchors.horizontalCenter: parent.horizontalCenter
            cache: false
            source: "qrc:/images10_25/trackMode/ekSport_2.png"
        }
        //两侧背光 z:1
        Image {
            id:redReflectId
            y: 534
            anchors.horizontalCenter: parent.horizontalCenter
            cache:false
            source: "qrc:/images10_25/trackMode/backLight_1.png"
            opacity: 0
        }
    }

    //top
    Rectangle{
        id:topRect
        x: 174
        y: 0
        width: 1551
        height: 73
        color: "transparent"

        //中间栏
        Image{
            id:frame
            x:494
            anchors.top: parent.top
            source: "qrc:/images10_25/trackMode/frame.png"
            cache: false
        }
        //信息栏
        Item{
            anchors.left: topRect.left
            y:25
            width: parent.width
            height: 33

            //时间显示
            Item{
                id: timeDisplayId
                visible: DataSource.timeDisplay === 0x01 ? true : false
                property bool isAm: true
                property string currentTime: ""

                Text{
                    font.bold:rootItemId.jiacu === 1
                    font.family: rootItemId.ziti
                    x: 0
                    y: 9
                    width: 102
                    height: 28
                    text: timeDisplayId.currentTime
                    horizontalAlignment: Text.AlignLeft
                    verticalAlignment: Text.AlignVCenter
                    color: DataSource.dayNightMode === 0x02 ?"#ffffff":"#333333"
                    font.pixelSize: 36//45
                    visible: DataSource.timeFormat === 2 ? true: false
                }

                Text{
                    font.bold:rootItemId.jiacu === 1
                    font.family: rootItemId.ziti
                    anchors.left: timeFormatId.right
                    anchors.leftMargin: -2
                    anchors.bottom: timeFormatId.bottom
                    anchors.bottomMargin: -6
                    text: timeDisplayId.currentTime
                    color: DataSource.dayNightMode === 0x02 ?"#ffffff":"#333333"
                    font.pixelSize: 36//45
                    visible: timeFormatId.visible && DataSource.language === 0x01 ? true: false
                }

                Text{
                    font.bold:rootItemId.jiacu === 1
                    font.family: rootItemId.ziti
                    anchors.right: timeFormatId.left
                    anchors.rightMargin: 1
                    anchors.bottom: timeFormatId.bottom
                    anchors.bottomMargin: -4
                    text: timeDisplayId.currentTime
                    color: DataSource.dayNightMode === 0x02 ?"#ffffff":"#333333"
                    font.pixelSize: 36//45
                    visible: timeFormatId.visible && DataSource.language !== 0x01 ? true: false
                }

                Text{
                    font.bold:rootItemId.jiacu === 1
                    font.family: rootItemId.ziti
                    id:timeFormatId
                    x: DataSource.language !== 0x01 ? 88  : -7
                    y: DataSource.language !== 0x01 ? 9 : 7
                    width: 62
                    height: 28
                    horizontalAlignment: Text.AlignHCenter
                    verticalAlignment: Text.AlignVCenter
                    color: DataSource.dayNightMode === 0x02 ?"#bfffffff":"#bf333333"
                    text: timeDisplayId.isAm ? (DataSource.language === 0x01?"上午":"AM") : (DataSource.language === 0x01?"下午":"PM")
                    font.pixelSize: DataSource.language !== 0x01 ? 36 : 25
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

            //档位
            WarningLight{
                id: gearModeId
                x: 768
                anchors.bottom: parent.bottom
                displayState:DataSource.gearMode > 0?DataSource.gearDisplayState:0
                Image {
                    id: gearModeImageId
                    anchors.left: gearModeId.left
                    anchors.bottom: gearModeId.bottom
                    cache: false
                    source:{
                        if(DataSource.gearMode === 1){
                            "qrc:/images10_25/trackMode/P.png"
                        }else if(DataSource.gearMode === 2){
                            "qrc:/images10_25/trackMode/R.png"
                        }else if(DataSource.gearMode === 3){
                            "qrc:/images10_25/trackMode/N.png"
                        }else if(DataSource.gearMode === 4){
                            "qrc:/images10_25/trackMode/D.png"
                        }else if(DataSource.gearMode === 5){
                            "qrc:/images10_25/trackMode/M.png"
                        }else if(DataSource.gearMode === 6){
                            "qrc:/images10_25/trackMode/S.png"
                        }else{
                            ""
                        }
                    }
                }
                Image {
                    id: realGearImageId
                    anchors.left: gearModeImageId.right
                    anchors.leftMargin: 1
                    anchors.bottom: gearModeImageId.bottom
                    source: {
                        if(DataSource.realGear === 1){
                            "qrc:/images10_25/trackMode/1.png"
                        }else if(DataSource.realGear === 2){
                            "qrc:/images10_25/trackMode/2.png"
                        }else if(DataSource.realGear === 3){
                            "qrc:/images10_25/trackMode/3.png"
                        }else if(DataSource.realGear === 4){
                            "qrc:/images10_25/trackMode/4.png"
                        }else if(DataSource.realGear === 5){
                            "qrc:/images10_25/trackMode/5.png"
                        }else if(DataSource.realGear === 6){
                            "qrc:/images10_25/trackMode/6.png"
                        }else if(DataSource.realGear === 7){
                            "qrc:/images10_25/trackMode/7.png"
                        }else if(DataSource.realGear === 8){
                            "qrc:/images10_25/trackMode/8.png"
                        }else if(DataSource.realGear === 9){
                            "qrc:/images10_25/trackMode/9.png"
                        }else{
                            ""
                        }
                    }
                }
            }
            //温度
            Item{
                id: outsideTempId
                x: 1321
                anchors.bottom: parent.bottom
                anchors.bottomMargin: -8
                visible: DataSource.outsideTempDisplay !== 0 ? 1 : 0
                Text{
                    font.bold:rootItemId.jiacu === 1
                    font.family: rootItemId.ziti
                    id: tempValueId
                    anchors.left: parent.left
                    anchors.bottom: outsideTempId.bottom
                    color: "#ffffff"
                    font.pixelSize: 36
                    text: DataSource.outsideTemp
                }
                Text{
                    font.bold:rootItemId.jiacu === 1
                    font.family: rootItemId.ziti
                    id:tempUnitId
                    anchors.left: tempValueId.right
                    anchors.leftMargin: 8
                    anchors.bottom: tempValueId.bottom
                    color: "#ffffff"
                    font.pixelSize: 36
                    text: DataSource.outsideTempUnit === 0 ? "°C":"°F"
                }
            }
            //方位
            Item{
                x: 1457
                anchors.bottom: parent.bottom
                Image {
                    id: directionImage
                    anchors.left: parent.left
                    anchors.bottom: parent.bottom
                    source: "qrc:/images10_25/trackMode/direction_icon.png"
                    cache: false
                }
                Text{
                    font.bold:rootItemId.jiacu === 1
                    font.family: rootItemId.ziti
                    id:directionTextId
                    visible: DataSource.direction !== 0 ? 1 : 0
                    anchors.left: directionImage.right
                    anchors.leftMargin: 9
                    anchors.bottom: directionImage.bottom
                    anchors.bottomMargin: DataSource.language !== 0x01 ? -8 : -3
                    color: "#ffffff"
                    font.pixelSize: DataSource.language !== 0x01 ? 36 : 25
                    text: "SE"
                    states:[
                        State {
                            name: "N"
                            when:DataSource.direction === 1
                            PropertyChanges {
                                target: directionTextId
                                text: TranslateStr.alwyasDisplay_N_Str
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
            }
        }
    }

    //bottom
    Rectangle{
        id:bottomRect
        color: "transparent"
        y:646
        x:0
        width: parent.width
        height: 74
        Image{
            id:bottomBg
            anchors.fill: parent
            cache: false
            source: "qrc:/images10_25/trackMode/bottomBg.png"
        }
        //电量表
        Item {
            id: driveRangeInfoId
            x:34
            y:7
            width: 477
            height: 52
            //电续驶里程
            Image {
                id: evBatteryLightId
                source: "qrc:/images10_25/display_always/night/battery_icon.png"
                anchors.left: parent.left
                anchors.leftMargin: -12
                y: 6
                visible: (DataSource.lowPowerBatLight === 0 || DataSource.lowPowerBatLight === 2) ? true : false
                cache: false
            }
            ImgReflection{
                x: evBatteryLightId.x
                y: evBatteryLightId.y
                imgSource: evBatteryLightId.source
                visible: evBatteryLightId.visible
            }
            WarningLight{
                id: evBatteryWarningLightId
                x: evBatteryLightId.x
                y: evBatteryLightId.y
                displayState: DataSource.lowPowerBatLight
                Image{
                    id: evBatteryWarningLightImageId
                    source: "qrc:/images10_25/warninglight/lowBat.png"
                }
            }
            WarningLight{
                displayState: DataSource.lowPowerBatLight
                ImgReflection{
                    x: evBatteryWarningLightId.x
                    y: evBatteryWarningLightId.y
                    imgSource: evBatteryWarningLightImageId.source
                }
            }

            Text {
                font.bold:rootItemId.jiacu === 1
                font.family: rootItemId.ziti
                id: evSocVauleId
                anchors.left: evBatteryLightId.right
                anchors.leftMargin: 19
                anchors.bottom: parent.bottom
                anchors.bottomMargin: 4
                font.pixelSize: 37
                color: "#ffffff"
                text: DataSource.powerBatterySoc === 0xFFE ? " ": DataSource.powerBatterySoc
                visible: DataSource.powerBatterySoc !== 101 ? true : false
                TextReflection{
                    anchors.left: parent.left
                    anchors.top: parent.bottom
                    anchors.topMargin: -14
                    textSource: evSocVauleId.text
                    fontpix: evSocVauleId.font.pixelSize
                }
            }
            Text {
                font.bold:rootItemId.jiacu === 1
                font.family: rootItemId.ziti
                id: evSocUnitId
                text: "%"
                anchors.left: evSocVauleId.right
                anchors.bottom: parent.bottom
                anchors.bottomMargin: 7
                visible: evSocVauleId.visible
                font.pixelSize: 24
                color: "#ffffff"
                TextReflection{
                    anchors.left: parent.left
                    anchors.top: parent.bottom
                    anchors.topMargin: -5
                    textSource: evSocUnitId.text
                    fontpix: evSocUnitId.font.pixelSize
                }
            }
            Text {
                font.bold:rootItemId.jiacu === 1
                font.family: rootItemId.ziti
                id: evSocMileId
                anchors.bottom: parent.bottom
                anchors.bottomMargin: 4
                anchors.right: evSocMileUnitId.left
                anchors.rightMargin: 10
                font.pixelSize: 37
                color: "#ffffff"
                text: DataSource.socMile
                visible: DataSource.socMile !== "1000" ? true : false
                TextReflection{
                    anchors.left: parent.left
                    anchors.top: parent.bottom
                    anchors.topMargin: -14
                    textSource: evSocMileId.text
                    fontpix: evSocMileId.font.pixelSize
                }
            }

            Text {
                font.bold:rootItemId.jiacu === 1
                font.family: rootItemId.ziti
                id: evSocMileUnitId
                anchors.bottom: parent.bottom
                anchors.bottomMargin: 7
                anchors.right: parent.right
                anchors.rightMargin: -10
                visible: evSocMileId.visible
                font.pixelSize: 24
                color: "#ffffff"
                text: DataSource.odoUnit !== 2 ? "km" : (CustomStyle.isSingular(DataSource.socMile) ? "mile":"miles")
                TextReflection{
                    anchors.left: parent.left
                    anchors.top: parent.bottom
                    anchors.topMargin: -8
                    textSource: evSocMileUnitId.text
                    fontpix: evSocMileUnitId.font.pixelSize
                }
            }
            //进度条
            ProgressBar{
                id: elecProgress
                width: 248
                height: 52
                x: 121
                y: 0
                visible: evSocVauleId.visible
                background: Image {
                    id: img
                    anchors.fill: parent
                    cache: false
                    source: "qrc:/images10_25/trackMode/elec_base.png"
                }

                contentItem:Item{
                    Rectangle {
                        id: socRect
                        x: 28
                        y: 23
                        width: elecProgress.visualPosition * 200
                        height: 14
                        radius: 4
                        transform: Matrix4x4 {
                            matrix: Qt.matrix4x4(1, -1, 0, 0,
                                                 0, 1, 0, 0,
                                                 0, 0, 1, 0,
                                                 0, 0, 0, 1)
                        }
                        LinearGradient{
                            anchors.fill: socRect
                            gradient: Gradient{
                                orientation: Gradient.Vertical
                                GradientStop { position: 0.0; color: DataSource.batteryAlarm === 1 ? "#1E90FF":"#fe0027"}//"#6A5ACD"-紫色
                                GradientStop { position: 0.65; color: DataSource.batteryAlarm === 1 ? "#701E90FF":"#fe0027"}
                                GradientStop { position: 1.0; color: DataSource.batteryAlarm === 1 ? "#1E90FF":"#fe0027"}
                            }
                            source: socRect
                        }
                    }
                }
                value: DataSource.powerBatterySoc !==0xFFE ? DataSource.powerBatterySoc/100 : 0
            }

        }
        //里程
        Item {
            id: odoItemId
            x: 1536
            y: 23
            height: 26
            width: 346
            Text {
                font.bold:rootItemId.jiacu === 1
                id: odoNameId
                anchors.bottom: parent.bottom
                anchors.bottomMargin: -3
                anchors.right: odoValueId.left
                anchors.rightMargin: 16
                font.pixelSize: 28
                color: "#fefefe"
                font.family: rootItemId.ziti
                visible: DataSource.odoIndex !== 0 ? true : false
                states:[
                    State {
                        name: "odoTotal"
                        when:(DataSource.odoIndex === 1)
                        PropertyChanges {
                            target: odoNameId
                            text: TranslateStr.alwyasDisplay_totalOdoStr
                        }
                    },
                    State {
                        name: "odo1"
                        when:(DataSource.odoIndex === 2)
                        PropertyChanges {
                            target: odoNameId
                            text: TranslateStr.alwyasDisplay_odo1Str
                        }
                    },
                    State {
                        name: "odo2"
                        when:(DataSource.odoIndex === 3)
                        PropertyChanges {
                            target: odoNameId
                            text: TranslateStr.alwyasDisplay_odo2Str
                        }
                    },
                    State {
                        name: "odoHev"
                        when:(DataSource.odoIndex === 4)
                        PropertyChanges {
                            target: odoNameId
                            text: TranslateStr.alwyasDisplay_odoHevStr
                        }
                    },
                    State {
                        name: "odoEv"
                        when:(DataSource.odoIndex === 5)
                        PropertyChanges {
                            target: odoNameId
                            text: TranslateStr.alwyasDisplay_odoEvStr
                        }
                    }
                ]
                TextReflection{
                    anchors.left: parent.left
                    anchors.leftMargin: DataSource.odoIndex === 4?1:0
                    anchors.top: parent.bottom
                    anchors.topMargin: -8
                    textSource: odoNameId.text
                    letterSpacing:odoNameId.font.letterSpacing-0.6
                    fontpix: odoNameId.font.pixelSize
                }
            }

            Text {
                font.bold:rootItemId.jiacu === 1
                font.family: rootItemId.ziti
                id: odoValueId
                anchors.bottom: parent.bottom
                anchors.bottomMargin: -5
                anchors.right:parent.right
                anchors.rightMargin: totalOdoUnitId.visible?(totalOdoUnitId.width+12):(odo1UnitId.visible?(odo1UnitId.width+12):(odoEvUnitId.visible?(odoEvUnitId.width+12):(totalOdoUnitId.width+12)))
                font.pixelSize: 40
                visible: DataSource.odoIndex !== 0 ? true : false
                color: "#fefefe"
                text: DataSource.odoValue
                TextReflection{
                    anchors.left: parent.left
                    anchors.top: parent.bottom
                    anchors.topMargin: -14
                    textSource: odoValueId.text
                    fontpix: odoValueId.font.pixelSize
                }
            }

            Text {
                font.bold:rootItemId.jiacu === 1
                font.family: rootItemId.ziti
                id: totalOdoUnitId
                anchors.bottom: parent.bottom
                anchors.right: parent.right
                anchors.rightMargin: 1
                visible: odoValueId.visible && DataSource.odoIndex === 1
                font.pixelSize: 24
                color: "#fefefe"
                text: DataSource.odoUnit !== 2 ? "km" : (CustomStyle.isSingular(DataSource.odoValue) ? "mile":"miles")
                TextReflection{
                    anchors.left: parent.left
                    anchors.top: parent.bottom
                    anchors.topMargin: -8
                    textSource: totalOdoUnitId.text
                    fontpix: totalOdoUnitId.font.pixelSize
                }
            }

            Text {
                font.bold:rootItemId.jiacu === 1
                font.family: rootItemId.ziti
                id: odo1UnitId
                anchors.right: parent.right
                anchors.rightMargin: 1
                visible: odoValueId.visible && (DataSource.odoIndex === 2 || DataSource.odoIndex === 3)
                font.pixelSize: 24
                color: "#fefefe"
                text: DataSource.odo1Unit !== 2 ? "km" : (CustomStyle.isSingular(DataSource.odoValue) ? "mile":"miles")
                anchors.bottom: parent.bottom
                TextReflection{
                    anchors.left: parent.left
                    anchors.top: parent.bottom
                    anchors.topMargin: -8
                    textSource: odo1UnitId.text
                    fontpix: odo1UnitId.font.pixelSize
                }
            }

            Text {
                font.bold:rootItemId.jiacu === 1
                font.family: rootItemId.ziti
                id: odoEvUnitId
                anchors.right: parent.right
                anchors.rightMargin: 1
                visible: odoValueId.visible && (DataSource.odoIndex === 4 || DataSource.odoIndex === 5)
                font.pixelSize: 24
                color: "#fefefe"
                text: DataSource.odoEvUnit !== 2 ? "km" : (CustomStyle.isSingular(DataSource.odoValue) ? "mile":"miles")
                anchors.bottom: parent.bottom
                TextReflection{
                    anchors.left: parent.left
                    anchors.top: parent.bottom
                    anchors.topMargin: -8
                    textSource: odoEvUnitId.text
                    fontpix: odoEvUnitId.font.pixelSize
                }
            }
        }
    }

    //标准回馈
    WarningLight{
        id:feedbackLight
        x: 1210 + 38 - 23
        y: 31
        width: 205
        height: 28
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
            anchors.left : parent.left
        }
    }

    //ECO
    WarningLight{
        id: ecoWarningLightId
        x: 514 + 62 + 23
        y: 31
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
            anchors.right : parent.right
        }
    }
    //SPORT
    WarningLight{
        id: sportWarningLightId
        width: 205
        height: 28
        anchors.right: ecoWarningLightId.right
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
            anchors.right : parent.right
        }
    }
    //NORMAL
    WarningLight{
        id: normalWarningLightId
        width: 205
        height: 28
        anchors.right: ecoWarningLightId.right
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
            anchors.right : parent.right
        }
    }

    //GRASS
    WarningLight{
        id: grassWarningLightId

        width: 205
        height: 28
        anchors.right: ecoWarningLightId.right
        anchors.bottom:ecoWarningLightId.bottom
        visible: DataSource.modeLight === 0x04?true:false
        Image{
            id: grassWarningLightImageId
            anchors.bottom:parent.bottom
            anchors.bottomMargin: 1
            anchors.right : parent.right
            source: "qrc:/images10_25/warninglight/grassLight.png"
        }
    }
    //MUDDY
    WarningLight{
        id: muddyWarningLightId
        width: 205
        height: 28
        anchors.right: ecoWarningLightId.right
        anchors.bottom:ecoWarningLightId.bottom

        visible: DataSource.modeLight === 0x05?true:false
        Image{
            id: muddyWarningLightImageId
            anchors.bottom:parent.bottom
            anchors.bottomMargin: 1
            anchors.right : parent.right
            source: "qrc:/images10_25/warninglight/muddyLight.png"
        }
    }
    //SANDY
    WarningLight{
        id: sandWarningLightId
        width: 205
        height: 28
        anchors.right: ecoWarningLightId.right
        anchors.bottom:ecoWarningLightId.bottom

        visible: DataSource.modeLight === 0x06?true:false
        Image{
            id: sandWarningLightImageId
            anchors.bottom:parent.bottom
            anchors.bottomMargin: 1
            anchors.right : parent.right
            source: "qrc:/images10_25/warninglight/sandLight.png"
        }
    }

    //车速
    Item{
        anchors.horizontalCenter: parent.horizontalCenter
        y:158
        width: 285
        height: 160
        visible: DataSource.speed === -1 ? false : true
        Text {
            font.bold:rootItemId.jiacu === 1
            font.family: rootItemId.ziti
            id: speedValueTextId
            y: -30
            anchors.horizontalCenter: parent.horizontalCenter
            text: DataSource.speed
            color: "#ffffff"
            font.pixelSize: 180
            font.letterSpacing: 7
            visible: DataSource.speed === -1 ? false : true
        }
        Text{
            font.bold:rootItemId.jiacu === 1
            font.family: rootItemId.ziti
            id: speedUnitTextId
            text: DataSource.speedUnit === 2 ? "mph" : "km/h"
            color: "#cccccc"
            font.pixelSize: 36
            font.letterSpacing: 0
            anchors.horizontalCenter: parent.horizontalCenter
            anchors.bottom: parent.bottom
            anchors.bottomMargin: -3
            visible: DataSource.speed === -1 ? false : true
        }
        DropShadow{
            anchors.fill: speedValueTextId
            verticalOffset: 18
            radius: 27
            samples: 15
            color: "#131625"
            opacity: 0.5
            source: speedValueTextId
        }
    }
    //胎压
    Item{
        id:tireId
        x: 1388
        y: 138
        opacity: 0
        TrackTire{
        }
    }
    //G值区域
    Item{
        id:gAreaId
        x: 191
        y: 131
        width: 351
        height: 321
        opacity: 0
        Image {
            id: imgBg
            x: 48
            y: 33
            source: "qrc:/images10_25/trackMode/G_frame.png"
            cache: false
        }
        Rectangle{
            id:rect
            x: 48
            y: 33
            width: imgBg.width
            height:imgBg.height
            radius: width/2
            color: "transparent"
            border.color: "#306A5ACD"
        }
        Text{
            font.bold:rootItemId.jiacu === 1
            font.family: rootItemId.ziti
            id:positionTop
            font.pixelSize: 28
            color: "#ffffff"
            anchors.horizontalCenter: parent.horizontalCenter
            anchors.bottom: imgBg.top
            anchors.bottomMargin: 15
            text: -1*DataSource.accelerateGY<0?(-1*DataSource.accelerateGY).toFixed(1):"0.0"
        }
        Text {
            font.bold:rootItemId.jiacu === 1
            font.family: rootItemId.ziti
            id: positionBottom
            font.pixelSize: 28
            color: "#ffffff"
            anchors.horizontalCenter: parent.horizontalCenter
            anchors.top: imgBg.bottom
            anchors.topMargin: 15
            text: -1*DataSource.accelerateGY<0?"0.0":(-1*DataSource.accelerateGY).toFixed(1)
        }
        Text{
            font.bold:rootItemId.jiacu === 1
            font.family: rootItemId.ziti
            id:positionLeft
            font.pixelSize: 28
            color: "#ffffff"
            anchors.verticalCenter: parent.verticalCenter
            anchors.right: imgBg.left
            anchors.rightMargin: 13
            text: DataSource.accelerateGX < 0?DataSource.accelerateGX.toFixed(1):"0.0"
        }
        Text{
            font.bold:rootItemId.jiacu === 1
            font.family: rootItemId.ziti
            id:positionRight
            font.pixelSize: 28
            color: "#ffffff"
            anchors.verticalCenter: parent.verticalCenter
            anchors.left: imgBg.right
            anchors.leftMargin: 13
            text: DataSource.accelerateGX < 0?"0.0":DataSource.accelerateGX.toFixed(1)
        }
        Image{
            id:point
            source: "qrc:/images10_25/trackMode/point.png"
            cache: false
        }

        Rectangle{
            id:pointCircle
            x: point.x+point.width/2-width/2
            y: point.y+point.height/2-width/2
            width: point.width/2+3
            height: width
            radius: width/2
            color: "transparent"
            border.color: "red"
            border.width: 1
            opacity: 0
        }

        Component.onCompleted: {
            point.x = 48+256/2+DataSource.accelerateGX*256/43.2-point.width/2
            point.y = 33+256/2-DataSource.accelerateGY*256/43.2-point.height/2
            prePonintX = point.x
            prePonintY = point.y
        }
    }
    //超级iTAC即将退出，请驶离赛道
    Image{
        id:iTacExitWarningInfo
        source:"qrc:/images10_25/adas2d/pop-night.png"
        anchors.horizontalCenter: parent.horizontalCenter
        y:583
        width:iTacExitWarningInfoText.contentWidth +14+4
        height: 42+4
        visible: DataSource.ekShiftPInfoDisplay === 0 &&DataSource.ekItacExitInfoDisplay === 1?true:false//"超级iTAC即将退出，请驶离赛道"和"请切换到P挡"同时满足，"请切换到P挡"优先级更高
        Text {
            font.bold:rootItemId.jiacu === 1
            font.family: rootItemId.ziti
            id: iTacExitWarningInfoText
            font.pixelSize: 28
            anchors.centerIn: parent
            text: TranslateStr.iTacExitWarningInfoStr
            color: "#ffffff"
        }
    }

    Connections{
        target: DataSource
        function onTimeFormatChanged(){
            timeDisplayId.currentTime  = currentDateTime()
        }
        function onAccelerateGXChanged(){
            pointXAni.start()
        }
        function onAccelerateGYChanged(){
            pointYAni.start()
        }
        function onSpeedChanged(){
            if(DataSource.speed !== -1 && DataSource.speed !== 0){
                if(!speedAnimTimer.running && !speedApproachAdimTimer.running){
                    speedApproachAdimTimer.start()
                }
            }else{
                if(speedAnimTimer.running){
                    speedAnimTimer.stop()
                    hidePics3()
                }
                if(speedApproachAdimTimer.running){
                    speedApproachAdimTimer.stop()
                    hidePics2()
                }
            }
        }
    }
    NumberAnimation{
        id:pointXAni
        running: false
        target: point
        property: "x"
        from: prePonintX
        to: 48+256/2+DataSource.accelerateGX*256/43.2-point.width/2
        duration: 100
        easing.type: Easing.Linear
        onStarted: {
            pointMoveAdim.start()
            rotationAnim.start()
        }
        onFinished: {
            point.x = 48+256/2+DataSource.accelerateGX*256/43.2-point.width/2
            prePonintX = point.x
            rotationAnim.stop()
        }
    }
    NumberAnimation {
        id:pointYAni
        running: false
        target: point
        property: "y"
        duration: 100
        from: prePonintY
        to: 33+256/2-DataSource.accelerateGY*256/43.2-point.height/2
        easing.type: Easing.Linear
        onStarted: {
            pointMoveAdim.start()
            rotationAnim.start()
        }
        onFinished: {
            point.y = 33+256/2-DataSource.accelerateGY*256/43.2-point.height/2
            prePonintY = point.y
            rotationAnim.stop()
        }
    }
    ParallelAnimation{
        id:pointMoveAdim
        NumberAnimation {
            target: pointCircle
            property: "width"
            duration: 200
            from:point.width/2+3
            to:point.width/2+9
            easing.type: Easing.InOutBounce
        }
        NumberAnimation{
            target: pointCircle
            property: "opacity"
            from: 0.9
            to:0
            duration: 200
            easing.type: Easing.InOutBounce
        }
    }
    SequentialAnimation{
        id:rotationAnim
        running: false
        loops:Animation.Infinite
        RotationAnimation{target:point;from:0;to:180;duration: 30}
        RotationAnimation{target:point;from:180;to:360;duration: 30}
    }
    NumberAnimation {
        id:redLightOpacityAnim
        target: redLightId
        property: "opacity"
        from: 0
        to: 1.0
        duration: 165
        easing.type: Easing.InOutQuad
    }
    NumberAnimation{
        id:trackImgOpacityAnim
        target:trackEntryItem
        property: "opacity"
        from:1
        to:0
        duration:20
        easing.type: Easing.InOutQuad
    }

    SequentialAnimation{
        id:opacityAnimId
        NumberAnimation {
            targets: [tireId,gAreaId]
            properties: "opacity"
            from: 0
            to: 1.0
            duration: 430
            easing.type: Easing.InOutQuad
        }
        NumberAnimation {
            duration: 100
            easing.type: Easing.InOutQuad
        }
        ParallelAnimation{
            NumberAnimation {
                target: circleAreaId
                property: "opacity"
                from: 0
                to: 1.0
                duration: 230
                easing.type: Easing.InOutQuad
            }
            NumberAnimation {
                target: redReflectId
                property: "opacity"
                from: 0
                to: 1.0
                duration: 300
                easing.type: Easing.InOutQuad
            }
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

}
