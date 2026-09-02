import QtQuick 2.15
import com.byd.DataSource 1.0
import com.byd.CenterChild 1.0
import "qrc:/common/singleton/"

CenterChild{
    id:adasRoot
    width: 608
    height: 290
//    anchors.fill:parent
    visible: true
	property int currentIndex: 0
    property bool needShowAlertCar: false
    property bool approachTopPoint: false
    property int yOffSet: DataSource.naviType === 0x04 ? 58 : (DataSource.adasInterfaceDisplay === 2 && DataSource.naviType!==0x04 ? 60 : 0)
    property string adasRadar_name: "IMG_%1.png"
    property int adasRadar_bl_count:0 //0-25
    property bool adasRadar_bl_enable: DataSource.leftRearRadarStatus === 1 ? true : false
    property int adasRadar_bm_count:0 //0-25
    property bool adasRadar_bm_enable: DataSource.rearRadarStatus === 1 ? true :false
    property int adasRadar_br_count:0 //0-25
    property bool adasRadar_br_enable: DataSource.rightRearRadarStatus === 1 ? true : false
    property int adasRadar_fl_count:0 //0-25
    property bool adasRadar_fl_enable: DataSource.leftFrontRadarStatus === 1 ? true : false
    property int adasRadar_fr_count:0 //0-25
    property bool adasRadar_fr_enable: DataSource.rightFrontRadarStatus === 1 ? true :false
    property int preAccMote: 0
    ListModel{
        id:radarPicListModel
    }

    Component.onCompleted: {
        updateImageIcon()
        updateTrackAlertIcon()
        updateLaneImage()
        updateSelfCarPosition()
        updateOpenDoorImage()
        updateSteerImage()
        for(var i = 0; i < 25; ++i){
            radarPicListModel.append({"picVisible": false})
        }
        radarTimer.start()
    }

    Item{
        id:adasCommonInfoItemId
        anchors.fill: parent
        visible: true
        Image {
            id: roadBg
            x:845
            y:255
			visible: DataSource.naviType === 4
            source: DataSource.dayNightMode === 0x1 ? "qrc:/images10_25/adas2d/singleroadlight.png": "qrc:/images10_25/adas2d/singleroad-dark.png"
        }

        //左侧线
        Image {
            id: leftLineImg
            cache: false
            x:839-23
            y:258
        }

        //右侧线
        Image {
            id: rightLineImg
            cache: false
            x:985
            y:258
        }

        //车头居中
        Image {
            id: self_car
            cache: false
            y:280
            z:2	
            scale: 0.8			
    x: {updateSelfCarPosition()}
    source: updateSelfCarSource()
            opacity:(DataSource.accRemoteText === 0x2
                     ||DataSource.accRemoteText === 0x3
                     ||DataSource.accRemoteText === 0x7
                     ||DataSource.accRemoteText === 0x8
                     ||DataSource.accRemoteText === 0x24
                     ||DataSource.accRemoteText === 0x27) ? 0.3 : 1
//            Behavior on x{
//                NumberAnimation{duration: 100}
//            }
        }
        Image {
            id: adasCircleLXHId
            anchors.centerIn: self_car
            visible: DataSource.leftLineColor === 2
            scale: 0.8  // 初始缩放值（根据需求调整，若需从当前1.3开始可保留原scale）
            source: "qrc:/images10_25/adas2d/adasCircle.png"

            // 缩放动画：先放大到1.2倍，再缩小到1.0倍，循环播放
            SequentialAnimation on scale {
                id: adasCircleLXHAnimationId
                loops: Animation.Infinite  // 无限循环
                running: true              // 自动启动动画

                // 第一步：放大到1.2倍（持续2秒）
                NumberAnimation {
                    from: 0.8                // 起始值（若初始scale为1.3，可改为from: 1.3）
                    to: 1.3                  // 目标值：1.2倍
                    duration: 2000           // 持续时间2秒
                }

                // 第二步：缩小回1.0倍（持续2秒）
                NumberAnimation {
                    from: 1.3                // 起始值：1.2倍
                    to: 0.8                 // 目标值：原始大小1.0倍
                    duration: 2000           // 持续时间2秒
                }
            }
        }
        //超越加速中
        Image {
            id:speedUpBlowVentId
            anchors.left: self_car.left
            anchors.top: self_car.bottom
            anchors.topMargin: -65
            anchors.leftMargin: 40
            source: "qrc:/images10_25/adas2d/blow_vent.png"
            visible:DataSource.accRemoteText === 0xC ? true : false
        }

        Image {
            id: steerWarningImage
            x:862
            y:387
            z:3
            source: "qrc:/images10_25/adas3d/steering_wheel2_SK2.png"
            visible:  (DataSource.accRemoteText === 0x2
                       ||DataSource.accRemoteText === 0x3
                       ||DataSource.accRemoteText === 0x7
                       ||DataSource.accRemoteText === 0x8
                       ||DataSource.accRemoteText === 0x24
                       ||DataSource.accRemoteText === 0x27) ? true : false
        }

        //一档间距前车
        Image {
            id: frontCarDistance1
            visible: DataSource.carTimeDisLevel ===0x01?true:false
            cache: false
            x:885
            y:309
        }
        //一档间距报警
        Image {
            id: frontCarDistanceAlert1
            visible: DataSource.carTimeDisLevel === 0x01?true:false
            cache: false
            x:886
            y:382
            source: "qrc:/images10_25/adas2d/frontCarDistanceAlert1.png"
        }

        //二档间距前车
        Image {
            id: frontCarDistance2
            visible: DataSource.carTimeDisLevel === 0x02?true:false
            cache: false
            x:896
            y:294
        }
        //二档间距报警
        Image {
            id: frontCarDistanceAlert2
            visible: DataSource.carTimeDisLevel === 0x02?true:false
            cache: false
            x:886
            y:358
            source: "qrc:/images10_25/adas2d/frontCarDistanceAlert2.png"
        }
        //三档/四档间距前车
        Image {
            id: frontCarDistance3
            visible: (DataSource.carTimeDisLevel === 0x03 || DataSource.carTimeDisLevel === 0x04)?true:false
            cache: false
            x:916
            y:257
        }
        //三档间距报警
        Image {
            id: frontCarDistanceAlert3
            visible: DataSource.carTimeDisLevel === 0x03?true:false
            cache: false
            x:886
            y:300
            source: "qrc:/images10_25/adas2d/frontCarDistanceAlert3.png"
        }

        Repeater{
            model:radarPicListModel

            Image {
                id: radar_bl
                visible: DataSource.performanceMode === 0x1 ? picVisible: picVisible && adasRadar_bl_enable
                z:1
                anchors.left: self_car.left
                anchors.leftMargin: -33
                //x: 804
                y: 479
                source: "qrc:/images10_25/adas2d/radar/left_rear/"+adasRoot.adasRadar_name.arg(index)
            }
        }
        Repeater{
            model:radarPicListModel
            Image {
                id: radar_bm
                visible:DataSource.performanceMode === 0x1 ? picVisible: picVisible && adasRadar_bm_enable
                z:1
                y: 491
                anchors.horizontalCenter: self_car.horizontalCenter
                source: "qrc:/images10_25/adas2d/radar/mid_rear/"+adasRadar_name.arg(index)
            }
        }
        Repeater{
            model:radarPicListModel
            Image {
                id: radar_br
                visible: DataSource.performanceMode === 0x1 ? picVisible: picVisible &&adasRadar_br_enable
                z:1
                anchors.left: self_car.right
                anchors.leftMargin: -100
                //x: 983
                y: 479
                source: "qrc:/images10_25/adas2d/radar/right_rear/"+adasRadar_name.arg(index)
            }
        }
        Repeater{
            model:radarPicListModel
            Image {
                id: radar_fl
                visible: DataSource.performanceMode === 0x1 ? picVisible: picVisible &&adasRadar_fl_enable
                z:1
                anchors.left: self_car.left
                anchors.leftMargin: -33
                //x: 804
                y: 373
                source: "qrc:/images10_25/adas2d/radar/left_front/"+adasRadar_name.arg(index)
            }
        }
        Repeater{
            model:radarPicListModel
            Image {
                id: radar_fr
                visible: DataSource.performanceMode === 0x1 ? picVisible: picVisible &&adasRadar_fr_enable
                z:1
                anchors.left: self_car.right
                anchors.leftMargin: -101
                //x: 982
                y: 373
                source: "qrc:/images10_25/adas2d/radar/right_front/"+adasRadar_name.arg(index)
            }
        }
    }

    //车门预警
    Item {
        id: openDoorWarningContainer
        visible:false
        x: DataSource.naviType === 0x04 ? 6 : 0
        //车身
        Image {
            id: imageId
            x: 839
            y: 158+yOffSet
            source:"qrc:/images10_25/adas2d/car_SK2.png"
            cache: false
        }
        Image {
            id: leftSideDoorId
            x: 894
            y: 293+yOffSet
            visible: DataSource.adasCarDoorOpenSide !== 1 ? true:false
            source:"qrc:/images10_25/adas2d/door_l_SK2.png"
        }
        Image {
            id: rightSideDoorId
            x: 999
            y: 293+yOffSet
            visible: DataSource.adasCarDoorOpenSide !== 0 ? true:false
            source:"qrc:/images10_25/adas2d/door_r_SK2.png"
        }
    }

    function updateOpenDoorImage(){
        switch(DataSource.carNameType){
        case 6:
            imageId.source = "qrc:/images10_25/adas2d/car_SL.png"
            leftSideDoorId.source = "qrc:/images10_25/adas2d/door_l_SL.png"
            rightSideDoorId.source = "qrc:/images10_25/adas2d/door_r_SL.png"
            break
        case 9:
            if(DataSource.ekCarbodyColor === 2){
                imageId.source = "qrc:/images10_25/adas2d/car_ek_sport_green.png"
            }else{
                imageId.source = "qrc:/images10_25/adas2d/car_ek_sport_orange.png"
            }
            leftSideDoorId.source = "qrc:/images10_25/adas2d/door_l_ek.png"
            rightSideDoorId.source = "qrc:/images10_25/adas2d/door_r_ek.png"
            break
        case 10:
            imageId.source = "qrc:/images10_25/adas2d/car_ek_normal.png"
            leftSideDoorId.source = "qrc:/images10_25/adas2d/door_l_ek.png"
            rightSideDoorId.source = "qrc:/images10_25/adas2d/door_r_ek.png"
            break
        case DataSource.CARNAME_EK23_10_25:
            imageId.source = "qrc:/images10_25/adas2d/car_ek_normal_23.png"
            leftSideDoorId.source = "qrc:/images10_25/adas2d/door_l_ek.png"
            rightSideDoorId.source = "qrc:/images10_25/adas2d/door_r_ek.png"
            break
        case DataSource.CARNAME_SC3E_8_8: //车型id:0xA0
            imageId.source = "qrc:/images10_25/adas2d/car_sc3e.png"
            leftSideDoorId.source = "qrc:/images10_25/adas2d/door_l_sc3e.png"
            rightSideDoorId.source = "qrc:/images10_25/adas2d/door_r_sc3e.png"
            break
        case DataSource.CARNAME_HA3_8_8:
            imageId.source = "qrc:/images10_25/adas2d/car_HA3.png"
            leftSideDoorId.source = "qrc:/images10_25/adas2d/door_l_HA3.png"
            rightSideDoorId.source = "qrc:/images10_25/adas2d/door_r_HA3.png"
            break
        case DataSource.CARNAME_HKHA_8_8:
            imageId.source = "qrc:/images10_25/adas2d/car_HKH.png"
            leftSideDoorId.source = "qrc:/images10_25/adas2d/door_l_HKH.png"
            rightSideDoorId.source = "qrc:/images10_25/adas2d/door_r_HKH.png"
            break
        case DataSource.CARNAME_SA5H_10_25:
            imageId.source = "qrc:/images10_25/adas2d/car_SA5H.png"
            leftSideDoorId.source = "qrc:/images10_25/adas2d/door_l_SA5H.png"
            rightSideDoorId.source = "qrc:/images10_25/adas2d/door_r_SA5H.png"
            break
        case DataSource.CARNAME_SA6H_8_8:
            imageId.source = "qrc:/images10_25/adas2d/car_SA6H.png"
            leftSideDoorId.source = "qrc:/images10_25/adas2d/door_l_SA6H.png"
            rightSideDoorId.source = "qrc:/images10_25/adas2d/door_r_SA6H.png"
            break
        case DataSource.CARNAME_HXHK_8_8:
            imageId.source = "qrc:/images10_25/adas2d/car_HXHK.png"
            leftSideDoorId.source = "qrc:/images10_25/adas2d/door_l_HXHK.png"
            rightSideDoorId.source = "qrc:/images10_25/adas2d/door_r_HXHK.png"
            break
        default:
            imageId.source = "qrc:/images10_25/adas2d/car_SK2.png"
            leftSideDoorId.source = "qrc:/images10_25/adas2d/door_l_SK2.png"
            rightSideDoorId.source = "qrc:/images10_25/adas2d/door_r_SK2.png"
            break
        }
    }


    function updateSteerImage(){
        switch(DataSource.carNameType){
        case 6:
            steerWarningImage.source = DataSource.accRemoteText === 0x2?"qrc:/images10_25/adas3d/steering_wheel_SL":"qrc:/images10_25/adas3d/steering_wheel2_SL"
            break
        case 7:
            steerWarningImage.source = DataSource.accRemoteText === 0x2?"qrc:/images10_25/adas3d/steering_wheel_SK2.png":"qrc:/images10_25/adas3d/steering_wheel2_SK2.png"
            break
        case 9:
        case 10:
            steerWarningImage.source = DataSource.accRemoteText === 0x2?"qrc:/images10_25/adas3d/steering_wheel_EK.png":"qrc:/images10_25/adas3d/steering_wheel2_EK.png"
            break
        case DataSource.CARNAME_EK23_10_25:
            steerWarningImage.source = DataSource.accRemoteText === 0x2?"qrc:/images10_25/adas3d/steering_wheel_EK_23.png":"qrc:/images10_25/adas3d/steering_wheel2_EK_23"
            break
        case DataSource.CARNAME_HA3_8_8:
            steerWarningImage.source = DataSource.accRemoteText === 0x2?"qrc:/images10_25/adas3d/steering_wheel_car_HA3.png":"qrc:/images10_25/adas3d/steering_wheel2_car_HA3"
            break
        case DataSource.CARNAME_HKHA_8_8:
            steerWarningImage.source = DataSource.accRemoteText === 0x2?"qrc:/images10_25/adas3d/steering_wheel_car_HKH.png":"qrc:/images10_25/adas3d/steering_wheel2_car_HKH"
            break
        case DataSource.CARNAME_SA5H_10_25:
            steerWarningImage.source = DataSource.accRemoteText === 0x2?"qrc:/images10_25/adas3d/steering_wheel_car_SA5H.png":"qrc:/images10_25/adas3d/steering_wheel2_car_SA5H"
            break
        case DataSource.CARNAME_SA6H_8_8:
            steerWarningImage.source = DataSource.accRemoteText === 0x2?"qrc:/images10_25/adas3d/steering_wheel_car_SA6H.png":"qrc:/images10_25/adas3d/steering_wheel2_car_SA6H.png"
            break
        case DataSource.CARNAME_HXHK_8_8:
            steerWarningImage.source = DataSource.accRemoteText === 0x2?"qrc:/images10_25/adas3d/steering_wheel_car_HXHK.png":"qrc:/images10_25/adas3d/steering_wheel2_car_HXHK.png"
            break
        default:
            steerWarningImage.source = DataSource.accRemoteText === 0x2?"qrc:/images10_25/adas3d/steering_wheel_SK2.png":"qrc:/images10_25/adas3d/steering_wheel2_SK2.png"
            break
        }
    }
function updateSelfCarSource() {
    var basePath = (rootItemId.cheXing >= 1 && rootItemId.cheXing <= 18) 
               ? "qrc:/images10_25/adas3d/" + rootItemId.cheXing + "car_combinations/" 
               : "";
    var imageSource = basePath + "combo_000_none.png";
    var s = DataSource.smallOrSwitchLight;  
    var h = DataSource.highBeamLight;       
    var l = DataSource.leftTurnLight;     
    var r = DataSource.rightTurnLight;    
    var f = DataSource.rearFogLight;      
    var b = rootItemId.brakeDepth;         
    var g = DataSource.gearMode;          
    var conditionMap = [
        { condition: s===2 && h===2 && l===2 && r===2 && f===2 && b===0 && g===2, image: "combo_001_倒车.png" },
        { condition: s===2 && h===2 && l===2 && r===2 && f===2 && b>0 && g!==2, image: "combo_002_刹车.png" },
        { condition: s===2 && h===2 && l===2 && r===1 && f===2 && b===0 && g!==2, image: "combo_003_右.png" },
        { condition: s===2 && h===2 && l===1 && r===2 && f===2 && b===0 && g!==2, image: "combo_004_左.png" },
        { condition: s===2 && h===2 && l===2 && r===2 && f===2 && b>0 && g===2, image: "combo_005_倒车_刹车.png" },
        { condition: s===2 && h===2 && l===2 && r===1 && f===2 && b===0 && g===2, image: "combo_006_倒车_右.png" },
        { condition: s===2 && h===2 && l===1 && r===2 && f===2 && b===0 && g===2, image: "combo_007_倒车_左.png" },
        { condition: s===2 && h===2 && l===2 && r===1 && f===2 && b>0 && g!==2, image: "combo_008_刹车_右.png" },
        { condition: s===2 && h===2 && l===1 && r===2 && f===2 && b>0 && g!==2, image: "combo_009_刹车_左.png" },
        { condition: s===2 && h===2 && l===1 && r===1 && f===2 && b===0 && g!==2, image: "combo_010_左_右.png" },
        { condition: s===1 && h===2 && l===2 && r===2 && f===2 && b===0 && g!==2, image: "combo_011_近光_尾灯.png" },
        { condition: s===1 && h===1 && l===2 && r===2 && f===2 && b===0 && g!==2, image: "combo_012_远光_尾灯.png" },
        { condition: s===2 && h===2 && l===2 && r===1 && f===2 && b>0 && g===2, image: "combo_013_倒车_刹车_右.png" },
        { condition: s===2 && h===2 && l===1 && r===2 && f===2 && b>0 && g===2, image: "combo_014_倒车_刹车_左.png" },
        { condition: s===2 && h===2 && l===1 && r===1 && f===2 && b===0 && g===2, image: "combo_015_倒车_左_右.png" },
        { condition: s===1 && h===2 && l===2 && r===2 && f===2 && b===0 && g===2, image: "combo_016_倒车_近光_尾灯.png" },
        { condition: s===1 && h===1 && l===2 && r===2 && f===2 && b===0 && g===2, image: "combo_017_倒车_远光_尾灯.png" },
        { condition: s===2 && h===2 && l===1 && r===1 && f===2 && b>0 && g!==2, image: "combo_018_刹车_左_右.png" },
        { condition: s===1 && h===2 && l===2 && r===2 && f===2 && b>0 && g!==2, image: "combo_019_刹车_近光_尾灯.png" },
        { condition: s===1 && h===1 && l===2 && r===2 && f===2 && b>0 && g!==2, image: "combo_020_刹车_远光_尾灯.png" },
        { condition: s===1 && h===2 && l===2 && r===1 && f===2 && b===0 && g!==2, image: "combo_021_右_近光_尾灯.png" },
        { condition: s===1 && h===1 && l===2 && r===1 && f===2 && b===0 && g!==2, image: "combo_022_右_远光_尾灯.png" },
        { condition: s===1 && h===2 && l===1 && r===2 && f===2 && b===0 && g!==2, image: "combo_023_左_近光_尾灯.png" },
        { condition: s===1 && h===1 && l===1 && r===2 && f===2 && b===0 && g!==2, image: "combo_024_左_远光_尾灯.png" },
        { condition: s===1 && h===2 && l===2 && r===2 && f===1 && b===0 && g!==2, image: "combo_025_雾灯_近光_尾灯.png" },
        { condition: s===1 && h===1 && l===2 && r===2 && f===1 && b===0 && g!==2, image: "combo_026_雾灯_远光_尾灯.png" },
        { condition: s===2 && h===2 && l===1 && r===1 && f===2 && b>0 && g===2, image: "combo_027_倒车_刹车_左_右.png" },
        { condition: s===1 && h===2 && l===2 && r===2 && f===2 && b>0 && g===2, image: "combo_028_倒车_刹车_近光_尾灯.png" },
        { condition: s===1 && h===1 && l===2 && r===2 && f===2 && b>0 && g===2, image: "combo_029_倒车_刹车_远光_尾灯.png" },
        { condition: s===1 && h===2 && l===2 && r===1 && f===2 && b===0 && g===2, image: "combo_030_倒车_右_近光_尾灯.png" },
        { condition: s===1 && h===1 && l===2 && r===1 && f===2 && b===0 && g===2, image: "combo_031_倒车_右_远光_尾灯.png" },
        { condition: s===1 && h===2 && l===1 && r===2 && f===2 && b===0 && g===2, image: "combo_032_倒车_左_近光_尾灯.png" },
        { condition: s===1 && h===1 && l===1 && r===2 && f===2 && b===0 && g===2, image: "combo_033_倒车_左_远光_尾灯.png" },
        { condition: s===1 && h===2 && l===2 && r===2 && f===1 && b===0 && g===2, image: "combo_034_倒车_雾灯_近光_尾灯.png" },
        { condition: s===1 && h===1 && l===2 && r===2 && f===1 && b===0 && g===2, image: "combo_035_倒车_雾灯_远光_尾灯.png" },
        { condition: s===1 && h===2 && l===2 && r===1 && f===2 && b>0 && g!==2, image: "combo_036_刹车_右_近光_尾灯.png" },
        { condition: s===1 && h===1 && l===2 && r===1 && f===2 && b>0 && g!==2, image: "combo_037_刹车_右_远光_尾灯.png" },
        { condition: s===1 && h===2 && l===1 && r===2 && f===2 && b>0 && g!==2, image: "combo_038_刹车_左_近光_尾灯.png" },
        { condition: s===1 && h===1 && l===1 && r===2 && f===2 && b>0 && g!==2, image: "combo_039_刹车_左_远光_尾灯.png" },
        { condition: s===1 && h===2 && l===1 && r===1 && f===2 && b===0 && g!==2, image: "combo_040_左_右_近光_尾灯.png" },
        { condition: s===1 && h===1 && l===1 && r===1 && f===2 && b===0 && g!==2, image: "combo_041_左_右_远光_尾灯.png" },
        { condition: s===1 && h===2 && l===2 && r===2 && f===1 && b>0 && g!==2, image: "combo_042_雾灯_刹车_近光_尾灯.png" },
        { condition: s===1 && h===1 && l===2 && r===2 && f===1 && b>0 && g!==2, image: "combo_043_雾灯_刹车_远光_尾灯.png" },
        { condition: s===1 && h===2 && l===2 && r===1 && f===1 && b===0 && g!==2, image: "combo_044_雾灯_右_近光_尾灯.png" },
        { condition: s===1 && h===1 && l===2 && r===1 && f===1 && b===0 && g!==2, image: "combo_045_雾灯_右_远光_尾灯.png" },
        { condition: s===1 && h===2 && l===1 && r===2 && f===1 && b===0 && g!==2, image: "combo_046_雾灯_左_近光_尾灯.png" },
        { condition: s===1 && h===1 && l===1 && r===2 && f===1 && b===0 && g!==2, image: "combo_047_雾灯_左_远光_尾灯.png" },
        { condition: s===1 && h===2 && l===2 && r===1 && f===2 && b>0 && g===2, image: "combo_048_倒车_刹车_右_近光_尾灯.png" },
        { condition: s===1 && h===1 && l===2 && r===1 && f===2 && b>0 && g===2, image: "combo_049_倒车_刹车_右_远光_尾灯.png" },
        { condition: s===1 && h===2 && l===1 && r===2 && f===2 && b>0 && g===2, image: "combo_050_倒车_刹车_左_近光_尾灯.png" },
        { condition: s===1 && h===1 && l===1 && r===2 && f===2 && b>0 && g===2, image: "combo_051_倒车_刹车_左_远光_尾灯.png" },
        { condition: s===1 && h===2 && l===1 && r===1 && f===2 && b===0 && g===2, image: "combo_052_倒车_左_右_近光_尾灯.png" },
        { condition: s===1 && h===1 && l===1 && r===1 && f===2 && b===0 && g===2, image: "combo_053_倒车_左_右_远光_尾灯.png" },
        { condition: s===1 && h===2 && l===2 && r===2 && f===1 && b>0 && g===2, image: "combo_054_倒车_雾灯_刹车_近光_尾灯.png" },
        { condition: s===1 && h===1 && l===2 && r===2 && f===1 && b>0 && g===2, image: "combo_055_倒车_雾灯_刹车_远光_尾灯.png" },
        { condition: s===1 && h===2 && l===2 && r===1 && f===1 && b===0 && g===2, image: "combo_056_倒车_雾灯_右_近光_尾灯.png" },
        { condition: s===1 && h===1 && l===2 && r===1 && f===1 && b===0 && g===2, image: "combo_057_倒车_雾灯_右_远光_尾灯.png" },
        { condition: s===1 && h===2 && l===1 && r===2 && f===1 && b===0 && g===2, image: "combo_058_倒车_雾灯_左_近光_尾灯.png" },
        { condition: s===1 && h===1 && l===1 && r===2 && f===1 && b===0 && g===2, image: "combo_059_倒车_雾灯_左_远光_尾灯.png" },
        { condition: s===1 && h===2 && l===1 && r===1 && f===2 && b>0 && g!==2, image: "combo_060_刹车_左_右_近光_尾灯.png" },
        { condition: s===1 && h===1 && l===1 && r===1 && f===2 && b>0 && g!==2, image: "combo_061_刹车_左_右_远光_尾灯.png" },
        { condition: s===1 && h===2 && l===2 && r===1 && f===1 && b>0 && g!==2, image: "combo_062_雾灯_刹车_右_近光_尾灯.png" },
        { condition: s===1 && h===1 && l===2 && r===1 && f===1 && b>0 && g!==2, image: "combo_063_雾灯_刹车_右_远光_尾灯.png" },
        { condition: s===1 && h===2 && l===1 && r===2 && f===1 && b>0 && g!==2, image: "combo_064_雾灯_刹车_左_近光_尾灯.png" },
        { condition: s===1 && h===1 && l===1 && r===2 && f===1 && b>0 && g!==2, image: "combo_065_雾灯_刹车_左_远光_尾灯.png" },
        { condition: s===1 && h===2 && l===1 && r===1 && f===1 && b===0 && g!==2, image: "combo_066_雾灯_左_右_近光_尾灯.png" },
        { condition: s===1 && h===1 && l===1 && r===1 && f===1 && b===0 && g!==2, image: "combo_067_雾灯_左_右_远光_尾灯.png" },
        { condition: s===1 && h===2 && l===1 && r===1 && f===2 && b>0 && g===2, image: "combo_068_倒车_刹车_左_右_近光_尾灯.png" },
        { condition: s===1 && h===1 && l===1 && r===1 && f===2 && b>0 && g===2, image: "combo_069_倒车_刹车_左_右_远光_尾灯.png" },
        { condition: s===1 && h===2 && l===2 && r===1 && f===1 && b>0 && g===2, image: "combo_070_倒车_雾灯_刹车_右_近光_尾灯.png" },
        { condition: s===1 && h===1 && l===2 && r===1 && f===1 && b>0 && g===2, image: "combo_071_倒车_雾灯_刹车_右_远光_尾灯.png" },
        { condition: s===1 && h===2 && l===1 && r===2 && f===1 && b>0 && g===2, image: "combo_072_倒车_雾灯_刹车_左_近光_尾灯.png" },
        { condition: s===1 && h===1 && l===1 && r===2 && f===1 && b>0 && g===2, image: "combo_073_倒车_雾灯_刹车_左_远光_尾灯.png" },
        { condition: s===1 && h===2 && l===1 && r===1 && f===1 && b===0 && g===2, image: "combo_074_倒车_雾灯_左_右_近光_尾灯.png" },
        { condition: s===1 && h===1 && l===1 && r===1 && f===1 && b===0 && g===2, image: "combo_075_倒车_雾灯_左_右_远光_尾灯.png" },
        { condition: s===1 && h===2 && l===1 && r===1 && f===1 && b>0 && g!==2, image: "combo_076_雾灯_刹车_左_右_近光_尾灯.png" },
        { condition: s===1 && h===1 && l===1 && r===1 && f===1 && b>0 && g!==2, image: "combo_077_雾灯_刹车_左_右_远光_尾灯.png" },
        { condition: s===1 && h===2 && l===1 && r===1 && f===1 && b>0 && g===2, image: "combo_078_倒车_雾灯_刹车_左_右_近光_尾灯.png" },
        { condition: s===1 && h===1 && l===1 && r===1 && f===1 && b>0 && g===2, image: "combo_079_倒车_雾灯_刹车_左_右_远光_尾灯.png" }
    ];
    for (var i = 0; i < conditionMap.length; i++) {
        if (conditionMap[i].condition) {
            imageSource = basePath + conditionMap[i].image;
            break;
        }
    }
    self_car.source = imageSource;
}
Connections {
    target: rootItemId
    function onBrakeDepthChanged() {
        updateSelfCarSource()
    }
	function onCheXingChanged() {
        updateSelfCarSource()
    }
}
Connections {
    target:DataSource
    function onGearModeChanged() {
        updateSelfCarSource()
    }

    function onSmallOrSwitchLightChanged() {
        updateSelfCarSource()
    }

    function onHighBeamLightChanged() {
        updateSelfCarSource()
    }

    function onLeftTurnLightChanged() {
        updateSelfCarSource()
    }

    function onRightTurnLightChanged() {
        updateSelfCarSource()
    }

    function onRearFogLightChanged() {
        updateSelfCarSource()
    }
        function onAccRemoteTextChanged()
        {
            if(preAccMote !== DataSource.accRemoteText){
                preAccMote = DataSource.accRemoteText
            }
            updateImageIcon()
            updateTrackAlertIcon()
            updateSteerImage()
        }

        function onCarTimeDisLevelChanged(){
            updateTrackAlertIcon()
        }

        function onLeftLineColorChanged(){
            updateLaneImage()
            updateSelfCarPosition()
        }

        function onRightLineColorChanged(){
            updateLaneImage()
            updateSelfCarPosition()
        }
        function onLeftLineTypeChanged(){
            updateLaneImage()
        }
        function onRightLineTypeChanged(){
            updateLaneImage()
        }

        function onPerformanceModeChanged(){
            performanceModeTest()
        }
//        function onCarToLeftLaneDistanceChanged(){
//            updateSelfCarPosition()
//        }
        function onCarNameTypeChanged(){
            updateOpenDoorImage()
            updateSteerImage()
        }

        function onDayNightModeChanged(){
            updateLaneImage()
        }

        function onEkCarbodyColorChanged(){
            updateOpenDoorImage()
        }
    }

    function updateSelfCarPosition(){
        // 默认居中显示，左侧LDW报警往左偏，右侧LDW报警往右偏，两侧都报警居中
        if(DataSource.leftLineColor === 3 && DataSource.rightLineColor !== 3){
            self_car.x = 760-30
        }else if(DataSource.leftLineColor !== 3 && DataSource.rightLineColor === 3){
            self_car.x = 760+30
        }else{
            self_car.x = 760
        }
    }	
    function updateImageIcon(){
        if(DataSource.accRemoteText === 0x9){
            adasCommonInfoItemId.visible = false
            openDoorWarningContainer.visible = true
        }else{
            adasCommonInfoItemId.visible = true
            openDoorWarningContainer.visible = false
        }
    }

    function updateTrackAlertIcon(){
        switch(DataSource.accRemoteText){
        case 4:
        case 5:
        case 6:
            frontCarDistance1.source = "qrc:/images10_25/adas2d/alert_1_master.png"
            frontCarDistance2.source = "qrc:/images10_25/adas2d/alert_2_master.png"
            frontCarDistance3.source = "qrc:/images10_25/adas2d/alert_3_master.png"
            break
        case 1:
            frontCarDistance1.source = "qrc:/images10_25/adas2d/alert_1.png"
            frontCarDistance2.source = "qrc:/images10_25/adas2d/alert_2.png"
            frontCarDistance3.source = "qrc:/images10_25/adas2d/alert_3.png"
            break
        default:
            frontCarDistance1.source = "qrc:/images10_25/adas2d/front_distance_car_1.png"
            frontCarDistance2.source = "qrc:/images10_25/adas2d/front_distance_car_2.png"
            frontCarDistance3.source = "qrc:/images10_25/adas2d/front_distance_car_3.png"
            break
        }
    }


    function updateLaneImageAnim(value){
        var temp = value < 10 ? "IMG_00"+value:"IMG_0"+value
        if(DataSource.leftLineType === 1){
            switch(DataSource.leftLineColor){
            case 1:
                leftLineImg.source = "qrc:/images10_25/adas2d/grey_dot/left/"+temp+".png"
                break
            case 2:
                leftLineImg.source = "qrc:/images10_25/adas2d/green_dot/left/"+temp+".png"
                break
            case 3:
                leftLineImg.source = "qrc:/images10_25/adas2d/red_dot/left/"+temp+".png"
                break
            default:
                leftLineImg.source = "qrc:/images10_25/adas2d/grey_dot/left/"+temp+".png"
                break
            }
        }
        if(DataSource.rightLineType === 1){
            switch(DataSource.rightLineColor){
            case 1:
                rightLineImg.source = "qrc:/images10_25/adas2d/grey_dot/right/"+temp+".png"
                break
            case 2:
                rightLineImg.source = "qrc:/images10_25/adas2d/green_dot/right/"+temp+".png"
                break
            case 3:
                rightLineImg.source = "qrc:/images10_25/adas2d/red_dot/right/"+temp+".png"
                break
            default:
                rightLineImg.source = "qrc:/images10_25/adas2d/grey_dot/right/"+temp+".png"
                break
            }
        }
    }

	function updateLaneImage(){
        if(DataSource.leftLineType === 0x0 && rootItemId.xuXian === 0){
            //实线
            if(DataSource.leftLineColor === 1){
                leftLineImg.source="qrc:/images10_25/adas2d/grey-l.png"
            }else if(DataSource.leftLineColor === 2){
                leftLineImg.source="qrc:/images10_25/adas2d/blue-l.png"
            }else if(DataSource.leftLineColor === 3){
                leftLineImg.source="qrc:/images10_25/adas2d/red-l.png"
            }else{
                leftLineImg.source="qrc:/images10_25/adas2d/grey-l.png"
            }
        }else{
            //虚线
            if(DataSource.leftLineColor === 1){
                leftLineImg.source = "qrc:/images10_25/adas2d/grey_dot/left/IMG_" + currentIndex.toString().padStart(3, '0') + ".png"
            }else if(DataSource.leftLineColor === 2){
                leftLineImg.source = "qrc:/images10_25/adas2d/blue_dot/left/IMG_" + currentIndex.toString().padStart(3, '0') + ".png"
            }else if(DataSource.leftLineColor === 3){
                leftLineImg.source = "qrc:/images10_25/adas2d/red_dot/left/IMG_" + currentIndex.toString().padStart(3, '0') + ".png"
            }else{
                 leftLineImg.source = "qrc:/images10_25/adas2d/grey_dot/left/IMG_" + currentIndex.toString().padStart(3, '0') + ".png"
            }
        }
        if(DataSource.rightLineType === 0x0 && rootItemId.xuXian === 0){
            //实线
            if(DataSource.rightLineColor === 1){
                rightLineImg.source = "qrc:/images10_25/adas2d/grey-r.png"
            }else if(DataSource.rightLineColor === 2){
                rightLineImg.source = "qrc:/images10_25/adas2d/blue-r.png"
            }else if(DataSource.rightLineColor === 3){
                rightLineImg.source = "qrc:/images10_25/adas2d/red-r.png"
            }else{
                rightLineImg.source = "qrc:/images10_25/adas2d/grey-r.png"
            }
        }else{
            //虚线
            if(DataSource.rightLineColor === 1){
                rightLineImg.source = "qrc:/images10_25/adas2d/grey_dot/right/IMG_" + currentIndex.toString().padStart(3, '0') + ".png"
            }else if(DataSource.rightLineColor === 2){
                rightLineImg.source = "qrc:/images10_25/adas2d/blue_dot/right/IMG_" + currentIndex.toString().padStart(3, '0') + ".png"
            }else if(DataSource.rightLineColor === 3){
                rightLineImg.source = "qrc:/images10_25/adas2d/red_dot/right/IMG_" + currentIndex.toString().padStart(3, '0') + ".png"
            }else{
                rightLineImg.source = "qrc:/images10_25/adas2d/grey_dot/right/IMG_" + currentIndex.toString().padStart(3, '0') + ".png"
            }
        }
    }

Timer {
    id: imageTimer
    interval: 1000 / DataSource.speed  
    running: (DataSource.leftLineColor === 1 || DataSource.rightLineColor === 1 || rootItemId.xuXian === 1) && DataSource.speed > 0
    repeat: true
    onTriggered: {
        currentIndex = (currentIndex + 1) % 15;
        updateLaneImage();
    }
}
    function hidePics(){
        for(var i=0; i < radarPicListModel.count; ++i){
            radarPicListModel.setProperty(i, "picVisible", false)
        }
    }

    function showPic(index){
        radarPicListModel.setProperty(index, "picVisible", true)
    }

    property int picIndex: 0
    Timer{
        id: radarTimer
        repeat: true
        running: false
        interval: 100
        onTriggered: {
            if(picIndex > radarPicListModel.count - 1){
                picIndex = 0
            }

            hidePics()
            showPic(picIndex++)
        }
    }
}
