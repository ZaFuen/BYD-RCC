import QtQuick 2.15
import QtGraphicalEffects 1.12
import com.byd.DataSource 1.0
import QtQuick.Shapes 1.15
import "qrc:/common/singleton"

Item {
    id:speedDashRootId
    width: 814
    height: 619

    property real selfCheckSpeedRealValue:0
    property bool hasSelfChecked: false

    readonly property int speedFillX:232
    readonly property int speedFillY:32
    readonly property int speedFillArcWidth: 100
    readonly property int arcCenterX: 275
    readonly property int arcCenterY: 280
    readonly property int arcRadius:283

    Component.onCompleted: {
        if(DataSource.playAnim  === true){
            hasSelfChecked = true
            realSpeedUpdate()
            if(DataSource.changeDashBoard === true){
                classicSpeedMaskId.opacity = 0
                needleMaskId.opacity = 0
                classicSpeedMaskId.opacity = 0
                classicSpeedTextItemId.opacity=0
            }
        }
    }

    Image {
        id: powerBgIdOne
        x:speedFillX+28
        y:speedFillY
        source: DataSource.dayNightMode === 0x02?"qrc:/images10_25/display_always/dash/classic/night/speed_bg_one.astc":"qrc:/images10_25/display_always/dash/classic/day/speed_bg_one.astc"
    }
    Image {
        id: speedFillId
        x:speedFillX
        y:speedFillY
        source: DataSource.dayNightMode === 0x02?"qrc:/images10_25/display_always/dash/classic/night/speed_fill.astc":"qrc:/images10_25/display_always/dash/classic/day/speed_fill.astc"
        visible: false
    }

    Image {
        id: speedFillMaskId
        x:speedFillX
        y:speedFillY
        source: DataSource.dayNightMode === 0x02?"qrc:/images10_25/display_always/dash/classic/night/speed_fill_mask.astc":"qrc:/images10_25/display_always/dash/classic/day/speed_fill_mask.astc"
        visible: false
    }
    Image {
        id: speedBgId
        source: DataSource.dayNightMode === 0x02?"qrc:/images10_25/display_always/dash/classic/night/speed_bg.astc":"qrc:/images10_25/display_always/dash/classic/day/speed_bg.astc"
    }

    /*
    Canvas{
        id:canvasId
        x:speedFillX
        y:speedFillY
        anchors.verticalCenter: parent.verticalCenter
        property real progressValue:DataSource.speed
        width:speedFillId.width
        height:speedFillId.height
        onPaint: {
            var ctx = getContext("2d");
            ctx.fillStyle="red"
            ctx.strokeStyle = "red"
            ctx.lineWidth =speedFillArcWidth
            //ctx.fillRect(0,0,h,200)

            ctx.beginPath();
            ctx.fillStyle="transparent"
            ctx .clearRect(0,0,speedFillId.width,speedFillId.height);
            ctx.fillStyle="red"

            if(progressValue < 0){
                ctx.arc(arcCenterX,arcCenterY,arcRadius-speedFillArcWidth/2,Math.PI/2,0.5*Math.PI,true)
            }else{
                if(DataSource.speedUnit === 0x02){
                    ctx.arc(arcCenterX,arcCenterY,arcRadius-speedFillArcWidth/2,Math.PI/2,(0.5-progressValue/150*1.332)*Math.PI,true)
                }else{
                    ctx.arc(arcCenterX,arcCenterY,arcRadius-speedFillArcWidth/2,Math.PI/2,(0.5-progressValue/240*1.332)*Math.PI,true)
                }
            }
            ctx.stroke()

        }
        onProgressValueChanged: {
            updateNeedleRotation()
            requestPaint()
        }
        function updateNeedleRotation(){
            if(DataSource.speedUnit === 0x02){
                needleImgId.rotation = (0.5-progressValue/150*1.332)*180-1.76
            }else{
                needleImgId.rotation = (0.5-progressValue/240*1.332)*180-1.76
            }
        }

        visible: false
    }
    */

    function realSpeedUpdate(){
        var angle = 0
        if(!hasSelfChecked){
            //自检
            angle = (0.5-speedDashRootId.selfCheckSpeedRealValue/100*1.332)
            needleImgId.rotation = angle*180-1.76
            shapeId.arcX =  arcCenterX+arcRadius*Math.cos(angle*Math.PI)
            shapeId.arcY = arcCenterY+arcRadius*Math.sin(angle*Math.PI)
            if(speedDashRootId.selfCheckSpeedRealValue>75){
                pathArcId.useLargeArc = true
            }else{
                pathArcId.useLargeArc = false
            }
        }else{
            if(DataSource.speed === -1){
                //速度值直接绑定DataSource.Speed，和填充条刷新分开
                //speedValueTextId.text = 0
                angle = (0.5-0/150*1.332)
                needleImgId.rotation = angle*180-1.76
                shapeId.arcX =  arcCenterX+arcRadius*Math.cos(angle*Math.PI)
                shapeId.arcY = arcCenterY+arcRadius*Math.sin(angle*Math.PI)
                pathArcId.useLargeArc = false
            }else{
                //速度值直接绑定DataSource.Speed，和填充条刷新分开
                //speedValueTextId.text = Math.round(DataSource.realSpeed)
                if(DataSource.speedUnit === 0x02){
                    angle = (0.5-DataSource.realSpeed/150*1.332)
                    needleImgId.rotation = angle*180-1.76
                    shapeId.arcX =  arcCenterX+arcRadius*Math.cos(angle*Math.PI)
                    shapeId.arcY = arcCenterY+arcRadius*Math.sin(angle*Math.PI)
                    if(DataSource.realSpeed>112.5){
                        pathArcId.useLargeArc = true
                    }else{
                        pathArcId.useLargeArc = false
                    }
                }else{
                    angle = (0.5-DataSource.realSpeed/240*1.332)
                    needleImgId.rotation = angle*180-1.76
                    shapeId.arcX =  arcCenterX+arcRadius*Math.cos(angle*Math.PI)
                    shapeId.arcY = arcCenterY+arcRadius*Math.sin(angle*Math.PI)
                    if(DataSource.realSpeed>180){
                        pathArcId.useLargeArc = true
                    }else{
                        pathArcId.useLargeArc = false
                    }
                }
            }
        }

    }

    Shape {
        id:shapeId
        x:speedFillX
        y:speedFillY
        anchors.verticalCenter: parent.verticalCenter
        property real arcX: arcCenterX+arcRadius*Math.cos(0.5*Math.PI)
        property real arcY: arcCenterY+arcRadius*Math.sin(0.5*Math.PI)
        width:speedFillId.width
        height:speedFillId.height
        ShapePath {
            strokeWidth: 1
            strokeColor: "red"
            fillColor: "red"
            startX: arcCenterX
            startY: arcCenterY
            PathLine { x: arcCenterX   +   arcRadius*Math.cos(Math.PI/2); y: arcCenterY   +   arcRadius*Math.sin(Math.PI/2) }
            PathArc {
                id:pathArcId
                x: shapeId.arcX
                y: shapeId.arcY
                radiusX: arcRadius
                radiusY: arcRadius
                direction: PathArc.Counterclockwise
            }
            PathLine { x: arcCenterX; y:arcCenterY }

        }
        visible: false
    }

    OpacityMask{
        id:classicSpeedMaskId
        anchors.fill:speedFillId
        source:speedFillId
        maskSource: shapeId
        visible: (hasSelfChecked===true && DataSource.realSpeed<0.25)?false:true
    }

    Item{
        id:needleItemId
        x:speedFillX
        y:speedFillY
        width: speedFillId.width
        height: speedFillId.height
        Image{
            id:needleImgId
            x:arcCenterX
            y:arcCenterY
            source: DataSource.dayNightMode === 0x02?"qrc:/images10_25/display_always/dash/classic/night/speed_needle.png":"qrc:/images10_25/display_always/dash/classic/day/speed_needle.png"
            visible: true
            antialiasing: true
            transformOrigin: Item.TopLeft
            rotation: (0.5-1.332)*180-1.76
        }
        visible: false
    }


    OpacityMask{
        id:needleMaskId
        anchors.fill:needleItemId
        source:needleItemId
        maskSource: speedFillMaskId
        visible: (hasSelfChecked===true && DataSource.realSpeed<0.25)?false:true
    }

    Item{
        id:classicSpeedTextItemId
        x:342
        y:263
        width: 296
        height: 151
        Text {
            font.bold:rootItemId.jiacu === 1
            id:speedValueTextId
            anchors.horizontalCenter: parent.horizontalCenter
            anchors.bottom: speedUnitTextId.top
            anchors.bottomMargin: -15
            text: DataSource.speed
            font.pixelSize: 145
            font.family: rootItemId.ziti
            color: DataSource.dayNightMode === 0x02?"#fefefe":"#333333"
            visible: DataSource.speed === -1 ? false : true
        }
        Text {
            font.bold:rootItemId.jiacu === 1
            font.family: rootItemId.ziti
            id:speedUnitTextId
            anchors.horizontalCenter:speedValueTextId.horizontalCenter
            y: 114
            text: DataSource.speedUnit !== 2 ? "km/h" : "mph"
            font.pixelSize: 45
            color: DataSource.dayNightMode === 0x02?"#fefefe":"#333333"
            visible: speedValueTextId.visible
        }

    }

    /*
    Text {
        id:minTextId
        x:495+19
        y:519
        text: "0"
        font.pixelSize: 37
        color: DataSource.dayNightMode === 0x02?"#fefefe":"#000000"
    }
    Text {
        id:maxTextId
        x:294
        y:166
        text: DataSource.speedUnit !== 2 ? "240" : "150"
        font.pixelSize: 33
        color: DataSource.dayNightMode === 0x02?"#fefefe":"#000000"
    }*/



    Connections {
        target:DataSource

        function onPluginMsgReceived(id,value){
            if(id === DataSource.SEND_MSG_ID_DASHBOARD_SELFCHECK){
                speedDashRootId.selfCheckSpeedRealValue = 0
                //速度值直接绑定DataSource.Speed，和填充条刷新分开
                //speedValueTextId.text = "0"
                selfCheckAnimId.start()
            }else if(id === DataSource.SEND_MSG_ID_THEME_SWITCH_REQUEST){
                if(value === DataSource.THEME_SWITCH_REQUEST_TO_PLAY_HIDE_ANIM){
                    classicSpeedDashOpacityHideAnimId.start()
                }else if(value === DataSource.THEME_SWITCH_REQUEST_TO_PLAY_DISP_ANIM){
                    classicSpeedDashOpacityShowAnimId.start()
                }else if(value === DataSource.THEME_SWITCH_POWER_OFF_STATE){
                    classicSpeedDashOpacityShowAnimId.stop()
                }
            }
        }
        function onPowerGearChanged(){
            if( DataSource.powerGear !== 3){
                DataSource.realSpeed = 0
                realSpeedUpdate()
                hasSelfChecked = false
            }

            //没有自检，也不会播放动画，需要置自检通过
            if(DataSource.powerGear === 3 && !hasSelfChecked && DataSource.playAnim === true){
                console.log("onPowerGearChanged speed")
                hasSelfChecked = true
                realSpeedUpdate()
            }
        }
        function onSpeedUnitChanged(){
            realSpeedUpdate()
        }

        function onRealSpeedChanged(){
            if(hasSelfChecked){
                realSpeedUpdate()
            }
        }
    }

    onSelfCheckSpeedRealValueChanged: {
        realSpeedUpdate()
    }

    SequentialAnimation {
        id:selfCheckAnimId
        PropertyAnimation {
            target: speedDashRootId
            properties: "selfCheckSpeedRealValue"
            to: 100
            duration: CustomStyle.selfCheckAnimationTimer
            easing.type: Easing.InQuad
        }
        PropertyAnimation{
            target: speedDashRootId
            duration: CustomStyle.selfCheckAnimationWaitTimer
        }
        PropertyAnimation {
            target: speedDashRootId
            properties: "selfCheckSpeedRealValue"
            to: 0
            duration: CustomStyle.selfCheckAnimationTimer
            easing.type: Easing.OutQuad
        }
        onFinished:{
            hasSelfChecked = true
            if(DataSource.realSpeed === 0.0){
                DataSource.realSpeed = DataSource.speed
            }
            realSpeedUpdate()
        }
    }

    //主题切换透明度动画
    PropertyAnimation{
        id:classicSpeedDashOpacityHideAnimId
        targets: [classicSpeedMaskId,needleMaskId,classicSpeedTextItemId]//minTextId,maxTextId
        property:"opacity"
        from: 1
        to:0
        duration:CustomStyle.themeOpacityChangeTimer
        //easing.type: Easing.InOutQuad
        onFinished: {
            console.log("classic speed opacity animation finish")
        }
    }

    //主题切换透明度动画
    PropertyAnimation{
        id:classicSpeedDashOpacityShowAnimId
        targets: [classicSpeedMaskId,needleMaskId,classicSpeedTextItemId]//minTextId,maxTextId
        property:"opacity"
        from: 0
        to:1
        duration:CustomStyle.themeOpacityChangeTimer
        //easing.type: Easing.InOutQuad
        onFinished: {
            DataSource.changeDashBoard = false
        }
    }

}
