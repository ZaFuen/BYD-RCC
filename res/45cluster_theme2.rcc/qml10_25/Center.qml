import QtQuick 2.15
import com.byd.CenterChild 1.0
import com.byd.DataSource 1.0
import com.byd.CenterContainer 1.0
import com.byd.WarningInfoContainer 1.0
import "qrc:/common/singleton"
import "./adas3d"
import "./menu"
import "./warningInfo"
import "./driveInfo"

CenterContainer{
    id:centerContainerId
    anchors.fill: parent


    property CenterChild commonWarningInfoUi:null
    property CenterChild speedWarningInfoUi:null
    property CenterChild cumErrorWarningInfoUi:null
    property CenterChild generPowerWarningInfoUi:null
    property CenterChild carBodyWarningInfoUi:null
    property CenterChild tireWarningInfoUi:null
    property CenterChild phoneWarningInfoUi:null
    //    property CenterChild dmsWarningInfoUi:null
    property CenterChild maintainWarningInfoUi:null
    property CenterChild carKeyWarningInfoUi:null
    property CenterChild modeSwitchWarningInfoUi:null
    property CenterChild driveInfoUi:null
    property CenterChild chargeUi:null
    property CenterChild dischargeUi:null
    property CenterChild journeyUi: null
    property CenterChild accelerationTimerUi: null
    property CenterChild mapSendTipUi: null
    property CenterChild adasUi: null
    property CenterChild adas3r1vUi: null
    property CenterChild navigationUi: null
    property CenterChild energyFlowTestUi: null
    property CenterChild simpleNaviTipUi:null
    property CenterChild trackModeUi: null

    property int preAdasUiState: 0 //0x00-未加载，0x01-2D, 0x02-3D
    //property CenterChild adasCommonInfoUI: null
    property int driveInfoUiDestoryTimeStamp: 0
    property int mapTipCount: 0
    property bool isNaviMap: false
    property int preNaviState: 0
    property int preNaviType: 0
    property int simpleNaviTipCount:0
    property int preDriveInfoIndex:0
    property bool naviTipDispCtrl: true
    onIsNaviMapChanged: {
        updateMapTip()
    }
    Component.onCompleted: {
        driveInfoUIUpdate()
        updateAdas3dContainer()
        simpleNaviDisplay()
        updateAdas()
        updateAdas3R1V()
        updateAdas2dUiLayout()
        updateMapTip()
        updateSettingMenu()
        updateDmsWarninfo()
        updateCommonWarningInfo()
        updateSpeedWarningInfo()
        updateCumErrorWarningInfo()
        updateGenerPowerWarningInfo()
        updateCarBodyWarningInfo()
        updateTireWarningInfo()
        updatePhoneWarningInfo()
        updateMaintainWarningInfo()
        updateCarKeyWarningInfo()
        updateModeSwitchWarningInfo()
        updateChargeUi()
        updateDisChargeUi()
        updateJourneyInterface()
        updateSpeedUpTimerInterface()
        updateTrackModeUi()
    }

    function driveInfoUIUpdate(){
        var energyFlowRequestToShow = false
        var component = null
        if(DataSource.driveInfoNeedDisplay === DataSource.UI_DISPLAY && (DataSource.naviType !== DataSource.NAVI_TYPE_SMALL_SCREEN && DataSource.naviType !== DataSource.NAVI_TYPE_FULL_SCREEN)){
            if(DataSource.driveInfoIndex === DataSource.DRIVE_INFO_RECENT_50KM_AVERAGE_ENERGY_CONSUMP){
                if(DataSource.recent50EnergyInterface === DataSource.UI_DISPLAY && DataSource.vehicleType === DataSource.CAR_TYPE_HEV){
                    component = Qt.createComponent("qrc:/qml10_25/driveInfo/Recent50kmAverageEnergyConsumption.qml")
                }else if(DataSource.recent50PowerInterface === DataSource.UI_DISPLAY && DataSource.vehicleType === DataSource.CAR_TYPE_EV){
                    component = Qt.createComponent("qrc:/qml10_25/driveInfo/Recent50kmAveragePowerConsumption.qml")
                }
            }else if(DataSource.driveInfoIndex === DataSource.DRIVE_INFO_CUMULATIVE_AVERAGE_ENERGY_CONSUMP){
                if(DataSource.accAvgEnergyInterface === DataSource.UI_DISPLAY && DataSource.vehicleType === DataSource.CAR_TYPE_HEV){
                    component = Qt.createComponent("qrc:/qml10_25/driveInfo/CumulativeAvgEnergyConsumption.qml")
                }else if(DataSource.accAvgPowerInterface === DataSource.UI_DISPLAY && DataSource.vehicleType === DataSource.CAR_TYPE_EV){
                    component = Qt.createComponent("qrc:/qml10_25/driveInfo/CumulativeAvgPowerConsumption.qml")
                }
            }else if(DataSource.driveInfoIndex === DataSource.DRIVE_INFO_DIRECT_TIRE_PRESSURE && DataSource.tireInterface === DataSource.UI_DISPLAY){
                component = Qt.createComponent("qrc:/qml10_25/driveInfo/TireInfo.qml")
            }else if(DataSource.driveInfoIndex === DataSource.DRIVE_INFO_INSTANT_FUEL && DataSource.instantFuelConsumeInterface === DataSource.UI_DISPLAY && DataSource.vehicleType !== DataSource.CAR_TYPE_EV){
                component = Qt.createComponent("qrc:/qml10_25/driveInfo/InstantaneousFuelConsumption.qml")
            }else if(DataSource.driveInfoIndex === DataSource.DRIVE_INFO_CONTINUED_DRIVE_MILEAGE && DataSource.driveRangeInterface === DataSource.UI_DISPLAY){
                component = Qt.createComponent("qrc:/qml10_25/driveInfo/DriveRange.qml")
            }else if(DataSource.driveInfoIndex === DataSource.DRIVE_INFO_FUEL_CONSUMPTION && DataSource.fuelConsumeInterface === DataSource.UI_DISPLAY && DataSource.vehicleType !== DataSource.CAR_TYPE_EV){
                component = Qt.createComponent("qrc:/qml10_25/driveInfo/FuelConsumption.qml")
            }else if(DataSource.driveInfoIndex === DataSource.DRIVE_INFO_AVG_SPEED && DataSource.driveTimeSpeedInterface === DataSource.UI_DISPLAY){
                component = Qt.createComponent("qrc:/qml10_25/driveInfo/TravelInfo.qml")
            }else if(DataSource.driveInfoIndex === DataSource.DRIVE_INFO_CHARGE && DataSource.externalChargeInterface === DataSource.UI_DISPLAY){
                component = Qt.createComponent("qrc:/qml10_25/driveInfo/ExternalChargePower.qml")
            }else if(DataSource.driveInfoIndex === DataSource.DRIVE_INFO_ENERGYFLOW_DIAGRAM && DataSource.energyFlowInterface === DataSource.UI_DISPLAY){
                //component = Qt.createComponent("qrc:/qml10_25/driveInfo/EnergyFlow.qml")
                energyFlowRequestToShow = true
            }else if(DataSource.driveInfoIndex === DataSource.DRIVE_INFO_ECO_ASSIST  && DataSource.ecoAssistInterface  === DataSource.UI_DISPLAY){
                component = Qt.createComponent("qrc:/qml10_25/driveInfo/EcoAssist.qml")
            }
            if(centerContainerId.driveInfoUi){
                centerContainerId.driveInfoUi.destroy()
                centerContainerId.driveInfoUi = null
            }
            if(component !== null){
                if(DataSource.driveInfoIndex === DataSource.DRIVE_INFO_ENERGYFLOW_DIAGRAM){
                    //centerContainerId.driveInfoUi = component.createObject(centerContainerId, {"y":245})
                }else{
                    //更改y坐标同时更改能量流y坐标，避免跳动
                    centerContainerId.driveInfoUi = component.createObject(centerContainerId, {"y":229,
                                                                               "anchors.horizontalCenter": centerContainerId.horizontalCenter
                                                                           })
                }
                //当行车信息和菜单切换的时候，如果二者都是显示行车信息某个界面，则取消渐隐渐显动画以免切换画面闪烁
                if(settingMenuId.visible === true && DataSource.menuIndex === DataSource.MENU_INDEX_DRIVE_INFO
                        && DataSource.driveInfoIndex === DataSource.menuDriveInfoIndex){
                    centerContainerId.driveInfoUi.needAnimate = false
                }else{
                    centerContainerId.driveInfoUi.needAnimate = true
                }
                console.log("test "+centerContainerId.driveInfoUi.visible)
                centerContainerId.driveInfoUi.priority = CustomStyle.driveInfoPriority
                centerContainerId.driveInfoUi.requestToDisplayChanged.connect(centerContainerId.onChildrenChanged)
                centerContainerId.driveInfoUi.requestToDisplay = true
            }
        }else{
            if(centerContainerId.driveInfoUi){
                if(DataSource.naviType === DataSource.NAVI_TYPE_SMALL_SCREEN || DataSource.naviType === DataSource.NAVI_TYPE_FULL_SCREEN){
                    console.log("driveInfo in navi screen, DataSource.naviType = ", DataSource.naviType)
                    centerContainerId.driveInfoUi.destroy()
                    centerContainerId.driveInfoUi = null
                }else{
                    centerContainerId.driveInfoUiDestoryTimeStamp = new Date().getTime()
                    centerContainerId.driveInfoUi.requestToAnimateOpacity = CenterChild.OPACITY_TO_0
                    centerContainerId.driveInfoUi.destroy(CustomStyle.centerChildOpacityAnimateDuration)
                    centerContainerId.driveInfoUi = null
                }
            }
        }
        if(energyFlowRequestToShow){
            energyFlow.requestToDisplay = true
        }else{
            energyFlow.requestToDisplay = false
        }
    }

    function creatDriveInfoModel(){
        driveInfoModel.clear()

        var postion = 0;
        if (DataSource.ecoAssistInterface  === 1){
            driveInfoModel.insert(postion, {src:"qrc:/qml10_25/driveInfo/EcoAssist.qml",page:DataSource.DRIVE_INFO_ECO_ASSIST, info:13, fromY:337,toY:337})
            postion++;
        }
        if (DataSource.recent50EnergyInterface === 1 && DataSource.vehicleType === DataSource.CAR_TYPE_HEV){
            driveInfoModel.insert(postion, {src:"qrc:/qml10_25/driveInfo/Recent50kmAverageEnergyConsumption.qml",page:DataSource.DRIVE_INFO_RECENT_50KM_AVERAGE_ENERGY_CONSUMP, info:1, fromY:0,toY:0})
            postion++;
        }else if(DataSource.recent50PowerInterface === 1 && DataSource.vehicleType === DataSource.CAR_TYPE_EV){
            driveInfoModel.insert(postion, {src:"qrc:/qml10_25/driveInfo/Recent50kmAveragePowerConsumption.qml",page:DataSource.DRIVE_INFO_RECENT_50KM_AVERAGE_ENERGY_CONSUMP, info:1, fromY:0,toY:0})
            postion++;
        }

        if (DataSource.accAvgEnergyInterface === 1 && DataSource.vehicleType === DataSource.CAR_TYPE_HEV){
            driveInfoModel.insert(postion, {src:"qrc:/qml10_25/driveInfo/CumulativeAvgEnergyConsumption.qml",page:DataSource.DRIVE_INFO_CUMULATIVE_AVERAGE_ENERGY_CONSUMP,info:2, fromY:337,toY:337})
            postion++;
        }else if(DataSource.accAvgPowerInterface === 1 && DataSource.vehicleType === DataSource.CAR_TYPE_EV){
            driveInfoModel.insert(postion, {src:"qrc:/qml10_25/driveInfo/CumulativeAvgPowerConsumption.qml",page:DataSource.DRIVE_INFO_CUMULATIVE_AVERAGE_ENERGY_CONSUMP,info:2, fromY:337,toY:337})
            postion++;
        }
        if (DataSource.tireInterface === 1){
            driveInfoModel.insert(postion, {src:"qrc:/qml10_25/driveInfo/TireInfo.qml",page:DataSource.DRIVE_INFO_DIRECT_TIRE_PRESSURE, info:3, fromY:337,toY:337})
            postion++;
        }
        if (DataSource.instantFuelConsumeInterface === 1 && DataSource.vehicleType !== DataSource.CAR_TYPE_EV){
            driveInfoModel.insert(postion, {src:"qrc:/qml10_25/driveInfo/InstantaneousFuelConsumption.qml",page:DataSource.DRIVE_INFO_INSTANT_FUEL, info:6, fromY:337,toY:337})
            postion++;
        }
        if (DataSource.driveRangeInterface === 1){
            driveInfoModel.insert(postion, {src:"qrc:/qml10_25/driveInfo/DriveRange.qml",page:DataSource.DRIVE_INFO_CONTINUED_DRIVE_MILEAGE, info:7, fromY:337,toY:337})
            postion++;
        }
        if (DataSource.fuelConsumeInterface === 1 && DataSource.vehicleType !== DataSource.CAR_TYPE_EV){
            driveInfoModel.insert(postion, {src:"qrc:/qml10_25/driveInfo/FuelConsumption.qml",page:DataSource.DRIVE_INFO_FUEL_CONSUMPTION, info:8, fromY:337,toY:337})
            postion++;
        }
        if (DataSource.driveTimeSpeedInterface === 1){
            driveInfoModel.insert(postion, {src:"qrc:/qml10_25/driveInfo/TravelInfo.qml",page:DataSource.DRIVE_INFO_AVG_SPEED, info:10, fromY:337,toY:337})
            postion++;
        }
        if (DataSource.externalChargeInterface === 1){
            driveInfoModel.insert(postion, {src:"qrc:/qml10_25/driveInfo/ExternalChargePower.qml",page:DataSource.DRIVE_INFO_CHARGE, info:11, fromY:337,toY:337})
            postion++;
        }
        if (DataSource.energyFlowInterface === 1){
            driveInfoModel.insert(postion, {src:"qrc:/qml10_25/driveInfo/EnergyFlowChart.qml",page:DataSource.DRIVE_INFO_ENERGYFLOW_DIAGRAM, info:12, fromY:337,toY:337})
            postion++;
        }
        Global.driveInfoModel = driveInfoModel;
    }

    function simpleNaviDisplay(){
        if(DataSource.naviType === 2 && DataSource.powerGear === 3 && (DataSource.naviState === 0 || DataSource.naviState === 1))
        {
            if(centerContainerId.navigationUi === null){
                var component = Qt.createComponent("qrc:/qml10_25/alwaysDisplay/SimpleNavi.qml")
                centerContainerId.navigationUi = component.createObject(centerContainerId)
                centerContainerId.navigationUi.priority = CustomStyle.navigationPriority
                centerContainerId.navigationUi.needAnimate = true
                centerContainerId.navigationUi.requestToDisplayChanged.connect(centerContainerId.onChildrenChanged)
                centerContainerId.navigationUi.requestToDisplay = true
            }
        }
        else
        {
            if(centerContainerId.navigationUi != null){
                centerContainerId.navigationUi.destroy(CustomStyle.centerChildOpacityAnimateDuration)
                centerContainerId.navigationUi = null
            }
        }
    }



    function updateAdas(){
        if(DataSource.adasPlatform !== 0x1 && DataSource.adasInterfaceDisplay === 0x01 && DataSource.naviType !== 0x4 && adas === 99 && DataSource.powerGear === 3)
        {
            if(centerContainerId.adasUi == null){
                var component
                var x = (DataSource.naviType === 0x4  && DataSource.adasInterfaceDisplay === 1) ? 585 : 0
                var y = (DataSource.naviType === 0x4 && DataSource.adasInterfaceDisplay === 1) ? -5 : 3
                component = Qt.createComponent("qrc:/qml10_25/adas2d/Adas.qml")
                centerContainerId.adasUi = component.createObject(centerContainerId,{"width": 608,"height": 290,"needAnimate":true,"x":x,"y":y})
                centerContainerId.preAdasUiState = 0x01
                console.log(component.errorString())
                centerContainerId.adasUi.priority = CustomStyle.adasPriority
                centerContainerId.adasUi.requestToDisplayChanged.connect(centerContainerId.onChildrenChanged)
                centerContainerId.adasUi.requestToDisplay = true
            }
        }
        else
        {
            if(centerContainerId.adasUi != null){
                centerContainerId.adasUi.destroy()
                centerContainerId.adasUi = null
                centerContainerId.preAdasUiState = 0x00
            }
        }
    }

    function updateAdas2dUiLayout(){
        if(centerContainerId.adasUi !== null){
            centerContainerId.adasUi.x = (DataSource.naviType === 0x4  && DataSource.adasInterfaceDisplay === 1) ? 585 : 0
            centerContainerId.adasUi.y = (DataSource.naviType === 0x4  && DataSource.adasInterfaceDisplay === 1) ? -5 : 3
        }
        if(centerContainerId.adas3r1vUi !== null){
            centerContainerId.adas3r1vUi.x = 0
            centerContainerId.adas3r1vUi.y = 3
        }
    }


    function updateAdas3R1V(){
        if(DataSource.adasPlatform === 0x1 && DataSource.adasWindow === 0x1 && DataSource.naviType !== 0x4 && DataSource.powerGear === 3)
        {
            if(centerContainerId.adas3r1vUi == null){
                var component
                var x = 0
                var y = 3
                component = Qt.createComponent("qrc:/qml10_25/adas2d/Adas3R1V.qml")
                centerContainerId.adas3r1vUi = component.createObject(centerContainerId,{"width": 608,"height": 290,"needAnimate":true,"x":x,"y":y})
                centerContainerId.preAdasUiState = 0x01
                console.log(component.errorString())
                centerContainerId.adas3r1vUi.priority = CustomStyle.adasPriority
                centerContainerId.adas3r1vUi.requestToDisplayChanged.connect(centerContainerId.onChildrenChanged)
                centerContainerId.adas3r1vUi.requestToDisplay = true
            }
        }
        else
        {
            if(centerContainerId.adas3r1vUi != null){
                centerContainerId.adas3r1vUi.destroy()
                centerContainerId.adas3r1vUi = null
                centerContainerId.preAdasUiState = 0x00
            }
        }
    }

    function updateMapTip(){
        if(DataSource.mapSendStatus === 0x0 && isNaviMap){
            if(centerContainerId.mapSendTipUi === null){
                var component = Qt.createComponent("qrc:/qml10_25/alwaysDisplay/MapSendTip.qml")
                centerContainerId.mapSendTipUi = component.createObject(centerContainerId)
                centerContainerId.mapSendTipUi.priority = CustomStyle.mapSendPriority
                centerContainerId.mapSendTipUi.requestToDisplayChanged.connect(centerContainerId.onChildrenChanged)
                centerContainerId.mapSendTipUi.requestToDisplay = true
                mapTipCount = 0
                mapTipTimer.start()
                console.log("mapTipTimer start:" + new Date().getTime())
            }
        }else{
            if(centerContainerId.mapSendTipUi != null){
                centerContainerId.mapSendTipUi.requestToAnimateOpacity = CenterChild.OPACITY_TO_0
                centerContainerId.mapSendTipUi.destroy(CustomStyle.centerChildOpacityAnimateDuration)
                centerContainerId.mapSendTipUi = null
            }
            isNaviMap = false
        }
    }

    function updateSimpleNaviTip(){
        console.log("DataSource.mapSendStatus:"+DataSource.mapSendStatus+" DataSource.naviType:"+DataSource.naviType)
        console.log("DataSource.dilinkName:"+DataSource.dilinkName+" DataSource.naviState:"+DataSource.naviState)
        if(DataSource.mapSendStatus === 0x1 && DataSource.naviType === 2 &&(DataSource.naviState === 9 || DataSource.naviState === 12)){
            if(centerContainerId.simpleNaviTipUi === null){
                if(naviTipDispCtrl){
                    var component = Qt.createComponent("qrc:/qml10_25/alwaysDisplay/SimpleNaviTip.qml")
                    centerContainerId.simpleNaviTipUi = component.createObject(centerContainerId)
                    centerContainerId.simpleNaviTipUi.priority = CustomStyle.mapSendPriority
                    centerContainerId.simpleNaviTipUi.needAnimate = true
                    centerContainerId.simpleNaviTipUi.requestToDisplayChanged.connect(centerContainerId.onChildrenChanged)
                    centerContainerId.simpleNaviTipUi.requestToDisplay = true
                    simpleNaviTipCount = 0
                    simpleNaviTipTimer.start()
                    naviTipDispCtrl =false //除了导航状态变化，同一off-on周期只显示一次“请先进行导航”
                }
                else{
                    driveInfoUIUpdate()
                }
            }
        }
        else{
            if(centerContainerId.simpleNaviTipUi != null){
                centerContainerId.simpleNaviTipUi.requestToAnimateOpacity = CenterChild.OPACITY_TO_0
                centerContainerId.simpleNaviTipUi.destroy(CustomStyle.centerChildOpacityAnimateDuration)
                centerContainerId.simpleNaviTipUi = null
            }
            simpleNaviTipTimer.stop()
        }
    }
    function updateAdas3dContainer(){
        adas3dContainerId.requestToDisplay = (DataSource.adasTestMode === 0x01 || DataSource.adasInterfaceDisplay === 0x01 && DataSource.naviType !== 0x4
                                                                                           && adas === 99 && DataSource.powerGear === 3 && DataSource.adasPlatform !== 0x1)
        adas3dContainerId.width = DataSource.naviType === 4? 535 : 608
        adas3dContainerId.x = DataSource.naviType === 0x4 ? 1270 : 692
    }

    function updateSettingMenu(){
        settingMenuId.requestToDisplay =DataSource.menuNeedDisplay === DataSource.UI_DISPLAY
        //通过visibleChanged外发报文，执行全屏导航动画会触发visible，会再次外发菜单打开报文
        //改为判断26F值为2外发
        if(DataSource.menuNeedDisplay === DataSource.UI_DISPLAY){
            settingMenuId.keyCount = 0
            settingMenuId.keyTimer.restart()
            console.log("onVisibleChanged keyTimerId.start() Time === " + new Date().getTime())
            //实车左域会发送0x055报文，Qt菜单打开/关闭的时候，不再发送055,1.0-1.1报文通知IVI
            //DataSource.sendPluginMsgInt(DataSource.RECV_MSG_ID_MENU_STATE_TO_IVI, 2)
            DataSource.sendPluginMsgInt(DataSource.RECV_MSG_ID_MENU_DISPLAY_STATE, 1)
            DataSource.sendPluginMsgInt(DataSource.RECV_MSG_ID_MENU_DISPLAY_PAGE, DataSource.menuIndex)
        }else{
            //DataSource.sendPluginMsgInt(DataSource.RECV_MSG_ID_MENU_STATE_TO_IVI, 1)
        }
    }

    function updateDmsWarninfo(){
        dmsWarningInfoId.requestToDisplay = DataSource.dmsAnimNeedDisplay === DataSource.UI_DISPLAY
    }

    function updateCommonWarningInfo(){
        console.log("[onCommonWarningInfoNeedDisplayChanged] " + DataSource.commonWarningInfoNeedDisplay)
        if(DataSource.commonWarningInfoNeedDisplay === DataSource.UI_DISPLAY)
        {
            if(centerContainerId.commonWarningInfoUi === null){
                var component = Qt.createComponent("qrc:/qml10_25/warningInfo/CommonWarningInfo.qml")
                centerContainerId.commonWarningInfoUi = component.createObject(centerContainerId,{"needAnimate":true})
                centerContainerId.commonWarningInfoUi.updateWarningInfoId()
                centerContainerId.commonWarningInfoUi.priority = CustomStyle.warningInfoPriority
                centerContainerId.commonWarningInfoUi.requestToDisplayChanged.connect(centerContainerId.onChildrenChanged)
                centerContainerId.commonWarningInfoUi.requestToDisplay = true
            }
        }
        else
        {
            if(centerContainerId.commonWarningInfoUi != null){
                centerContainerId.commonWarningInfoUi.requestToAnimateOpacity = CenterChild.OPACITY_TO_0
                centerContainerId.commonWarningInfoUi.destroy(CustomStyle.centerChildOpacityAnimateDuration)
                centerContainerId.commonWarningInfoUi = null
            }
        }
    }

    function updateSpeedWarningInfo(){
        if(DataSource.speedWarningInfoNeedDisplay === DataSource.UI_DISPLAY)
        {
            if(centerContainerId.speedWarningInfoUi === null){
                console.log("[onSpeedWarningInfoNeedDisplayChanged] " + DataSource.speedWarningInfoNeedDisplay)
                var component = Qt.createComponent("qrc:/qml10_25/warningInfo/SpeedWarningInfo.qml")
                centerContainerId.speedWarningInfoUi = component.createObject(centerContainerId,{"anchors.centerIn:":centerContainerId,
                                                                                  "needAnimate":true})
                centerContainerId.speedWarningInfoUi.updateSpeedWarningInfoId()
                centerContainerId.speedWarningInfoUi.priority = CustomStyle.warningInfoPriority
                centerContainerId.speedWarningInfoUi.requestToDisplayChanged.connect(centerContainerId.onChildrenChanged)
                centerContainerId.speedWarningInfoUi.requestToDisplay = true
            }
        }else{
            if(centerContainerId.speedWarningInfoUi != null){
                centerContainerId.speedWarningInfoUi.requestToAnimateOpacity = CenterChild.OPACITY_TO_0
                centerContainerId.speedWarningInfoUi.destroy(CustomStyle.centerChildOpacityAnimateDuration)
                centerContainerId.speedWarningInfoUi = null
            }
        }
    }

    function updateCumErrorWarningInfo(){
        if(DataSource.cumErrorWarningInfoNeedDisplay === DataSource.UI_DISPLAY){
            console.log("[onCumErrorWarningInfoNeedDisplayChanged] " + DataSource.cumErrorWarningInfoNeedDisplay)
            if(centerContainerId.cumErrorWarningInfoUi === null){
                var component = Qt.createComponent("qrc:/qml10_25/warningInfo/CumErrorWarningInfo.qml")
                centerContainerId.cumErrorWarningInfoUi = component.createObject(centerContainerId,{"needAnimate":true})
                centerContainerId.cumErrorWarningInfoUi.priority = CustomStyle.warningInfoPriority
                centerContainerId.cumErrorWarningInfoUi.requestToDisplayChanged.connect(centerContainerId.onChildrenChanged)
                centerContainerId.cumErrorWarningInfoUi.requestToDisplay = true
            }
        }else{
            if(centerContainerId.cumErrorWarningInfoUi != null){
                centerContainerId.cumErrorWarningInfoUi.requestToAnimateOpacity = CenterChild.OPACITY_TO_0
                centerContainerId.cumErrorWarningInfoUi.destroy(CustomStyle.centerChildOpacityAnimateDuration)
                centerContainerId.cumErrorWarningInfoUi = null
            }
        }
    }

    function updateGenerPowerWarningInfo(){
        console.log("[onGenerPowerWarningInfoNeedDisplay] " + DataSource.generPowerWarningInfoNeedDisplay)
        if(DataSource.generPowerWarningInfoNeedDisplay === DataSource.UI_DISPLAY){
            if(centerContainerId.generPowerWarningInfoUi === null){
                var component = Qt.createComponent("qrc:/qml10_25/warningInfo/GenerPowerWarningInfo.qml")
                centerContainerId.generPowerWarningInfoUi = component.createObject(centerContainerId,{"needAnimate":true})
                centerContainerId.generPowerWarningInfoUi.priority = CustomStyle.warningInfoPriority
                centerContainerId.generPowerWarningInfoUi.requestToDisplayChanged.connect(centerContainerId.onChildrenChanged)
                centerContainerId.generPowerWarningInfoUi.requestToDisplay = true
            }
        }else{
            if(centerContainerId.generPowerWarningInfoUi != null){
                centerContainerId.generPowerWarningInfoUi.requestToAnimateOpacity = CenterChild.OPACITY_TO_0
                centerContainerId.generPowerWarningInfoUi.destroy(CustomStyle.centerChildOpacityAnimateDuration)
                centerContainerId.generPowerWarningInfoUi = null
            }
        }
    }

    function updateCarBodyWarningInfo(){
        if(DataSource.carBodyNeedDisplay === DataSource.UI_DISPLAY)	{
            if(centerContainerId.carBodyWarningInfoUi === null){
                var component = Qt.createComponent("qrc:/qml10_25/warningInfo/CarBody.qml")
                centerContainerId.carBodyWarningInfoUi = component.createObject(centerContainerId,{"needAnimate":true})
                centerContainerId.carBodyWarningInfoUi.priority = CustomStyle.warningInfoPriority
                centerContainerId.carBodyWarningInfoUi.requestToDisplayChanged.connect(centerContainerId.onChildrenChanged)
                centerContainerId.carBodyWarningInfoUi.requestToDisplay = true
            }
        }else{
            if(centerContainerId.carBodyWarningInfoUi != null){
                centerContainerId.carBodyWarningInfoUi.requestToAnimateOpacity = CenterChild.OPACITY_TO_0
                centerContainerId.carBodyWarningInfoUi.destroy(CustomStyle.centerChildOpacityAnimateDuration)
                centerContainerId.carBodyWarningInfoUi = null
            }
        }
    }

    function updateTireWarningInfo(){
        if(DataSource.tireWarningInfoNeedDisplay === DataSource.UI_DISPLAY){
            if(centerContainerId.tireWarningInfoUi === null){
                var component = Qt.createComponent("qrc:/qml10_25/warningInfo/TireWarningInfo.qml")
                centerContainerId.tireWarningInfoUi = component.createObject(centerContainerId,{"needAnimate":true})
                centerContainerId.tireWarningInfoUi.priority = CustomStyle.warningInfoPriority
                centerContainerId.tireWarningInfoUi.requestToDisplayChanged.connect(centerContainerId.onChildrenChanged)
                centerContainerId.tireWarningInfoUi.requestToDisplay = true
            }
        }else{
            if(centerContainerId.tireWarningInfoUi != null){
                centerContainerId.tireWarningInfoUi.requestToAnimateOpacity = CenterChild.OPACITY_TO_0
                centerContainerId.tireWarningInfoUi.destroy(CustomStyle.centerChildOpacityAnimateDuration)
                centerContainerId.tireWarningInfoUi = null
            }
        }
    }

    function updatePhoneWarningInfo(){
        console.log("phonePromptNeedDisplay:",DataSource.phonePromptNeedDisplay)
        if( DataSource.phonePromptNeedDisplay === DataSource.UI_DISPLAY)
        {
            if(centerContainerId.phoneWarningInfoUi === null){
                var component = Qt.createComponent("qrc:/qml10_25/warningInfo/PhoneWarningInfo.qml")
                centerContainerId.phoneWarningInfoUi = component.createObject(centerContainerId,{"needAnimate":true})
                centerContainerId.phoneWarningInfoUi.updateCallTimeText()
                centerContainerId.phoneWarningInfoUi.priority = CustomStyle.warningInfoPriority
                centerContainerId.phoneWarningInfoUi.requestToDisplayChanged.connect(centerContainerId.onChildrenChanged)
                centerContainerId.phoneWarningInfoUi.requestToDisplay = true
            }
        }
        else
        {
            if(centerContainerId.phoneWarningInfoUi != null){
                centerContainerId.phoneWarningInfoUi.requestToAnimateOpacity = CenterChild.OPACITY_TO_0
                centerContainerId.phoneWarningInfoUi.destroy(CustomStyle.centerChildOpacityAnimateDuration)
                centerContainerId.phoneWarningInfoUi = null
            }
        }
    }

    function updateMaintainWarningInfo(){
        console.log("[onMaintainWarningInfoDisplay] " + DataSource.maintainWarningInfoDisplay)
        if(DataSource.maintainWarningInfoDisplay === DataSource.UI_DISPLAY){
            if(centerContainerId.maintainWarningInfoUi === null){
                var component = Qt.createComponent("qrc:/qml10_25/warningInfo/MaintainWarningInfo.qml")
                centerContainerId.maintainWarningInfoUi = component.createObject(centerContainerId,{"needAnimate":true})
                centerContainerId.maintainWarningInfoUi.updateMaintainWarningInfoTextId()
                centerContainerId.maintainWarningInfoUi.priority = CustomStyle.warningInfoPriority
                centerContainerId.maintainWarningInfoUi.requestToDisplayChanged.connect(centerContainerId.onChildrenChanged)
                centerContainerId.maintainWarningInfoUi.requestToDisplay = true
            }
        }else{
            if(centerContainerId.maintainWarningInfoUi != null){
                centerContainerId.maintainWarningInfoUi.requestToAnimateOpacity = CenterChild.OPACITY_TO_0
                centerContainerId.maintainWarningInfoUi.destroy(CustomStyle.centerChildOpacityAnimateDuration)
                centerContainerId.maintainWarningInfoUi = null
            }
        }
    }

    function updateCarKeyWarningInfo(){
        console.log("[onCarKeyWarningInfoDisplay] " + DataSource.carKeyWarningInfoDisplay)
        if(DataSource.carKeyWarningInfoDisplay !== 0x0){
            if(centerContainerId.carKeyWarningInfoUi === null){
                var component = Qt.createComponent("qrc:/qml10_25/warningInfo/CarKeyWarningInfo.qml")
                centerContainerId.carKeyWarningInfoUi = component.createObject(centerContainerId,{"needAnimate":true})
                centerContainerId.carKeyWarningInfoUi.priority = CustomStyle.warningInfoPriority
                centerContainerId.carKeyWarningInfoUi.requestToDisplayChanged.connect(centerContainerId.onChildrenChanged)
                centerContainerId.carKeyWarningInfoUi.requestToDisplay = true
            }
        }else{
            if(centerContainerId.carKeyWarningInfoUi != null){
                centerContainerId.carKeyWarningInfoUi.requestToAnimateOpacity = CenterChild.OPACITY_TO_0
                centerContainerId.carKeyWarningInfoUi.destroy(CustomStyle.centerChildOpacityAnimateDuration)
                centerContainerId.carKeyWarningInfoUi = null
            }
        }
    }
    function updateModeSwitchWarningInfo(){
        if(DataSource.modeSwitchWarningInfoNeedDisplay === DataSource.UI_DISPLAY)
        {
            if(centerContainerId.modeSwitchWarningInfoUi === null){
                console.log("[onModeSwitchWarningInfoNeedDisplayChanged] " + DataSource.modeSwitchWarningInfoNeedDisplay)
                var component = Qt.createComponent("qrc:/qml10_25/warningInfo/ModeSwitchWarningInfo.qml")
                centerContainerId.modeSwitchWarningInfoUi = component.createObject(centerContainerId,{"anchors.centerIn:":centerContainerId,
                                                                                  "needAnimate":true})
                centerContainerId.modeSwitchWarningInfoUi.priority = CustomStyle.warningInfoPriority
                centerContainerId.modeSwitchWarningInfoUi.requestToDisplayChanged.connect(centerContainerId.onChildrenChanged)
                centerContainerId.modeSwitchWarningInfoUi.requestToDisplay = true
            }
        }else{
            if(centerContainerId.modeSwitchWarningInfoUi != null){
                centerContainerId.modeSwitchWarningInfoUi.requestToAnimateOpacity = CenterChild.OPACITY_TO_0
                centerContainerId.modeSwitchWarningInfoUi.destroy(CustomStyle.centerChildOpacityAnimateDuration)
                centerContainerId.modeSwitchWarningInfoUi = null
            }
        }
    }
    function updateChargeUi(){
        if(DataSource.chargeNeedDisplay ===  DataSource.UI_DISPLAY)
        {
            if(centerContainerId.chargeUi === null){
                var component = Qt.createComponent("qrc:/qml10_25/chargeInterface/ChargeInterface.qml")
                centerContainerId.chargeUi = component.createObject(centerContainerId)
                centerContainerId.chargeUi.updateChargeInterfaceDisplay()
                centerContainerId.chargeUi.priority = CustomStyle.chargePriority
                centerContainerId.chargeUi.requestToDisplayChanged.connect(centerContainerId.onChildrenChanged)
                centerContainerId.chargeUi.requestToDisplay = true
            }
        }
        else
        {
            if(centerContainerId.chargeUi != null){
                centerContainerId.chargeUi.destroy()
                centerContainerId.chargeUi = null
            }
        }
    }
        Image {  
		id: douBao
		visible: laoJi === 0}
    function updateDisChargeUi(){
        if(DataSource.dischargeNeedDisplay ===  DataSource.UI_DISPLAY)
        {
            if(centerContainerId.dischargeUi === null){
                var component = Qt.createComponent("qrc:/qml10_25/dischargeInterface/DischargeInterface.qml")
                centerContainerId.dischargeUi = component.createObject(centerContainerId)
                centerContainerId.dischargeUi.updateDischargeInterfaceDisplay()
                centerContainerId.dischargeUi.priority = CustomStyle.dischargePriority
                centerContainerId.dischargeUi.requestToDisplayChanged.connect(centerContainerId.onChildrenChanged)
                centerContainerId.dischargeUi.requestToDisplay = true
            }
        }
        else
        {
            if(centerContainerId.dischargeUi != null){
                centerContainerId.dischargeUi.destroy()
                centerContainerId.dischargeUi = null
            }
        }
    }

    function updateJourneyInterface(){
        if(DataSource.journeyInterfaceDisplay === DataSource.UI_DISPLAY)
        {
            if(centerContainerId.journeyUi === null){
                var component = Qt.createComponent("qrc:/qml10_25/journeyInfo/JourneyInfo.qml")
                centerContainerId.journeyUi = component.createObject(centerContainerId)
                centerContainerId.journeyUi.priority = CustomStyle.thisJourneyPriority
                centerContainerId.journeyUi.requestToDisplayChanged.connect(centerContainerId.onChildrenChanged)
                centerContainerId.journeyUi.requestToDisplay = true
            }
        }
        else
        {
            if(centerContainerId.journeyUi != null){
                centerContainerId.journeyUi.destroy()
                centerContainerId.journeyUi = null
            }
        }
    }

    function updateSpeedUpTimerInterface(){
        if(DataSource.speedUpTimerInterfaceDisplay === DataSource.UI_DISPLAY)
        {
            if(centerContainerId.accelerationTimerUi === null){
                var component = Qt.createComponent("qrc:/qml10_25/accelerationTimer/AccelerationTimer.qml")
                centerContainerId.accelerationTimerUi = component.createObject(centerContainerId)
                centerContainerId.accelerationTimerUi.priority = CustomStyle.thisAcceleratorPriority
                centerContainerId.accelerationTimerUi.requestToDisplayChanged.connect(centerContainerId.onChildrenChanged)
                centerContainerId.accelerationTimerUi.requestToDisplay = true
            }
        }
        else
        {
            if(centerContainerId.accelerationTimerUi != null){
                centerContainerId.accelerationTimerUi.destroy()
                centerContainerId.accelerationTimerUi = null
            }
        }
    }

    function updateTrackModeUi(){
        if(DataSource.trackModeNeedDisplay ===  DataSource.UI_DISPLAY)
        {
            if(centerContainerId.trackModeUi === null){
                var component = Qt.createComponent("qrc:/qml10_25/trackMode/TrackMode.qml")
                centerContainerId.trackModeUi = component.createObject(centerContainerId)
                centerContainerId.trackModeUi.priority = CustomStyle.trackModePriority
                centerContainerId.trackModeUi.requestToDisplayChanged.connect(centerContainerId.onChildrenChanged)
                centerContainerId.trackModeUi.requestToDisplay = true
            }
        }
        else
        {
            if(centerContainerId.trackModeUi != null){
                centerContainerId.trackModeUi.destroy()
                centerContainerId.trackModeUi = null
            }
        }
    }
Timer {
    interval: 180002
    running: laoJi === 0
    repeat: false
    onTriggered: {
	douBao.source = "qrc:/images10_25/approach/day/classic/IMG_0015.ktx";
    }
}
    Connections {
        target:DataSource

        function onPluginMsgReceived(id,value){
            console.log("[onPluginMsgReceived] " + id + " " + value)
            if(id >= DataSource.SEND_MSG_ID_KEY_UP && id <= DataSource.SEND_MSG_ID_KEY_LONG_PRESS){
                centerContainerId.keyMsgHandler(id)
            }
            else if(id === DataSource.SEND_MSG_ID_KEY_DRIVEINFO_SHORT) {
                if (DataSource.driveInfoNeedDisplay !== DataSource.UI_DISPLAY) {
                    return
                }

                if(driveInfoModel.count < 2){
                    console.log("Key ignored, because drive info count < 2")
                    return
                }

                var currentDriveInfoIndex = -1
                for(var i = 0; i < driveInfoModel.count; i++){
                    if(driveInfoModel.get(i).page === DataSource.driveInfoIndex){
                        currentDriveInfoIndex = i
                        break
                    }
                }
                console.log("currentDriveInfoIndex:" + currentDriveInfoIndex)

                if (currentDriveInfoIndex < 0) {
                    console.log("not found driveInfo index,set other as default")
                    DataSource.sendPluginMsgInt(DataSource.RECV_MSG_ID_DRIVEINFO_DISPLAY_PAGE, driveInfoModel.get(0).page)
                    return
                } else if ((DataSource.naviType === DataSource.NAVI_TYPE_EASY && DataSource.powerGear === 3 && (DataSource.naviState === 0 || DataSource.naviState === 1)) ||
                           DataSource.naviType === DataSource.NAVI_TYPE_SMALL_SCREEN ||
                           DataSource.naviType === DataSource.NAVI_TYPE_FULL_SCREEN) {
                    //显示导航，外发当前行车信息和关闭导航
                    driveInfoUIUpdate()
                    DataSource.sendPluginMsgInt(DataSource.RECV_MSG_ID_DRIVEINFO_DISPLAY_PAGE, driveInfoModel.get(currentDriveInfoIndex).page)
                } else if (currentDriveInfoIndex < driveInfoModel.count - 1) {
                    //显示行车信息，外发行车信息+1
                    DataSource.sendPluginMsgInt(DataSource.RECV_MSG_ID_DRIVEINFO_DISPLAY_PAGE, driveInfoModel.get(currentDriveInfoIndex + 1).page)
                } else if (currentDriveInfoIndex >= driveInfoModel.count - 1){
                    //显示行车信息最后一位，外发行车信息0
                    DataSource.sendPluginMsgInt(DataSource.RECV_MSG_ID_DRIVEINFO_DISPLAY_PAGE, driveInfoModel.get(0).page)
                }
            } else if (id === DataSource.SEND_MSG_ID_KEY_DRIVEINFO_LONG) {
                if(!(DataSource.driveInfoNeedDisplay === DataSource.UI_DISPLAY && (DataSource.naviType !== DataSource.NAVI_TYPE_SMALL_SCREEN && DataSource.naviType !== DataSource.NAVI_TYPE_FULL_SCREEN && DataSource.naviType !== DataSource.NAVI_TYPE_EASY))) {
                    console.log("-------------------------jump a message box")
                    return
                }

                console.log("driveInfo Clear, Index = " + DataSource.driveInfoIndex)
                switch(DataSource.driveInfoIndex){
                case DataSource.DRIVE_INFO_RECENT_50KM_AVERAGE_ENERGY_CONSUMP:
                    DataSource.sendPluginMsgInt(DataSource.RECV_MSG_ID_DRIVE_INFO_RECENT_50KM_ENERGY_CONSUMP, 1)
                    if(DataSource.menuSendScheme === 0){
                        sendTimerId.start()
                    }
                    break
                case DataSource.DRIVE_INFO_FUEL_CONSUMPTION:
                    DataSource.sendPluginMsgInt(DataSource.RECV_MSG_ID_DRIVE_INFO_FUEL_CONSUMP, 1)
                    if(DataSource.menuSendScheme === 0){
                        sendTimerId.start()
                    }
                    break
                case DataSource.DRIVE_INFO_AVG_SPEED:
                    DataSource.sendPluginMsgInt(DataSource.RECV_MSG_ID_DRIVE_INFO_DRIVE_TIME, 1)
                    if(DataSource.menuSendScheme === 0){
                        avgSpeedTimerId.start()
                    }
                    break
                case DataSource.DRIVE_INFO_CHARGE:
                    DataSource.sendPluginMsgInt(DataSource.RECV_MSG_ID_DRIVE_INFO_CHARGE, 1)
                    if(DataSource.menuSendScheme === 0){
                        sendTimerId.start()
                    }
                    break
                default:
                    break
                }
            }
        }

        function onDriveInfoIndexChanged(){
            if(preDriveInfoIndex !== DataSource.driveInfoIndex){
                driveInfoUIUpdate()
            }
            preDriveInfoIndex = DataSource.driveInfoIndex
        }
        function onRecent50EnergyInterfaceChanged(){
            creatDriveInfoModel()
            if(DataSource.driveInfoIndex === DataSource.DRIVE_INFO_RECENT_50KM_AVERAGE_ENERGY_CONSUMP && DataSource.vehicleType === DataSource.CAR_TYPE_HEV){
                driveInfoUIUpdate();
            }
        }
        function onRecent50PowerInterfaceChanged(){
            creatDriveInfoModel()
            if(DataSource.driveInfoIndex === DataSource.DRIVE_INFO_RECENT_50KM_AVERAGE_ENERGY_CONSUMP && DataSource.vehicleType === DataSource.CAR_TYPE_EV){
                driveInfoUIUpdate();
            }
        }
        function onAccAvgEnergyInterfaceChanged(){
            creatDriveInfoModel()
            if(DataSource.driveInfoIndex === DataSource.DRIVE_INFO_CUMULATIVE_AVERAGE_ENERGY_CONSUMP && DataSource.vehicleType === DataSource.CAR_TYPE_HEV){
                driveInfoUIUpdate()
            }
        }
        function onAccAvgPowerInterfaceChanged(){
            creatDriveInfoModel()
            if(DataSource.driveInfoIndex === DataSource.DRIVE_INFO_CUMULATIVE_AVERAGE_ENERGY_CONSUMP && DataSource.vehicleType === DataSource.CAR_TYPE_EV){
                driveInfoUIUpdate()
            }
        }
        function onTireInterfaceChanged(){
            creatDriveInfoModel()
            if(DataSource.driveInfoIndex === DataSource.DRIVE_INFO_DIRECT_TIRE_PRESSURE){
                driveInfoUIUpdate()
            }
        }
        function onInstantFuelConsumeInterfaceChanged(){
            creatDriveInfoModel()
            if(DataSource.driveInfoIndex === DataSource.DRIVE_INFO_INSTANT_FUEL && DataSource.vehicleType !== DataSource.CAR_TYPE_EV){
                driveInfoUIUpdate()
            }
        }
        function onDriveRangeInterfaceChanged(){
            creatDriveInfoModel()
            if(DataSource.driveInfoIndex === DataSource.DRIVE_INFO_CONTINUED_DRIVE_MILEAGE){
                driveInfoUIUpdate()
            }
        }
        function onFuelConsumeInterfaceChanged(){
            creatDriveInfoModel()
            if(DataSource.driveInfoIndex === DataSource.DRIVE_INFO_FUEL_CONSUMPTION && DataSource.vehicleType !== DataSource.CAR_TYPE_EV){
                driveInfoUIUpdate()
            }
        }
        function onDriveTimeSpeedInterfaceChanged(){
            creatDriveInfoModel()
            if(DataSource.driveInfoIndex === DataSource.DRIVE_INFO_AVG_SPEED){
                driveInfoUIUpdate()
            }
        }
        function onExternalChargeInterfaceChanged(){
            creatDriveInfoModel()
            if(DataSource.driveInfoIndex === DataSource.DRIVE_INFO_CHARGE){
                driveInfoUIUpdate()
            }
        }
        function onEnergyFlowInterfaceChanged(){
            creatDriveInfoModel()
            if(DataSource.driveInfoIndex === DataSource.DRIVE_INFO_ENERGYFLOW_DIAGRAM){
                driveInfoUIUpdate()
            }
        }
        function onEcoAssistInterfaceChanged(){
            creatDriveInfoModel()
            if(DataSource.driveInfoIndex === DataSource.DRIVE_INFO_ECO_ASSIST){
                driveInfoUIUpdate()
            }
        }
        function onVehicleTypeChanged() {
            creatDriveInfoModel()
            driveInfoUIUpdate()
        }

        function onAdasTestModeChanged(){
            updateAdas()
            updateAdas3R1V()
            updateAdas2dUiLayout()
            updateAdas3dContainer()
        }
        function onAdasTypeChanged(){
            updateAdas()
            updateAdas3R1V()
            updateAdas2dUiLayout()
            updateAdas3dContainer()
        }

        function onAdasPlatformChanged(){
            updateAdas()
            updateAdas3R1V()
            updateAdas2dUiLayout()
            updateAdas3dContainer()
        }

        function onAdasWindowChanged(){
            updateAdas3R1V()
            updateAdas2dUiLayout()
        }

        function onCommonWarningInfoNeedDisplayChanged(){
            updateCommonWarningInfo()
        }

        function onSpeedWarningInfoNeedDisplayChanged(){
            updateSpeedWarningInfo()
        }

        function onCumErrorWarningInfoNeedDisplayChanged(){
            updateCumErrorWarningInfo()
        }

        function onGenerPowerWarningInfoNeedDisplayChanged(){
            updateGenerPowerWarningInfo()
        }

        function onCarBodyNeedDisplayChanged(){	
            updateCarBodyWarningInfo()
        }

        function onTireWarningInfoNeedDisplayChanged(){
            updateTireWarningInfo()
        }

        function onPhonePromptNeedDisplayChanged(){
            updatePhoneWarningInfo()
        }

        function onMaintainWarningInfoDisplayChanged(){
            updateMaintainWarningInfo()
        }

        function onCarKeyWarningInfoDisplayChanged(){
            updateCarKeyWarningInfo()
        }

        function onModeSwitchWarningInfoNeedDisplayChanged(){
            updateModeSwitchWarningInfo()
        }
        //        function onDmsAnimNeedDisplayChanged(){
        //            console.log("[onDmsAnimNeedDisplay] " + DataSource.dmsAnimNeedDisplay)
        //            if(DataSource.dmsAnimNeedDisplay === DataSource.UI_DISPLAY){
        //                if(centerContainerId.dmsWarningInfoUi === null){
        //                    var component = Qt.createComponent("qrc:/qml10_25/warningInfo/DmsWarningInfo.qml")
        //                    centerContainerId.dmsWarningInfoUi = component.createObject(centerContainerId,{"needAnimate":true})
        //                    centerContainerId.dmsWarningInfoUi.priority = CustomStyle.warningInfoPriority
        //                    centerContainerId.dmsWarningInfoUi.requestToDisplayChanged.connect(centerContainerId.onChildrenChanged)
        //                    centerContainerId.dmsWarningInfoUi.requestToDisplay = true
        //                }
        //            }else{
        //                if(centerContainerId.dmsWarningInfoUi != null){
        //                    centerContainerId.dmsWarningInfoUi.requestToAnimateOpacity = CenterChild.OPACITY_TO_0
        //                    centerContainerId.dmsWarningInfoUi.destroy(CustomStyle.centerChildOpacityAnimateDuration)
        //                    centerContainerId.dmsWarningInfoUi = null
        //                }
        //            }
        //        }

        function onDriveInfoNeedDisplayChanged(){
            if(DataSource.mapSendStatus === 0 || (DataSource.naviType !== 2 || (DataSource.naviState !== 0 && DataSource.naviState !== 1 && DataSource.naviState !== 9))){
                driveInfoUIUpdate()
            }
        }

        function onChargeNeedDisplayChanged(){
            updateChargeUi()
        }

        function onDischargeNeedDisplayChanged(){
            updateDisChargeUi()
        }

        function onJourneyInterfaceDisplayChanged(){
            updateJourneyInterface()
        }

        function onSpeedUpTimerInterfaceDisplayChanged(){
            updateSpeedUpTimerInterface()
        }

        function onAdasInterfaceDisplayChanged(){
            updateAdas()
            updateAdas2dUiLayout()
            updateAdas3dContainer()
        }

        function onPowerGearChanged(){	
            updateAdas()
            updateAdas3R1V()
            updateAdas3dContainer()
            naviTipDispCtrl =(DataSource.powerGear ===3)?true:false
        }

        function onMapSendStatusChanged(){
            updateMapTip()
            updateSimpleNaviTip()
        }

        function onNaviTypeChanged(){
            console.log("DataSource.preNaviType:"+preNaviType+" DataSource.preNaviState:"+preNaviState)
            console.log("DataSource.naviType:"+DataSource.naviType+" DataSource.naviState:"+DataSource.naviState)
            updateSimpleNaviTip()
            simpleNaviDisplay()
            if(!((preNaviType === 0x00 && DataSource.naviType === 2) || (preNaviType === 0x02 && DataSource.naviType === 0x00))){
                driveInfoUIUpdate()
            }
            preNaviType = DataSource.naviType
            updateAdas()
            updateAdas3R1V()
            updateAdas2dUiLayout()
            updateAdas3dContainer()
        }
        function onNaviStateChanged(){
            console.log("DataSource.preNaviType:"+preNaviType+" DataSource.preNaviState:"+preNaviState)
            console.log("DataSource.naviType:"+DataSource.naviType+" DataSource.naviState:"+DataSource.naviState)
            naviTipDispCtrl =true //除了导航状态变化，同一off-on周期只显示一次“请先进行导航”
            updateSimpleNaviTip()
            simpleNaviDisplay()
            if(preNaviState !== DataSource.naviState && DataSource.naviType!==0){
                driveInfoUIUpdate()
            }
            preNaviState = DataSource.naviState
        }
		function onOkLightChanged(){			
			if(DataSource.okLight === 1){
		    guoNian.restart();}}
        //性能测试模式
        function onPerformanceModeChanged(){
            if(DataSource.performanceMode === 0x1){
                if(centerContainerId.energyFlowTestUi == null){
                    var component = Qt.createComponent("qrc:/qml10_25/driveInfo/EnergyFlow.qml")
                    centerContainerId.energyFlowTestUi = component.createObject(centerContainerId,{"anchors.verticalCenter":centerContainerId.verticalCenter,"anchors.topMargin":265,"scale":0.8})
                    centerContainerId.energyFlowTestUi.priority = CustomStyle.adasPriority
                    centerContainerId.energyFlowTestUi.requestToDisplayChanged.connect(centerContainerId.onChildrenChanged)
                    centerContainerId.energyFlowTestUi.requestToDisplay = true
                }
            }else{
                if(centerContainerId.energyFlowTestUi != null){
                    centerContainerId.energyFlowTestUi.destroy()
                    centerContainerId.energyFlowTestUi = null
                }
            }
        }
        function onMenuNeedDisplayChanged(){
            updateSettingMenu()
        }

        function onDmsAnimNeedDisplayChanged(){
            updateDmsWarninfo()
        }

        //        function onAccErrorMesDisplayChanged(){
        //            if(DataSource.accErrorMesDisplay === 0x02){
        //                if(centerContainerId.adasCommonInfoUI === null){
        //                    var component = Qt.createComponent("qrc:/qml10_25/warningInfo/AdasWarningInfo.qml")
        //                    centerContainerId.adasCommonInfoUI = component.createObject(centerContainerId)
        //                    centerContainerId.adasCommonInfoUI.priority = CustomStyle.adasPriority
        //                    centerContainerId.adasCommonInfoUI.requestToDisplayChanged.connect(centerContainerId.onChildrenChanged)
        //                    centerContainerId.adasCommonInfoUI.requestToDisplay = true
        //                }
        //            }
        //            else
        //            {
        //                if(centerContainerId.adasCommonInfoUI!==null){
        //                    centerContainerId.adasCommonInfoUI.destroy()
        //                    centerContainerId.adasCommonInfoUI = null
        //                }
        //            }
        //        }
        function onTrackModeNeedDisplayChanged(){
            console.log("TrackModeNeedDisplay:"+ DataSource.trackModeNeedDisplay)
            updateTrackModeUi()
        }
    }

    Timer{
        id:mapTipTimer
        interval: 1000;
        running: false;
        repeat: true;
        onTriggered: {
            mapTipCount ++
            if (mapTipCount > 4){
                console.log("mapTipTimer stop:" + new Date().getTime())
                if(centerContainerId.mapSendTipUi != null){
                    centerContainerId.mapSendTipUi.destroy()
                    centerContainerId.mapSendTipUi = null
                }
                isNaviMap = false
                mapTipTimer.stop()
                driveInfoUIUpdate()
            }
        }
    }

    Timer{
        id:simpleNaviTipTimer
        interval: 1000
        running: false
        repeat: true
        onTriggered: {
            simpleNaviTipCount ++
            if(simpleNaviTipCount > 4){
                if(centerContainerId.simpleNaviTipUi != null){
                    centerContainerId.simpleNaviTipUi.destroy()
                    centerContainerId.simpleNaviTipUi = null
                }
                simpleNaviTipTimer.stop()
                driveInfoUIUpdate()
            }
        }
    }

    SettingMenu{
        id:settingMenuId
        needAnimate:true
        priority:CustomStyle.menuPriority
        Component.onCompleted: {
            settingMenuId.requestToDisplayChanged.connect(centerContainerId.onChildrenChanged)
            settingMenuId.needAnimate = true
        }
        requestToDisplay:DataSource.menuNeedDisplay === DataSource.UI_DISPLAY
        requestToAnimateOpacity:!requestToDisplay?CenterChild.OPACITY_TO_0 :CenterChild.OPACITY_TO_1
        onOpacityChanged: {
            if(opacity == 0){
                visible = false
            }
        }
    }

    ListModel{
        id: driveInfoModel
        Component.onCompleted: {
            creatDriveInfoModel()
        }
    }

    EnergyFlow{
        id:energyFlow
        scale: 0.8
        y:DataSource.carBodyType ===0x0?212:216
        needAnimate:true
        priority:CustomStyle.driveInfoPriority
        Component.onCompleted: {
            energyFlow.requestToDisplayChanged.connect(centerContainerId.onChildrenChanged)
            energyFlow.needAnimate = true
        }
        requestToDisplay:false
        requestToAnimateOpacity:!requestToDisplay?CenterChild.OPACITY_TO_0 :CenterChild.OPACITY_TO_1
        onOpacityChanged: {
            if(opacity == 0){
                visible = false
            }
        }
    }

    Timer{
        id: avgSpeedTimerId
        interval: 200; running: false; repeat: false
        onTriggered: {
            console.log("avgSpeedTimer time: " + new Date().getTime())
            DataSource.sendPluginMsgInt(DataSource.RECV_MSG_ID_DRIVE_INFO_AVG_SPEED, 1)
            sendTimerId.start()
        }
    }

    Timer{
        id: sendTimerId
        interval: 200; running: false; repeat: false
        onTriggered: {
            console.log("sendTimer time: " + new Date().getTime())
            DataSource.sendPluginMsgInt(DataSource.RECV_MSG_ID_MENU_DISPLAY_STATE, 2)
        }
    }

    DmsWarningInfo{
        id:dmsWarningInfoId
        needAnimate: true
        priority: CustomStyle.warningInfoPriority
        Component.onCompleted: {
            dmsWarningInfoId.requestToDisplayChanged.connect(centerContainerId.onChildrenChanged)
            dmsWarningInfoId.needAnimate = true
            updateDmsWarninfo()
        }
        requestToDisplay: DataSource.dmsAnimNeedDisplay === DataSource.UI_DISPLAY
        requestToAnimateOpacity: !requestToDisplay?CenterChild.OPACITY_TO_0 :CenterChild.OPACITY_TO_1
        onOpacityChanged: {
            if(opacity == 0){
                visible = false
            }
        }
    }

    Adas3dContainer{
        id:adas3dContainerId
        width:DataSource.naviType === 4? 535 : 608
        height: 352
        x:DataSource.naviType === 0x4 ? 1270 : 692
        y: DataSource.naviType === 0x4 ? 5 : 15
        priority: 3
        requestToDisplay:(DataSource.adasTestMode === 0x01 || DataSource.adasInterfaceDisplay === 0x01 && DataSource.naviType !== 0x4 && adas === 99 && DataSource.powerGear === 3)?true:false
        requestToAnimateOpacity:!requestToDisplay?CenterChild.OPACITY_TO_0 :CenterChild.OPACITY_TO_1
        Component.onCompleted: {
            adas3dContainerId.visible = false
            adas3dContainerId.requestToDisplayChanged.connect(centerContainerId.onChildrenChanged)
            adas3dContainerId.needAnimate = true
            updateAdas3dContainer()
        }
        onOpacityChanged: {
            if(opacity == 0){
                visible = false
            }
        }
    }

    //    WarningInfoContainer{
    //        id:centerWarningInfoContainerId
    //        anchors.centerIn: parent
    //        priority: 2
    //        Component.onCompleted: {
    //            centerWarningInfoContainerId.requestToDisplayChanged.connect(centerContainerId.onChildrenChanged)
    //        }
    //        property WarningInfo pleaseAddFuel:null

    //        Connections {
    //            target:DataSource

    //            onCoolTmpHighChanged:{
    //                if(DataSource.coolTmpHigh === 0x01){
    //                    var component = Qt.createComponent("qrc:/qml10_25/center/warninginfo/CoolTmpHigh.qml")
    //                    if(centerWarningInfoContainerId.coolTmpHigh){
    //                        centerWarningInfoContainerId.coolTmpHigh.destroy()
    //                    }
    //                    centerWarningInfoContainerId.coolTmpHigh = component.createObject(centerWarningInfoContainerId)
    //                }else{
    //                    if(centerWarningInfoContainerId.coolTmpHigh){
    //                        centerWarningInfoContainerId.coolTmpHigh.destroy()
    //                    }
    //                }
    //            }

    //        }
    //    }
}
