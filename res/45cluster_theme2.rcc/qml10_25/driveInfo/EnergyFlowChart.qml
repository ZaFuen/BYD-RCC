import QtQuick 2.15
import com.byd.DataSource 1.0
import com.byd.CenterChild 1.0

CenterChild {
    id: energyFlowChartId
    width: 560
    height: 300
    visible: true
    Item {
        id: mainContent
        scale: 0.33
        x: DataSource.carBodyType === 0x0 ? 85 : 95
        y: DataSource.carBodyType === 0x0 ? -10 : -5
        width: 1161
        height: 1026
        transformOrigin: Item.TopLeft
        
        // 车体阴影图
        Image {
            id: carBodyImgBg
            source: {
                if(DataSource.carBodyType === 0x0) {
                    "qrc:/images10_25/energyFlow/day/car_body_sedan_day_shadow.png"
                } else if(DataSource.carBodyType === 0x1) {
                    "qrc:/images10_25/energyFlow/day/car_body_suv_day_shadow.png"
                } else {
                    "qrc:/images10_25/energyFlow/day/car_body_mpv_day_shadow.png"
                }
            }
            mipmap: true
            visible: DataSource.dayNightMode === 0x01
        }

        // 前电机
        Image {
            id: frontMotor
            x: 334
            y: 593
            visible: DataSource.performanceMode === 0x1 ? true : ((DataSource.motorConfig === 0x01 || DataSource.motorConfig === 0x03) ? true : false)
            source: {
                DataSource.energyFlowDisplay !== 0x0 ? (DataSource.frontMotorColor === 0x0 ? "qrc:/images10_25/energyFlow/day/motor_gray_front.ktx" : "qrc:/images10_25/energyFlow/day/motor_blue_front.ktx") : "qrc:/images10_25/energyFlow/day/motor_gray_front.ktx"
            }
        }

        // 发动机
        Image {
            id: frontEngine
            x: 213
            y: 638
            visible: DataSource.performanceMode === 0x1 ? true : (DataSource.vehicleType === 0x1 ? false : true)
            source: {
                DataSource.energyFlowDisplay !== 0x0 ? (DataSource.engineEnergyFlowDirection === -1 || ((DataSource.motorConfig === 0x02 || DataSource.motorConfig === -1) && (DataSource.engineEnergyFlowDirection === 0x02 || DataSource.engineEnergyFlowDirection === 0x04 || DataSource.engineEnergyFlowDirection === 0x05)) ? "qrc:/images10_25/energyFlow/day/engine_gray_front.ktx" : "qrc:/images10_25/energyFlow/day/engine_red_front.ktx") : "qrc:/images10_25/energyFlow/day/engine_gray_front.ktx"
            }
        }

        // 后电机
        Image {
            id: rearMotor
            x: 757
            y: 352
            visible: DataSource.performanceMode === 0x1 ? true : ((DataSource.motorConfig === 0x02 || DataSource.motorConfig === 0x03) ? true : false)
            source: {
                DataSource.energyFlowDisplay !== 0x0 ? (DataSource.rearMotorColor === 0x0 ? "qrc:/images10_25/energyFlow/day/motor_gray_rear.ktx" : "qrc:/images10_25/energyFlow/day/motor_blue_rear.ktx") : "qrc:/images10_25/energyFlow/day/motor_gray_rear.ktx"
            }
        }

        // 电池
        Image {
            visible: true
            x: 420
            y: 396
            source: "qrc:" + "/images10_25/energyFlow/day/anim_battery/bat_" + parseInt(DataSource.energyFlowBattery / 5) + ".ktx"
        }

        // 车体图
        Image {
            id: carBodyImg
            source: {
                if(DataSource.carBodyType === 0x0) {
                    DataSource.dayNightMode === 0x01 ? "qrc:/images10_25/energyFlow/day/car_body_sedan_day.png" : "qrc:/images10_25/energyFlow/day/car_body_sedan_night.png"
                } else if(DataSource.carBodyType === 0x1) {
                    DataSource.dayNightMode === 0x01 ? "qrc:/images10_25/energyFlow/day/car_body_suv_day.png" : "qrc:/images10_25/energyFlow/day/car_body_suv_night.png"
                } else {
                    DataSource.dayNightMode === 0x01 ? "qrc:/images10_25/energyFlow/day/car_body_mpv_day.png" : "qrc:/images10_25/energyFlow/day/car_body_mpv_night.png"
                }
            }
            mipmap: true
        }
        
        ListModel {
            id: picListModelTwoId
            ListElement { picVisible: false }
            ListElement { picVisible: false }
            ListElement { picVisible: false }
            ListElement { picVisible: false }
            ListElement { picVisible: false }
            ListElement { picVisible: false }
            ListElement { picVisible: false }
            ListElement { picVisible: false }
            ListElement { picVisible: false }
            ListElement { picVisible: false }
        }

        // 发动机能量回收
        Repeater {
            model: picListModelTwoId
            Image {
                id: animEngineEnergyRecovery
                x: 328
                y: 579
                z: 6
                visible: picVisible && (DataSource.vehicleType !== 1 && (DataSource.motorConfig === 1 || DataSource.motorConfig === 3) && (DataSource.engineEnergyFlowDirection === 0x02 || DataSource.engineEnergyFlowDirection === 0x03 || DataSource.engineEnergyFlowDirection === 0x05 || DataSource.engineEnergyFlowDirection === 0x06 || DataSource.engineEnergyFlowDirection === 0x07)) ? true : false
                source: "qrc:/images10_25/energyFlow/day/anim_Engine_EnergyRevocery/IMG_" + (index) + ".ktx"
            }
        }

        // 发动机到电池的能量回收
        Repeater {
            model: picListModelTwoId
            Image {
                id: animEngineToBatEnergyRecovery
                x: 328
                y: 579
                z: 6
                visible: picVisible && (DataSource.vehicleType !== 1 && (DataSource.motorConfig === 2 || DataSource.motorConfig === -1) && (DataSource.engineEnergyFlowDirection === 0x06 || DataSource.engineEnergyFlowDirection === 0x07)) ? true : false
                source: "qrc:" + "/images10_25/energyFlow/day/anim_EngineToBat_Recorvery/IMG_" + (index) + ".ktx"
            }
        }

        // 发动机能量到前电机
        Repeater {
            model: picListModelTwoId
            Image {
                id: animEngineToFrontMotorEnergy
                x: 328
                y: 641
                z: 6
                visible: picVisible && DataSource.vehicleType !== 1 && (DataSource.motorConfig === 1 || DataSource.motorConfig === 3) && ((DataSource.engineEnergyFlowDirection === 0x02) || DataSource.engineEnergyFlowDirection === 0x03 || (DataSource.engineEnergyFlowDirection === 0x04 || DataSource.engineEnergyFlowDirection === 0x05)) ? true : false
                source: "qrc:/images10_25/energyFlow/day/anim_EngineToFrontMotor_Energy/IMG_" + (index) + ".ktx"
            }
        }

        // 发动机驱动能量流
        Repeater {
            model: picListModelTwoId
            Image {
                id: animEngineDriveEnergy
                x: 223
                y: 547
                z: 6
                visible: DataSource.performanceMode === 0x1 ? picVisible : (DataSource.vehicleType === 0x01 ? false : ((DataSource.engineEnergyFlowDirection === 0x01 || DataSource.engineEnergyFlowDirection === 0x03 || DataSource.engineEnergyFlowDirection === 0x07) && picVisible) ? true : false)
                source: "qrc:/images10_25/energyFlow/day/anim_Engine_DriveEnergy/IMG_" + (index) + ".ktx"
            }
        }

        // 后电机能量回收，驱动
        Repeater {
            model: picListModelTwoId
            Image {
                id: animRearMotorEnergyRecovery
                x: 669
                y: 319
                z: 6
                visible: DataSource.performanceMode === 0x1 ? picVisible : (picVisible && (DataSource.energyFlowDirection === 5 || DataSource.energyFlowDirection === 6 || DataSource.energyFlowDirection === 2 || DataSource.energyFlowDirection === 3) && (DataSource.motorConfig === 2 || DataSource.motorConfig === 3) ? true : false)
                source: {
                    if(DataSource.energyFlowDirection === 5 || DataSource.energyFlowDirection === 6) {
                        "qrc:/images10_25/energyFlow/day/anim_RearMotor_EnergyRecovery/IMG_" + (index) + ".ktx"
                    } else {
                        "qrc:/images10_25/energyFlow/day/anim_RearMotor_DriveEnergy/IMG_" + (index) + ".ktx"
                    }
                }
            }
        }

        // 前电机能量回收,驱动
        Repeater {
            model: picListModelTwoId
            Image {
                id: animFrontMotorEnergyRecorvery
                x: 265
                y: 548
                z: 6
                visible: DataSource.performanceMode === 0x1 ? picVisible : (picVisible && (DataSource.energyFlowDirection === 4 || DataSource.energyFlowDirection === 6 || DataSource.energyFlowDirection === 1 || DataSource.energyFlowDirection === 3) && (DataSource.motorConfig === 1 || DataSource.motorConfig === 3) ? true : false)
                source: {
                    if(DataSource.energyFlowDirection === 4 || DataSource.energyFlowDirection === 6) {
                        "qrc:/images10_25/energyFlow/day/anim_FrontMotor_EnergyRecovery/IMG_" + (index) + ".ktx"
                    } else {
                        "qrc:/images10_25/energyFlow/day/anim_FrontMotor_DrivingEnergy/IMG_" + (index) + ".ktx"
                    }
                }
            }
        }

        // 前电机驱动能量流2
        Repeater {
            model: picListModelTwoId
            Image {
                id: animFrontMotorDrivingEnergy2
                x: 265
                y: 548
                z: 6
                visible: picVisible && DataSource.vehicleType === 2 && (DataSource.engineEnergyFlowDirection === 4 || DataSource.engineEnergyFlowDirection === 5) && (DataSource.motorConfig === 1 || DataSource.motorConfig === 3) ? true : false
                source: "qrc:/images10_25/energyFlow/day/anim_FrontMotor_DrivingEnergy2/IMG_" + (index) + ".ktx"
            }
        }

        // 车轮动画
        Item {
            id: wheelAnim
            anchors.fill: parent
            visible: DataSource.energyFlowWheelAnimDisplay === true
            
            // 车轮动画Repeater组件（保持原样）
            // ... 这里包含所有车轮动画的Repeater，代码较长，保持原逻辑不变
            Repeater{
                model:picListModelTwoId
                Image{
                    id:d_drive_r_recovery_frontR
                    x:180
                    y:430
                    z:7
                    visible: picVisible&&(DataSource.energyFlowWheelStatus === 1 || DataSource.energyFlowWheelStatus === 5
                                          ||DataSource.energyFlowWheelStatus === 4 || DataSource.energyFlowWheelStatus === 8)
                    source:{
                        if(DataSource.energyFlowWheelStatus === 1 || DataSource.energyFlowWheelStatus === 5){
                            "qrc:/images10_25/energyFlow/day/D_gear_Driving/front_right_wheel/IMG_"+(index)+".ktx"
                        }else{
                            "qrc:/images10_25/energyFlow/day/R_gear_Recovery/front_right_wheel/IMG_"+(index)+".ktx"
                        }
                    }
                }
            }
            Repeater{//2前进驱动/倒车回收-前轮左
                model:picListModelTwoId
                Image{
                    id:d_drive_r_recovery_frontL
                    x:440
                    y:642
                    z:7
                    visible:picVisible&&(DataSource.energyFlowWheelStatus === 1 || DataSource.energyFlowWheelStatus === 5
                                         ||DataSource.energyFlowWheelStatus === 4 || DataSource.energyFlowWheelStatus === 8)
                    source:{
                        if(DataSource.energyFlowWheelStatus === 1 || DataSource.energyFlowWheelStatus === 5){
                            "qrc:/images10_25/energyFlow/day/D_gear_Driving/front_left_wheel/IMG_"+(index)+".ktx"
                        }else{
                            "qrc:/images10_25/energyFlow/day/R_gear_Recovery/front_left_wheel/IMG_"+(index)+".ktx"
                        }

                    }


                }
            }
            Repeater{//5前进回收/倒车驱动-前轮右
                model:picListModelTwoId
                Image{
                    id:d_recovery_r_drive_frontR
                    x:96
                    y:464
                    z:7
                    visible:picVisible&&(DataSource.energyFlowWheelStatus === 2 || DataSource.energyFlowWheelStatus === 6
                                         ||DataSource.energyFlowWheelStatus === 3 || DataSource.energyFlowWheelStatus === 7)
                    source:{
                        if(DataSource.energyFlowWheelStatus === 2 || DataSource.energyFlowWheelStatus === 6){
                            "qrc:/images10_25/energyFlow/day/D_gear_Recovery/front_right_wheel/IMG_"+(index)+".ktx"
                        }else{
                            "qrc:/images10_25/energyFlow/day/R_gear_Driving/front_right_wheel/IMG_"+(index)+".ktx"
                        }

                    }

                }
            }
            Repeater{//6前进回收/倒车驱动-前轮左
                model:picListModelTwoId
                Image{
                    id:d_recovery_r_drive_frontL
                    x:368
                    y:676
                    z:7
                    visible:picVisible&&(DataSource.energyFlowWheelStatus === 2 || DataSource.energyFlowWheelStatus === 6
                                         ||DataSource.energyFlowWheelStatus === 3 || DataSource.energyFlowWheelStatus === 7)
                    source:{
                        if(DataSource.energyFlowWheelStatus === 2 || DataSource.energyFlowWheelStatus === 6){
                            "qrc:/images10_25/energyFlow/day/D_gear_Recovery/front_left_wheel/IMG_"+(index)+".ktx"
                        }else{
                            "qrc:/images10_25/energyFlow/day/R_gear_Driving/front_left_wheel/IMG_"+(index)+".ktx"
                        }

                    }


                }
            }
            Repeater{//3前进驱动/倒车回收-后轮右
                model:picListModelTwoId
                Image{
                    id:d_drive_r_recovery_rearR
                    x:582
                    y:214
                    z:7
                    visible:picVisible&&(DataSource.energyFlowWheelStatus === 5 || DataSource.energyFlowWheelStatus === 8)
                    source:{
                        if(DataSource.energyFlowWheelStatus === 5){
                            "qrc:/images10_25/energyFlow/day/D_gear_Driving/rear_right_wheel/IMG_"+(index)+".ktx"
                        }else{
                            "qrc:/images10_25/energyFlow/day/R_gear_Recovery/rear_right_wheel/IMG_"+(index)+".ktx"
                        }

                    }

                }
            }
            Repeater{//4前进驱动/倒车回收-后轮左
                model:picListModelTwoId
                Image{
                    id:d_drive_r_recovery_rearL
                    x:848
                    y:362
                    z:7
                    visible:picVisible&&(DataSource.energyFlowWheelStatus === 5 || DataSource.energyFlowWheelStatus === 8)
                    source:{
                        if(DataSource.energyFlowWheelStatus === 5){
                            "qrc:/images10_25/energyFlow/day/D_gear_Driving/rear_left_wheel/IMG_"+(index)+".ktx"
                        }else{
                            "qrc:/images10_25/energyFlow/day/R_gear_Recovery/rear_left_wheel/IMG_"+(index)+".ktx"
                        }

                    }

                }
            }
            Repeater{//7前进回收/倒车驱动-后轮右
                model:picListModelTwoId
                Image{
                    id:d_recovery_r_drive_rearR
                    x:514
                    y:244
                    z:7
                    visible:picVisible&&(DataSource.energyFlowWheelStatus === 6 || DataSource.energyFlowWheelStatus === 7)
                    source:{
                        if(DataSource.energyFlowWheelStatus === 6){
                            "qrc:/images10_25/energyFlow/day/D_gear_Recovery/rear_right_wheel/IMG_"+(index)+".ktx"
                        }else{
                            "qrc:/images10_25/energyFlow/day/R_gear_Driving/rear_right_wheel/IMG_"+(index)+".ktx"
                        }

                    }

                }
            }
            Repeater{//7前进回收/倒车驱动-后轮左
                model:picListModelTwoId
                Image{
                    id:d_recovery_r_drive_rearL
                    x:766
                    y:380
                    z:7
                    visible:picVisible&&(DataSource.energyFlowWheelStatus === 6 || DataSource.energyFlowWheelStatus === 7)
                    source:{
                        if(DataSource.energyFlowWheelStatus === 6){
                            "qrc:/images10_25/energyFlow/day/D_gear_Recovery/rear_left_wheel/IMG_"+(index)+".ktx"
                        }else{
                            "qrc:/images10_25/energyFlow/day/R_gear_Driving/rear_left_wheel/IMG_"+(index)+".ktx"
                        }

                    }

                }
            }
        }
    }
    
    function hideListModelTwo() {
        for(var i = 0; i < picListModelTwoId.count; ++i) {
            picListModelTwoId.setProperty(i, "picVisible", false)
        }
    }

    function showPicTwo(index) {
        picListModelTwoId.setProperty(index, "picVisible", true)
    }

    property int picIndex2: 0
    property bool initTwo: false
    
    Timer {
        id: timer2
        repeat: true
        running: false
        interval: 80
        triggeredOnStart: true
        onTriggered: {
            if(picIndex2 > 9) {
                picIndex2 = 0
            }
            hideListModelTwo()
            showPicTwo(picIndex2++)
        }
    }

    function updateAnim() {
        if(DataSource.performanceMode === 0x1) {
            timer2.stop()
            timer2.start()
        } else {
            if(energyFlowChartId.visible === true && energyFlowChartId.opacity >= 1.0) {
                if(DataSource.energyFlowDisplay !== 0x1) {
                    timer2.stop()
                } else {
                    if(DataSource.engineEnergyFlowDirection !== -1 || DataSource.energyFlowDirection !== -1) {
                        timer2.stop()
                        timer2.start()
                    } else if(DataSource.energyFlowWheelAnimDisplay === true && DataSource.energyFlowDisplay === 0x1) {
                        timer2.stop()
                        timer2.start()
                    } else {
                        timer2.stop()
                    }
                }
            } else {
                timer2.stop()
            }
        }
    }

    // 连接数据源信号
    Connections {
        target: DataSource
        function onEnergyFlowDirectionChanged() { updateAnim() }
        function onEngineEnergyFlowDirectionChanged() { updateAnim() }
        function onEnergyFlowDisplayChanged() { updateAnim() }
        function onPerformanceModeChanged() { updateAnim() }
        function onEnergyFlowWheelAnimDisplayChanged() { updateAnim() }
    }

    Connections {
        target: energyFlowChartId
        function onOpacityChanged() { updateAnim() }
        function onVisibleChanged() { updateAnim() }
    }

    Component.onCompleted: {
        updateAnim()
    }
}