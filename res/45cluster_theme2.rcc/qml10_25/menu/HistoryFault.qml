import QtQuick 2.0
import com.byd.DataSource 1.0
import QtQml.Models 2.15
import QtQuick.Controls 2.0
import "qrc:/common/singleton"

Item {
    width: 710
    height: 322
    //20240826 laijunhao add x:21 for http://dlc.coding.byd.com/p/dilink-3.0-1for2/bug-tracking/issues/6564/detail
    x: 21

    Item {
        id: nomalItem
        y: 98+14
        width: parent.width
        visible: DataSource.historyFaultCount === 0 ? true : false

        Image {
            id: carImg
			height: 260
			fillMode: Image.PreserveAspectFit
            source: {
        if (rootItemId.zdycar === 1) {
            return rootItemId.car
        }			
                if(DataSource.carNameType === 0x06){//8.8 SA2HP
                    "qrc:/images10_25/menu/night/history_car_SA2HP.png"
                }else if(DataSource.carNameType === 0x07){//SK2H
                    "qrc:/images10_25/menu/night/history_car_SK2H.png"
                }else if(DataSource.carNameType === 0x09){
                    if (DataSource.ekCarbodyColor === 2) {
                        "qrc:/images10_25/menu/night/history_car_ek_sport_green.png"
                    } else {
                        "qrc:/images10_25/menu/night/history_car_ek_sport_orange.png"
                    }
                }else if(DataSource.carNameType === 0x0A){
                    "qrc:/images10_25/menu/night/history_car_ek_normal.png"
                }else if(DataSource.carNameType === 0x0B){
                    "qrc:/images10_25/menu/night/history_car_ha2e_normal.png"
                }else if(DataSource.carNameType === 0x0C){
                    "qrc:/images10_25/menu/night/history_car_ha2h_normal.png"
                }else if(DataSource.carNameType === DataSource.CARNAME_EK23_10_25){    //0xCD  eknormal23
                    "qrc:/images10_25/menu/night/history_car_ek_normal_23.png"
                }else if(DataSource.carNameType === DataSource.CARNAME_SC3E_8_8){// 0xA0  SC3E
                    "qrc:/images10_25/menu/night/history_car_SC3E.png"
                }else if(DataSource.carNameType === DataSource.CARNAME_SC2E_8_8){// 0x5B  SC2E
                    "qrc:/images10_25/menu/night/history_car_SC2E.png"
                }else if(DataSource.carNameType === DataSource.CARNAME_HA3_8_8){// 0xCC  HA3
                    "qrc:/images10_25/menu/night/history_car_HA3.png"
                }else if(DataSource.carNameType === DataSource.CARNAME_HKHA_8_8){// 0xBC  HKH
                    "qrc:/images10_25/menu/night/history_car_HKH.png"
                }else if(DataSource.carNameType === DataSource.CARNAME_SA5H_10_25){// 0xA1  SA5H
                    "qrc:/images10_25/menu/night/history_car_SA5H.png"
                }else if(DataSource.carNameType === DataSource.CARNAME_SA6H_8_8){// 0xEA  SA6H
                    "qrc:/images10_25/menu/night/history_car_SA6H.png"
                }else if(DataSource.carNameType === DataSource.CARNAME_HXHK_8_8){// 0xE9  HXHK
                    "qrc:/images10_25/menu/night/history_car_HXHK.png"
                }else if(DataSource.carNameType === DataSource.CARNAME_SL2H_8_8){// 0xE2  SL2H
                    "qrc:/images10_25/menu/night/history_car_SL2H.png"
                }else if(DataSource.carNameType === DataSource.CARNAME_EWE_8_8){// 0xBF  EWE
                    "qrc:/images10_25/menu/night/history_car_EWE.png"
                }else{
                    rootItemId.car
                }
            }
            anchors.horizontalCenter: parent.horizontalCenter
            cache: false
        }

        Text {
            font.bold:rootItemId.jiacu === 1
            font.family: rootItemId.ziti
            id: nomalTextId
            text: TranslateStr.menu_carNormalStr
            //    y: 203
            color: DataSource.dayNightMode === 0x02?"#ffffff":"#333333"
            font.pixelSize: 27
            anchors.horizontalCenter: parent.horizontalCenter
            anchors.top: carImg.bottom

        }
    }

    property alias listView: listView
    property var lastPage: -1
    property bool isFault: false

    Rectangle{
        x: 70
        y: 96+21
        width: 570
        height: 282
        color: "transparent"
        visible: !nomalItem.visible

        ListView {
            id:listView
            anchors.fill: parent
            model: listModel
            delegate: listDel
            orientation: ListView.Vertical
            snapMode: ListView.SnapOneItem
        }

        GridView {
            id:gridView
            anchors.fill: parent
            model:gridModel
            delegate: gridDel
            cellHeight : 94
            cellWidth : 570
            interactive: false
            contentY: listView.contentY
            clip: true
        }

        Component{
            id:gridDel
            Rectangle{
                color: "transparent"
                width:	570
                height: 94

                Rectangle{
                    id:dot
                    width: 26
                    height: 26
                    radius: 13
                    y:3
                    color: DataSource.dayNightMode === 0x02 ? nightColor:dayColor
                }

                Text {
                    font.bold:rootItemId.jiacu === 1
                    font.family: rootItemId.ziti
                    id: falutTextId
                    font.pixelSize: 32
                    anchors.left: dot.right
                    anchors.leftMargin: 22
                    text: DataSource.language === 0x02 ? nameEn : name
                    y: 0
                    color: DataSource.dayNightMode === 0x02 ? nightColor : dayColor
                    width: 522
                    wrapMode: Text.WordWrap
                    lineHeight: DataSource.language === 0x02 ? 0.9 : 1.0
                }
            }
        }

        ListModel{
            id:gridModel
            Component.onCompleted: {
                updateFaultItem()
            }
        }
        Component{
            id:listDel
            Rectangle{
                width: 570
                height: 282
                color:"transparent"
            }
        }
        ListModel{
            id:listModel
            Component.onCompleted: {
                updateFaultPage()
            }
        }
    }
    Connections{
        target: DataSource
        function onVehicleTypeChanged() { updateFaultItem() }
        function onHistoryFaultCountChanged(){ updateFaultPage()}
        function onFarAwayFromCarChanged() { updateFaultItem() }
        function onRemoteDriveSuspendedChanged() { updateFaultItem() }
        function onCheckBrakeSystemChanged() { updateFaultItem() }
        function onLowBrakeFluidChanged() { updateFaultItem() }
        function onCheckSteerSystemChanged() { updateFaultItem() }
        function onCheckEngineOverheatChanged() { updateFaultItem() }
        function onEngineOverheatChanged() { updateFaultItem() }
        function onLowEngineOilPressureChanged() { updateFaultItem() }
        function onPowerSystemFaultChanged() { updateFaultItem() }
        function onLvpsChanged() { updateFaultItem() }
        function onLowBatteryErrorChanged() { updateFaultItem() }
        function onCheckVehicleNetworkChanged() { updateFaultItem() }
        function onTransmissionSystemFaultChanged() { updateFaultItem() }
        function onCheckTransmissionSystemChanged() { updateFaultItem() }
        function onLowBatteryChanged() { updateFaultItem() }
        function onEvLimitedChanged() { updateFaultItem() }
        function onCheckEpbSystemChanged() { updateFaultItem() }
        function onSlidingRiskChanged() { updateFaultItem() }
        function onCheckLvpsChanged() { updateFaultItem() }
        function onCheckEngineSystemChanged() { updateFaultItem() }
        function onEngineAccessoryLimitedChanged() { updateFaultItem() }
        function onTransmissionLimitedChanged() { updateFaultItem() }
        function onDultchOverheatChanged() { updateFaultItem() }
        function onGearboxOilChanged() { updateFaultItem() }
        function onCheckSrsChanged() { updateFaultItem() }
        function onCheckAdbChanged() { updateFaultItem() }
        function onCheckPowerSystemChanged() { updateFaultItem() }
        function onCheckHeadlampSystemChanged() { updateFaultItem() }
        function onFailStartEngineChanged() { updateFaultItem() }
        function onLowCoolantLevelChanged() { updateFaultItem() }
        function onActmsErrorChanged() { updateFaultItem() }
        function onLowOilLevelChanged() { updateFaultItem() }
        function onHighOilLevelChanged() { updateFaultItem() }
        function onCheckOilDetectChanged() { updateFaultItem() }
        function onCheckTpmsChanged() { updateFaultItem() }
        function onTireLowChanged() { updateFaultItem() }
        function onCheckBrakingSystemChanged() { updateFaultItem() }
        function onCheckAbsChanged() { updateFaultItem() }
        function onCheckGeneratorChanged() { updateFaultItem() }
        function onCheckShiftSystemChanged() { updateFaultItem() }
        function onCheckEspSystemChanged() { updateFaultItem() }
        function onCheckHdcSystemChanged() { updateFaultItem() }
        function onCheckBrakWearChanged() { updateFaultItem() }
        function onCheckMultVideoChanged() { updateFaultItem() }
        function onCheckMmwRadarChanged() { updateFaultItem() }
        function onAebSystemLimitedChanged() { updateFaultItem() }
        function onLksLimitedChanged() { updateFaultItem() }
        function onAccSystemLimitedChanged() { updateFaultItem() }
        function onLdwsLimitedChanged() { updateFaultItem() }
        function onBsdSystemLimitedChanged() { updateFaultItem() }
        function onRefuleDieselAcHeaterChanged() { updateFaultItem() }
        function onCheckDischargEquipmentChanged() { updateFaultItem() }
        function onCheckExternalChargeEquipmentChanged() { updateFaultItem() }
        function onCheckObsSystemChanged() { updateFaultItem() }
        function onLowBatteryLimitedChanged() { updateFaultItem() }
        function onCompulsiveEVModeChanged() { updateFaultItem() }
        function onBydShopMaintenanceChanged() { updateFaultItem() }
        function onGpfServiceChanged() { updateFaultItem() }
        function onStopDischargeLowBatteryChanged() { updateFaultItem() }
        function onChargeInTimeChanged() { updateFaultItem() }
        function onReleaseParkingBrakeChanged() { updateFaultItem() }
        function onReleaseEpbChanged() { updateFaultItem() }
        function onPleaseRefuelChanged() { updateFaultItem() }
        function onApaLimitedChanged() { updateFaultItem() }
        function onCheckMsrSystemChanged() { updateFaultItem() }
        function onCheckMemorySystemChanged() { updateFaultItem() }
        function onCheckSunroofSystemChanged() { updateFaultItem() }
        function onAcLimitedChanged() { updateFaultItem() }
        function onBatteryCauseAcLimitedChanged() { updateFaultItem() }
        function onBatteryCausePowerLimitedChanged() { updateFaultItem() }
        function onAccBrakePadsChanged() { updateFaultItem() }
        function onKeyDayLeftChanged() { updateFaultItem() }
        function onKeyHourLeftChanged() { updateFaultItem() }
        function onTranslateLoadCompleteChanged(){ updateFaultItem() }
    }

    function updateFaultItem(){
        gridModel.clear()
        isFault = true

        if(DataSource.farAwayFromCar === 1) { gridModel.append({name:TranslateStr.menu_farAwayFromCarStr,nameEn:TranslateStr.menu_farAwayFromCarEnStr,dayColor:"#c80000",nightColor:"#c80000"})}
        if(DataSource.remoteDriveSuspended === 1) { gridModel.append({name:TranslateStr.menu_remoteDriveSuspendedStr,nameEn:TranslateStr.menu_remoteDriveSuspendedEnStr,dayColor:"#c88800",nightColor:"#fff000"})}
        if(DataSource.checkBrakeSystem === 1) { gridModel.append({name:TranslateStr.menu_checkBrakeSystemStr,nameEn:TranslateStr.menu_checkBrakeSystemEnStr,dayColor:"#c80000",nightColor:"#c80000"})}
        if(DataSource.lowBrakeFluid === 1) { gridModel.append({name:TranslateStr.menu_lowBrakeFluidStr,nameEn:TranslateStr.menu_lowBrakeFluidEnStr,dayColor:"#c80000",nightColor:"#c80000"})}
        if(DataSource.checkSteerSystem === 1) { gridModel.append({name:TranslateStr.menu_checkSteerSystemStr,nameEn:TranslateStr.menu_checkSteerSystemEnStr,dayColor:"#c80000",nightColor:"#c80000"})}
        if(DataSource.checkEngineOverheat === 1) { gridModel.append({name:TranslateStr.menu_checkEngineOverheatStr,nameEn:TranslateStr.menu_checkEngineOverheatEnStr,dayColor:"#c80000",nightColor:"#c80000"})}
        if(DataSource.engineOverheat === 1) { gridModel.append({name:TranslateStr.menu_engineOverheatStr,nameEn:TranslateStr.menu_engineOverheatEnStr,dayColor:"#c80000",nightColor:"#c80000"})}
        if(DataSource.lowEngineOilPressure === 1) { gridModel.append({name:TranslateStr.menu_lowEngineOilPressureStr,nameEn:TranslateStr.menu_lowEngineOilPressureEnStr,dayColor:"#c80000",nightColor:"#c80000"})}
        if(DataSource.powerSystemFault === 1){ gridModel.append({name:TranslateStr.menu_powerSystemFaultStr,nameEn:TranslateStr.menu_powerSystemFaultEnStr,dayColor:"#c80000",nightColor:"#c80000"})}
        if(DataSource.lvps === 1) { gridModel.append({name:TranslateStr.menu_lvpsStr,nameEn:TranslateStr.menu_lvpsEnStr,dayColor:"#c80000",nightColor:"#c80000"})}
        if(DataSource.lowBatteryError === 1) { gridModel.append({name:DataSource.vehicleType === 2?TranslateStr.menu_lowBatteryErrorStr_hev:TranslateStr.menu_lowBatteryErrorStr_ev,nameEn:DataSource.vehicleType === 2?TranslateStr.menu_lowBatteryErrorEnStr_hev:TranslateStr.menu_lowBatteryErrorEnStr_ev,dayColor:"#c80000",nightColor:"#c80000"})}
        if(DataSource.checkVehicleNetwork === 1) { gridModel.append({name:TranslateStr.menu_checkVehicleNetworkStr,nameEn:TranslateStr.menu_checkVehicleNetworkEnStr,dayColor:"#c80000",nightColor:"#c80000"})}
        if(DataSource.transmissionSystemFault === 1) { gridModel.append({name:TranslateStr.menu_transmissionSystemFaultStr,nameEn:TranslateStr.menu_transmissionSystemFaultEnStr,dayColor:"#c80000",nightColor:"#c80000"})}
        if(DataSource.checkTransmissionSystem === 1) { gridModel.append({name:TranslateStr.menu_checkTransmissionSystemStr,nameEn:TranslateStr.menu_checkTransmissionSystemEnStr,dayColor:"#c80000",nightColor:"#c80000"})}
        if(DataSource.lowBattery === 1) { gridModel.append({name:TranslateStr.menu_lowBatteryStr,nameEn:TranslateStr.menu_lowBatteryEnStr,dayColor:"#c80000",nightColor:"#c80000"})}
        if(DataSource.evLimited === 1) { gridModel.append({name:TranslateStr.menu_evLimitedStr,nameEn:TranslateStr.menu_evLimitedStr,dayColor:"#c80000",nightColor:"#c80000"})}
        if(DataSource.checkEpbSystem === 1) { gridModel.append({name:TranslateStr.menu_checkEpbSystemStr,nameEn:TranslateStr.menu_checkEpbSystemEnStr,dayColor:"#c80000",nightColor:"#c80000"})}
        if(DataSource.slidingRisk === 1) { gridModel.append({name:TranslateStr.menu_slidingRiskStr,nameEn:TranslateStr.menu_slidingRiskEnStr,dayColor:"#c88800",nightColor:"#fff000"})}
        if(DataSource.checkLvps === 1) { gridModel.append({name:TranslateStr.menu_checkLvpsStr,nameEn:TranslateStr.menu_checkLvpsEnStr,dayColor:"#c80000",nightColor:"#c80000"})}
        if(DataSource.checkEngineSystem === 1) { gridModel.append({name:TranslateStr.menu_checkEngineSystemStr,nameEn:TranslateStr.menu_checkEngineSystemEnStr,dayColor:"#c80000",nightColor:"#c80000"})}
        if(DataSource.engineAccessoryLimited === 1) { gridModel.append({name:TranslateStr.menu_engineAccessoryLimitedStr,nameEn:TranslateStr.menu_engineAccessoryLimitedEnStr,dayColor:"#c80000",nightColor:"#c80000"})}
        if(DataSource.transmissionLimited === 1) { gridModel.append({name:TranslateStr.menu_transmissionLimitedStr,nameEn:TranslateStr.menu_transmissionLimitedEnStr,dayColor:"#c80000",nightColor:"#c80000"})}
        if(DataSource.dultchOverheat === 1) { gridModel.append({name:TranslateStr.menu_dultchOverheatStr,nameEn:TranslateStr.menu_dultchOverheatEnStr,dayColor:"#c80000",nightColor:"#c80000"})}
        if(DataSource.gearboxOil === 1) { gridModel.append({name:TranslateStr.menu_gearboxOilStr,nameEn:TranslateStr.menu_gearboxOilEnStr,dayColor:"#c80000",nightColor:"#c80000"})}
        if(DataSource.checkSrs === 1) { gridModel.append({name:TranslateStr.menu_checkSrsStr,nameEn:TranslateStr.menu_checkSrsEnStr,dayColor:"#c80000",nightColor:"#c80000"})}
        if(DataSource.checkAdb === 1) { gridModel.append({name:TranslateStr.menu_checkAdbStr,nameEn:TranslateStr.menu_checkAdbEnStr,dayColor:"#c88800",nightColor:"#fff000"})}
        if(DataSource.checkPowerSystem === 1) { gridModel.append({name:TranslateStr.menu_checkPowerSystemStr,nameEn:TranslateStr.menu_checkPowerSystemEnStr,dayColor:"#c88800",nightColor:"#fff000"})}
        if(DataSource.checkHeadlampSystem === 1) { gridModel.append({name:TranslateStr.menu_checkHeadlampSystemStr,nameEn:TranslateStr.menu_checkHeadlampSystemEnStr,dayColor:"#c88800",nightColor:"#fff000"})}
        if(DataSource.failStartEngine === 1) { gridModel.append({name:TranslateStr.menu_failStartEngineStr,nameEn:TranslateStr.menu_failStartEngineEnStr,dayColor:"#c80000",nightColor:"#c80000"})}
        if(DataSource.lowCoolantLevel === 1) { gridModel.append({name:TranslateStr.menu_lowCoolantLevelStr,nameEn:TranslateStr.menu_lowCoolantLevelEnStr,dayColor:"#c88800",nightColor:"#fff000"})}
        if(DataSource.actmsError === 1) { gridModel.append({name:TranslateStr.menu_actmsErrorStr,nameEn:TranslateStr.menu_actmsErrorEnStr,dayColor:"#c88800",nightColor:"#fff000"})}
        if(DataSource.lowOilLevel === 1) { gridModel.append({name:TranslateStr.menu_lowOilLevelStr,nameEn:TranslateStr.menu_lowOilLevelEnStr,dayColor:"#c88800",nightColor:"#fff000"})}
        if(DataSource.highOilLevel === 1) { gridModel.append({name:TranslateStr.menu_highOilLevelStr,nameEn:TranslateStr.menu_highOilLevelEnStr,dayColor:"#c88800",nightColor:"#fff000"})}
        if(DataSource.checkOilDetect === 1) { gridModel.append({name:TranslateStr.menu_checkOilDetectStr,nameEn:TranslateStr.menu_checkOilDetectEnStr,dayColor:"#c88800",nightColor:"#fff000"})}
        if(DataSource.checkTpms === 1) { gridModel.append({name:TranslateStr.menu_checkTpmsStr,nameEn:TranslateStr.menu_checkTpmsEnStr,dayColor:"#c88800",nightColor:"#fff000"})}
        if(DataSource.tireLow === 1) { gridModel.append({name:TranslateStr.menu_tireLowStr,nameEn:TranslateStr.menu_tireLowEnStr,dayColor:"#c88800",nightColor:"#fff000"})}
        if(DataSource.checkBrakingSystem === 1) { gridModel.append({name:TranslateStr.menu_checkBrakingSystemStr,nameEn:TranslateStr.menu_checkBrakingSystemEnStr,dayColor:"#c88800",nightColor:"#fff000"})}
        if(DataSource.checkAbs === 1) { gridModel.append({name:TranslateStr.menu_checkAbsStr,nameEn:TranslateStr.menu_checkAbsEnStr,dayColor:"#c88800",nightColor:"#fff000"})}
        if(DataSource.checkGenerator === 1) { gridModel.append({name:TranslateStr.menu_checkGeneratorStr,nameEn:TranslateStr.menu_checkGeneratorEnStr,dayColor:"#c88800",nightColor:"#fff000"})}
        if(DataSource.checkShiftSystem === 1) { gridModel.append({name:TranslateStr.menu_checkShiftSystemStr,nameEn:TranslateStr.menu_checkShiftSystemEnStr,dayColor:"#c88800",nightColor:"#fff000"})}
        if(DataSource.checkEspSystem === 1) { gridModel.append({name:TranslateStr.menu_checkEspSystemStr,nameEn:TranslateStr.menu_checkEspSystemEnStr,dayColor:"#c88800",nightColor:"#fff000"})}
        if(DataSource.checkHdcSystem === 1) { gridModel.append({name:TranslateStr.menu_checkHdcSystemStr,nameEn:TranslateStr.menu_checkHdcSystemEnStr,dayColor:"#c88800",nightColor:"#fff000"})}
        if(DataSource.checkBrakWear === 1) { gridModel.append({name:TranslateStr.menu_checkBrakWearStr,nameEn:TranslateStr.menu_checkBrakWearEnStr,dayColor:"#c88800",nightColor:"#fff000"})}
        if(DataSource.checkMultVideo === 1) { gridModel.append({name:TranslateStr.menu_checkMultVideoStr,nameEn:TranslateStr.menu_checkMultVideoEnStr,dayColor:"#c88800",nightColor:"#fff000"})}
        if(DataSource.checkMmwRadar === 1) { gridModel.append({name:TranslateStr.menu_checkMmwRadarStr,nameEn:TranslateStr.menu_checkMmwRadarEnStr,dayColor:"#c88800",nightColor:"#fff000"})}
        if(DataSource.aebSystemLimited === 1) { gridModel.append({name:TranslateStr.menu_aebSystemLimitedStr,nameEn:TranslateStr.menu_aebSystemLimitedEnStr,dayColor:"#c88800",nightColor:"#fff000"})}
        if(DataSource.lksLimited === 1) { gridModel.append({name:TranslateStr.menu_lksLimitedStr,nameEn:TranslateStr.menu_lksLimitedEnStr,dayColor:"#c88800",nightColor:"#fff000"})}
        if(DataSource.accSystemLimited === 1) { gridModel.append({name:TranslateStr.menu_accSystemLimitedStr,nameEn:TranslateStr.menu_accSystemLimitedEnStr,dayColor:"#c88800",nightColor:"#fff000"})}
        if(DataSource.ldwsLimited === 1) { gridModel.append({name:TranslateStr.menu_ldwsLimitedStr,nameEn:TranslateStr.menu_ldwsLimitedEnStr,dayColor:"#c88800",nightColor:"#fff000"})}
        if(DataSource.bsdSystemLimited === 1) { gridModel.append({name:TranslateStr.menu_bsdSystemLimitedStr,nameEn:TranslateStr.menu_bsdSystemLimitedEnStr,dayColor:"#c88800",nightColor:"#fff000"})}
        if(DataSource.refuleDieselAcHeater === 1) { gridModel.append({name:TranslateStr.menu_refuleDieselAcHeaterStr,nameEn:TranslateStr.menu_refuleDieselAcHeaterEnStr,dayColor:"#c88800",nightColor:"#fff000"})}
        if(DataSource.checkDischargEquipment === 1) { gridModel.append({name:TranslateStr.menu_checkDischargEquipmentStr,nameEn:TranslateStr.menu_checkDischargEquipmentEnStr,dayColor:"#c88800",nightColor:"#fff000"})}
        if(DataSource.checkExternalChargeEquipment === 1) { gridModel.append({name:TranslateStr.menu_checkExternalChargeEquipmentStr,nameEn:TranslateStr.menu_checkExternalChargeEquipmentEnStr,dayColor:"#c88800",nightColor:"#fff000"})}
        if(DataSource.checkObsSystem === 1) { gridModel.append({name:TranslateStr.menu_checkObsSystemStr,nameEn:TranslateStr.menu_checkObsSystemEnStr,dayColor:"#c88800",nightColor:"#fff000"})}
        if(DataSource.lowBatteryLimited === 1) { gridModel.append({name:TranslateStr.menu_lowBatteryLimitedStr,nameEn:TranslateStr.menu_lowBatteryLimitedEnStr,dayColor:"#c88800",nightColor:"#fff000"})}
        if(DataSource.compulsiveEVMode === 1) { gridModel.append({name:TranslateStr.menu_compulsiveEVModeStr,nameEn:TranslateStr.menu_compulsiveEVModeEnStr,dayColor:"#c88800",nightColor:"#fff000"})}
        if(DataSource.bydShopMaintenance === 1) { gridModel.append({name:TranslateStr.menu_bydShopMaintenanceStr,nameEn:TranslateStr.menu_bydShopMaintenanceEnStr,dayColor:"#c88800",nightColor:"#fff000"})}
        if(DataSource.gpfService === 1) { gridModel.append({name:TranslateStr.menu_gpfServiceStr,nameEn:TranslateStr.menu_gpfServiceEnStr,dayColor:"#c88800",nightColor:"#fff000"})}
        if(DataSource.stopDischargeLowBattery === 1) { gridModel.append({name:TranslateStr.menu_stopDischargeLowBatteryStr,nameEn:TranslateStr.menu_stopDischargeLowBatteryEnStr,dayColor:"#c88800",nightColor:"#fff000"})}
        if(DataSource.chargeInTime === 1) { gridModel.append({name:TranslateStr.menu_chargeInTimeStr,nameEn:TranslateStr.menu_chargeInTimeEnStr,dayColor:"#c88800",nightColor:"#fff000"})}
        if(DataSource.releaseParkingBrake === 1) { gridModel.append({name:TranslateStr.menu_releaseParkingBrakeStr,nameEn:TranslateStr.menu_releaseParkingBrakeEnStr,dayColor:"#c88800",nightColor:"#fff000"})}
        if(DataSource.releaseEpb === 1) { gridModel.append({name:TranslateStr.menu_releaseEpbStr,nameEn:TranslateStr.menu_releaseEpbEnStr,dayColor:"#c88800",nightColor:"#fff000"})}
        if(DataSource.pleaseRefuel === 1) { gridModel.append({name:TranslateStr.menu_pleaseRefuelStr,nameEn:TranslateStr.menu_pleaseRefuelEnStr,dayColor:"#c88800",nightColor:"#fff000"})}
        if(DataSource.apaLimited === 1) { gridModel.append({name:TranslateStr.menu_apaLimitedStr,nameEn:TranslateStr.menu_apaLimitedEnStr,dayColor:"#c88800",nightColor:"#fff000"})}
        if(DataSource.checkMsrSystem === 1) { gridModel.append({name:TranslateStr.menu_checkMsrSystemStr,nameEn:TranslateStr.menu_checkMsrSystemEnStr,dayColor:"#c88800",nightColor:"#fff000"})}
        if(DataSource.checkMemorySystem === 1) { gridModel.append({name:TranslateStr.menu_checkMemorySystemStr,nameEn:TranslateStr.menu_checkMemorySystemEnStr,dayColor:"#c88800",nightColor:"#fff000"})}
        if(DataSource.checkSunroofSystem === 1) { gridModel.append({name:TranslateStr.menu_checkSunroofSystemStr,nameEn:TranslateStr.menu_checkSunroofSystemEnStr,dayColor:"#c88800",nightColor:"#fff000"})}
        if(DataSource.acLimited === 1) { gridModel.append({name:TranslateStr.menu_acLimitedStr,nameEn:TranslateStr.menu_acLimitedEnStr,dayColor:"#c88800",nightColor:"#fff000"})}
        if(DataSource.batteryCauseAcLimited === 1) { gridModel.append({name:TranslateStr.menu_batteryCauseAcLimitedStr,nameEn:TranslateStr.menu_batteryCauseAcLimitedEnStr,dayColor:"#c88800",nightColor:"#fff000"})}
        if(DataSource.batteryCausePowerLimited === 1) { gridModel.append({name:TranslateStr.menu_batteryCausePowerLimitedStr,nameEn:TranslateStr.menu_batteryCausePowerLimitedEnStr,dayColor:"#c88800",nightColor:"#fff000"})}
        if(DataSource.accBrakePads === 1) { gridModel.append({name:TranslateStr.menu_accBrakePadsStr,nameEn:TranslateStr.menu_accBrakePadsEnStr,dayColor:"#c88800",nightColor:"#fff000"})}
        if(DataSource.keyDayLeft !== 0) {
            gridModel.append({name:TranslateStr.menu_keyDayLeftStr,nameEn:TranslateStr.menu_keyDayLeftStr,dayColor:"#c88800",nightColor:"#fff000"})}
        if(DataSource.keyHourLeft !== 0) {
            gridModel.append({name:TranslateStr.menu_keyHourLeftStr,nameEn:TranslateStr.menu_keyHourLeftStr,dayColor:"#c88800",nightColor:"#fff000"})}
    }

    function updateFaultPage(){
        var page = Math.ceil(DataSource.historyFaultCount/3)
        console.log("page = " + page)
        console.log("gridView.count = " + gridView.count)
        if(lastPage !== page){
            lastPage = page
            for(var i= 0; i < lastPage; i++){
                listModel.append({})
            }

            if (page > 1 && isFault){
                listModel.remove(page, listModel.count-page)
            } else if(page === 1) {
                listModel.clear()
                listModel.append({})
            }
        }

        listView.positionViewAtBeginning()
        listView.currentIndex = 0
    }
}
