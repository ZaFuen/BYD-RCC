import QtQuick 2.15
import com.byd.CenterChild 1.0
import com.byd.DataSource 1.0
import QtGraphicalEffects 1.0

CenterChild{
    id:adas3dContainerRootId
    //anchors.fill:parent
    width: 600
    height: 352
    visible: false
    property double roadWidthPer: 96/4.0//(96 = 左右车道px值 默认车道宽度4米)
	property real shuHan: rootItemId.xuXian === 1 ? rootItemId.turnLight : DataSource.laneRadius
    property real zhangGe: rootItemId.wuNai
    property double maxTargetXBike: 125   //目标最大横坐标(行人\自行车)
    property double maxTargetXCar:103
    property double minTargetXBike: -125   //目标最大横坐标（小车、货车）
    property double minTargetXCar:-103

//    property double maxTargetZTruck: 1820//1618   //货车最大Z值（最前方坐标）
//    property double maxTargetZHuman: 1820//1618   //行人/自行车最大Z值
//    property double maxTargetZCar: 1687//1492     //小车最大Z值（最前方坐标）
    property double maxTargetZ: 2200
    property double zeroTargetZ:75
    property double fixedTargetZ:280
    property double curveOffset: 0.030705 / 0.004


    //全屏导航界面显示
    property bool navigationFlag: (DataSource.dilinkName===0x02&&DataSource.naviType===0x04)?true:false

    Component.onCompleted: {
        updateContainer()
        laneCheckTimerId.start()
    }

    function updateAdas3d(){
        adas3dId.laneChangeVisible = false
        updateLeftLineType()
        updateRightLineType()
        updateLeftLineColor()
        updateRightLineColor()
        updateSelfCarToLeftLinePosition()
        updateLaneCurve()
        //左前方目标
        updateLeftFrontTargetType()
        updateLeftFrontTargetPosX()
        updateLeftFrontTargetPosY()
        //左后方目标
        updateLeftRearTargetType()
        updateLeftRearTargetPosX()
        updateLeftRearTargetPosY()
        //右前方目标
        updateRightFrontTargetType()
        updateRightFrontTargetPosX()
        updateRightFrontTargetPosY()
        //右后方目标
        updateRightRearTargetType()
        updateRightRearTargetPosX()
        updateRightRearTargetPosY()
        //正前方目标一
        updateFrontTargetOneType()
        updateFrontTargetOnePosX()
        updateFrontTargetOnePosY()
        //正前方目标二
        updateFrontTargetTwoType()
        updateFrontTargetTwoPosX()
        updateFrontTargetTwoPosY()
        //雷达
        updateLeftFrontRadarStatus()
        updateLeftRearRadarStatus()
        updateRightFrontRadarStatus()
        updateRightRearRadarStatus()
        updateRearRadarStatus()
        //文字提示相关UI
        updateCarDistanceLevel()
        updateAccRemoteImage()
        updateSpeedUpText()

        updateContainer()
        updateSelfCarSource()
        updateDayNightModeSource()
        updateOpenDoorImage()
        updateSteerwheelImage()
    }
    onVisibleChanged: {
        if(adas3dContainerRootId.visible === true){
            connectionsId.enabled = true
            updateAdas3d()
        }else{
            if(DataSource.adasShowMode === 1){
                return
            }
            connectionsId.enabled = false
            adas3dId.adasModel_00_source = ""
            adas3dId.adasModel_01_source = ""
            adas3dId.adasModel_02_source = ""
            adas3dId.adasModel_03_source = ""
            adas3dId.adasModel_04_source = ""
            adas3dId.adasModel_05_source = ""
        }
    }

//    Image {
//        id: bgId
//        visible: (DataSource.naviType === 0x4 && DataSource.adasInterfaceDisplay === 1) ? true:false
//        y:225
//        x:-14
//        source: DataSource.dayNightMode === 0x02?"qrc:/images10_25/warningInfo/night_bg.png":"qrc:/images10_25/warningInfo/day_bg.png"
//    }

    Rectangle{
        width: 535
        height: 325
        radius: 20
        color: "transparent"
        y:234
        Adas3d{
            id: adas3dId
            visible: true
            x: -215
            y: -41
            Component.onCompleted: {
                updateAdas3d()
            }
            onLaneChangeAnimationFinish: {
                DataSource.sendPluginMsgId(DataSource.RECV_MSG_ID_LANE_CHANGE_ANIMATION_FINISHED)
            }
        }
    }
    //车门预警
    Item {
        id: openDoorWarningContainer
        visible:DataSource.accRemoteText === 0x9 ? true :false
        x:DataSource.adasInterfaceDisplay === 2 && DataSource.naviType !== 0x4 ? -27 : navigationFlag ? -32 : -33
        y:DataSource.adasInterfaceDisplay === 2 && DataSource.naviType !== 0x4 ? rootItemId.duoJiao+55+40 : navigationFlag ? rootItemId.duoJiao+43+60 : rootItemId.duoJiao+43+60
        //车身
        Image {
            id: imageId
            x: 839-660
            y: 158
            source: "qrc:/images10_25/adas2d/car_SL.png"
            cache: false
        }
        Image {
            id: leftSideDoorId
            x: 894-660
            y: 297
            visible: DataSource.adasCarDoorOpenSide !== 1 ? true:false
            source: "qrc:/images10_25/adas2d/door_l_SL.png"
        }
        Image {
            id: rightSideDoorId
            x: 997-660
            y: 297
            visible: DataSource.adasCarDoorOpenSide !== 0 ? true:false
            source: "qrc:/images10_25/adas2d/door_r_SL.png"
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
        case DataSource.CARNAME_SC2E_8_8: //车型id:0x5B
            imageId.source = "qrc:/images10_25/adas2d/car_sc2e.png"
            leftSideDoorId.source = "qrc:/images10_25/adas2d/door_l_sc2e.png"
            rightSideDoorId.source = "qrc:/images10_25/adas2d/door_r_sc2e.png"
            break
        case DataSource.CARNAME_HA3_8_8: //车型id:0xCC
            imageId.source = "qrc:/images10_25/adas2d/car_HA3.png"
            leftSideDoorId.source = "qrc:/images10_25/adas2d/door_l_HA3.png"
            rightSideDoorId.source = "qrc:/images10_25/adas2d/door_r_HA3.png"
            break
        case DataSource.CARNAME_HKHA_8_8: //车型id:0xBC
            imageId.source = "qrc:/images10_25/adas2d/car_HKH.png"
            leftSideDoorId.source = "qrc:/images10_25/adas2d/door_l_HKH.png"
            rightSideDoorId.source = "qrc:/images10_25/adas2d/door_r_HKH.png"
            break
        case DataSource.CARNAME_SA5H_10_25: //车型id:0xA1
            imageId.source = "qrc:/images10_25/adas2d/car_SA5H.png"
            leftSideDoorId.source = "qrc:/images10_25/adas2d/door_l_SA5H.png"
            rightSideDoorId.source = "qrc:/images10_25/adas2d/door_r_SA5H.png"
            break
        case DataSource.CARNAME_SA6H_8_8: //车型id:0xEA
            imageId.source = "qrc:/images10_25/adas2d/car_SA6H.png"
            leftSideDoorId.source = "qrc:/images10_25/adas2d/door_l_SA6H.png"
            rightSideDoorId.source = "qrc:/images10_25/adas2d/door_r_SA6H.png"
            break
        case DataSource.CARNAME_HXHK_8_8: //车型id:0xE9
            imageId.source = "qrc:/images10_25/adas2d/car_HXHK.png"
            leftSideDoorId.source = "qrc:/images10_25/adas2d/door_l_HXHK.png"
            rightSideDoorId.source = "qrc:/images10_25/adas2d/door_r_HXHK.png"
            break
        case DataSource.CARNAME_SL2H_8_8: //车型id:0xE2
            imageId.source = "qrc:/images10_25/adas2d/car_SL2H.png"
            leftSideDoorId.source = "qrc:/images10_25/adas2d/door_l_SL2H.png"
            rightSideDoorId.source = "qrc:/images10_25/adas2d/door_r_SL2H.png"
            break
        case DataSource.CARNAME_EWE_8_8: //车型id:0xBF
            imageId.source = "qrc:/images10_25/adas2d/car_EWE.png"
            leftSideDoorId.source = "qrc:/images10_25/adas2d/door_l_EWE.png"
            rightSideDoorId.source = "qrc:/images10_25/adas2d/door_r_EWE.png"
            break
        default:
            imageId.source = "qrc:/images10_25/adas2d/car_SK2.png"
            leftSideDoorId.source = "qrc:/images10_25/adas2d/door_l_SK2.png"
            rightSideDoorId.source = "qrc:/images10_25/adas2d/door_r_SK2.png"
            break
        }
    }

    /*
        更新左侧车道线颜色
    */
function updateLeftLineColor(){
    if(DataSource.leftLineColor === 0x02){
        adas3dId.leftLaneColor = DataSource.dayNightMode === 0x02 ? rootItemId.accyanse4 : rootItemId.accyanse3;
        adas3dId.leftLeftLaneColor = DataSource.dayNightMode === 0x02 ? rootItemId.accyanse4 : rootItemId.accyanse3;
    }else if(DataSource.leftLineColor === 0x03){
        adas3dId.leftLaneColor = "#be2525";  
        adas3dId.leftLeftLaneColor = "#be2525";
    }else{
        adas3dId.leftLaneColor = DataSource.dayNightMode === 0x02 ? rootItemId.accyanse2 : rootItemId.accyanse1;
        adas3dId.leftLeftLaneColor = DataSource.dayNightMode === 0x02 ? rootItemId.accyanse2 : rootItemId.accyanse1;
    }
}
    /*
        更新右侧车道线颜色
    */
function updateRightLineColor(){
    if(DataSource.rightLineColor === 0x02){
        adas3dId.rightLaneColor = DataSource.dayNightMode === 0x02 ? rootItemId.accyanse4 : rootItemId.accyanse3;
        adas3dId.rightRightLaneColor = DataSource.dayNightMode === 0x02 ? rootItemId.accyanse4 : rootItemId.accyanse3;
    }else if(DataSource.rightLineColor === 0x03){
        adas3dId.rightLaneColor = "#be2525";
        adas3dId.rightRightLaneColor = "#be2525";
    }else{
        adas3dId.rightLaneColor = DataSource.dayNightMode === 0x02 ? rootItemId.accyanse2 : rootItemId.accyanse1;
        adas3dId.rightRightLaneColor = DataSource.dayNightMode === 0x02 ? rootItemId.accyanse2 : rootItemId.accyanse1;
    }
}
    /*
        更新左侧车道线类型
    */
    function updateLeftLineType(){
        adas3dId.leftLaneSolid = DataSource.leftLineType === 0x0 ? true :false
        adas3dId.leftLeftLaneSolid = DataSource.leftLineType === 0x0 ? true :false
    }
    /*
        更新右侧车道线类型
    */
    function updateRightLineType(){
        adas3dId.rightLaneSolid = DataSource.rightLineType === 0x0 ? true :false
        adas3dId.rightRightLaneSolid =DataSource.rightLineType === 0x0 ? true :false
    }

    /*
        更新自车距离左侧车道线位置
    */
function updateSelfCarToLeftLinePosition() {
    // 自动变道动画开始后不更新车道线值
    if (DataSource.laneChangeAnimationDirection !== 0) {
        return;
    }

    if (DataSource.gearMode === 1 || DataSource.gearMode === 0) {
        adas3dId.middleLaneLeftX = -53;
        adas3dId.middleLaneRightX = 48;
        return;
    }
    var temp = -DataSource.carToLeftLaneDistance * 0.96;
    adas3dId.middleLaneLeftX = temp - 5;
    adas3dId.middleLaneRightX = temp + 96;
}

    /*
        更新车道线曲率
    */
    function updateLaneCurve(){
        var temp =shuHan * curveOffset
        if(temp >  0.030705){
            adas3dId.laneCurvature = 0.030705
        }else if(temp < -0.030705){
            adas3dId.laneCurvature = -0.030705
        }else{
            adas3dId.laneCurvature = temp
        }
    }

    /*
        更新右前目标类型
    */
    function updateRightFrontTargetType(){
        if(DataSource.adasShowMode === 1){
            return
        }
        adas3dId.adasModel_01_source = getTargetSource(DataSource.rightFrontTargetState)
    }

    /*
        更新右前目标X
    */
    function updateRightFrontTargetPosX(){
        fixTargetPoint(DataSource.rightFrontTargetPosY,DataSource.rightFrontTargetPosX,DataSource.rightFrontTargetState,1)
    }

    /*
        更新右前目标Y
    */
    function updateRightFrontTargetPosY(){
        var isCarRear = checkTargetPostionIsRear(DataSource.rightFrontTargetPosX,DataSource.rightFrontTargetState)
        adas3dId.adasModel_01_visible = (isCarRear && DataSource.rightFrontTargetPosY <= 0) ? false : true
        fixTargetPoint(DataSource.rightFrontTargetPosY,DataSource.rightFrontTargetPosX,DataSource.rightFrontTargetState,1)
    }
    /*
        更新右后目标类型
    */
    function updateRightRearTargetType(){
        if(DataSource.rightRearRadarStatus === 0){
            return
        }
        adas3dId.adasModel_03_source = getTargetSource2(zhangGe)
    }

    /*
        更新右后目标一X
    */
    function updateRightRearTargetPosX(){
        fixTargetPoint(-2,-5,zhangGe,3)
    }

    function updateRightRearTargetPosY(){
        adas3dId.adasModel_03_visible = DataSource.rightRearRadarStatus === 0 ? false : true
        fixTargetPoint(-2,-5,zhangGe,3)
    }

    /*
        更新左前目标类型
    */
    function updateLeftFrontTargetType(){
        if(DataSource.adasShowMode === 1){
            return
        }
        adas3dId.adasModel_00_source = getTargetSource(DataSource.leftFrontTargetState)
    }

    /*
        更新左前目标X
    */
    function updateLeftFrontTargetPosX(){
        fixTargetPoint(DataSource.leftFrontTargetPosY,DataSource.leftFrontTargetPosX,DataSource.leftFrontTargetState,0)
    }

    /*
        更新左前目标Y
    */
    function updateLeftFrontTargetPosY(){
        var isCarRear = checkTargetPostionIsRear(DataSource.leftFrontTargetPosX,DataSource.leftFrontTargetState)
        adas3dId.adasModel_00_visible = (isCarRear && DataSource.leftFrontTargetPosY <= 0) ? false : true
        fixTargetPoint(DataSource.leftFrontTargetPosY,DataSource.leftFrontTargetPosX,DataSource.leftFrontTargetState,0)
    }

    /*
        更新左后目标类型
    */
    function updateLeftRearTargetType(){
        if(DataSource.leftRearRadarStatus === 0){
            return
        }
        adas3dId.adasModel_02_source = getTargetSource2(zhangGe)
    }
    /*
        更新左后目标X
    */
    function updateLeftRearTargetPosX(){
        fixTargetPoint(-2,5,zhangGe,2)
    }

    /*
        更新左后目标Y
    */
    function updateLeftRearTargetPosY(){
        adas3dId.adasModel_02_visible = DataSource.leftRearRadarStatus === 0 ? false : true
        fixTargetPoint(-2,5,zhangGe,2)
    }

    /*
        更新正前方目标一类型
    */
    function updateFrontTargetOneType(){
        if(DataSource.adasShowMode === 1){
            return
        }
        adas3dId.adasModel_04_source = DataSource.frontTargetOnePosY >= 6 ? getTargetSource1(DataSource.frontTargetOneState) : DataSource.frontTargetOnePosY >= 3 ? getTargetSource2(DataSource.frontTargetOneState) : getTargetSource3(DataSource.frontTargetOneState)
    }

    /*
        更新正前目标一X
    */
    function updateFrontTargetOnePosX(){
        fixTargetPoint(DataSource.frontTargetOnePosY,DataSource.frontTargetOnePosX,DataSource.frontTargetOneState,4)
    }
    /*
        更新正前目标一Y
    */
function updateFrontTargetOnePosY() {
    var isCarRear = checkTargetPostionIsRear(DataSource.frontTargetOnePosX, DataSource.frontTargetOneState);
    var posY = DataSource.frontTargetOnePosY;
    
    // 如果 DataSource.frontTargetOnePosY 小于等于 10，则按 10 计算
    if (posY <= 10) {
        posY = 10;
    }
    
    adas3dId.adasModel_04_visible = (isCarRear && DataSource.frontTargetOnePosY <= 0) ? false : true;
    fixTargetPoint(posY, DataSource.frontTargetOnePosX, DataSource.frontTargetOneState, 4);
}
    /*
        更新正前方目标二类型
    */
    function updateFrontTargetTwoType(){
        if(DataSource.adasShowMode === 1){
            return
        }
        adas3dId.adasModel_05_source = getTargetSource(DataSource.frontTargetTwoState)
    }
    /*
        更新正前目标二X
    */
    function updateFrontTargetTwoPosX(){
        fixTargetPoint(DataSource.frontTargetTwoPosY,DataSource.frontTargetTwoPosX,DataSource.frontTargetTwoState,5)
    }

    /*
        更新正前目标二Y
    */
    function updateFrontTargetTwoPosY(){
        var isCarRear = checkTargetPostionIsRear(DataSource.frontTargetTwoPosX,DataSource.frontTargetTwoState)
        adas3dId.adasModel_05_visible = (isCarRear && DataSource.frontTargetTwoPosY <= 0) ? false : true
        fixTargetPoint(DataSource.frontTargetTwoPosY,DataSource.frontTargetTwoPosX,DataSource.frontTargetTwoState,5)
    }

    /*
        更新车间距离
    */
    function updateCarDistanceLevel(){
        adas3dId.distanceVisible = false
        /*
        //变道动画执行时，不显示车间距离
        if(DataSource.laneChangeAnimationDirection !== 0)
        {
            return
        }
        if(DataSource.carTimeDisLevel === 0 || DataSource.mainTargetIndex === 0)
        {
            adas3dId.distanceVisible = false
            return
        }
        var source = ""
        var tempEnd = 0.0
        var mainTargetType = 0

        switch(DataSource.mainTargetIndex)
        {
        case 1:
            tempEnd = adas3dId.adasModel_00_pos_z   //左前
            source = adas3dId.adasModel_00_source
            break
        case 2:
            tempEnd = adas3dId.adasModel_01_pos_z   //右前
            source = adas3dId.adasModel_01_source
            break
        case 3:
            tempEnd = adas3dId.adasModel_02_pos_z   //左后
            source = adas3dId.adasModel_02_source
            break
        case 4:
            tempEnd = adas3dId.adasModel_03_pos_z   //右后
            source = adas3dId.adasModel_03_source
            break
        case 5:
            tempEnd = adas3dId.adasModel_04_pos_z   //正前方一
            source = adas3dId.adasModel_04_source
            break
        case 6 :
            tempEnd = adas3dId.adasModel_05_pos_z   //正前方二
            source = adas3dId.adasModel_05_source
            break
        case 0:
        default:
            break
        }
        var maxTargetZ = maxTargetXCar
        if(source==="qrc:/qml10_25/adas3d/components/PedestrianDetail.qml")
        {
            tempEnd = tempEnd - 20
            maxTargetZ = maxTargetZHuman
        }
        else if(source==="qrc:/qml10_25/adas3d/components/BikeDetail.qml")
        {
            tempEnd = tempEnd - 20
            maxTargetZ = maxTargetZHuman
        }else if(source === "qrc:/qml10_25/adas3d/components/CarDetail.qml"){
            maxTargetZ = maxTargetZCar
        }else if(source === "qrc:/qml10_25/adas3d/components/TruckDetail.qml"){
            tempEnd = tempEnd - 30
            maxTargetZ = maxTargetZTruck
        }
        var temp = (tempEnd / maxTargetZ)
        adas3dId.distanceEnd = temp > 0.95 ? 0.95 : temp
        switch(DataSource.carTimeDisLevel){
        case 1:
            adas3dId.distanceColor = "#f62728"
            adas3dId.distanceVisible = true
            break
        case 2:
            adas3dId.distanceColor = "#e08102"
            adas3dId.distanceVisible = true
            break
        case 3:
            adas3dId.distanceColor = "#17975f"
            adas3dId.distanceVisible = true
            break
        default:
            adas3dId.distanceVisible = false
            break
        }
        */
    }

    function updateLeftFrontRadarStatus(){
        adas3dId.adasRadar_fl_enable = DataSource.leftFrontRadarStatus === 0 ? false : true
    }

    function updateRightFrontRadarStatus(){
        adas3dId.adasRadar_fr_enable = DataSource.rightFrontRadarStatus === 0 ? false : true
    }

    function updateLeftRearRadarStatus(){
        adas3dId.adasRadar_bl_enable = DataSource.leftRearRadarStatus === 0 ? false : true
    }

    function updateRightRearRadarStatus(){
        adas3dId.adasRadar_br_enable = DataSource.rightRearRadarStatus === 0 ? false : true
    }

    function updateRearRadarStatus(){
        adas3dId.adasRadar_bm_enable = DataSource.rearRadarStatus === 0 ? false : true
    }

    function updateAccRemoteImage(){
        if(DataSource.accRemoteText === 0x2
                ||DataSource.accRemoteText === 0x3
                ||DataSource.accRemoteText === 0x7
                ||DataSource.accRemoteText === 0x8
                ||DataSource.accRemoteText === 0x24
                ||DataSource.accRemoteText === 0x27){
            adas3dId.adasSelfCarSteerWheelEnable = true
            adas3dId.adasSelfCarSteerWheelType = DataSource.accRemoteText === 0x2 ? 1 : 0
            adas3dId.adasSelfCarOp = 0.3
        }else{
            adas3dId.adasSelfCarOp = 1
            adas3dId.adasSelfCarSteerWheelEnable = false
        }
        var needCollision = false
        if(DataSource.accRemoteText ===1 || DataSource.accRemoteText ===4 || DataSource.accRemoteText ===5 || DataSource.accRemoteText === 6){
            needCollision = true
        }
        updateMainTargetCollision(needCollision)
        updateSteerwheelImage()
    }

    //更新碰撞效果
    function updateMainTargetCollision(needCollision){
        adas3dId.adasModel_00_collision_visible = DataSource.mainTargetIndex === 1 && needCollision? true :false
        adas3dId.adasModel_00_color = DataSource.mainTargetIndex === 1  && needCollision?
                    Qt.rgba(210.0/255.0,91.0/255.0,91.0/255.0,0.8):(DataSource.dayNightMode === 0x1 ?"white":"#d1d1d1")
        adas3dId.adasModel_00_collision_type = (DataSource.mainTargetIndex === 1 && DataSource.accRemoteText === 1 && needCollision) ? true :false
        adas3dId.adasModel_01_collision_visible = DataSource.mainTargetIndex === 2  && needCollision ? true :false
        adas3dId.adasModel_01_color = DataSource.mainTargetIndex === 2  && needCollision ?
                    Qt.rgba(210.0/255.0,91.0/255.0,91.0/255.0,0.8):(DataSource.dayNightMode === 0x1 ?"white":"#d1d1d1")
        adas3dId.adasModel_01_collision_type = (DataSource.mainTargetIndex === 2 && DataSource.accRemoteText === 1  && needCollision) ? true :false
        adas3dId.adasModel_02_collision_visible = DataSource.mainTargetIndex === 3 && needCollision? true :false
        adas3dId.adasModel_02_color = DataSource.mainTargetIndex === 3  && needCollision ?
                    Qt.rgba(210.0/255.0,91.0/255.0,91.0/255.0,0.8):(DataSource.dayNightMode === 0x1 ?"white":"#d1d1d1")
        adas3dId.adasModel_02_collision_type = (DataSource.mainTargetIndex === 3 && DataSource.accRemoteText === 1  && needCollision) ? true :false
        adas3dId.adasModel_03_collision_visible = DataSource.mainTargetIndex === 4  && needCollision ? true :false
        adas3dId.adasModel_03_color = DataSource.mainTargetIndex === 4  && needCollision ?
                    Qt.rgba(210.0/255.0,91.0/255.0,91.0/255.0,0.8):(DataSource.dayNightMode === 0x1 ?"white":"#d1d1d1")
        adas3dId.adasModel_03_collision_type = (DataSource.mainTargetIndex === 4 && DataSource.accRemoteText === 1  && needCollision) ? true :false
        adas3dId.adasModel_04_collision_visible = DataSource.mainTargetIndex === 5  && needCollision? true :false
        adas3dId.adasModel_04_color = DataSource.mainTargetIndex === 5  && needCollision ?
                    Qt.rgba(210.0/255.0,91.0/255.0,91.0/255.0,0.8):(DataSource.dayNightMode === 0x1 ?"white":"#d1d1d1")
        adas3dId.adasModel_04_collision_type = (DataSource.mainTargetIndex === 5 && DataSource.accRemoteText === 1  && needCollision) ? true :false
        adas3dId.adasModel_05_collision_visible = DataSource.mainTargetIndex === 6  && needCollision? true :false
        adas3dId.adasModel_05_color = DataSource.mainTargetIndex === 6  && needCollision ?
                    Qt.rgba(210.0/255.0,91.0/255.0,91.0/255.0,0.8):(DataSource.dayNightMode === 0x1 ?"white":"#d1d1d1")
        adas3dId.adasModel_05_collision_type = (DataSource.mainTargetIndex === 6 && DataSource.accRemoteText === 1  && needCollision) ? true :false
    }

    function updateContainer(){
        if(DataSource.accRemoteText === 0x9){
            adas3dId.visible = false
            openDoorWarningContainer.visible = true
        }else{
            adas3dId.visible = true
            openDoorWarningContainer.visible = false
        }
    }

    function updateSpeedUpText(){
        //超越加速中
        if(DataSource.accRemoteText === 0xC){
            adas3dId.adasSelfCarBlowVentEnable = true
        }else{
            adas3dId.adasSelfCarBlowVentEnable = false
        }
    }

    function updateDayNightModeSource(){
        adas3dId.adasModel_RoadBgSource = DataSource.dayNightMode === 0x1 ?
                    "qrc:/images10_25/adas3d/maps/road_surface_light.png":"qrc:/images10_25/adas3d/maps/road_surface_dark.png"
        adas3dId.adasModel_roadBgVisible = DataSource.adasInterfaceDisplay === 0x1 && DataSource.naviType !== 4? true : false
    }
Connections {
    target: rootItemId
function onAccyanse1Changed() {
updateLeftLineColor()
updateRightLineColor()
}
function onAccyanse2Changed() {
updateLeftLineColor()
updateRightLineColor()
}
function onAccyanse3Changed() {
updateLeftLineColor()
updateRightLineColor()
}
function onAccyanse4Changed() {
updateLeftLineColor()
updateRightLineColor()
}	
    function onBrakeStateChanged() {
        updateSelfCarSource()
    }
	function onCheXingChanged() {
        updateSelfCarSource()
    }
}
    Connections {
        id:connectionsId
        target:DataSource
    function onGearModeChanged() {
        updateSelfCarSource()
    }

    function onSmallOrSwitchLightChanged() {
        updateSelfCarSource()
    }
    
    function onRearFogLightChanged() {
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

        function onRoadWidthChanged(){
            adas3dContainerId.roadWidthPer = 96 / DataSource.roadWidth
        }

        function onAdasInterfaceDisplayChanged(){
            updateDayNightModeSource()
        }

        function onDayNightModeChanged(){
            updateDayNightModeSource()
            updateAccRemoteImage()
        }

        function onLeftFrontRadarStatusChanged(){
            updateLeftFrontRadarStatus()
        }

        function onRightFrontRadarStatusChanged(){
            updateRightFrontRadarStatus()
        }

        function onLeftRearRadarStatusChanged(){
            updateLeftRearRadarStatus()
        }

        function onRightRearRadarStatusChanged(){
            updateRightRearRadarStatus()
        }

        function onRearRadarStatusChanged(){
            updateRearRadarStatus()
        }

        function onAccRemoteTextChanged(){
            updateAccRemoteImage()
            updateSpeedUpText()
            updateContainer()
        }

        function onAdasShowModeChanged(){
            if(DataSource.adasShowMode === 1){
                adas3dId.adasModel_00_source = "qrc:/qml10_25/adas3d/components/TruckDetail.qml"
                adas3dId.adasModel_01_source = "qrc:/qml10_25/adas3d/components/CarDetail.qml"
                adas3dId.adasModel_02_source = "qrc:/qml10_25/adas3d/components/TruckDetail.qml"
                adas3dId.adasModel_03_source = "qrc:/qml10_25/adas3d/components/CarDetail.qml"
                adas3dId.adasModel_04_source = "qrc:/qml10_25/adas3d/components/BikeDetail.qml"
                adas3dId.adasModel_05_source = "qrc:/qml10_25/adas3d/components/PedestrianDetail.qml"
                adas3dId.laneAnimation.running = true
                adas3dId.timelineAnimation.running = true
            }else{
                adas3dId.laneAnimation.running = false
                adas3dId.timelineAnimation.running = false
                updateFrontTargetTwoType()
                updateFrontTargetOneType()
                updateRightFrontTargetType()
                updateLeftFrontTargetType()
                updateRightRearTargetType()
                updateLeftRearTargetType()
            }
        }

        function onLaneChangeAnimationDirectionChanged()
        {
            if(DataSource.laneChangeAnimationDirection === 1){
                adas3dId.rightLaneChangeAnimation.stop()
                resetLinePosition()
                adas3dId.leftLaneChangeAnimation.start()
            }else if(DataSource.laneChangeAnimationDirection === 2){
                adas3dId.leftLaneChangeAnimation.stop()
                resetLinePosition()
                adas3dId.rightLaneChangeAnimation.start()
            }else{
                adas3dId.leftLaneChangeAnimation.stop()
                adas3dId.rightLaneChangeAnimation.stop()
                resetLinePosition()
            }
        }

        function onAdasDebugModeChanged()
        {
            if(DataSource.adasDebugMode === 1){
                adas3dId.adasDebugMode = true
            }else{
                adas3dId.adasDebugMode = false
            }
        }

        function onCarNameTypeChanged(){
            updateSelfCarSource()
            updateOpenDoorImage()
            updateSteerwheelImage()
        }

        function onEkCarbodyColorChanged(){
            updateSelfCarSource()
            updateOpenDoorImage()
        }
    }

    /**
    重置车道线位置
    背景：动画超时未结束，触发保护机制，需要强制将最左，最右车道线隐藏并归位，左右两侧车道线应回到显示状态，避免车道线不显示
    */
    function resetLinePosition()
    {
        adas3dId.leftLeftLaneOpacity = 0      //最左侧车道不可见
        adas3dId.rightRightLaneOpacity = 0 //最右侧车道不可见
        adas3dId.leftLeftLanePositionX = -139
        adas3dId.rightRightLanePositionX = 139

        //车道线透明度不能设置为1，否则会有锯齿
        adas3dId.leftLaneOpacity = 0.99     //左侧车道线可见
        adas3dId.rightLaneOpacity = 0.99    //右侧车道线可见
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
    var b = rootItemId.brakeState;         
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
    adas3dId.selfCarSource = imageSource;
}

    function updateSteerwheelImage(){
        switch(DataSource.carNameType){
        case 6:
            adas3dId.steerwheelSource = adas3dId.adasSelfCarSteerWheelType===0?"qrc:/images10_25/adas3d/steering_wheel2_SL":"qrc:/images10_25/adas3d/steering_wheel_SL"
            break
        case 7:
            adas3dId.steerwheelSource = adas3dId.adasSelfCarSteerWheelType===0?"qrc:/images10_25/adas3d/steering_wheel2_SK2.png":"qrc:/images10_25/adas3d/steering_wheel_SK2.png"
            break
        case 9:
        case 10:
            adas3dId.steerwheelSource = adas3dId.adasSelfCarSteerWheelType===0?"qrc:/images10_25/adas3d/steering_wheel2_EK.png":"qrc:/images10_25/adas3d/steering_wheel_EK.png"
            break
        case DataSource.CARNAME_EK23_10_25:
            adas3dId.steerwheelSource = adas3dId.adasSelfCarSteerWheelType===0?"qrc:/images10_25/adas3d/steering_wheel2_EK_23.png":"qrc:/images10_25/adas3d/steering_wheel_EK_23"
            break
        case DataSource.CARNAME_SC3E_8_8:  //车型ID:0xA0
            adas3dId.steerwheelSource = adas3dId.adasSelfCarSteerWheelType===0 ? "qrc:/images10_25/adas3d/steering_wheel2_car_sc3e.png"
                                                                               : "qrc:/images10_25/adas3d/steering_wheel_car_sc3e.png"
            break
        case DataSource.CARNAME_SC2E_8_8:  //车型ID:0x5B
            adas3dId.steerwheelSource = adas3dId.adasSelfCarSteerWheelType===0 ? "qrc:/images10_25/adas3d/steering_wheel2_car_sc2e.png"
                                                                               : "qrc:/images10_25/adas3d/steering_wheel_car_sc2e.png"
            break
        case DataSource.CARNAME_HA3_8_8:  //车型ID:0xCC
            adas3dId.steerwheelSource = adas3dId.adasSelfCarSteerWheelType===0 ? "qrc:/images10_25/adas3d/steering_wheel2_car_HA3.png"
                                                                               : "qrc:/images10_25/adas3d/steering_wheel_car_HA3.png"
            break
        case DataSource.CARNAME_HKHA_8_8:  //车型ID:0xBC
            adas3dId.steerwheelSource = adas3dId.adasSelfCarSteerWheelType===0 ? "qrc:/images10_25/adas3d/steering_wheel2_car_HKH.png"
                                                                               : "qrc:/images10_25/adas3d/steering_wheel_car_HKH.png"
            break
        case DataSource.CARNAME_SA5H_10_25:  //车型ID:0xA1
            adas3dId.steerwheelSource = adas3dId.adasSelfCarSteerWheelType===0 ? "qrc:/images10_25/adas3d/steering_wheel2_car_SA5H.png"
                                                                               : "qrc:/images10_25/adas3d/steering_wheel_car_SA5H.png"
            break
        case DataSource.CARNAME_SA6H_8_8:  //车型ID:0xEA
            adas3dId.steerwheelSource = adas3dId.adasSelfCarSteerWheelType===0 ? "qrc:/images10_25/adas3d/steering_wheel2_car_SA6H.png"
                                                                               : "qrc:/images10_25/adas3d/steering_wheel_car_SA6H.png"
            break
        case DataSource.CARNAME_HXHK_8_8:  //车型ID:0xE9
            adas3dId.steerwheelSource = adas3dId.adasSelfCarSteerWheelType===0 ? "qrc:/images10_25/adas3d/steering_wheel2_car_HXHK.png"
                                                                               : "qrc:/images10_25/adas3d/steering_wheel_car_HXHK.png"
            break
        case DataSource.CARNAME_SL2H_8_8:  //车型ID:0xE2
            adas3dId.steerwheelSource = adas3dId.adasSelfCarSteerWheelType===0 ? "qrc:/images10_25/adas3d/steering_wheel2_car_SL2H.png"
                                                                               : "qrc:/images10_25/adas3d/steering_wheel_car_SL2H.png"
            break
        case DataSource.CARNAME_EWE_8_8:  //车型ID:0xBF
            adas3dId.steerwheelSource = adas3dId.adasSelfCarSteerWheelType===0 ? "qrc:/images10_25/adas3d/steering_wheel2_car_EWE.png"
                                                                               : "qrc:/images10_25/adas3d/steering_wheel_car_EWE.png"
            break
        default:
            adas3dId.steerwheelSource = adas3dId.adasSelfCarSteerWheelType===0?"qrc:/images10_25/adas3d/steering_wheel2_SK2.png":"qrc:/images10_25/adas3d/steering_wheel_SK2.png"
            break
        }
    }


    //检查是否会与自车碰撞
    function checkTargetPostionIsRear(val,type)
    {
        if(type === 1 ){
            //小车
            if(Math.abs(val) < 1.89){
                return true
            }else{
                return false
            }
        }else if(type === 2)
        {
            //货车
            if(Math.abs(val) < 2.0){
                return true
            }else{
                return false
            }
        }else if(type ===3 || type ===4)
        {
            //行人/自行车
            if(Math.abs(val) < 1.29){
                return true
            }else{
                return false
            }
        }else{
            //目标无效
            return true
        }
    }

    /*
    *曲率修正
    *tempX：（数据项PositionY）
    *tempY：（数据项PositionX）
    *targetType:目标类型
    *targetId：目标ID
    */
    function fixTargetPoint(curX,curY,targetType,targetId)
    {
        var L2
        var L1
        var delatX

        var dx = curX
        var dy = curY

        var newX
        var newY

        //原始曲率
        var R0
        //映射后的圆半径 380来源：UI曲率半径与实际不一致，530是根据UI猜测出来的，需要实车验证该值是否满足实际显示
        var R1

        //实际曲率绝对值
        var curvatureAbs = Math.abs(shuHan)


        //前方目标才计算偏移值
        if(curX > 0 && curvatureAbs !== 0)
        {
            R0= 1/curvatureAbs
            if(curvatureAbs > 0.004)
            {
                R1 = 380
            }
            else
            {
                R1=380 * (0.004 / curvatureAbs)
            }

            if(curY < 0)
            {
                L2 = Math.sqrt(R0 * R0 - dx * dx)
                L1 = Math.sqrt(dx * dx + (L2 + R1 - R0) * (L2 + R1 - R0))
                delatX = R1 - L1
                newY = dy + delatX * ((L2 + R1 - R0) / L1)
                newX = dx + delatX * (dx / L1)
            } else if (curY === 0) {
                newX = curX
                newY = curY
            }
            else {
                L2 = Math.sqrt(R0 * R0 - dx * dx)
                L1 = Math.sqrt(dx * dx + (L2 + R1 - R0) * (L2 + R1 - R0))
                delatX = R1 - L1
                newY = dy - delatX * ((L2 + R1 - R0) / L1)
                newX = dx + delatX * (dx / L1)
            }
        }
        else
        {
            newX = curX
            newY = curY
        }
        //console.log("转换后:"+newX+"    "+newY)
        //根据报文米数，等比换成像素比例
        var uiPxX = -newY * roadWidthPer
        var uiPxY = setTargetY(newX,targetType)

        //限制左右显示范围
        if(targetType === 1 || targetType ===2){
            uiPxX = uiPxX > maxTargetXCar ? maxTargetXCar : (uiPxX < minTargetXCar ? minTargetXCar : uiPxX)
        }else{
            uiPxX =  uiPxX > maxTargetXBike ? maxTargetXBike : (uiPxX < minTargetXBike ? minTargetXBike : uiPxX)
        }
        switch(targetId)
        {
        case 0:
            adas3dId.adasModel_00_pos_x = uiPxX
            adas3dId.adasModel_00_pos_z = uiPxY
            break
        case 1:
            adas3dId.adasModel_01_pos_x = uiPxX
            adas3dId.adasModel_01_pos_z = uiPxY
            break
        case 2:
            adas3dId.adasModel_02_pos_x = uiPxX
            adas3dId.adasModel_02_pos_z = uiPxY
            break
        case 3:
            adas3dId.adasModel_03_pos_x = uiPxX
            adas3dId.adasModel_03_pos_z = uiPxY
            break
        case 4:
            adas3dId.adasModel_04_pos_x = uiPxX
            adas3dId.adasModel_04_pos_z = uiPxY
            break
        case 5:
            adas3dId.adasModel_05_pos_x = uiPxX
            adas3dId.adasModel_05_pos_z = uiPxY
            break
        default:
            break
        }
    }

    function setTargetY(temp,type)
    {
        temp = temp > 0 ? temp +4 : temp
        var val = temp * maxTargetZ /100 +zeroTargetZ
        if(temp < 8.5 && temp >0){
            val = fixedTargetZ
        }
        if (val > maxTargetZ){
            val = maxTargetZ
        }
        return val
    }

    function getTargetSource(temp){
        var resource = ""
        switch(temp){
        case 1:
            resource = "qrc:/qml10_25/adas3d/components/CarDetail.qml"
            break
        case 2:
            resource= "qrc:/qml10_25/adas3d/components/TruckDetail.qml"
            break
        case 3:
            resource = "qrc:/qml10_25/adas3d/components/BikeDetail.qml"
            break
        case 4:
            resource = "qrc:/qml10_25/adas3d/components/PedestrianDetail.qml"
            break
        case 0:
        default:
            resource = ""
            break
        }
        return resource
    }
    function getTargetSource1(temp){
        var resource = ""
        switch(temp){
        case 1:
            resource = "qrc:/qml10_25/adas3d/components/CarDetail1.qml"
            break
        case 2:
            resource= "qrc:/qml10_25/adas3d/components/TruckDetail1.qml"
            break
        case 3:
            resource = "qrc:/qml10_25/adas3d/components/BikeDetail1.qml"
            break
        case 4:
            resource = "qrc:/qml10_25/adas3d/components/PedestrianDetail1.qml"
            break
        case 0:
        default:
            resource = ""
            break
        }
        return resource
    }
    function getTargetSource2(temp){
        var resource = ""
        switch(temp){
        case 1:
            resource = "qrc:/qml10_25/adas3d/components/CarDetail2.qml"
            break
        case 2:
            resource= "qrc:/qml10_25/adas3d/components/TruckDetail2.qml"
            break
        case 3:
            resource = "qrc:/qml10_25/adas3d/components/BikeDetail2.qml"
            break
        case 4:
            resource = "qrc:/qml10_25/adas3d/components/PedestrianDetail2.qml"
            break
        case 0:
        default:
            resource = ""
            break
        }
        return resource
    }
    function getTargetSource3(temp){
        var resource = ""
        switch(temp){
        case 1:
            resource = "qrc:/qml10_25/adas3d/components/CarDetail3.qml"
            break
        case 2:
            resource= "qrc:/qml10_25/adas3d/components/TruckDetail3.qml"
            break
        case 3:
            resource = "qrc:/qml10_25/adas3d/components/BikeDetail3.qml"
            break
        case 4:
            resource = "qrc:/qml10_25/adas3d/components/PedestrianDetail3.qml"
            break
        case 0:
        default:
            resource = ""
            break
        }
        return resource
    }	
    Timer{
        id:laneCheckTimerId
        interval: 100
        repeat: true
        onTriggered: {
            if(DataSource.adasShowMode !== 1){
                updateLeftLineColor()
                updateLeftLineType()
                updateRightLineColor()
                updateRightLineType()
                updateSelfCarToLeftLinePosition()
                updateLaneCurve()
                updateLeftFrontTargetPosX()
                updateLeftRearTargetPosX()
                updateRightFrontTargetPosX()
                updateRightRearTargetPosX()
                updateFrontTargetOnePosX()
                updateFrontTargetTwoPosX()
                updateFrontTargetTwoType()
                updateFrontTargetOneType()
                updateRightFrontTargetType()
                updateLeftFrontTargetType()
                updateRightRearTargetType()
                updateLeftRearTargetType()
                updateLeftFrontTargetPosY()
                updateLeftRearTargetPosY()
                updateRightFrontTargetPosY()
                updateRightRearTargetPosY()
                updateFrontTargetOnePosY()
                updateFrontTargetTwoPosY()
                updateCarDistanceLevel()
                updateAccRemoteImage()
            }
        }
    }
}
