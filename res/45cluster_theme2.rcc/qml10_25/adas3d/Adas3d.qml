import QtQuick 2.15
import QtQuick3D 1.15
import "./components"
//import "qrc:/qml_1025/adas/common"
import QtQuick.Timeline 1.0
import com.byd.DataSource 1.0

Item {
    id: root
    width: 960
    height: 370+65
    property int laneAnimationDuration: 2500
    property bool adasDebugMode:false
    property int adasSelfCarXValue: 0               //自车原点坐标
    property int adasSelfCarZValue: DataSource.carNameType === 6 ? 90:105  //自车位置Z，影响自车前方距离
    property real adasSelfCarOp: 1  //:0 :1
    property bool adasSelfCarBlowVentEnable: false
    property bool adasSelfCarSteerWheelEnable: false
    property int adasSelfCarSteerWheelType: 0 //0,rotary:1
    property alias self_car_speedup_animation: self_car_speedup_animation

    //roads
    property alias lanePosChangeAnimEnable: model.lanePosChangeAnimEnable
    property alias leftLaneSolid: model.leftRoadLaneSolid
    property alias rightLaneSolid: model.rightRoadLaneSolid
    property alias laneCurvature: model.roadLaneCurvature
    property alias leftLaneColor: model.leftRoadLaneColor
    property alias rightLaneColor: model.rightRoadLaneColor
    property alias leftLaneVisible: model.leftRoadLaneVisible
    property alias rightLaneVisible: model.rightRoadLaneVisible
    property alias leftLaneOpacity: model.leftRoadLaneOpacity
    property alias rightLaneOpacity: model.rightRoadLaneOpacity
    property alias leftLanePositionX: model.leftRoadLanePositionX
    property alias rightLanePositionX: model.rightRoadLanePositionX
    property alias distanceStart: model.distanceStart
    property alias distanceEnd: model.distanceEnd
    property alias distanceColor: model.distanceColor
    property alias distanceVisible: model.distanceVisible

    property alias laneChangeScaleZ: model.laneChangeScaleZ
    property alias laneChangeX: model.laneChangeX
    property alias laneChangeZ: model.laneChangeZ
    property alias laneChangeK: model.laneChangeK
    property alias laneChangeT: model.laneChangeT
    property alias laneChangeVisible: model.laneChangeVisible
    property alias laneChangeColor: model.laneChangeColor
    property alias laneAnimation: laneAnimation
    property alias laneChangeAnimation: laneChangeAnimation
    property alias leftLaneChangeAnimation: leftLaneChangeAnimation
    property alias rightLaneChangeAnimation: rightLaneChangeAnimation
    property alias  timelineAnimation: timelineAnimation
    //models
    property real adasModel_00_pos_x: -90
    property real adasModel_00_pos_z: 620
    property string adasModel_00_source: ""
    property color adasModel_00_color:"#ff969696"
    property bool adasModel_00_collision_visible: false
    property bool adasModel_00_collision_type: false
    property alias adasModel_00_visible: model.visible_00

    property real adasModel_01_pos_x: -100
    property real adasModel_01_pos_z: -100
    property string adasModel_01_source: ""
    property color adasModel_01_color:"#ff969696"
    property bool adasModel_01_collision_visible: false
    property bool adasModel_01_collision_type: false
    property alias adasModel_01_visible: model.visible_01

    property real adasModel_02_pos_x: 60
    property real adasModel_02_pos_z: 300
    property string adasModel_02_source: ""
    property color adasModel_02_color:"#ff969696"
    property bool adasModel_02_collision_visible: false
    property bool adasModel_02_collision_type: false
    property alias adasModel_02_visible: model.visible_02

    property real adasModel_03_pos_x: 0
    property real adasModel_03_pos_z: 500
    property string adasModel_03_source: ""
    property color adasModel_03_color:"#ff969696"
    property bool adasModel_03_collision_visible: false
    property bool adasModel_03_collision_type: false
    property alias adasModel_03_visible: model.visible_03

    property real adasModel_04_pos_x: 90
    property real adasModel_04_pos_z: 620
    property string adasModel_04_source: ""
    property color adasModel_04_color:"#ff969696"
    property bool adasModel_04_collision_visible: false
    property bool adasModel_04_collision_type: false
    property alias adasModel_04_visible: model.visible_04

    property real adasModel_05_pos_x: 90
    property real adasModel_05_pos_z: 200
    property string adasModel_05_source: ""
    property color adasModel_05_color:"#ff969696"
    property bool adasModel_05_collision_visible: false
    property bool adasModel_05_collision_type: false
    property alias adasModel_05_visible: model.visible_05

    //车道背景资源路径
    property string adasModel_RoadBgSource: ""
    property string adasModel_RoadBg2Source: ""
    property alias adasModel_roadBgVisible: model.roadBgVisible
    property alias adasModel_roadBg2Visible: model.roadBg2Visible
    //变道动画
    property alias adasModelLeftLaneLeftColor: model.left

    //property int settingRoadsLineBgType: 0  //light:0 dark:1
    property int    adasCarRoadLineTypeLeft
    property int    adasCarRoadLineColorLeft
    property int    adasCarRoadLineTypeRight
    property int    adasCarRoadLineColorRight
    property int    adasCarRoadLineTypeLeftMost
    property int    adasCarRoadLineColorLeftMost
    property int    adasCarRoadLineTypeRightMost
    property int    adasCarRoadLineColorRightMost
    property double curvature
    property bool adasLaneLuminousEnable: false

    property real adasCarFrontBottomAlarmStartPos: 0.0
    property bool adasCarFrontBottomAlarmEnable: false
    property var adasCarFrontBottomAlarmColor: Qt.rgba(162.0/255.0, 213.0/255.0, 191.0/255.0, 1.0)
    property int adasTextInfoColor: 0 //black:0 red:1
    property int adasTextInfoContent: 0
    //Roads
    //Radar
    property string adasRadar_name: "IMG_%1.png"
    property int adasRadar_bl_count:0 //0-25
    property bool adasRadar_bl_enable: false
    property int adasRadar_bm_count:0 //0-25
    property bool adasRadar_bm_enable: false
    property int adasRadar_br_count:0 //0-25
    property bool adasRadar_br_enable: false
    property int adasRadar_fl_count:0 //0-25
    property bool adasRadar_fl_enable: false
    property int adasRadar_fr_count:0 //0-25
    property bool adasRadar_fr_enable: false

    //变道动画结束
    property alias leftLeftLaneVisible: model.leftLeftLaneRoadVisible
    property alias rightRightLaneVisible: model.rightRightRoadLaneVisible
    property alias leftLeftLaneOpacity: model.leftLeftLaneRoadOpacity
    property alias rightRightLaneOpacity: model.rightRightRoadLaneOpacity
    property alias leftLeftLanePositionX: model.leftLeftLaneRoadPositionX
    property alias rightRightLanePositionX: model.rightRightRoadLanePositionX
    property alias leftLeftLaneSolid: model.leftLeftLaneRoadSolid
    property alias rightRightLaneSolid: model.rightRightLaneRoadSolid
    property alias leftLeftLaneColor: model.leftLeftLaneRoadColor
    property alias rightRightLaneColor: model.rightRightLaneRoadColor

    //property alias selfCarMesh: model.selfCarMesh
    //property alias selfCarPng: model.selfCarPng
    property alias middleLaneLeftX: model.middleLaneLeftX
    property alias middleLaneRightX: model.middleLaneRightX
    property alias selfCarSource: model.selfCarSource
    property alias selfCarScale: model.selfcar_scale
    property alias steerwheelSource: steer_wheel.source

    signal laneChangeAnimationFinish()

    Image
    {
        id:steer_wheel
        x:175+208
        y:70+130
        z:7
        visible: adasSelfCarSteerWheelEnable
        source: adasSelfCarSteerWheelType===0?
                    (DataSource.carNameType === 0x06?"qrc:/images10_25/adas3d/steering_wheel2_SL":"qrc:/images10_25/adas3d/steering_wheel2_SK2.png"):
                    (DataSource.carNameType === 0x06?"qrc:/images10_25/adas3d/steering_wheel_SL":"qrc:/images10_25/adas3d/steering_wheel_SK2.png")
    }

    SequentialAnimation{
        id: self_car_speedup_animation
        PropertyAnimation{
            target: model
            property: "selfcar_z"
            from: 610+adasSelfCarZValue
            to: 610+adasSelfCarZValue - 100
            duration: 2500
        }

        PauseAnimation {
            duration: 500
        }

        PropertyAnimation{
            target: model
            property: "selfcar_z"
            from: 610+adasSelfCarZValue - 100
            to: 610+adasSelfCarZValue
            duration: 2000
        }
    }

    PropertyAnimation{
        id: laneAnimation
        target: model
        property: "rightLaneDashlineOffset"
        from: 0
        to: 100
        duration: laneAnimationDuration
        loops: Animation.Infinite
    }

    SequentialAnimation{
        id: laneChangeAnimation
        ParallelAnimation{
            PropertyAnimation{
                target: model
                property: "laneChangeX"
                from: 0
                to: -90
                duration: 2500
            }
            PropertyAnimation{
                target: model
                property: "selfcar_x"
                from: 0+adasSelfCarXValue
                to: 0+adasSelfCarXValue-90
                duration: 2500
            }

            ScriptAction{
                script: model.distanceVisible = false
            }
        }

        ScriptAction{
            script: model.laneChangeVisible = false
        }

        PauseAnimation {
            duration: 500
        }

        ParallelAnimation{
            PropertyAnimation{
                target: model
                property: "selfcar_x"
                from: 0+adasSelfCarXValue-90
                to: 0+adasSelfCarXValue
                duration: 2000
            }

            PropertyAnimation{
                target: model
                property: "leftRoadLanePositionX"
                from: -48
                to: 48
                duration: 2000
            }

            PropertyAnimation{
                target: model
                property: "rightRoadLanePositionX"
                from: 48
                to: 96+30
                duration: 2000
            }
        }

        PauseAnimation {
            duration: 500
        }

        PropertyAnimation{
            target: model
            property: "rightRoadLaneOpacity"
            from: 1
            to: 0
            duration: 2000
        }

        PauseAnimation {
            duration: 500
        }

        ParallelAnimation{
            PropertyAnimation{
                target: model
                property: "rightRoadLaneOpacity"
                from: 0
                to: 1
                duration: 1
            }

            PropertyAnimation{
                target: model
                property: "leftRoadLaneOpacity"
                from: 1
                to: 0
                duration: 1
            }

            PropertyAnimation{
                target: model
                property: "leftRoadLanePositionX"
                from: 48
                to: -48
                duration: 1
            }

            PropertyAnimation{
                target: model
                property: "rightRoadLanePositionX"
                from: 96+30
                to: 48
                duration: 1
            }
        }

        PauseAnimation {
            duration: 500
        }

        ParallelAnimation{
            PropertyAnimation{
                target: model
                property: "leftRoadLaneOpacity"
                from: 0
                to: 1
                duration: 2000
            }

            ScriptAction{
                script: model.distanceVisible = true
            }
        }
    }


    //左变道动画
    SequentialAnimation{
        id: leftLaneChangeAnimation
        //车间时距不显示
        ScriptAction{
            script: model.distanceVisible = false
        }
        //左一车道设置透明度0不可见
        ScriptAction{
            script: model.leftLeftLaneRoadOpacity = 0
        }
        //右一车道设置透明度0不可见
        ScriptAction{
            script: model.rightRightRoadLaneOpacity = 0
        }
        ScriptAction{
            script: leftLeftLanePositionX = - 48    //基于左侧车道线在右侧车道线位置时计算。
        }


        //移动车道线车道线
        ParallelAnimation{
            //左侧车道线
            PropertyAnimation{
                target: model
                property: "middleLaneLeftX"
                from: middleLaneLeftX  //左侧车道线从当前位置移动到右侧车道线的位置
                to:48
                duration: 2400
            }
            //右侧车道线
            PropertyAnimation{
                target: model
                property: "middleLaneRightX"
                from: middleLaneRightX  //左侧车道线从当前位置移动到右侧车道线的位置
                to:139
                duration: 2400
            }
            //变道辅助线变直动画
            PropertyAnimation{
                target: model
                property:"laneChangeK"
                from:laneChangeK    //变道辅助线继续变直
                to:0
                duration:2400
            }
        }


        ParallelAnimation{
            //变道辅助线渐隐
//            PropertyAnimation{
//                target: model
//                property:"laneChangeOpacity"
//                from:0.99
//                to:0
//                duration: 600
//            }
            //左一车道线渐显
            PropertyAnimation{
                target: model
                property: "leftLeftLaneOpacity"
                from:0
                to:0.99
                duration: 600
            }
            //右侧车道线渐隐，左侧车道线成为右侧车道线
            PropertyAnimation{
                target: model
                property: "rightRoadLaneOpacity"
                from:model.rightRoadLaneOpacity
                to:0
                duration: 600
            }
        }

        //车道转变动画
        ParallelAnimation{
            //右侧车道线归位
            ScriptAction{
                script: lanePosChangeAnimEnable = false //车道移动动画短暂屏蔽
            }

            ScriptAction{
                script:rightLanePositionX = 48
            }

            ScriptAction{
                script:rightLaneOpacity = 0.99
            }

            //左侧车道线归位
            ScriptAction{
                script:leftLanePositionX = -48
            }

            ScriptAction{
                script:leftLaneOpacity = 0.99
            }
            ScriptAction{
                script:leftLeftLaneOpacity = 0
            }
//            ScriptAction{
//                script: model.laneChangeVisible = false //变道完成不可见
//            }
//            ScriptAction{
//                script:model.laneChangeOpacity = 0.99 //变道辅助线恢复透明度，避免下次变道触发不显示
//            }
            ScriptAction{
                script: lanePosChangeAnimEnable = true
            }
        }
        onFinished: {
            laneChangeAnimationFinish()
        }
    }


    //右变道动画
    SequentialAnimation{
        id: rightLaneChangeAnimation

        //车间时距不显示
        ScriptAction{
            script: model.distanceVisible = false
        }
        //右一车道设置透明度0不可见
        ScriptAction{
            script: model.leftLeftLaneRoadOpacity = 0
        }
        //右一车道设置透明度0不可见
        ScriptAction{
            script: model.rightRightRoadLaneOpacity = 0
        }
        ScriptAction{
            script:rightRightLanePositionX = 48 //右一车道线位置放置在右侧车道线上
        }

        //移动车道线车道线
        ParallelAnimation{
            //左侧车道线
            PropertyAnimation{
                target: model
                property: "middleLaneLeftX"
                from: middleLaneLeftX  //左侧车道线从当前位置移动到右侧车道线的位置
                to:-139
                duration: 2400
            }
            //右侧车道线
            PropertyAnimation{
                target: model
                property: "middleLaneRightX"
                from: middleLaneRightX  //左侧车道线从当前位置移动到右侧车道线的位置
                to:-48
                duration: 2400
            }
            //变道辅助线变直动画
            PropertyAnimation{
                target: model
                property:"laneChangeK"
                from:laneChangeK    //变道辅助线继续变直
                to:0
                duration:2400
            }
        }


        ParallelAnimation{
            //变道辅助线渐隐
//            PropertyAnimation{
//                target: model
//                property:"laneChangeOpacity"
//                from:0.99
//                to:0
//                duration: 600
//            }
            //右一车道线渐显
            PropertyAnimation{
                target: model
                property: "rightRightLaneOpacity"
                from:0
                to:0.99
                duration: 600
            }
            //左侧车道线渐隐，右侧车道线成为左侧车道线
            PropertyAnimation{
                target: model
                property: "leftLeftLaneOpacity"
                from:model.leftLeftLaneOpacity
                to:0
                duration: 600
            }
        }

        //车道转变动画
        ParallelAnimation{
            //右侧车道线归位
            ScriptAction{
                script: lanePosChangeAnimEnable = false //车道移动动画短暂屏蔽
            }

            ScriptAction{
                script:rightLanePositionX = 48
            }

            ScriptAction{
                script:rightLaneOpacity = 0.99
            }

            //左侧车道线归位
            ScriptAction{
                script:leftLanePositionX = -48
            }

            ScriptAction{
                script:leftLaneOpacity = 0.99
            }

            ScriptAction{
                script:rightRightLaneOpacity = 0  //右一车道不可见
            }
//            ScriptAction{
//                script: model.laneChangeVisible = false //变道完成不可见
//            }
//            ScriptAction{
//                script:model.laneChangeOpacity = 0.99 //变道辅助线恢复透明度，避免下次变道触发不显示
//            }
            ScriptAction{
                script: lanePosChangeAnimEnable = true
            }
        }
        onFinished: {
            laneChangeAnimationFinish()
        }
    }


    //    onLaneChangeXChanged: {
    //        if (adas.laneChangeX > 0)
    //            adas.laneChangeK = -1599 * adas.laneChangeX / 95 + 1600
    //        else
    //            adas.laneChangeK = -1599 * adas.laneChangeX / 95 - 1600
    //    }
    /*
    Image {
        id: radar_bl
        visible: adasRadar_bl_enable
        width: 114
        height: 80
        anchors.top: self_car.top
        anchors.left: self_car.left
        source: "./images/adas/radar/bl/"+adasRadar_name.arg(adasRadar_bl_count)
        anchors.leftMargin: -90
        anchors.topMargin: 82
    }
    */
    onAdasRadar_bl_enableChanged:
    {
        //console.log(adasRadar_bl_enable)
        if(adasRadar_bl_enable==true)
        {
            adasRadar_bl_count=0
            radar_bl_t.start()
        }
        else
        {
            radar_bl_t.stop()
            adasRadar_bl_count=0
        }
    }
    Timer
    {
        id:radar_bl_t
        interval: 40
        repeat: true
        onTriggered:
        {
            if(adasRadar_bl_count==24)
                adasRadar_bl_count=0;
            else
                adasRadar_bl_count++;
        }
    }
    /*
    Image {
        id: radar_bm
        visible: adasRadar_bm_enable
        width: 114
        height: 80
        anchors.top: self_car.top
        anchors.left: self_car.left
        source: "./images/adas/radar/bm/"+adasRadar_name.arg(adasRadar_bm_count)
        anchors.leftMargin: 16
        anchors.topMargin: 82
    }
    */
    onAdasRadar_bm_enableChanged:
    {
        //console.log(adasRadar_bm_enable)
        if(adasRadar_bm_enable==true)
        {
            adasRadar_bm_count=0
            radar_bm_t.start()
        }
        else
        {
            radar_bm_t.stop()
            adasRadar_bm_count=0
        }
    }
    Timer
    {
        id:radar_bm_t
        interval: 40
        repeat: true
        onTriggered:
        {
            if(adasRadar_bm_count==24)
                adasRadar_bm_count=0;
            else
                adasRadar_bm_count++;
        }
    }
    /*
    Image {
        id: radar_br
        visible: adasRadar_br_enable
        width: 114
        height: 80
        anchors.top: self_car.top
        anchors.left: self_car.left
        source: "./images/adas/radar/br/"+adasRadar_name.arg(adasRadar_br_count)
        anchors.leftMargin: 122
        anchors.topMargin: 82
        //anchors.topMargin: -20
    }
    */
    onAdasRadar_br_enableChanged:
    {
        //console.log(adasRadar_br_enable)
        if(adasRadar_br_enable==true)
        {
            adasRadar_br_count=0
            radar_br_t.start()
        }
        else
        {
            radar_br_t.stop()
            adasRadar_br_count=0
        }
    }
    Timer
    {
        id:radar_br_t
        interval: 40
        repeat: true
        onTriggered:
        {
            if(adasRadar_br_count==24)
                adasRadar_br_count=0;
            else
                adasRadar_br_count++;
        }
    }
    /*
    Image {
        id: radar_fl
        visible: adasRadar_fl_enable
        width: 114
        height: 80
        anchors.top: self_car.top
        anchors.left: self_car.left
        anchors.leftMargin: -81
        anchors.topMargin: -12
        source: "./images/adas/radar/fl/"+adasRadar_name.arg(adasRadar_fl_count)
        //anchors.topMargin: -20
    }
    */
    onAdasRadar_fl_enableChanged:
    {
        //console.log(adasRadar_fl_enable)
        if(adasRadar_fl_enable==true)
        {
            adasRadar_fl_count=0
            radar_fl_t.start()
        }
        else
        {
            radar_fl_t.stop()
            adasRadar_fl_count=0
        }
    }
    Timer
    {
        id:radar_fl_t
        interval: 40
        repeat: true
        onTriggered:
        {
            if(adasRadar_fl_count==24)
                adasRadar_fl_count=0;
            else
                adasRadar_fl_count++;
        }
    }
    /*
    Image {
        id: radar_fr
        visible: adasRadar_fr_enable
        width: 114
        height: 80
        anchors.top: self_car.top
        anchors.left: self_car.left
        anchors.leftMargin: 122
        anchors.topMargin: -12
        source: "./images/adas/radar/fr/"+adasRadar_name.arg(adasRadar_fr_count)
        //anchors.topMargin: -20
    }
    */
    onAdasRadar_fr_enableChanged:
    {
        //console.log(adasRadar_fr_enable)
        if(adasRadar_fr_enable==true)
        {
            adasRadar_fr_count=0
            radar_fr_t.start()
        }
        else
        {
            radar_fr_t.stop()
            adasRadar_fr_count=0
        }
    }
    Timer
    {
        id:radar_fr_t
        interval: 40
        repeat: true
        onTriggered:
        {
            if(adasRadar_fr_count==24)
                adasRadar_fr_count=0;
            else
                adasRadar_fr_count++;
        }
    }

    property real posXOri: 0
    property real posXOriL: -90
    property real posXOriR: 90
    property real posZOri: 993

    property real posK: -1.5
    property real posB: -10
    property real rotK: 0.5//2
    property real rotB: -0.1//10

    property real posK2: -600//-160
    property real rotK2: 0.007//0.015
    property real rotB2: 0

    property real rotK3: -0.05
    property real rotB3: -0.1

    Model3D
    {
        id:model
        anchors.fill: parent
        z:5
        debugMode: adasDebugMode
        selfcar_x: 0+adasSelfCarXValue+(laneCurvature*Math.pow(adasSelfCarZValue,2)+adasSelfCarZValue+1)/posK2
        selfcar_z: posZOri-adasSelfCarZValue
        //selfcar_rot_y: 180+Math.atan((rotK2*laneCurvature*adasSelfCarZValue+rotB2))*180/Math.PI
        selfcar_op: adasSelfCarOp
        blow_vent_visible: adasSelfCarBlowVentEnable
        radar_bl_visible: adasRadar_bl_enable
        radar_bm_visible: adasRadar_bm_enable
        radar_br_visible: adasRadar_br_enable
        radar_fl_visible: adasRadar_fl_enable
        radar_fr_visible: adasRadar_fr_enable

        radar_bl_count: adasRadar_bl_count
        radar_bm_count: adasRadar_bm_count
        radar_br_count: adasRadar_br_count
        radar_fl_count: adasRadar_fl_count
        radar_fr_count: adasRadar_fr_count
        pos_x_00: adasModel_00_pos_x//+(laneCurvature*Math.pow(adasModel_00_pos_z,2)+adasModel_00_pos_z+1)/posK2
        pos_z_00: posZOri-adasModel_00_pos_z
        rot_y_00: Math.atan((rotK2*laneCurvature*adasModel_00_pos_z+rotB2))*180/Math.PI
        source_00:adasModel_00_source
        color_00:adasModel_00_color
        collision_visible_00:adasModel_00_collision_visible
        collision_type_00:adasModel_00_collision_type
        pos_x_01: adasModel_01_pos_x//+(laneCurvature*Math.pow(adasModel_01_pos_z,2)+adasModel_01_pos_z+1)/posK2
        pos_z_01: posZOri-adasModel_01_pos_z
        rot_y_01: Math.atan((rotK2*laneCurvature*adasModel_01_pos_z+rotB2))*180/Math.PI
        source_01:adasModel_01_source
        color_01:adasModel_01_color
        collision_visible_01:adasModel_01_collision_visible
        collision_type_01:adasModel_01_collision_type
        pos_x_02: adasModel_02_pos_x//+(laneCurvature*Math.pow(adasModel_02_pos_z,2)+adasModel_02_pos_z+1)/posK2
        pos_z_02: posZOri-adasModel_02_pos_z
        rot_y_02: Math.atan((rotK2*laneCurvature*adasModel_02_pos_z+rotB2))*180/Math.PI
        source_02:adasModel_02_source
        color_02:adasModel_02_color
        collision_visible_02:adasModel_02_collision_visible
        collision_type_02:adasModel_02_collision_type
        pos_x_03: adasModel_03_pos_x//+(laneCurvature*Math.pow(adasModel_03_pos_z,2)+adasModel_03_pos_z+1)/posK2
        pos_z_03: posZOri-adasModel_03_pos_z
        rot_y_03: Math.atan((rotK2*laneCurvature*adasModel_03_pos_z+rotB2))*180/Math.PI
        source_03:adasModel_03_source
        color_03:adasModel_03_color
        collision_visible_03:adasModel_03_collision_visible
        collision_type_03:adasModel_03_collision_type
        pos_x_04: adasModel_04_pos_x//+(laneCurvature*Math.pow(adasModel_04_pos_z,2)+adasModel_04_pos_z+1)/posK2
        pos_z_04: posZOri-adasModel_04_pos_z
        rot_y_04: Math.atan((rotK2*laneCurvature*adasModel_04_pos_z+rotB2))*180/Math.PI
        source_04:adasModel_04_source
        color_04:adasModel_04_color
        collision_visible_04:adasModel_04_collision_visible
        collision_type_04:adasModel_04_collision_type
        pos_x_05: adasModel_05_pos_x//+(laneCurvature*Math.pow(adasModel_05_pos_z,2)+adasModel_05_pos_z+1)/posK2
        pos_z_05: posZOri-adasModel_05_pos_z
        rot_y_05: Math.atan((rotK2*laneCurvature*adasModel_05_pos_z+rotB2))*180/Math.PI
        source_05:adasModel_05_source
        color_05:adasModel_05_color
        collision_visible_05:adasModel_05_collision_visible
        collision_type_05:adasModel_05_collision_type
        roadBg2Source: adasModel_RoadBg2Source
        roadBgSource: adasModel_RoadBgSource
    }
    //    Timer{
    //        id: laneAnimationTimer
    //        running: ture
    //        interval: 100
    //        repeat: true
    //        onTriggered: {
    //            if(model.rightLaneDashlineOffset > 1){
    //                model.rightLaneDashlineOffset = 0
    //            }
    //            model.rightLaneDashlineOffset += 0.1
    //            console.log(model.rightLaneDashlineOffset)
    //        }
    //    }
    /*    Model3D
    {
        id:model_01
        anchors.fill: parent
        z:5
        pos_x: 0
        pos_z: 200
        source:"./components/Motuoche.qml"
        collision_visible:false
    }
    Model3D
    {
        id:model_02
        anchors.fill: parent
        z:5
        pos_x: 0
        pos_z: -150
        source:"./components/Motuoche.qml"
    }
    Model3D
    {
        id:model_03
        anchors.fill: parent
        z:5
        pos_x: 90
        pos_z: 620
        source:"./components/Motuoche.qml"
    }
    Model3D
    {
        id:model_04
        anchors.fill: parent
        z:5
        pos_x: 90
        pos_z: -150
        source:"./components/Motuoche.qml"

    }
    Model3D
    {
        id:model_05
        anchors.fill: parent
        z:5
        pos_x: -90
        pos_z: -150
        source:"./components/Motuoche.qml"
    }
*/

    Rectangle
    {
        id:text_info_rect
        anchors.centerIn: text_info_title
        height: text_info_title.height
        width: text_info_title.contentWidth+20
        visible: text_info_title.contentWidth>0?true:false
        radius: 5
        color: "#bed0e0"
        opacity: 1
    }
    Text {
        font.family: rootItemId.ziti
        id: text_info_title
        font.pixelSize: 28
        font.bold:rootItemId.jiacu === 1
        width: 400
        //        x:231
        //        y:70+279
        color:adasTextInfoColor === 0?"#black":"red"
        anchors.bottom: parent.bottom
        horizontalAlignment: Text.AlignHCenter
        verticalAlignment: Text.AlignVCenter
        anchors.bottomMargin: 17
        anchors.horizontalCenter: parent.horizontalCenter
        font.styleName: "Bold"
        font.weight: Font.Bold
    }
    //roadsBg
    Image {
        id: roadsBg
        x:177
        y:73
        z:0
        source: "qrc:/images10_25/adas3d/RoadsBG_TR_Light.png"
        fillMode:Image.Pad
        visible: false
    }

    Component.onCompleted: {
        //laneAnimation.running = true
        //timelineAnimation.running = true
    }
    Timeline {
        id: timeline
        animations: [
            TimelineAnimation {
                id: timelineAnimation
                loops: -1
                running: false
                duration: 10000
                to: 1000
                from: 0
            }
        ]
        endFrame: 1000
        startFrame: 0
        enabled: true
        /*
        KeyframeGroup {
            target: model
            property: "rightLaneDashlineOffset"
            Keyframe {
                frame: 0
                value: 0.0
            }
            Keyframe {
                frame: 100
                value: 100.0
            }

            Keyframe {
                frame: 101
                value: 0.0
            }
            Keyframe {
                frame: 200
                value: 100.0
            }

            Keyframe {
                frame: 201
                value: 0.0
            }
            Keyframe {
                frame: 300
                value: 100.0
            }

            Keyframe {
                frame: 301
                value: 0.0
            }
            Keyframe {
                frame: 400
                value: 100.0
            }

            Keyframe {
                frame: 401
                value: 0.0
            }
            Keyframe {
                frame: 500
                value: 100.0
            }

            Keyframe {
                frame: 501
                value: 0.0
            }
            Keyframe {
                frame: 600
                value: 100.0
            }
            Keyframe {
                frame: 601
                value: 0.0
            }
            Keyframe {
                frame: 700
                value: 100.0
            }

            Keyframe {
                frame: 701
                value: 0.0
            }
            Keyframe {
                frame: 800
                value: 100.0
            }

            Keyframe {
                frame: 801
                value: 0.0
            }
            Keyframe {
                frame: 900
                value: 100.0
            }
            Keyframe {
                frame: 901
                value: 0.0
            }
            Keyframe {
                frame: 1000
                value: 100.0
            }
        }

        KeyframeGroup {
            target: model
            property: "leftLaneDashlineOffset"
            Keyframe {
                frame: 0
                value: 0.0
            }
            Keyframe {
                frame: 100
                value: 100.0
            }

            Keyframe {
                frame: 101
                value: 0.0
            }
            Keyframe {
                frame: 200
                value: 100.0
            }

            Keyframe {
                frame: 201
                value: 0.0
            }
            Keyframe {
                frame: 300
                value: 100.0
            }

            Keyframe {
                frame: 301
                value: 0.0
            }
            Keyframe {
                frame: 400
                value: 100.0
            }

            Keyframe {
                frame: 401
                value: 0.0
            }
            Keyframe {
                frame: 500
                value: 100.0
            }

            Keyframe {
                frame: 501
                value: 0.0
            }
            Keyframe {
                frame: 600
                value: 100.0
            }
            Keyframe {
                frame: 601
                value: 0.0
            }
            Keyframe {
                frame: 700
                value: 100.0
            }

            Keyframe {
                frame: 701
                value: 0.0
            }
            Keyframe {
                frame: 800
                value: 100.0
            }

            Keyframe {
                frame: 801
                value: 0.0
            }
            Keyframe {
                frame: 900
                value: 100.0
            }
            Keyframe {
                frame: 901
                value: 0.0
            }
            Keyframe {
                frame: 1000
                value: 100.0
            }
        }
*/
        KeyframeGroup {
            target: model
            property: "roadLaneCurvature"
            Keyframe {
                frame: 0
                value: 0.04
            }
            Keyframe {
                frame: 500
                value: -0.04
            }
            Keyframe {
                frame: 1000
                value: 0.04
            }
        }

        KeyframeGroup {
            target: root
            property: "adasModel_00_pos_z"
            Keyframe {
                frame: 0
                value: 620//850

            }

            Keyframe {
                frame: 500
                value: 200
            }
            Keyframe {
                frame: 1000
                value: 620//850
            }
        }
        KeyframeGroup {
            target: root
            property: "adasModel_01_pos_z"
            Keyframe {
                frame: 0
                value: 400

            }

            Keyframe {
                frame: 500
                value: -20//-400
            }
            Keyframe {
                frame: 1000
                value: 400
            }
        }
        KeyframeGroup {
            target: root
            property: "adasModel_02_pos_z"
            Keyframe {
                frame: 0
                value:0

            }

            Keyframe {
                frame: 500
                value: 850
            }
            Keyframe {
                frame: 1000
                value: 0
            }
        }
        KeyframeGroup {
            target: root
            property: "adasModel_03_pos_z"
            Keyframe {
                frame: 0
                value: 600

            }

            Keyframe {
                frame: 500
                value: -100
            }
            Keyframe {
                frame: 1000
                value: 600
            }
        }
        KeyframeGroup {
            target: root
            property: "adasModel_04_pos_z"
            Keyframe {
                frame: 0
                value: 600

            }

            Keyframe {
                frame: 500
                value: 400
            }
            Keyframe {
                frame: 1000
                value: 600
            }
        }
        KeyframeGroup {
            target: root
            property: "adasModel_05_pos_z"
            Keyframe {
                frame: 0
                value: 400

            }

            Keyframe {
                frame: 500
                value: 200
            }
            Keyframe {
                frame: 1000
                value: 400
            }
        }
    }

    //    Timeline {
    //        id: timeline
    //        animations: [
    //            TimelineAnimation {
    //                id: timelineAnimation
    //                loops: 1
    //                running: true
    //                duration: 1000
    //                to: 1000
    //                from: 0
    //            }
    //        ]
    //        endFrame: 1000
    //        startFrame: 0
    //        enabled: true

    //        KeyframeGroup {
    //            target: model
    //            property: "x"
    //            Keyframe {
    //                frame: 1
    //                value: 0.00001
    //            }

    //            Keyframe {
    //                frame: 734
    //                value: 0.00012
    //            }

    //            Keyframe {
    //                frame: 0
    //                value: -0.00001
    //            }

    //            Keyframe {
    //                frame: 1000
    //                value: 0
    //            }
    //        }

    //        KeyframeGroup {
    //            target: model
    //            property: "y"
    //            Keyframe {
    //                frame: 1
    //                value: -0
    //            }

    //            Keyframe {
    //                frame: 734
    //                value: -0.00006
    //            }

    //            Keyframe {
    //                frame: 0
    //                value: -0.00004
    //            }

    //            Keyframe {
    //                frame: 1000
    //                value: 0
    //            }
    //        }

    //        KeyframeGroup {
    //            target: model
    //            property: "z"
    //            Keyframe {
    //                frame: 1
    //                value: -81.08806
    //            }

    //            Keyframe {
    //                frame: 734
    //                value: -1019.1225
    //            }

    //            Keyframe {
    //                frame: 1000
    //                value: -991.75861
    //            }

    //            Keyframe {
    //                frame: 0
    //                value: -416.62109
    //            }
    //        }
    //    }

    onAdasTextInfoContentChanged: {
        if(adasTextInfoContent===0x3A){
            text_info_title.text=TranslateStr.warningInfoStr_0x3A
        }else if(adasTextInfoContent === 0x3B){
            text_info_title.text=TranslateStr.warningInfoStr_0x3B
        }else if(adasTextInfoContent === 0x3C){
            text_info_title.text=TranslateStr.warningInfoStr_0x3C
        }else if(adasTextInfoContent === 0x117){
            text_info_title.text=TranslateStr.warningInfoStr_0x117
        }else if (adasTextInfoContent === 0x187){
            text_info_title.text =TranslateStr.warningInfoStr_0x187
        }else if (adasTextInfoContent === 0x188){
            text_info_title.text = TranslateStr.warningInfoStr_0x188
        }else if (adasTextInfoContent === 0x189){
            text_info_title.text = TranslateStr.warningInfoStr_0x189
        }
        else
        {
            text_info_title.text=""
        }
    }

}
/*##^##
Designer {
    D{i:0;height:400;width:600}D{i:31}
}
##^##*/
