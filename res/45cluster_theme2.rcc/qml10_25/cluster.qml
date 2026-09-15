import QtQuick 2.15
import QtQuick.Window 2.14
import QtQuick.Controls 2.5
import com.byd.DataSource 1.0
import com.byd.WarningLight 1.0
import QtQuick3D 1.15
import QtGraphicalEffects 1.0
import com.byd.AndroidNativeWindowItem 1.0
import "./alwaysDisplay"
import "qrc:/common/singleton"
import "./adas3d"
import Qt.labs.settings 1.0
import QtWebSockets 1.1
import QtQuick.Particles 2.15

Item {

    Skin {
        id: skinValue
    }

    id:rootItemId
    width: 1920
    height: 720
    scale: DataSource.screenSize === 0x01 ? 2/3:1
    x:DataSource.screenSize === 0x01 ? -320 : 0
    y:DataSource.screenSize === 0x01 ? -120 : 0
property string ziti:haogeSettings.storedziti	
property int jiacu:haogeSettings.storedjiacu
property int ding:0	
property string bgday: ""
property string bgnight: ""
property int xpadas:haogeSettings.storedxpadas
onXpadasChanged: {
checkAndLoadTestComponent();
checkAndLoadTestComponentb();
} 
property int maptime:haogeSettings.storedmaptime
property int danwei:haogeSettings.storeddanwei
property int suduy:haogeSettings.storedsuduy
property int xpadasa:haogeSettings.storedxpadasa
property int xpadasb:haogeSettings.storedxpadasb
property int xpadasc:haogeSettings.storedxpadasc
property int adasx:haogeSettings.storedadasx
property int kunkun:0	
property int zhinanzhenkg1:haogeSettings.storedzhinanzhenkg1
property int zhinanzhenkg2:haogeSettings.storedzhinanzhenkg2
property int zhinanzhenkg3:haogeSettings.storedzhinanzhenkg3
property int zhinanzhenkg4:haogeSettings.storedzhinanzhenkg4		
property int zhinanzhen1:haogeSettings.storedzhinanzhen1
property int zhinanzhen2:haogeSettings.storedzhinanzhen2
property int zhinanzhen3:haogeSettings.storedzhinanzhen3
property int zhinanzhen4:haogeSettings.storedzhinanzhen4	
property double beishu1:haogeSettings.storedbeishu1
property double beishu2:haogeSettings.storedbeishu2 
property double beishu3:haogeSettings.storedbeishu3 
property double beishu4:haogeSettings.storedbeishu4
property int zhinanzhenx1:haogeSettings.storedzhinanzhenx1 
property int zhinanzhenx2:haogeSettings.storedzhinanzhenx2
property int zhinanzhenx3:haogeSettings.storedzhinanzhenx3
property int zhinanzhenx4:haogeSettings.storedzhinanzhenx4
property int zhinanzheny1:haogeSettings.storedzhinanzheny1
property int zhinanzheny2:haogeSettings.storedzhinanzheny2
property int zhinanzheny3:haogeSettings.storedzhinanzheny3
property int zhinanzheny4:haogeSettings.storedzhinanzheny4
property int timeX: haogeSettings.storedTimeX
property int timeY: haogeSettings.storedTimeY
property int fangweiX: haogeSettings.storedFangweiX
property int fangweiY: haogeSettings.storedFangweiY
property int tempX: haogeSettings.storedTempX
property int tempY: haogeSettings.storedTempY
property int ecoX: haogeSettings.storedEcoX
property int ecoY: haogeSettings.storedEcoY
property int sportX: haogeSettings.storedSportX
property int sportY: haogeSettings.storedSportY
property int normalX: haogeSettings.storedNormalX
property int normalY: haogeSettings.storedNormalY
property int evX: haogeSettings.storedEvX
property int evY: haogeSettings.storedEvY
property int hevX: haogeSettings.storedHevX
property int hevY: haogeSettings.storedHevY
property int okX: haogeSettings.storedOkX
property int okY: haogeSettings.storedOkY
property int autoHoldX: haogeSettings.storedAutoHoldX
property int autoHoldY: haogeSettings.storedAutoHoldY
property int epbX: haogeSettings.storedEpbX
property int epbY: haogeSettings.storedEpbY
property int lowBeamX: haogeSettings.storedLowBeamX
property int lowBeamY: haogeSettings.storedLowBeamY
property int smallLightX: haogeSettings.storedSmallLightX
property int smallLightY: haogeSettings.storedSmallLightY
property int highBeamX: haogeSettings.storedHighBeamX
property int highBeamY: haogeSettings.storedHighBeamY
property int leftTurnX: haogeSettings.storedLeftTurnX
property int leftTurnY: haogeSettings.storedLeftTurnY
property int rightTurnX: haogeSettings.storedRightTurnX
property int rightTurnY: haogeSettings.storedRightTurnY
property int rearFogX: haogeSettings.storedRearFogX
property int rearFogY: haogeSettings.storedRearFogY
property int seatBeltX: haogeSettings.storedSeatBeltX
property int seatBeltY: haogeSettings.storedSeatBeltY
property int cruiseMainX: haogeSettings.storedCruiseMainX
property int cruiseMainY: haogeSettings.storedCruiseMainY
property int cruiseSetX: haogeSettings.storedCruiseSetX
property int cruiseSetY: haogeSettings.storedCruiseSetY
property int trafficSign2X: haogeSettings.storedTrafficSign2X
property int trafficSign2Y: haogeSettings.storedTrafficSign2Y
property int windowX: haogeSettings.storedWindowX
property int windowY: haogeSettings.storedWindowY
property int fangweiFutureX: haogeSettings.storedFangweiFutureX
property int fangweiFutureY: haogeSettings.storedFangweiFutureY
property int timeFutureX: haogeSettings.storedTimeFutureX
property int timeFutureY: haogeSettings.storedTimeFutureY
property int tempFutureX: haogeSettings.storedTempFutureX
property int tempFutureY: haogeSettings.storedTempFutureY
property int platformIconX: haogeSettings.storedPlatformIconX
property int platformIconY: haogeSettings.storedPlatformIconY
property int pemLightX: haogeSettings.storedPemLightX
property int pemLightY: haogeSettings.storedPemLightY
property int prndSliderX: haogeSettings.storedPrndSliderX
property int prndSliderY: haogeSettings.storedPrndSliderY
property int gearModeX: haogeSettings.storedGearModeX
property int gearModeY: haogeSettings.storedGearModeY
property int cabinTempX: haogeSettings.storedCabinTempX
property int cabinTempY: haogeSettings.storedCabinTempY
property int cabinTempFutureX: haogeSettings.storedCabinTempFutureX
property int cabinTempFutureY: haogeSettings.storedCabinTempFutureY
property int tempUnit2X: haogeSettings.storedTempUnit2X
property int tempUnit2Y: haogeSettings.storedTempUnit2Y
property int tempUnit2FutureX: haogeSettings.storedTempUnit2FutureX
property int tempUnit2FutureY: haogeSettings.storedTempUnit2FutureY
property int lowBeamFutureX: haogeSettings.storedLowBeamFutureX
property int lowBeamFutureY: haogeSettings.storedLowBeamFutureY
property int highBeamFutureX: haogeSettings.storedHighBeamFutureX
property int highBeamFutureY: haogeSettings.storedHighBeamFutureY
property int smallLightFutureX: haogeSettings.storedSmallLightFutureX
property int smallLightFutureY: haogeSettings.storedSmallLightFutureY
property int readyX: haogeSettings.storedReadyX
property int readyY: haogeSettings.storedReadyY
property int moshiX: haogeSettings.storedMoshiX
property int moshiY: haogeSettings.storedMoshiY
property int trafficBorder2X: haogeSettings.storedTrafficBorder2X
property int trafficBorder2Y: haogeSettings.storedTrafficBorder2Y
property int energyX: haogeSettings.storedEnergyX
property int energyY: haogeSettings.storedEnergyY

property int sududaxiao:haogeSettings.storedsududaxiao	
property int chechuang:haogeSettings.storedchechuang	
property int tanqi:	haogeSettings.storedtanqi
property int driverWindowPercent: 0      
property int passengerWindowPercent: 0   
property int leftRearWindowPercent: 0    
property int rightRearWindowPercent: 0   
property int caidan:1		
property color suduyanse1:haogeSettings.storedsuduyanse1	
property color suduyanse2:haogeSettings.storedsuduyanse2	
property int adasy:haogeSettings.storedadasy	
property int shijian:0	
property int currentIndexdangwei:1		
property int quanping:haogeSettings.storedquanping
property int mapcurrentDayBgIndex:haogeSettings.storedmapcurrentDayBgIndex
property int mapcurrentNightBgIndex:haogeSettings.storedmapcurrentNightBgIndex
property string dayHaogea:haogeSettings.storeddayHaogea
property string dayHaogeb:haogeSettings.storeddayHaogeb
property string dayHaogec:haogeSettings.storeddayHaogec
property string nightHaogea:haogeSettings.storednightHaogea
property string nightHaogeb:haogeSettings.storednightHaogeb
property string nightHaogec:haogeSettings.storednightHaogec
property string faguang1:haogeSettings.storedfaguang1
property string faguang2:haogeSettings.storedfaguang2
property int banjing:haogeSettings.storedbanjing
property color diansebegin:haogeSettings.storeddiansebegin
property color dianseend:haogeSettings.storeddianseend
property color yousebegin:haogeSettings.storedyousebegin
property color youseend:haogeSettings.storedyouseend	
property int chenjin: haogeSettings.storedchenjin
property int tianji: haogeSettings.storedtianji	
property int tianji2: haogeSettings.storedtianji2
property int zdycar: haogeSettings.storedzdycar	
property string car: haogeSettings.storedcar	
property int weilai: haogeSettings.storedweilai	 	
onWeilaiChanged: {
checkAndLoadTestComponent();
checkAndLoadTestComponentb();
} 
property string yanse1: haogeSettings.storedYanse1	
property string yanse2: haogeSettings.storedYanse2
property string accyanse1: haogeSettings.storedaccYanse1	
property string accyanse2: haogeSettings.storedaccYanse2
property string accyanse3: haogeSettings.storedaccYanse3	
property string accyanse4: haogeSettings.storedaccYanse4
property var previousGearMode: null
property int dongneng: haogeSettings.storeddongneng
property int dianji: haogeSettings.storeddianji
property string miYue: haogeSettings.storedMiYue
property int xiMen: haogeSettings.storedXiMen
property int dingSu: haogeSettings.storedDingSu
property int batteryPercentage: 0
property string externalChargea: ""
property string currentPosition: ""
property string currentValues: "电量百分比" + DataSource.powerBatterySoc + 
                        "@油量百分比" + DataSource.fuelPercent +
                        "@用电百分比" + yongDian +
                        "@用油百分比" + yongYou +
                        "@掉电百分比" + diaoDian +
                        "@电续航里程" + DataSource.socMile + 
                        "@HEV续航里程" + DataSource.fuelMile + 
                        "@平均电耗" + DataSource.accAvgPowerValue + 
                        "@平均油耗" + DataSource.accAvgFuelValue + 
                        "@近期电耗" + DataSource.recent50PowerValue + 
                        "@近期油耗" + DataSource.recent50FuelValue + 
                        "@外部充电量" + DataSource.externalCharge +
                        "@本次行驶时间" + tripTime +
                        "@本次里程" + tripMileage + 
                        "@本次电耗" + electricityConsumption +
                        "@本次油耗" + fuelConsumption +
                        "@本次费用" + tripCost +
						"@位置" + currentPosition +
                        "@上次充电" + socIncreaseRounded + "%" + chargeAmountRounded + "度"					
property int yongDian: 0
property int diaoDian: 0
property int jieshuDian: 0
property int chushiDian: 0
property int chushiYou: 0
property int yongYou: 0	
property double x1: 0.0
property double x2: 0.0
property double x3: 0.0
property int x4: 0
property int x5: 0
property int x6: 0	
property int x7: 0
property int x8: 0	
property int y1: 0
property int y2: 0
property int y3: 0
property int y4: 0
property int y5: 0
property int y6: 0	
property int y7: 0
property int y8: 0	
property int chuXing: haogeSettings.storedChuXing
property int woShuo: 0
property int latestmultimediaPlayStatus: 2
property var testComponentb: null
property int anQuan: haogeSettings.storedAnQuan
property int carInfob: haogeSettings.storedCarInfob
property int fetchRetryCount: 0
property string weiFeng: ""	
property string lastCarinfo: ""
property int faDong: haogeSettings.storedFaDong	
property int shenDu: 0
property int jinDu: haogeSettings.storedJinDu
property int carInfo: haogeSettings.storedCarInfo
property int laoBan: haogeSettings.storedLaoBan
property int currentIndexnew: 0
property int multimediaPlayStatus: 2
property int xuXian: haogeSettings.storedXuXian
property bool isDayMode: DataSource.dayNightMode === 0x01
property int duoJiao: 0	
property int adAs: haogeSettings.storedAdAs
property int noL2: haogeSettings.storedNoL2	
property int xiaoXiao: haogeSettings.storedXiaoXiao	
property int danDan: 1	
property int cheXing: haogeSettings.storedCheXing	
property int haoKun: 0
property int daoLu: haogeSettings.storedDaoLu	
property int yuJing: haogeSettings.storedYuJing	
property int smallMap: haogeSettings.storedSmallMap
onSmallMapChanged: {
if(DataSource.naviTypeStore === 1) {
    updateAdasContainer();
    checkAndLoadTestComponent();
	checkAndLoadTestComponentb();
    wenHao.restart();
    wenhaoGe.visible = true;
    modeSwitchItem.visible = true;
    imageTimer.restart();
    jingJing.restart();
    DataSource.sendPluginMsgInt(DataSource.RECV_MSG_ID_NAVI_TYPE, 1);
    DataSource.sendPluginMsgInt(DataSource.RECV_MSG_ID_MENU_NAVI_TYPE, 3);
    updateFullNaviDayNightModeChangeBgImageSource();	
	}
}
property real dianJia: haogeSettings.storedDianJia
property real youJia: haogeSettings.storedYouJia
property real dianChi: haogeSettings.storedDianChi
property int baiSegg: haogeSettings.storedBaiSegg
property int heiSegg: haogeSettings.storedHeiSegg
property int baiZhonggg: haogeSettings.storedBaiZhonggg
property int heiZhonggg: haogeSettings.storedHeiZhonggg
property int baiYougg: haogeSettings.storedBaiYougg
property int heiYougg: haogeSettings.storedHeiYougg
property int haoYu: haogeSettings.storedHaoYu	
property int jianYi: haogeSettings.storedJianYi
property int laoJi: haogeSettings.storedLaoJi	
property int shuHan: haogeSettings.storedShuHan
property int currentDayBgIndex: haogeSettings.storedCurrentDayBgIndex
property int currentNightBgIndex: haogeSettings.storedCurrentNightBgIndex
property int maxDayBgImages: 5
property int maxNightBgImages: 6
property int mPrevBatteryMode: 0
property real speedLimitRatio: 0.0
property double initialCharge: 0
property double initialSoc: 0	
property string chargeAmountRounded: haogeSettings.storedChargeAmountRounded
property string socIncreaseRounded: haogeSettings.storedSocIncreaseRounded
property string calculatedValueRounded: haogeSettings.storedCalculatedValueRounded		
property string dayHaoge1: haogeSettings.storedDayHaoge1
property string dayHaoge2: haogeSettings.storedDayHaoge2
property string dayHaoge3: haogeSettings.storedDayHaoge3
property string nightHaoge1: haogeSettings.storedNightHaoge1
property string nightHaoge2: haogeSettings.storedNightHaoge2
property string nightHaoge3: haogeSettings.storedNightHaoge3
property string dayZhanggea1: haogeSettings.storedDayZhanggea1
property string dayZhanggea2: haogeSettings.storedDayZhanggea2
property string dayZhanggea3: haogeSettings.storedDayZhanggea3
property string nightZhanggea1: haogeSettings.storedNightZhanggea1
property string nightZhanggea2: haogeSettings.storedNightZhanggea2
property string nightZhanggea3: haogeSettings.storedNightZhanggea3
property string dayZhanggeb1: haogeSettings.storedDayZhanggeb1
property string dayZhanggeb2: haogeSettings.storedDayZhanggeb2
property string dayZhanggeb3: haogeSettings.storedDayZhanggeb3
property string nightZhanggeb1: haogeSettings.storedNightZhanggeb1
property string nightZhanggeb2: haogeSettings.storedNightZhanggeb2
property string nightZhanggeb3: haogeSettings.storedNightZhanggeb3
property int xiaoPingday1: haogeSettings.storedXiaoPingday1
property int xiaoPingnight1: haogeSettings.storedXiaoPingnight1
property int xiaoPingday2: haogeSettings.storedXiaoPingday2
property int xiaoPingnight2: haogeSettings.storedXiaoPingnight2
property int lastRequestedAccSpeed: 0	
property int lastRequestedDistanceLevel: 0	
property bool isFetchingVehicleData: false
property int shanGan: haogeSettings.storedShanGan
property int wuNai: haogeSettings.storedWuNai
property int xiuXi: haogeSettings.storedXiuXi		
property int cheMo: 0	
property int meiTi: haogeSettings.storedMeiTi	
property int haoGe: haogeSettings.storedHaoGe	
property int weiBo: haogeSettings.storedWeiBo
property string apiMessage: ""
property string valueTwo: "0"  
property string valueThree: "0"	
property string yiBiao: haogeSettings.storedYiBiao
property string moShi: haogeSettings.storedMoShi		
property int yinYuan: 0	
property var currentSongData: null
property string currentSongTitle: ""
property var lyricTimer: null
property int currentLyricIndex: 0
property var lyricsArray: []
property int songDuration: 0
property int currentLyricTime: 0
property Timer lyricSyncTimer: Timer {
    interval: 100
    repeat: true
    running: multimediaPlayStatus === 1
    onTriggered: {
        updateLyricsAndProgress();
    }
}	
property string tripTime: "00:00:00"	
property string tripMileage: "0"
property string electricityConsumption: "0"
property string fuelConsumption: "0"
property string tripCost: "0"
property string engineRpm: "0"	
property string cabinTemp: "0"
property string initialMileage: "0"
property string initialElectricityConsumption: "0"
property string initialFuelConsumption: "0"
property string ceShi: ""   
property bool hasRecordedInitialData: false	
property int brakeState: 0
property int turnLight: 0
property string coverImageData: ""
property string songName: ""
onWebSocketConnectedChanged: {
    if(webSocketConnected) {
        shenDu = 1
    }
}
property var webSocket: null
property string webSocketMessage: ""
property bool webSocketConnected: false
property bool reconnectTimerRunning: false
property bool reconnectTimer2Running: false
property var webSocket2: null
property string webSocket2Message: ""
property bool webSocket2Connected: false
property var testComponent: null
    //isCauseByDayNightModeChanged:用于判断地图投屏显示时，判断是否深浅模式切换，需要全屏背景遮挡地图
    property bool isCauseByDayNightModeChanged: false
Settings {
    id: haogeSettings
	property string storedziti:"HarmonyOS Sans SC"
	property int storedjiacu:1
	property int storedmaptime:0
	property int storeddanwei:0
	property int storedsuduy:0
	property int storedxpadas:0
	property int storedxpadasa:0
	property int storedxpadasb:0
	property int storedxpadasc:0
	property int storedadasx:0
	property int storedzhinanzhenkg1:0
	property int storedzhinanzhenkg2:0
	property int storedzhinanzhenkg3:0
	property int storedzhinanzhenkg4:0
	property int storedzhinanzhen1:0
	property int storedzhinanzhen2:0
	property int storedzhinanzhen3:0
	property int storedzhinanzhen4:0
	property int storedzhinanzheny1:0
	property int storedzhinanzheny2:0
	property int storedzhinanzheny3:0
	property int storedzhinanzheny4:0
	property int storedzhinanzhenx1:0
	property int storedzhinanzhenx2:0
	property int storedzhinanzhenx3:0
	property int storedzhinanzhenx4:0
	property int storedTimeX: 0
	property int storedTimeY: 0
	property int storedFangweiX: 0
	property int storedFangweiY: 0
	property int storedTempX: 0
	property int storedTempY: 0
	property int storedEcoX: 0
	property int storedEcoY: 0
	property int storedSportX: 0
	property int storedSportY: 0
	property int storedNormalX: 0
	property int storedNormalY: 0
	property int storedEvX: 0
	property int storedEvY: 0
	property int storedHevX: 0
	property int storedHevY: 0
	property int storedOkX: 0
	property int storedOkY: 0
	property int storedAutoHoldX: 0
    property int storedAutoHoldY: 0
    property int storedEpbX: 0
    property int storedEpbY: 0
    property int storedLowBeamX: 0
    property int storedLowBeamY: 0
    property int storedSmallLightX: 0
    property int storedSmallLightY: 0
    property int storedHighBeamX: 0
    property int storedHighBeamY: 0
    property int storedLeftTurnX: 0
    property int storedLeftTurnY: 0
    property int storedRightTurnX: 0
    property int storedRightTurnY: 0
	property int storedRearFogX: 0
    property int storedRearFogY: 0
	property int storedSeatBeltX: 0
    property int storedSeatBeltY: 0
	property int storedCruiseMainX: 0
    property int storedCruiseMainY: 0
    property int storedCruiseSetX: 0
    property int storedCruiseSetY: 0
    property int storedTrafficSign2X: 0
    property int storedTrafficSign2Y: 0
    property int storedWindowX: 0
    property int storedWindowY: 0
    property int storedFangweiFutureX: 0
    property int storedFangweiFutureY: 0
    property int storedTimeFutureX: 0
    property int storedTimeFutureY: 0
    property int storedTempFutureX: 0
    property int storedTempFutureY: 0
    property int storedPlatformIconX: 0
    property int storedPlatformIconY: 0
    property int storedPemLightX: 0
    property int storedPemLightY: 0
    property int storedPrndSliderX: 0
    property int storedPrndSliderY: 0
    property int storedGearModeX: 0
    property int storedGearModeY: 0
    property int storedCabinTempX: 0
    property int storedCabinTempY: 0
    property int storedCabinTempFutureX: 0
    property int storedCabinTempFutureY: 0
    property int storedTempUnit2X: 0
    property int storedTempUnit2Y: 0
    property int storedTempUnit2FutureX: 0
    property int storedTempUnit2FutureY: 0
    property int storedLowBeamFutureX: 0
    property int storedLowBeamFutureY: 0
    property int storedHighBeamFutureX: 0
    property int storedHighBeamFutureY: 0
    property int storedSmallLightFutureX: 0
    property int storedSmallLightFutureY: 0
    property int storedReadyX: 0
    property int storedReadyY: 0
    property int storedMoshiX: 0
    property int storedMoshiY: 0
    property int storedTrafficBorder2X: 0
    property int storedTrafficBorder2Y: 0
    property int storedEnergyX: 0
    property int storedEnergyY: 0

	property double storedbeishu1:0.0
	property double storedbeishu2:0.0
	property double storedbeishu3:0.0
	property double storedbeishu4:0.0
	property int storedsududaxiao:0
	property int storedchechuang:1
	property int storedtanqi:1
	property color storedsuduyanse1:"#333333"
	property color storedsuduyanse2:"#FFFFFF"
	property int storedadasy:0
	property int storedquanping:0
	property int storedmapcurrentDayBgIndex:1
	property int storedmapcurrentNightBgIndex:1
	property string storeddayHaogea:""
	property string storeddayHaogeb:""
	property string storeddayHaogec:""
	property string storednightHaogea:""
	property string storednightHaogeb:""
	property string storednightHaogec:""
	property string storedfaguang1:"transparent"
	property string storedfaguang2:"transparent"
	property int storedbanjing:24
	property color storeddiansebegin:"#22c8c5"
	property color storeddianseend:"#46bf36"
	property color storedyousebegin:"#22c8c5"
	property color storedyouseend:"#46bf36"
	property int storedchenjin: 0
	property int storedtianji: 0    
	property int storeddianji: 145
	property string storedYanse1: "#007FFF"
	property string storedYanse2: "#007FFF"
	property string storedaccYanse1: "#ffffff"
	property string storedaccYanse2: "#ffffff"
	property string storedaccYanse3: "#007FFF"
	property string storedaccYanse4: "#007FFF"	
    property string storedMiYue: ""
    property int storedDingSu: 0
    property int storedXiMen: 0
    property int storedAnQuan: 0
    property int storedChuXing: 0
    property int storedCarInfob: 1
    property int storedFaDong: 0
    property int storedJinDu: 0
    property int storedCarInfo: 1
    property int storedLaoBan: 0
    property real storedDianJia: 0.6
    property real storedYouJia: 8
    property real storedDianChi: 18.3
    property int storedNoL2: 0
    property int storedXiaoXiao: 0
    property int storedJianYi: 1
    property int storedCheXing: 1
    property int storedHaoYu: 0
    property int storedAdAs: 1
    property int storedSmallMap: 1
    property int storedDaoLu: 0
    property int storedYuJing: 0
    property int storedShuHan: 0
    property int storedShanGan: 0
    property int storedWuNai: 1
    property int storedXuXian: 0
    property int storedXiuXi: 0
    property int storedMeiTi: 0
    property int storedHaoGe: 0
    property int storedWeiBo: 0
    property string storedMoShi: "矩形模式"
    property string storedYiBiao: ""
    property int storedBaiSegg: 1
    property int storedHeiSegg: 1
    property int storedBaiZhonggg: 1
    property int storedHeiZhonggg: 1
    property int storedBaiYougg: 1
    property int storedHeiYougg: 1
    property string storedDayHaoge1: ""
    property string storedDayHaoge2: ""
    property string storedDayHaoge3: ""
    property string storedNightHaoge1: ""
    property string storedNightHaoge2: ""
    property string storedNightHaoge3: ""
    property string storedDayZhanggea1: ""
    property string storedDayZhanggea2: ""
    property string storedDayZhanggea3: ""
    property string storedDayZhanggeb1: ""
    property string storedDayZhanggeb2: ""
    property string storedDayZhanggeb3: ""
    property string storedNightZhanggea1: ""
    property string storedNightZhanggea2: ""
    property string storedNightZhanggea3: ""
    property string storedNightZhanggeb1: ""
    property string storedNightZhanggeb2: ""
    property string storedNightZhanggeb3: ""
    property int storedXiaoPingday1: 1
    property int storedXiaoPingday2: 1
    property int storedXiaoPingnight1: 1
    property int storedXiaoPingnight2: 1
    property int storedCurrentDayBgIndex: 1
    property int storedCurrentNightBgIndex: 1
	property int storedLaoJi: 0
    property string storedChargeAmountRounded: ""
    property string storedSocIncreaseRounded: ""
    property string storedCalculatedValueRounded: ""	
}
Rectangle {
    id: blackLine
	y:50
    width: 1920
    height: 5
    color: "#000000"
    z: 9999  
	visible:false
}
Image {
    z:9999
	visible:true
    source: "qrc:/common/images/测试.png"
	}
Image {
    id: baiSe  
	visible:DataSource.dayNightMode === 1 && DataSource.powerGear === 3 && DataSource.naviTypeStore === 0 && baiSegg === 0
    source: "qrc:/images10_25/display_always/白.png"}
Image {
    id: heiSe 
    visible:DataSource.dayNightMode === 2 && DataSource.powerGear === 3 && DataSource.naviTypeStore === 0 && heiSegg === 0	
    source: "qrc:/images10_25/display_always/黑.png"}
Image {
    id: baiZhong 
    visible:smallMap === 0 && DataSource.dayNightMode === 1 && DataSource.powerGear === 3 && DataSource.naviTypeStore === 1 && baiZhonggg === 0 	
    source: "qrc:/images10_25/display_always/白中间.png"}
Image {
    id: baiYou 
    visible:smallMap === 1 && DataSource.dayNightMode === 1 && DataSource.powerGear === 3 && DataSource.naviTypeStore === 1 && baiYougg === 0	
    source: "qrc:/images10_25/display_always/白右侧.png"}
Image {
    id: heiZhong  
    visible:smallMap === 0 && DataSource.dayNightMode === 2 && DataSource.powerGear === 3 && DataSource.naviTypeStore === 1 && heiZhonggg === 0	
    source: "qrc:/images10_25/display_always/黑中间.png"}	
Image {
    id: heiYou  
    visible:smallMap === 1 && DataSource.dayNightMode === 2 && DataSource.powerGear === 3 && DataSource.naviTypeStore === 1 && heiYougg === 0		
    source: "qrc:/images10_25/display_always/黑右侧.png"}
Item {
    id: compassRoot
    x: DataSource.naviTypeStore === 0 ? 300+zhinanzhenx1 : DataSource.naviTypeStore === 1 && smallMap === 0 ? 862+zhinanzhenx2 : DataSource.naviTypeStore === 1 && smallMap === 1 ? 1502+zhinanzhenx3 : 862+zhinanzhenx4
    y: DataSource.naviTypeStore === 0 ? 300+zhinanzheny1 : DataSource.naviTypeStore === 1 && smallMap === 0 ? 288+zhinanzheny2 : DataSource.naviTypeStore === 1 && smallMap === 1 ? 288+zhinanzheny3 : 388+zhinanzheny4
    width: 200
    height: 200
    scale: DataSource.naviTypeStore === 0 ? 1.0+beishu1 : DataSource.naviTypeStore === 1 && smallMap === 0 ? 1.0+beishu2 : DataSource.naviTypeStore === 1 && smallMap === 1 ? 1.0+beishu3 : 1.0+beishu4
    visible: ((DataSource.naviTypeStore === 0 && zhinanzhenkg1 === 1) || (DataSource.naviTypeStore === 1 && zhinanzhenkg2 === 1 && smallMap === 0) || (DataSource.naviTypeStore === 1 && zhinanzhenkg3 === 1 && smallMap === 1) || (DataSource.naviTypeStore === 2 && zhinanzhenkg4 === 1)) && DataSource.powerGear === 3

    property real gabeng: DataSource.direction

    property int prevGabeng: gabeng
    property real currentRotation: 0
    property bool animationRunning: false

    function getStaticAngle(btn) {
        switch(btn) {
            case 1: return 0;
            case 2: return 45;
            case 3: return 90;
            case 4: return 135;
            case 5: return 180;
            case 6: return 225;
            case 7: return 270;
            case 8: return 315;
            default: return 0;
        }
    }

    function getTargetRotation() {
        var angle = getStaticAngle(gabeng);
        return -angle;
    }

    function startRotationAnimation(targetRot) {
        if (animationRunning) {
            rotationAnim.stop();
        }

        var from = currentRotation;
        var to = targetRot;

        var delta = to - from;
        delta = ((delta % 360) + 360) % 360;
        if (delta > 180) delta -= 360;

        if (Math.abs(delta) < 0.1) return;

        var finalTo = from + delta;

        rotationAnim.from = from;
        rotationAnim.to = finalTo;
        rotationAnim.start();

        currentRotation = finalTo;
        animationRunning = true;
    }

    onGabengChanged: {
        var newTarget = getTargetRotation();
        startRotationAnimation(newTarget);
        prevGabeng = gabeng;
    }

    NumberAnimation {
        id: rotationAnim
        target: rotatingLayer
        property: "rotation"
        duration: 400
        easing.type: Easing.InOutQuad
        onFinished: {
            animationRunning = false;
            rotatingLayer.rotation = currentRotation;
        }
    }

    Item {
        id: rotatingLayer
        anchors.fill: parent
        transformOrigin: Item.Center
        rotation: 0
Canvas {
            id: compassCanvas
            anchors.fill: parent

            property real breathPhase: 0.0
            property real expandRadius: 0.0

            Timer {
                id: breathTimer
                interval: 30
                running: (DataSource.naviTypeStore === 0 && zhinanzhen1 === 0) || (DataSource.naviTypeStore === 1 && zhinanzhen2 === 0 && smallMap === 0) || (DataSource.naviTypeStore === 1 && zhinanzhen3 === 0 && smallMap === 1) || (DataSource.naviTypeStore === 2 && zhinanzhen4 === 0)
                repeat: true
                onTriggered: {
                    compassCanvas.breathPhase += 0.05
                    if (compassCanvas.breathPhase > Math.PI * 2) {
                        compassCanvas.breathPhase = 0
                    }
                    compassCanvas.expandRadius = 4 * (Math.sin(compassCanvas.breathPhase) + 1)
                    compassCanvas.requestPaint()
                }
            }

            property int forceUpdate: zhinanzhen1 + zhinanzhen2 + zhinanzhen3 + zhinanzhen4 + DataSource.dayNightMode + smallMap + DataSource.naviTypeStore + zhinanzhenkg1 + zhinanzhenkg2 + zhinanzhenkg3 + zhinanzhenkg4
            onForceUpdateChanged: {
                requestPaint()
            }

            onPaint: {
                var ctx = getContext("2d");
                var w = width, h = height;
                ctx.clearRect(0, 0, w, h);

                var cx = w/2, cy = h/2;
                var radius = Math.min(w, h) * 0.42;

                ctx.beginPath();
                ctx.arc(cx, cy, radius + 8, 0, Math.PI * 2);
                ctx.fillStyle = (DataSource.naviTypeStore === 0 && zhinanzhen1 === 1) || (DataSource.naviTypeStore === 1 && zhinanzhen2 === 1 && smallMap === 0) || (DataSource.naviTypeStore === 1 && zhinanzhen3 === 1 && smallMap === 1) || (DataSource.naviTypeStore === 2 && zhinanzhen4 === 1) ? "#1e2a3a" : "transparent";
                ctx.fill();
                ctx.strokeStyle = (DataSource.naviTypeStore === 0 && zhinanzhen1 === 1) || (DataSource.naviTypeStore === 1 && zhinanzhen2 === 1 && smallMap === 0) || (DataSource.naviTypeStore === 1 && zhinanzhen3 === 1 && smallMap === 1) || (DataSource.naviTypeStore === 2 && zhinanzhen4 === 1) ? "#c0c0c0" : "transparent";
                ctx.lineWidth = 1.5;
                ctx.stroke();

                ctx.beginPath();
                ctx.arc(cx, cy, radius - 6, 0, Math.PI * 2);
                ctx.fillStyle = (DataSource.naviTypeStore === 0 && zhinanzhen1 === 1) || (DataSource.naviTypeStore === 1 && zhinanzhen2 === 1 && smallMap === 0) || (DataSource.naviTypeStore === 1 && zhinanzhen3 === 1 && smallMap === 1) || (DataSource.naviTypeStore === 2 && zhinanzhen4 === 1) ? "#0f1720" : "transparent";
                ctx.fill();

if ((DataSource.naviTypeStore === 0 && zhinanzhen1 === 0) ||
    (DataSource.naviTypeStore === 1 && zhinanzhen2 === 0 && smallMap === 0) ||
    (DataSource.naviTypeStore === 1 && zhinanzhen3 === 0 && smallMap === 1) ||
    (DataSource.naviTypeStore === 2 && zhinanzhen4 === 0)) {

    // 用正弦波控制透明度，形成呼吸感
    var pulseAlpha = 0.5 + 0.5 * Math.sin(compassCanvas.breathPhase);
    // expandRadius 已有的 0~8 范围，这里直接用它的一半作为脉冲偏移
    var pulseRadius = radius - 6 + compassCanvas.expandRadius * 0.5;

    ctx.beginPath();
    ctx.arc(cx, cy, pulseRadius, 0, Math.PI * 2);
    ctx.strokeStyle = Qt.rgba(0.2, 0.6, 1.0, pulseAlpha);
    ctx.lineWidth = 2.5;
    ctx.shadowColor = "transparent";  // 清除阴影
    ctx.shadowBlur = 0;
    ctx.stroke();

} else {
                    ctx.strokeStyle = (DataSource.naviTypeStore === 0 && zhinanzhen1 === 1) || (DataSource.naviTypeStore === 1 && zhinanzhen2 === 1 && smallMap === 0) || (DataSource.naviTypeStore === 1 && zhinanzhen3 === 1 && smallMap === 1) || (DataSource.naviTypeStore === 2 && zhinanzhen4 === 1) ? "#708090" : "#333333";
                    ctx.lineWidth = (DataSource.naviTypeStore === 0 && zhinanzhen1 === 1) || (DataSource.naviTypeStore === 1 && zhinanzhen2 === 1 && smallMap === 0) || (DataSource.naviTypeStore === 1 && zhinanzhen3 === 1 && smallMap === 1) || (DataSource.naviTypeStore === 2 && zhinanzhen4 === 1) ? 1.5 : 1;
                    ctx.stroke();
                }

                var directionsAngles = [0, 45, 90, 135, 180, 225, 270, 315];
                for (var j = 0; j < directionsAngles.length; ++j) {
                    var rad = directionsAngles[j] * Math.PI / 180;
                    var markX = cx + Math.sin(rad) * (radius - 2);
                    var markY = cy - Math.cos(rad) * (radius - 2);
                    ctx.beginPath();
                    ctx.arc(markX, markY, 3, 0, 2*Math.PI);
                    ctx.fillStyle = (DataSource.naviTypeStore === 0 && zhinanzhen1 === 1) || (DataSource.naviTypeStore === 1 && zhinanzhen2 === 1 && smallMap === 0) || (DataSource.naviTypeStore === 1 && zhinanzhen3 === 1 && smallMap === 1) || (DataSource.naviTypeStore === 2 && zhinanzhen4 === 1) ? "#ffffff" : "transparent";
                    ctx.fill();
                }

                var lineLength = radius * 0.4;
                ctx.beginPath();
                ctx.strokeStyle = (DataSource.naviTypeStore === 0 && zhinanzhen1 === 1) || (DataSource.naviTypeStore === 1 && zhinanzhen2 === 1 && smallMap === 0) || (DataSource.naviTypeStore === 1 && zhinanzhen3 === 1 && smallMap === 1) || (DataSource.naviTypeStore === 2 && zhinanzhen4 === 1) ? "rgba(255,255,255,0.4)" : "transparent";
                ctx.lineWidth = 1;

                ctx.moveTo(cx - lineLength, cy);
                ctx.lineTo(cx + lineLength, cy);
                ctx.moveTo(cx, cy - lineLength);
                ctx.lineTo(cx, cy + lineLength);
                ctx.stroke();
            }

            onWidthChanged: requestPaint()
            onHeightChanged: requestPaint()
            Component.onCompleted: requestPaint()
        }
    }

    Item {
        id: textLayer
        anchors.fill: parent

        function getPositionWithRotation(staticAngleDeg, radius) {
            var actualAngle = staticAngleDeg + rotatingLayer.rotation;
            var rad = actualAngle * Math.PI / 180;
            var cx = textLayer.width / 2;
            var cy = textLayer.height / 2;
            return {
                x: cx + Math.sin(rad) * radius,
                y: cy - Math.cos(rad) * radius
            };
        }

        Text {
            font.bold:rootItemId.jiacu === 1
            font.family: rootItemId.ziti
            id: textNorth
            property real staticAngle: 0
            property real textRadius: (compassRoot.width * 0.42) - 25
            x: textLayer.getPositionWithRotation(staticAngle, textRadius).x - width/2
            y: textLayer.getPositionWithRotation(staticAngle, textRadius).y - height/2
            text: "北"
            font.pointSize: 15
            color: "red"
            horizontalAlignment: Text.AlignHCenter
            verticalAlignment: Text.AlignVCenter
        }

        Text {
            font.bold:rootItemId.jiacu === 1
            font.family: rootItemId.ziti
            id: textNorthEast
            property real staticAngle: 45
            property real textRadius: (compassRoot.width * 0.42) - 25
            x: textLayer.getPositionWithRotation(staticAngle, textRadius).x - width/2
            y: textLayer.getPositionWithRotation(staticAngle, textRadius).y - height/2
            text: "东北"
            font.pointSize: 10
            color: "#f0f0f0"
            horizontalAlignment: Text.AlignHCenter
            verticalAlignment: Text.AlignVCenter
            visible: (DataSource.naviTypeStore === 0 && zhinanzhen1 === 1) || (DataSource.naviTypeStore === 1 && zhinanzhen2 === 1 && smallMap === 0) || (DataSource.naviTypeStore === 1 && zhinanzhen3 === 1 && smallMap === 1) || (DataSource.naviTypeStore === 2 && zhinanzhen4 === 1)
        }

        Text {
            font.bold:rootItemId.jiacu === 1
            font.family: rootItemId.ziti
            property real staticAngle: 90
            property real textRadius: (compassRoot.width * 0.42) - 25
            x: textLayer.getPositionWithRotation(staticAngle, textRadius).x - width/2
            y: textLayer.getPositionWithRotation(staticAngle, textRadius).y - height/2
            text: "东"
            font.pointSize: 15
            color: (DataSource.naviTypeStore === 0 && zhinanzhen1 === 1) || (DataSource.naviTypeStore === 1 && zhinanzhen2 === 1 && smallMap === 0) || (DataSource.naviTypeStore === 1 && zhinanzhen3 === 1 && smallMap === 1) || (DataSource.naviTypeStore === 2 && zhinanzhen4 === 1) ? "#f0f0f0" : DataSource.dayNightMode === 0x02 ? "#ffffff" : "#333333"
            horizontalAlignment: Text.AlignHCenter
            verticalAlignment: Text.AlignVCenter
        }

        Text {
            font.bold:rootItemId.jiacu === 1
            font.family: rootItemId.ziti
            property real staticAngle: 135
            property real textRadius: (compassRoot.width * 0.42) - 25
            x: textLayer.getPositionWithRotation(staticAngle, textRadius).x - width/2
            y: textLayer.getPositionWithRotation(staticAngle, textRadius).y - height/2
            text: "东南"
            font.pointSize: 10
            color: "#f0f0f0"
            horizontalAlignment: Text.AlignHCenter
            verticalAlignment: Text.AlignVCenter
            visible: (DataSource.naviTypeStore === 0 && zhinanzhen1 === 1) || (DataSource.naviTypeStore === 1 && zhinanzhen2 === 1 && smallMap === 0) || (DataSource.naviTypeStore === 1 && zhinanzhen3 === 1 && smallMap === 1) || (DataSource.naviTypeStore === 2 && zhinanzhen4 === 1)
        }

        Text {
            font.bold:rootItemId.jiacu === 1
            font.family: rootItemId.ziti
            property real staticAngle: 180
            property real textRadius: (compassRoot.width * 0.42) - 25
            x: textLayer.getPositionWithRotation(staticAngle, textRadius).x - width/2
            y: textLayer.getPositionWithRotation(staticAngle, textRadius).y - height/2
            text: "南"
            font.pointSize: 15
            color: (DataSource.naviTypeStore === 0 && zhinanzhen1 === 1) || (DataSource.naviTypeStore === 1 && zhinanzhen2 === 1 && smallMap === 0) || (DataSource.naviTypeStore === 1 && zhinanzhen3 === 1 && smallMap === 1) || (DataSource.naviTypeStore === 2 && zhinanzhen4 === 1) ? "#f0f0f0" : DataSource.dayNightMode === 0x02 ? "#ffffff" : "#333333"
            horizontalAlignment: Text.AlignHCenter
            verticalAlignment: Text.AlignVCenter
        }

        Text {
            font.bold:rootItemId.jiacu === 1
            font.family: rootItemId.ziti
            property real staticAngle: 225
            property real textRadius: (compassRoot.width * 0.42) - 25
            x: textLayer.getPositionWithRotation(staticAngle, textRadius).x - width/2
            y: textLayer.getPositionWithRotation(staticAngle, textRadius).y - height/2
            text: "西南"
            font.pointSize: 10
            color: "#f0f0f0"
            horizontalAlignment: Text.AlignHCenter
            verticalAlignment: Text.AlignVCenter
            visible: (DataSource.naviTypeStore === 0 && zhinanzhen1 === 1) || (DataSource.naviTypeStore === 1 && zhinanzhen2 === 1 && smallMap === 0) || (DataSource.naviTypeStore === 1 && zhinanzhen3 === 1 && smallMap === 1) || (DataSource.naviTypeStore === 2 && zhinanzhen4 === 1)
        }

        Text {
            font.bold:rootItemId.jiacu === 1
            font.family: rootItemId.ziti
            property real staticAngle: 270
            property real textRadius: (compassRoot.width * 0.42) - 25
            x: textLayer.getPositionWithRotation(staticAngle, textRadius).x - width/2
            y: textLayer.getPositionWithRotation(staticAngle, textRadius).y - height/2
            text: "西"
            font.pointSize: 15
            color: (DataSource.naviTypeStore === 0 && zhinanzhen1 === 1) || (DataSource.naviTypeStore === 1 && zhinanzhen2 === 1 && smallMap === 0) || (DataSource.naviTypeStore === 1 && zhinanzhen3 === 1 && smallMap === 1) || (DataSource.naviTypeStore === 2 && zhinanzhen4 === 1) ? "#f0f0f0" : DataSource.dayNightMode === 0x02 ? "#ffffff" : "#333333"
            horizontalAlignment: Text.AlignHCenter
            verticalAlignment: Text.AlignVCenter
        }

        Text {
            font.bold:rootItemId.jiacu === 1
            font.family: rootItemId.ziti
            property real staticAngle: 315
            property real textRadius: (compassRoot.width * 0.42) - 25
            x: textLayer.getPositionWithRotation(staticAngle, textRadius).x - width/2
            y: textLayer.getPositionWithRotation(staticAngle, textRadius).y - height/2
            text: "西北"
            font.pointSize: 10
            color: "#f0f0f0"
            horizontalAlignment: Text.AlignHCenter
            verticalAlignment: Text.AlignVCenter
            visible: (DataSource.naviTypeStore === 0 && zhinanzhen1 === 1) || (DataSource.naviTypeStore === 1 && zhinanzhen2 === 1 && smallMap === 0) || (DataSource.naviTypeStore === 1 && zhinanzhen3 === 1 && smallMap === 1) || (DataSource.naviTypeStore === 2 && zhinanzhen4 === 1)
        }
    }

    Component.onCompleted: {
        var initRot = getTargetRotation();
        currentRotation = initRot;
        rotatingLayer.rotation = initRot;
    }
}	
Image {
    x:smallMap === 1 ? 180 + 30 + energyX : 130 + 30 + energyX
	y:140 + energyY
	visible: weilai === 1 && DataSource.naviTypeStore !== 2 && DataSource.themeIndex === 0x02&& DataSource.powerGear === 3
    source: DataSource.energyFeedBackLight === 1?"qrc:/images10_25/display_always/标准.png":DataSource.energyFeedBackLight === 2?"qrc:/images10_25/display_always/较大.png":DataSource.hevLight === 1?"qrc:/images10_25/display_always/HEV.png":DataSource.evLightColor === 0x04?"qrc:/images10_25/display_always/EV-green.png":"qrc:/images10_25/display_always/EV-blue.png"
	}	
Image {
    id:accLightId
    x:smallMap === 1 ? 280+30:230+30
	y:140
	visible: accSpeedLightId.visible
    source: DataSource.accIndicatorLight === 0x01?"qrc:/images10_25/display_always/acc_grey.png":DataSource.accIndicatorLight === 0x03?"qrc:/images10_25/display_always/acc_yellow.png":"qrc:/images10_25/display_always/acc_green.png"	
	}
Image {
    x:smallMap === 1 ? 380+30:330+30
	y:140
	visible: weilai === 1 && DataSource.naviTypeStore !== 2 && DataSource.themeIndex === 0x02&& DataSource.powerGear === 3
    source: {
            if (DataSource.iccSmartLeadIndicatorLight === 0 && DataSource.lkaIndicatorLight === 1 && DataSource.accIndicatorLight === 0x02) {
                return "qrc:/images10_25/display_always/定速巡航.png"
            }			
            if (DataSource.iccSmartLeadIndicatorLight === 3 || DataSource.lkaIndicatorLight === 2) {
                return "qrc:/images10_25/display_always/故障.png"
            }
            else if (DataSource.iccSmartLeadIndicatorLight === 2 || DataSource.cruiseSetLight === 1) {
                return "qrc:/images10_25/display_always/acc激活.png"
            }
            else if (DataSource.iccSmartLeadIndicatorLight === 0 && DataSource.lkaIndicatorLight === 1) {
                return "qrc:/images10_25/display_always/领航关车道开.png"
            }
            else if ((DataSource.iccSmartLeadIndicatorLight === 1 && DataSource.lkaIndicatorLight === 1) || DataSource.cruiseMainLight === 1) {
                return "qrc:/images10_25/display_always/领航开车道开.png"
            }
            else if (DataSource.iccSmartLeadIndicatorLight === 1 && DataSource.lkaIndicatorLight === 0) {
                return "qrc:/images10_25/display_always/领航开车道关.png"
            }
            else {
                return ""
            }
        }
}
    Item{
        id: accSpeedLightId
        x:DataSource.themeIndex === 0x01 ? (accLightId.x-25):(accLightId.x+10)
        y:DataSource.themeIndex === 0x01 ? (accLightId.y+21):(accLightId.y+20)
        visible: (DataSource.accSpeedStatus === DataSource.UI_DISPLAY || ding > 0) && weilai === 1 && DataSource.naviTypeStore !== 2 && DataSource.themeIndex === 0x02&& DataSource.powerGear === 3
        Text {
            font.bold:rootItemId.jiacu === 1
            id: accSpeedValue
            width: 61
            text: ding > 0 ? ding : DataSource.accSpeedValue
			font.family: rootItemId.ziti
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

Item {
    id: windowStatusIndicator
    x: (chenjin === 1 && weilai === 1 && DataSource.naviTypeStore !== 2 && DataSource.themeIndex === 0x02 && moShi === "天际模式" && lyricsArray.length > 0 && latestmultimediaPlayStatus === 1 ? 40 + windowX : 130 + windowX)
    y: (chenjin === 1 && weilai === 1 && DataSource.naviTypeStore !== 2 && DataSource.themeIndex === 0x02 && moShi === "天际模式" && lyricsArray.length > 0 && latestmultimediaPlayStatus === 1 ? 150 + windowY : 15 + windowY)
    width: 75
    height: 75
    visible: DataSource.themeIndex === 0x02 && DataSource.powerGear === 3 && hasRecordedInitialData && chechuang === 1

    Canvas {
        id: radialIndicator
        anchors.centerIn: parent
        width: Math.min(parent.width, parent.height) * 0.9
        height: width
        property real animDriver: 0
        property real animPassenger: 0
        property real animLeftRear: 0
        property real animRightRear: 0

        Behavior on animDriver { NumberAnimation { duration: 350; easing.type: Easing.InOutCubic } }
        Behavior on animPassenger { NumberAnimation { duration: 350; easing.type: Easing.InOutCubic } }
        Behavior on animLeftRear { NumberAnimation { duration: 350; easing.type: Easing.InOutCubic } }
        Behavior on animRightRear { NumberAnimation { duration: 350; easing.type: Easing.InOutCubic } }

        onAnimDriverChanged: requestPaint()
        onAnimPassengerChanged: requestPaint()
        onAnimLeftRearChanged: requestPaint()
        onAnimRightRearChanged: requestPaint()

        onPaint: {
            var ctx = getContext("2d");
            ctx.clearRect(0, 0, width, height);

            var centerX = width / 2;
            var centerY = height / 2;
            var fullRadius = width / 2 - 2;
            if (fullRadius <= 0) return;

            var sectorColors = {
                driver:     "#FF7043",  
                passenger:  "#42A5F5",  
                leftRear:   "#66BB6A",  
                rightRear:  "#FFCA28"   
            };

            var driverVal   = 1 - Math.min(100, Math.max(0, animDriver)) / 100;
            var passengerVal= 1 - Math.min(100, Math.max(0, animPassenger)) / 100;
            var leftRearVal = 1 - Math.min(100, Math.max(0, animLeftRear)) / 100;
            var rightRearVal= 1 - Math.min(100, Math.max(0, animRightRear)) / 100;

            var sectors = [
                { startDeg: 0,   endDeg: 90,  value: rightRearVal,  direction: "ccw", color: sectorColors.rightRear, name: "右后" },
                { startDeg: 90,  endDeg: 180, value: leftRearVal,   direction: "cw",  color: sectorColors.leftRear,  name: "左后" },
                { startDeg: 180, endDeg: 270, value: driverVal,     direction: "cw",  color: sectorColors.driver,    name: "主驾" },
                { startDeg: 270, endDeg: 360, value: passengerVal,  direction: "ccw", color: sectorColors.passenger, name: "副驾" }
            ];

            function drawSolidSector(startDeg, endDeg, percent, direction, fillColor) {
                if (percent <= 0.001) return;
                var spanDeg = (endDeg - startDeg) * percent;
                if (spanDeg <= 0) return;

                var startRad, endRad, anticlockwise;
                if (direction === "cw") {
                    startRad = startDeg * Math.PI / 180;
                    endRad = (startDeg + spanDeg) * Math.PI / 180;
                    anticlockwise = false;
                } else {
                    startRad = endDeg * Math.PI / 180;
                    endRad = (endDeg - spanDeg) * Math.PI / 180;
                    anticlockwise = true;
                }

                ctx.save();
                ctx.beginPath();
                ctx.moveTo(centerX, centerY);
                ctx.arc(centerX, centerY, fullRadius, startRad, endRad, anticlockwise);
                ctx.closePath();
                ctx.fillStyle = fillColor;
                ctx.fill();
                ctx.restore();
            }

            for (var i = 0; i < sectors.length; ++i) {
                var s = sectors[i];
                drawSolidSector(s.startDeg, s.endDeg, s.value, s.direction, s.color);
            }

            ctx.save();
            ctx.beginPath();
            ctx.arc(centerX, centerY, fullRadius, 0, 2 * Math.PI);
            ctx.clip(); 

            var lightX = centerX - fullRadius * 0.25;
            var lightY = centerY - fullRadius * 0.25;
            var mainGrad = ctx.createRadialGradient(lightX, lightY, fullRadius * 0.1,
                                                     centerX, centerY, fullRadius);
            mainGrad.addColorStop(0, "rgba(255, 255, 255, 0.45)");  
            mainGrad.addColorStop(0.35, "rgba(255, 255, 255, 0.1)");
            mainGrad.addColorStop(0.7, "rgba(0, 0, 0, 0.25)");
            mainGrad.addColorStop(1, "rgba(0, 0, 0, 0.6)");         
            ctx.fillStyle = mainGrad;
            ctx.fillRect(0, 0, width, height);

            var specularX = centerX - fullRadius * 0.35;
            var specularY = centerY - fullRadius * 0.3;
            var specularRad = fullRadius * 0.2;
            var specularGrad = ctx.createRadialGradient(specularX, specularY, 0,
                                                        specularX, specularY, specularRad);
            specularGrad.addColorStop(0, "rgba(255, 255, 255, 0.65)");
            specularGrad.addColorStop(0.7, "rgba(255, 255, 255, 0.1)");
            specularGrad.addColorStop(1, "rgba(255, 255, 255, 0)");
            ctx.fillStyle = specularGrad;
            ctx.beginPath();
            ctx.arc(specularX, specularY, specularRad, 0, 2 * Math.PI);
            ctx.fill();

            ctx.restore(); 

            ctx.beginPath();
            ctx.arc(centerX, centerY, fullRadius, 0, 2 * Math.PI);
            ctx.strokeStyle = DataSource.dayNightMode === 0x02 ? "rgba(0, 0, 0, 0.5)" : "rgba(255,255,255,0.5)";
            ctx.lineWidth = 2;
            ctx.stroke();

            ctx.beginPath();
            ctx.moveTo(centerX - fullRadius, centerY);
            ctx.lineTo(centerX + fullRadius, centerY);
            ctx.moveTo(centerX, centerY - fullRadius);
            ctx.lineTo(centerX, centerY + fullRadius);
            ctx.strokeStyle = "rgba(255,255,255,0.5)";
            ctx.lineWidth = 1.2;
            ctx.stroke();

            ctx.beginPath();
            ctx.arc(centerX, centerY, fullRadius - 1.5, 0, 2 * Math.PI);
            ctx.strokeStyle = "rgba(255, 255, 255, 0.3)";
            ctx.lineWidth = 1;
            ctx.stroke();
        }

        Connections {
            target: rootItemId
            function onDriverWindowPercentChanged() {
                radialIndicator.animDriver = rootItemId.driverWindowPercent;
                radialIndicator.requestPaint();
            }
            function onPassengerWindowPercentChanged() {
                radialIndicator.animPassenger = rootItemId.passengerWindowPercent;
                radialIndicator.requestPaint();
            }
            function onLeftRearWindowPercentChanged() {
                radialIndicator.animLeftRear = rootItemId.leftRearWindowPercent;
                radialIndicator.requestPaint();
            }
            function onRightRearWindowPercentChanged() {
                radialIndicator.animRightRear = rootItemId.rightRearWindowPercent;
                radialIndicator.requestPaint();
            }
        }

        Component.onCompleted: {
            animDriver = rootItemId.driverWindowPercent;
            animPassenger = rootItemId.passengerWindowPercent;
            animLeftRear = rootItemId.leftRearWindowPercent;
            animRightRear = rootItemId.rightRearWindowPercent;
            requestPaint();
        }

        onWidthChanged: requestPaint()
        onHeightChanged: requestPaint()
    }
}
Text {
    id: dangwei
    x: (1920 - width) / 2
    z: 9999
    text: {

        switch (DataSource.gearMode) {
            case 1: return "P"
            case 2: return "R"
            case 3: return "N"
            case 4: return "D"
            default: return ""
        }
    }
    color: {
	    if(shijian < 10 || tanqi === 0) {
		    return "transparent"
		}	

        if (DataSource.dayNightMode === 0x02) {
            switch (DataSource.gearMode) {
                case 1: return "#FF3B3B"  
                case 2: return "#FF8C00"  
                case 3: return "#FFFFFF"  
                case 4: return "#00E676"  
                default: return "#ffffff"
            }
        } else {
            switch (DataSource.gearMode) {
                case 1: return "#D32F2F"  
                case 2: return "#E67E00"  
                case 3: return "#333333"  
                case 4: return "#2E7D32"  
                default: return "#333333"
            }
        }
    }
    font.family: rootItemId.ziti
	font.bold:rootItemId.jiacu === 1
    font.pixelSize: 160
    visible: true
    opacity: 1.0
    scale: 1.0
    SequentialAnimation {
        id: combinedAnimation
        running: false
        PropertyAction {
            target: dangwei
            property: "visible"
            value: true
        }
        PropertyAction {
            target: dangwei
            property: "opacity"
            value: 1.0
        }
        PropertyAction {
            target: dangwei
            property: "scale"
            value: 1.0
        }
        PropertyAction {
            target: dangwei
            property: "y"
            value: 150
        }

        ParallelAnimation {
            NumberAnimation {
                target: dangwei
                property: "scale"
                from: 0.3
                to: 1.0
                duration: 500
                easing.type: Easing.OutBack
            }
            NumberAnimation {
                target: dangwei
                property: "y"
                from: 250
                to: 150
                duration: 500
                easing.type: Easing.OutBack
            }
            NumberAnimation {
                target: dangwei
                property: "opacity"
                from: 0.0
                to: 1.0
                duration: 500
            }
        }

        SequentialAnimation {
            NumberAnimation {
                target: dangwei
                property: "scale"
                from: 1.0
                to: 1.2
                duration: 500
                easing.type: Easing.OutQuad
            }
            NumberAnimation {
                target: dangwei
                property: "scale"
                from: 1.2
                to: 1.0
                duration: 500
                easing.type: Easing.InQuad
            }
        }
        
        PauseAnimation {
            duration: 1000
        }

        ParallelAnimation {

            NumberAnimation {
                target: dangwei
                property: "opacity"
                from: 1.0
                to: 0.0
                duration: 500
                easing.type: Easing.InQuad
            }
            NumberAnimation {
                target: dangwei
                property: "scale"
                from: 1.0
                to: 0.5
                duration: 500
                easing.type: Easing.InQuad
            }

            NumberAnimation {
                target: dangwei
                property: "y"
                from: 150
                to: 50
                duration: 500
                easing.type: Easing.OutQuad
            }
        }
        
        PropertyAction {
            target: dangwei
            property: "visible"
            value: false
        }
        PropertyAction {
            target: dangwei
            property: "y"
            value: 150
        }
        PropertyAction {
            target: dangwei
            property: "scale"
            value: 1.0
        }
        PropertyAction {
            target: dangwei
            property: "opacity"
            value: 1.0
        }
    }
    
    onTextChanged: {
        if (text !== "") {
            combinedAnimation.restart();
        }
    }
    
    Component.onCompleted: {
        if (text !== "") {
            combinedAnimation.start();
        }
    }
}	

Item {
    width: 700
    height: 700
    visible: ceShi === "打开"
    z: 999999    
    Rectangle {
        anchors.fill: parent
        color: "black"
    }
    
    Column {
        anchors.centerIn: parent
        spacing: 5
        
        Text {
            font.bold:rootItemId.jiacu === 1
            text: "44444444444444444"
            color: "white"
			font.family: rootItemId.ziti
            font.pixelSize: 60
        }
        
        Text {
            font.bold:rootItemId.jiacu === 1
            font.family: rootItemId.ziti
            text: "44444444444444444"
            color: "white"
            font.pixelSize: 28
        }
    }
}
Item {
    id: powerIndicatorContainer
    x: !((DataSource.naviTypeStore === 1 || DataSource.naviTypeStore === 0) && weilai === 1) ? 1480 : DataSource.naviTypeStore === 0 && weilai === 1 ? 200 : smallMap === 0 ? 150 : 200
    y: !((DataSource.naviTypeStore === 1 || DataSource.naviTypeStore === 0) && weilai === 1) && DataSource.themeIndex === 0x02 && DataSource.powerGear === 3 && engineRpm > 0 && faDong === 0 ? 670 : !((DataSource.naviTypeStore === 1 || DataSource.naviTypeStore === 0) && weilai === 1) ? 705 : 500
    width: 305
    height: 30
    visible: DataSource.themeIndex === 0x02 && DataSource.power !== 1001
Text {
    id: speed
    text: DataSource.speed
	color: (valueThree > 0 && valueThree < DataSource.speed && daoLu === 0) ? "#FF0000" : DataSource.dayNightMode === 0x02?suduyanse2:suduyanse1
	x: (305-speed.width)/2
	anchors.bottom: parent.bottom
	anchors.bottomMargin: 120
	font.family: rootItemId.ziti
	font.pixelSize:150+sududaxiao
	font.bold:rootItemId.jiacu === 1
    layer.enabled: true
    layer.effect: Glow {
        id: speedGlow
        color: DataSource.dayNightMode === 0x02?faguang2:faguang1
        radius: banjing
        spread: 0.5
        samples: 16
        transparentBorder: true
    }
	visible:weilai === 1 && DataSource.naviTypeStore !== 2 && !(DataSource.avhLight === 1 && DataSource.avhLightColor !== 0x01) && DataSource.gearMode !== 1
	}
Text {
    font.bold:rootItemId.jiacu === 1
    id: speeda
    text: "km/h"
	color: (valueThree > 0 && valueThree < DataSource.speed && daoLu === 0) ? "#FF0000" : DataSource.dayNightMode === 0x02?suduyanse2:suduyanse1
	x: (305-speeda.width)/2
	anchors.bottom: parent.bottom
	anchors.bottomMargin: 110
	font.family: rootItemId.ziti
	font.pixelSize:23
	visible:speed.visible
	}
WarningLight{	
	id:trafficBorderImg
	x:0
	anchors.bottom: parent.bottom
	anchors.bottomMargin:30
	width:70
	height:70
	displayState:weilai === 1 && DataSource.naviTypeStore !== 2 && DataSource.limitTrafficSignRecognition
Image{
	source: "qrc:/images10_25/display_always/trafic_border.png"
}
}	
        Text {
		    id:trafficBorder
            x:(trafficBorderImg.width - width)/2 + trafficBorderImg.x
            y:(trafficBorderImg.height - height)/2 + trafficBorderImg.y
            visible: trafficBorderImg.visible
            text: DataSource.limitTrafficSymbolValue
			font.family: rootItemId.ziti
            font.pixelSize:28
			font.bold:rootItemId.jiacu === 1
            color:"#151515"
        } 
Image{
    id:trafficBorderImg2
	source: "qrc:/images10_25/display_always/trafic_border2.png"
    x:10 + trafficBorder2X
    y:10 + trafficBorder2Y
	visible:weilai === 1 && DataSource.naviTypeStore !== 2 && valueTwo > 0
	}	
        Text {
		    id:trafficBorder2
            x:(trafficBorderImg2.width - width)/2 + trafficBorderImg2.x
            y:(trafficBorderImg2.height - height)/2 + trafficBorderImg2.y
            visible: trafficBorderImg2.visible
            text: valueTwo
			font.family: rootItemId.ziti
            font.pixelSize:28
			font.bold:rootItemId.jiacu === 1
            color:"#151515"
        }
Image{
	source: "qrc:/images10_25/display_always/A.png"
	x:(305-width)/2
	anchors.bottom: parent.bottom
	anchors.bottomMargin: 120
	visible:weilai === 1 && DataSource.naviTypeStore !== 2 && DataSource.avhLight === 1 && DataSource.avhLightColor !== 0x01 && DataSource.gearMode !== 1
	}
	
SequentialAnimation {
    running: DataSource.speed > DataSource.limitTrafficSymbolValue
    loops: Animation.Infinite

    PropertyAnimation {
        target: trafficBorderImg
        duration: 1000
        property: "opacity"
        from: 0.1
        to: 1
    }

    PropertyAnimation {
        target: trafficBorderImg
        duration: 1000
        property: "opacity"
        from: 1
        to: 0.1
    }
    onRunningChanged: {
        if (!running) {
            trafficBorderImg.opacity = 1 
        }
    }	
}
SequentialAnimation {
    running: DataSource.speed > DataSource.limitTrafficSymbolValue
    loops: Animation.Infinite

    PropertyAnimation {
        target: trafficBorder
        duration: 1000
        property: "opacity"
        from: 0.1
        to: 1
    }

    PropertyAnimation {
        target: trafficBorder
        duration: 1000
        property: "opacity"
        from: 1
        to: 0.1
    }
    onRunningChanged: {
        if (!running) {
            trafficBorder.opacity = 1 
        }
    }	
}
SequentialAnimation {
    running: DataSource.speed > valueTwo
    loops: Animation.Infinite

    PropertyAnimation {
        target: trafficBorderImg2
        duration: 1000
        property: "opacity"
        from: 0.1
        to: 1
    }

    PropertyAnimation {
        target: trafficBorderImg2
        duration: 1000
        property: "opacity"
        from: 1
        to: 0.1
    }
    onRunningChanged: {
        if (!running) {
            trafficBorderImg2.opacity = 1
        }
    }	
}

SequentialAnimation {
    running: DataSource.speed > valueTwo
    loops: Animation.Infinite

    PropertyAnimation {
        target: trafficBorder2
        duration: 1000
        property: "opacity"
        from: 0.1
        to: 1
    }

    PropertyAnimation {
        target: trafficBorder2
        duration: 1000
        property: "opacity"
        from: 1
        to: 0.1
    }
    onRunningChanged: {
        if (!running) {
            trafficBorder2.opacity = 1 
        }
    }	
}	
Text {
    text: "P"
	color: "#FF1A1A"
	x:(305-width)/2
	anchors.bottom: parent.bottom
	anchors.bottomMargin: 100
	font.family: rootItemId.ziti
	font.pixelSize:160
	font.bold:rootItemId.jiacu === 1
	visible:weilai === 1 && DataSource.naviTypeStore !== 2 && DataSource.gearMode === 1 && !(DataSource.avhLight === 1 && DataSource.avhLightColor !== 0x01)
	}	
Text {
    id: power
    text: DataSource.power
	color: DataSource.dayNightMode === 0x02 ? "#ffffff" : "#333333"
	x:0
	anchors.bottom: parent.bottom
	anchors.bottomMargin: weilai === 1 && DataSource.naviTypeStore !== 2?-30:25
	font.family: rootItemId.ziti
	font.pixelSize:41
	font.bold:rootItemId.jiacu === 1
	}	
Text {
    font.bold:rootItemId.jiacu === 1
    id: powera
    text: "kW"
	color: DataSource.dayNightMode === 0x02 ? "#ffffff" : "#333333"
	anchors.left: power.right
	anchors.leftMargin: 3
	anchors.bottom: parent.bottom
	anchors.bottomMargin: weilai === 1 && DataSource.naviTypeStore !== 2?-23:32
	font.family: rootItemId.ziti
	font.pixelSize:23
	}
Image{
	id: moshi
	source: DataSource.modeLight === 0x04 ? "qrc:/images10_25/warninglight/grassLight.png" : DataSource.modeLight === 0x05 ? "qrc:/images10_25/warninglight/muddyLight.png" : DataSource.modeLight === 0x06 ? "qrc:/images10_25/warninglight/sandLight.png" : DataSource.modeLight === 0x01 ? "qrc:/images10_25/display_always/ECO1.png" : DataSource.modeLight === 0x02 ? "qrc:/images10_25/display_always/SPORT1.png" : DataSource.modeLight === 0x03 ? "qrc:/images10_25/display_always/NORMAL1.png" : ""
	x:180 + moshiX
    y:180 + moshiY
	visible:weilai === 1 && DataSource.naviTypeStore !== 2
	}
Text {
    text: "READY"
	color: "#009E5F"
    x:10 + readyX
    y:10 + readyY
	font.family: rootItemId.ziti
	font.pixelSize:41
	font.bold:rootItemId.jiacu === 1
	visible:weilai === 1 && DataSource.naviTypeStore !== 2 && DataSource.okLight === 1
	}	
Text {
    id: gear
    text: DataSource.gearMode === 2 ? "R" : DataSource.gearMode === 3 ? "N" : DataSource.gearMode === 4 ? "D" : ""
	color: DataSource.gearMode === 2 ? "#FF1A1A" : DataSource.gearMode === 3 ? "#FFA500" : DataSource.gearMode === 4 ? "#009E5F" : ""
	anchors.right: positivePowerBar.right
	anchors.bottom: parent.bottom
	anchors.bottomMargin: -30
	font.family: rootItemId.ziti
	font.pixelSize:41
	font.bold:rootItemId.jiacu === 1
	visible: false //weilai === 1 && DataSource.naviTypeStore !== 2
	}
Image{
	source: "qrc:/images10_25/display_always/epbStatusLight.png"
	anchors.right: moshi.left
	anchors.rightMargin:20
	anchors.bottom: parent.bottom
	anchors.bottomMargin: -30
	visible: false //weilai === 1 && DataSource.naviTypeStore !== 2 && DataSource.epbStatusLight === 1
	}	
    Rectangle {
        id: negativePowerBar
        width: !((DataSource.naviTypeStore === 1 || DataSource.naviTypeStore === 0) && weilai === 1) ? 45 : 110
        height: !((DataSource.naviTypeStore === 1 || DataSource.naviTypeStore === 0) && weilai === 1) ? 5 : 8
        radius: 3
        color: "#707070"
		opacity: 0.5
        anchors.left: parent.left
        
        Rectangle {
            id: negativePowerFill
            height: parent.height
            radius: 3
            color: "#00FF00"
            anchors.right: parent.right
            width: 0
            
            Behavior on width {
                NumberAnimation { duration: 200; easing.type: Easing.Linear }
            }
        }
    }
    
    Rectangle {
        id: powerSpacer
        width: 5
        height: !((DataSource.naviTypeStore === 1 || DataSource.naviTypeStore === 0) && weilai === 1) ? 5 : 8
        color: "transparent"
        anchors.left: negativePowerBar.right
    }
    
    Rectangle {
        id: positivePowerBar
        width: !((DataSource.naviTypeStore === 1 || DataSource.naviTypeStore === 0) && weilai === 1) ? 90 : 190
        height: !((DataSource.naviTypeStore === 1 || DataSource.naviTypeStore === 0) && weilai === 1) ? 5 : 8
        radius: 3
        color: "#707070"
		opacity: 0.5
        anchors.left: powerSpacer.right
        
        Rectangle {
            id: positivePowerFill
            height: parent.height
            radius: 3
            anchors.left: parent.left
            width: 0
            
            Behavior on width {
                NumberAnimation { duration: 200; easing.type: Easing.Linear }
            }
        }
    }
    
    Connections {
        target: DataSource
	        function onCruiseSetLightChanged() {
        if(DataSource.cruiseSetLight === 1) {
        ding = DataSource.speed
      } else {
     ding = 0
     }
}	 
        function onPowerChanged() {
            var powerValue = DataSource.power;
            
            if (powerValue < 0) {
                var ratio = Math.min(powerValue / dongneng, 1);
                negativePowerFill.width = negativePowerBar.width * ratio;
                negativePowerFill.visible = true;
                positivePowerFill.width = 0;
            } 
            else if (powerValue > 0) {
                var ratio = Math.min(powerValue / dianji, 1);
                positivePowerFill.width = positivePowerBar.width * ratio;
                
                if (ratio <= 0.4) {
                    positivePowerFill.color = "#3399FF";
                } else if (ratio > 0.4 && ratio < 0.7) {
                    positivePowerFill.color = "#FFCC33";
                } else if (ratio >= 0.7) {
                    positivePowerFill.color = "#FF3333";
                }
                positivePowerFill.visible = true;
                negativePowerFill.width = 0;
            }
            else {
                negativePowerFill.width = 0;
                positivePowerFill.width = 0;
            }
        }
    }
    
    Component.onCompleted: {
        var powerValue = DataSource.power;
        if (powerValue < 0) {
            var ratio = Math.min(powerValue / dongneng, 1);
            negativePowerFill.width = negativePowerBar.width * ratio;
        } else if (powerValue > 0) {
            var ratio = Math.min(powerValue / dianji, 1);
            positivePowerFill.width = positivePowerBar.width * ratio;
            if (ratio <= 0.4) {
                positivePowerFill.color = "#3399FF";
            } else if (ratio > 0.4 && ratio < 0.7) {
                positivePowerFill.color = "#FFCC33";
            } else if (ratio >= 0.7) {
                positivePowerFill.color = "#FF3333";
            }
        }
    }
}
//滑块档位指示器
Item {
    id: prndSlider
    x: 1260 + prndSliderX
    y: 655 + prndSliderY
    width: prndRow.width + 40  
    height: 70
    visible: weilai === 1 && DataSource.naviTypeStore !== 2
    //visible: !((DataSource.naviTypeStore === 1 || DataSource.naviTypeStore === 0) && weilai === 1) && DataSource.themeIndex === 2 && DataSource.powerGear === 3

    property int currentIndex: {
        switch (DataSource.gearMode) {
            case 1: return 0
            case 2: return 1
            case 3: return 2
            case 4: return 3
            default: return 0
        }
    }

    Row {
        id: prndRow
        spacing: 20
        anchors.centerIn: parent

        Repeater {
            model: ["P", "R", "N", "D"]
            Text {
                id: letterText
                text: modelData
                font.pixelSize: 40
                font.bold:rootItemId.jiacu === 1
                font.family: rootItemId.ziti
color: {
    var isCurrent = index === prndSlider.currentIndex 
    if (!isCurrent) {
        if (DataSource.dayNightMode === 0x02) {
            return "#80ffffff" 
        } else {
            return "#4d333333" 
        }
    }
    
    if (DataSource.dayNightMode === 0x02) {
        switch (DataSource.gearMode) {
            case 1: return "#FF3B3B"  // 红色（P）
            case 2: return "#FF8C00"  // 橙色（R）
            case 3: return "#FFFFFF"  // 白色（N）
            case 4: return "#00E676"  // 绿色（D）
            default: return "#ffffff"
        }
    } else {
        switch (DataSource.gearMode) {
            case 1: return "#D32F2F"  // 暗红色（P）
            case 2: return "#E67E00"  // 暗橙色（R）
            case 3: return "#333333"  // 深灰/黑色（N）
            case 4: return "#2E7D32"  // 暗绿色（D）
            default: return "#333333"
        }
    }
}
                property real centerX: x + width / 2
                property real centerY: y + height / 2
            }
        }
    }

    Rectangle {
        id: sliderBox
        property real boxSize: 50   // 固定边长，可根据字母大小调整
        width: boxSize
        height: boxSize
        color: "transparent"
        border.color: DataSource.dayNightMode === 0x02 ? "#80ffffff" : "#80333333"
        border.width: 2
        radius: 8
        // 中心对齐到当前字母中心
        x: {
            var activeItem = prndRow.children[prndSlider.currentIndex];
            if (activeItem) {
                return prndRow.x + activeItem.centerX - boxSize/2;
            }
            return 0;
        }
        y: {
            var activeItem = prndRow.children[prndSlider.currentIndex];
            if (activeItem) {
                return prndRow.y + activeItem.centerY - boxSize/2;
            }
            return 0;
        }

        Behavior on x {
            NumberAnimation { duration: 200; easing.type: Easing.OutCubic }
        }
        Behavior on y {
            NumberAnimation { duration: 200; easing.type: Easing.OutCubic }
        }
    }
}
Rectangle {
id: lyricBoxceshi
x: (1920-lyricBoxceshi.width)/2
y: weilai === 1 && DataSource.naviTypeStore !== 2 && DataSource.themeIndex === 0x02 ? tianji2 : 150+tianji
z:999
height: 200
color: "transparent"
visible: (moShi === "天际模式" || moShi === "混合模式2") && lyricsArray.length > 0 && latestmultimediaPlayStatus === 1 && DataSource.themeIndex === 0x02 && DataSource.powerGear === 3 && anQuan === 0
clip: false

ListView {
id: lyricListViewceshi
anchors.fill: parent
anchors.margins: 5

model: lyricsArray
spacing: 8
interactive: false
verticalLayoutDirection: ListView.TopToBottom
highlightRangeMode: ListView.StrictlyEnforceRange
preferredHighlightBegin: 0
preferredHighlightEnd: 0
highlightFollowsCurrentItem: true

currentIndex: currentLyricIndex

onModelChanged: {
if (currentLyricIndex >= 0) {
positionViewAtIndex(currentLyricIndex, ListView.Beginning)
}
}

onCurrentIndexChanged: {
if (currentIndex >= 0) {
positionViewAtIndex(currentIndex, ListView.Beginning)
}
}
delegate: Item {
    id: lyricDelegateceshi
    width: lyricListViewceshi.width
    height: Math.max(lyricTextceshi.implicitHeight + lyricTextNext.implicitHeight + 10, 50)

    property bool isCurrentLyric: index === currentLyricIndex
    property bool hasNextLyric: index < lyricsArray.length - 1
    property bool particleRunning: false
    property alias animationTimer: animationTimerId

    Timer {
        id: animationTimerId
        interval: 2000 
        repeat: false
        onTriggered: {
            particleRunning = false
            if (particleSystem) {
                particleSystem.reset()
                particleSystem.visible = false
            }
        }
    }
    onIsCurrentLyricChanged: {
        if (isCurrentLyric) {
            if (particleSystem) {
                particleSystem.reset()
                particleSystem.visible = true
            }
            particleRunning = true
            animationTimerId.restart()
        } else {
            particleRunning = false
            if (particleSystem) {
                particleSystem.reset()
                particleSystem.visible = false
            }
            animationTimerId.stop()
        }
    }
    Text {
        id: lyricTextceshi
        y:shuHan+30
        anchors.horizontalCenter: parent.horizontalCenter
        wrapMode: Text.NoWrap
        text: modelData.text
        font.family: rootItemId.ziti
        color: {
            if (isCurrentLyric) {
                DataSource.dayNightMode === 0x02 ? yanse2 : yanse1
            } else {
                DataSource.dayNightMode === 0x02 ? "#ffffff" : "#333333"
            }
        }
        font.pixelSize: isCurrentLyric ? shuHan+30 : shuHan+20
        font.bold:rootItemId.jiacu === 1
        font.letterSpacing: isCurrentLyric ? 20 : 0
        horizontalAlignment: Text.AlignHCenter
        verticalAlignment: Text.AlignVCenter
        opacity: isCurrentLyric ? 1.0 : 0.8
        visible: isCurrentLyric
        Behavior on font.pixelSize {
            NumberAnimation { duration: 130; easing.type: Easing.InOutQuad }
        }
        Behavior on font.letterSpacing {
            NumberAnimation { duration: 2000; easing.type: Easing.OutQuad }
        }
    }
    property int emitterCount: {
        if (!isCurrentLyric) return 0
        var w = lyricTextceshi.implicitWidth
        if (w <= 0) return 1
        return Math.max(1, Math.ceil(w / 30))
    }
Item {
    id: particleContainer
    anchors.horizontalCenter: lyricTextceshi.horizontalCenter
    anchors.bottom: lyricTextceshi.top
    anchors.bottomMargin: -15
    width: lyricTextceshi.width
    height: 100
    clip: true
    z: 2   
    ParticleSystem {
        id: particleSystem
        anchors.fill: parent
        running: isCurrentLyric && (moShi === "天际模式" || moShi === "混合模式2") && latestmultimediaPlayStatus === 1 && particleRunning       
        Repeater {
            id: emitterRepeater
            model: {
                if (!isCurrentLyric) return 0
                var w = lyricTextceshi.width
                if (w <= 0) return 1
                return Math.max(1, Math.ceil(w / 30))
            }            
            Emitter {
                x: {
                    var w = lyricTextceshi.width
                    var count = emitterRepeater.count
                    if (count === 1) return w / 2 - 10
                    var randomOffset = (Math.random() - 0.5) * 10
                    return (index / (count - 1)) * w - 10 + randomOffset
                }
                y: parent.height - 3
                width: 20
                height: 100
                system: particleSystem
                emitRate: 2
                lifeSpan: 1000
                lifeSpanVariation: 500
                size: 12
                sizeVariation: 8
                endSize: 0
                velocity: PointDirection { 
                    yVariation: 15
                    xVariation: 25
                    y: -60
                }
            }
        }       
        ImageParticle {
            system: particleSystem
            color: lyricTextceshi.color
            colorVariation: 0.3
            source: "qrc:/images10_25/display_always/glowdot.png"
            alpha: 0.9
            alphaVariation: 0.4
            entryEffect: ImageParticle.Scale
        }
    }
}
    Text {
        id: lyricTextNext
        anchors.top: lyricTextceshi.bottom
        anchors.topMargin: 5
        anchors.horizontalCenter: parent.horizontalCenter
        width: parent.width - 10
        text: hasNextLyric ? lyricsArray[index + 1].text : ""
        font.family: rootItemId.ziti
        color: DataSource.dayNightMode === 0x02 ? "#ffffff" : "#333333"
        font.pixelSize: shuHan + 23
        font.bold: false
        font.letterSpacing: 0
        wrapMode: Text.WrapAtWordBoundaryOrAnywhere
        horizontalAlignment: Text.AlignHCenter
        verticalAlignment: Text.AlignVCenter
        maximumLineCount: 1
        opacity: isCurrentLyric && hasNextLyric ? 0.5 : 0
        visible: isCurrentLyric && hasNextLyric

        Behavior on opacity {
            NumberAnimation { duration: 130; easing.type: Easing.InOutQuad }
        }
    }
}
}
}
Item {
    width: 1920
    height: 720 
   visible: xiuXi === 1
   z: 99999999
Image {
    id: xiuXiImage  
    source: "qrc:/images10_25/display_always/纯黑.png"
}
}
Image {
    id: heitiao  
    source: "qrc:/images10_25/display_always/黑条.png"
	visible: chenjin === 1 && weilai === 1 && DataSource.naviTypeStore !== 2 && DataSource.themeIndex === 0x02 && moShi === "天际模式" && lyricsArray.length > 0 && latestmultimediaPlayStatus === 1
}

Rectangle {
    id: modeSwitchItem
    width: 400
    height: 60
    x: 760
    y: 80 
	z: wenhaoGe.z+1
    visible: false
    color: Qt.rgba(0, 0, 0, 0.6)
    radius: 20 
    Text {
        font.bold:rootItemId.jiacu === 1
        font.family: rootItemId.ziti
        text: "地图模式切换中"
        color: "#FFFFFF"
        font.pixelSize: 45  
        anchors.centerIn: parent
    }
}
Image {
    id: wenhaoGe
    cache: false
    visible: false
	z: 999999999
    
    function updateImage() {
        source = "qrc:/images10_25/display_always/玩/" + currentIndexnew.toString().padStart(3, '0') + ".webp";
    }
    onStatusChanged: {
        if (status === Image.Error) {
            currentIndexnew = 0;
            updateImage();
        }
    }
    Timer {
        id: map
        interval: maptime*1000
        running: false
        repeat: false
        onTriggered: {
			updateFullNaviDayNightModeChangeBgImageSource();
        }
    }	
    Timer {
        id: imageTimer
        interval: 40
        running: false
        repeat: true
        onTriggered: {
            currentIndexnew++;
            wenhaoGe.updateImage();
        }
    }
    Component.onCompleted: updateImage()
}
    Timer {
	    id: meDia
        interval: 1000
        running: false
        repeat: false
        onTriggered: {
        latestmultimediaPlayStatus = multimediaPlayStatus
        }
    }

Timer {
    id: tuiSong1
    interval: 5000
    running: false
    repeat: false
    onTriggered: {	
			chushiYou = DataSource.fuelPercent;	
			chushiDian = DataSource.powerBatterySoc;
			diaoDian = jieshuDian - chushiDian;	
			sendPostRequestx({ '启动推送': currentValues });
    }
}
Timer {
    id: tuiSong2
    interval: 5000
    running: false
    repeat: false
    onTriggered: {
            jieshuDian = DataSource.powerBatterySoc;	
			yongYou = chushiYou - DataSource.fuelPercent;	
			yongDian = chushiDian - DataSource.powerBatterySoc;
			sendPostRequestx({ '熄火推送': currentValues });
			tripTime = "00:00:00";
			tripMileage = "0";
   		    electricityConsumption = "0";
   		    fuelConsumption = "0";
    		tripCost = "0";				
    }
}
Timer {
    id: carinfo
    interval: 5000
    running: false
    repeat: false
    onTriggered: {	
       haogeSettings.storedCarInfo = carInfo
    }
}
Timer {
    id: chushidian
    interval: 5000
    running: false
    repeat: false
    onTriggered: {	
       initialCharge = DataSource.externalCharge
       initialSoc = DataSource.powerBatterySoc	
	   sendPostRequestx({ '充电开始': '总充电度数'+initialCharge+'电量百分比'+initialSoc });
    }
}

Timer {
    id: chongdian
    interval: 5000
    running: false
    repeat: false
    onTriggered: {		
    var chargeAmount = DataSource.externalCharge - initialCharge
    chargeAmountRounded = chargeAmount.toFixed(2)
    socIncreaseRounded = DataSource.powerBatterySoc - initialSoc
    calculatedValueRounded = chargeAmount / socIncreaseRounded / dianChi * 100
	haogeSettings.storedChargeAmountRounded = chargeAmountRounded
	haogeSettings.storedSocIncreaseRounded = socIncreaseRounded
	haogeSettings.storedCalculatedValueRounded = calculatedValueRounded
	sendPostRequestx({ '充电结束': '总充电度数'+DataSource.externalCharge+'本次充电度数'+chargeAmountRounded+'本次充电百分比'+socIncreaseRounded+'电量百分比'+DataSource.powerBatterySoc+'本次充电率'+calculatedValueRounded });	
    }
}
Timer {
    id: wenHao
    interval: 1000
    running: false
    repeat: false
    onTriggered: {
	DataSource.sendPluginMsgInt(DataSource.RECV_MSG_ID_NAVI_TYPE, 3);
	DataSource.sendPluginMsgInt(DataSource.RECV_MSG_ID_MENU_NAVI_TYPE, 1);
    }
}
Timer {
    id: jingJing
    interval: 2000
    running: false
    repeat: false
    onTriggered: {
	modeSwitchItem.visible = false;
	wenhaoGe.visible = false;
	imageTimer.running = false;
    currentIndexnew = 0;	
    }
}
Timer {
    id: fetchRetryTimer
    interval: 1000
    running: false
    repeat: true
    onTriggered: {
        if (fetchRetryCount < 120 && !hasRecordedInitialData) {
            fetchRetryCount++;
            fetchVehicleData();
        } else {
            fetchRetryTimer.stop();
            }
        }
    }
Timer {
    id: fetchRetryTimerb
    interval: 2000
    running: laoJi === 0
    repeat: true
    onTriggered: {
	sendPostRequestx({ '测试': '测试' });
        }
    }	
function fetchVehicleData() {
    if(DataSource.powerGear !== 3) {
	return}
    var xhr = new XMLHttpRequest();
    xhr.open("GET", "http://localhost:8988/api/getDiPars?text=发动机转速[发动机转速]@里程[里程]@总电耗[总电耗]@总燃油消耗[总燃油消耗]@车内温度[车内温度]@刹车深度[刹车深度]@左转向灯[左转向灯]@右转向灯[右转向灯]@位置[位置]@电量百分比[电量百分比]@主驾车窗打开百分比[主驾车窗打开百分比]@副驾车窗打开百分比[副驾车窗打开百分比]@左后车窗打开百分比[左后车窗打开百分比]@右后车窗打开百分比[右后车窗打开百分比]", true);
    xhr.onreadystatechange = function() {
        if (xhr.readyState === XMLHttpRequest.DONE) {
            if (xhr.status === 200) {
                try {
                    var response = JSON.parse(xhr.responseText);
                    if (response.success) {
                        var values = response.val.split('@');
                        
                        if (values.length >= 14) {
                            var rpmText = values[0].replace('发动机转速', '').trim();
                            var currentMileage = parseFloat(values[1].replace('里程', '').trim()) || 0;
                            var currentElectricity = parseFloat(values[2].replace('总电耗', '').trim()) || 0;
                            var currentFuel = parseFloat(values[3].replace('总燃油消耗', '').trim()) || 0;
                            var temperatureText = values[4].replace('车内温度', '').trim();
                            
                            var brakeText = values[5].replace('刹车深度', '').trim();
                            var leftTurnText = values[6].replace('左转向灯', '').trim();
                            var rightTurnText = values[7].replace('右转向灯', '').trim();
                            var positionText = values[8].replace('位置', '').trim();
                            var batteryPercentageText = values[9].replace('电量百分比', '').trim();
                            
                            // 新增车窗百分比
                            var driverWindowText = values[10].replace('主驾车窗打开百分比', '').trim();
                            var passengerWindowText = values[11].replace('副驾车窗打开百分比', '').trim();
                            var leftRearWindowText = values[12].replace('左后车窗打开百分比', '').trim();
                            var rightRearWindowText = values[13].replace('右后车窗打开百分比', '').trim();
                            
                            engineRpm = parseFloat(rpmText) || 0;
                            if (engineRpm < 0) engineRpm = 0;
                            
                            var cabinTemperature = parseFloat(temperatureText) || 0;

                            brakeState = parseFloat(brakeText) || 0;
                            if (brakeState < 0) brakeState = 0;
                            if (brakeState > 100) brakeState = 100;
                            
                            if (leftTurnText === '开启') {
                                turnLight = 50;
                            } else if (rightTurnText === '开启') {
                                turnLight = -50;
                            } else {
                                turnLight = 0;
                            }
                            currentPosition = positionText;
                            
                            batteryPercentage = parseFloat(batteryPercentageText) || 0;
                            if (batteryPercentage < 0) batteryPercentage = 0;
                            if (batteryPercentage > 100) batteryPercentage = 100;
                            
                            // 车窗百分比赋值
                            driverWindowPercent = parseFloat(driverWindowText) || 0;
                            if (driverWindowPercent < 0) driverWindowPercent = 0;
                            if (driverWindowPercent > 100) driverWindowPercent = 100;
                            
                            passengerWindowPercent = parseFloat(passengerWindowText) || 0;
                            if (passengerWindowPercent < 0) passengerWindowPercent = 0;
                            if (passengerWindowPercent > 100) passengerWindowPercent = 100;
                            
                            leftRearWindowPercent = parseFloat(leftRearWindowText) || 0;
                            if (leftRearWindowPercent < 0) leftRearWindowPercent = 0;
                            if (leftRearWindowPercent > 100) leftRearWindowPercent = 100;
                            
                            rightRearWindowPercent = parseFloat(rightRearWindowText) || 0;
                            if (rightRearWindowPercent < 0) rightRearWindowPercent = 0;
                            if (rightRearWindowPercent > 100) rightRearWindowPercent = 100;

                            if (!hasRecordedInitialData) {
                                initialMileage = currentMileage;
                                initialElectricityConsumption = currentElectricity;
                                initialFuelConsumption = currentFuel;
                                hasRecordedInitialData = true;
                                tripMileage = "0.0";
                                electricityConsumption = "0.0";
                                fuelConsumption = "0.0";
                                tripCost = "0.0";                          
                            } else {
                                tripMileage = ((currentMileage - initialMileage) / 10).toFixed(1);
                                electricityConsumption = (currentElectricity - initialElectricityConsumption).toFixed(1);
                                fuelConsumption = (currentFuel - initialFuelConsumption).toFixed(1);
                                
                                var cost = (electricityConsumption * dianJia + fuelConsumption * youJia).toFixed(1);
                                tripCost = cost;
                                
                                cabinTemp = cabinTemperature;
                            }
                        }
                    }
                } catch(e) {}
            }
        }
    };
    xhr.send();
}
Timer {
    id: speedLimitRatioTimer
    interval: 500 // 每秒计算一次
    running: valueTwo > 0
    repeat: true
    onTriggered: {
        // 根据条件选择速度值
        var speed = DataSource.speed;
        var limit = parseFloat(valueTwo);
        speedLimitRatio = speed / limit;
    }
}
Image {
    id: alarmImage2
    visible: speedLimitRatio > 1.0 && speedLimitRatio < 1.1 && valueTwo > 0 && shanGan === 0
    source: "qrc:/images10_25/display_always/报警.png"
    opacity: 1.0
}

Image {
    id: alarmImage
    visible: speedLimitRatio >= 1.1 && valueTwo > 0 && shanGan === 0 
    source: "qrc:/images10_25/display_always/报警2.png"
    opacity: 0
}

SequentialAnimation {
    id: alarmSwitch
    running: speedLimitRatio >= 1.1 && valueTwo > 0
    loops: Animation.Infinite

    PropertyAnimation {
        target: alarmImage
        duration: 1000
        property: "opacity"
        from: 0
        to: 0.6
    }

    PropertyAnimation {
        target: alarmImage
        duration: 1000
        property: "opacity"
        from: 0.6
        to: 0
    }
}
SequentialAnimation {
    id: alarmSwitch2
    running: speedLimitRatio > 1.0 && speedLimitRatio < 1.1 && valueTwo > 0
    loops: Animation.Infinite

    PropertyAnimation {
        target: alarmImage2
        duration: 1000
        property: "opacity"
        from: 0
        to: 0.6
    }

    PropertyAnimation {
        target: alarmImage2
        duration: 1000
        property: "opacity"
        from: 0.6
        to: 0
    }
}
Timer {
    id: shiJiander
    interval: 1000
    repeat: true
    running: false
	onTriggered: {
	shijian++
	}
}
Timer {
    id: tripTimeUpdateTimer
    interval: 1000 // 每秒触发一次
    repeat: true
    running: DataSource.powerGear === 3
    onTriggered: {
        // 将当前时间字符串分割为时、分、秒
        var timeParts = tripTime.split(":");
        var hours = parseInt(timeParts[0]);
        var minutes = parseInt(timeParts[1]);
        var seconds = parseInt(timeParts[2]);
        
        // 增加1秒
        seconds++;
        if (seconds >= 60) {
            seconds = 0;
            minutes++;
            if (minutes >= 60) {
                minutes = 0;
                hours++;
                if (hours >= 100) { // 限制最大99小时
                    hours = 99;
                    minutes = 59;
                    seconds = 59;
                }
            }
        }
        
        // 格式化为两位数显示
        tripTime = 
            hours.toString().padStart(2, '0') + ":" + 
            minutes.toString().padStart(2, '0') + ":" + 
            seconds.toString().padStart(2, '0');
    }
}
Rectangle {
    id: vehicleDataContainer2
    visible: DataSource.menuNeedDisplay === DataSource.UI_DISPLAY
    x: 1425 - 110
    y: 210 - 70
z: 100
    width: 400
    height: 410
    radius: 15
    color: "transparent"//DataSource.dayNightMode === 0x02 ? "#CC000000":"#CCFFFFFF"
    
    // 添加六条水平虚线分割线
    Repeater {
        model: 6
        Canvas {
            width: parent.width - 20
            height: 0
            x: 10
            y: (index + 1) * (parent.height / 7)
            onPaint: {
                var ctx = getContext("2d");
                ctx.reset();
                ctx.strokeStyle = "#3c8ed0";
                ctx.setLineDash([10, 4]);
                ctx.beginPath();
                ctx.moveTo(0, 0.5);
                ctx.lineTo(width, 0.5);
                ctx.stroke();
            }
        }
    }

    Column {
        anchors.fill: parent
        anchors.margins: 0
        spacing: 0

        // 本次行驶时间
        Row {
            width: parent.width
            height: parent.height / 7
            spacing: 10
            bottomPadding: 5
            leftPadding: 15  
            
            Text {
                font.bold:rootItemId.jiacu === 1
                text: "本次时间"
				font.family: rootItemId.ziti
                color: DataSource.dayNightMode === 0x02 ? "#ffffff" : "#333333"
                font.pixelSize: 25  
                width: 60
                anchors.bottom: parent.bottom
            }
            
            Item {
                width: parent.width - 90 - parent.spacing
                height: parent.height
                
                Text {
                    font.bold:rootItemId.jiacu === 1
                    anchors.right: parent.right
                    text: tripTime
					font.family: rootItemId.ziti
                    color: DataSource.dayNightMode === 0x02 ? "#ffffff" : "#333333"
                    font.pixelSize: 30  
                    anchors.bottom: parent.bottom
                }
            }
        }
        
        // 本次里程
        Row {
            width: parent.width
            height: parent.height / 7
            spacing: 10
            bottomPadding: 5
            leftPadding: 15  
            
            Text {
                font.bold:rootItemId.jiacu === 1
                text: "本次里程"
				font.family: rootItemId.ziti
                color: DataSource.dayNightMode === 0x02 ? "#ffffff" : "#333333"
                font.pixelSize: 25  
                width: 60
                anchors.bottom: parent.bottom
            }
            
            Row {
                spacing: 5
                layoutDirection: Qt.RightToLeft
                width: parent.width - 90 - parent.spacing
                anchors.bottom: parent.bottom
                anchors.bottomMargin: 5
                
                Text {
                    font.bold:rootItemId.jiacu === 1
                    text: "公里"
					font.family: rootItemId.ziti
                    color: DataSource.dayNightMode === 0x02 ? "#ffffff" : "#333333"
                    font.pixelSize: 20  
                    anchors.baseline: parent.bottom
                }
                
                Text {
                    font.bold:rootItemId.jiacu === 1
                    text: tripMileage
					font.family: rootItemId.ziti
                    color: DataSource.dayNightMode === 0x02 ? "#ffffff" : "#333333"
                    font.pixelSize: 30  
                    anchors.baseline: parent.bottom
                }
            }
        }
        
        // 本次电耗
        Row {
            width: parent.width
            height: parent.height / 7
            spacing: 10
            bottomPadding: 5
            leftPadding: 15  
            
            Text {
                font.bold:rootItemId.jiacu === 1
                text: "本次电耗"
				font.family: rootItemId.ziti
                color: DataSource.dayNightMode === 0x02 ? "#ffffff" : "#333333"
                font.pixelSize: 25  
                width: 60
                anchors.bottom: parent.bottom
            }
            
            Row {
                spacing: 5
                layoutDirection: Qt.RightToLeft
                width: parent.width - 90 - parent.spacing
                anchors.bottom: parent.bottom
                anchors.bottomMargin: 5

                
                Text {
                    font.bold:rootItemId.jiacu === 1
                    text: "度"
					font.family: rootItemId.ziti
                    color: DataSource.dayNightMode === 0x02 ? "#ffffff" : "#333333"
                    font.pixelSize: 20  
                    anchors.baseline: parent.bottom
                }
                
                Text {
                    font.bold:rootItemId.jiacu === 1
                    text: electricityConsumption
					font.family: rootItemId.ziti
                    color: DataSource.dayNightMode === 0x02 ? "#ffffff" : "#333333"
                    font.pixelSize: 30  
                    anchors.baseline: parent.bottom
                }
            }
        }
        
        // 本次油耗
        Row {
            width: parent.width
            height: parent.height / 7
            spacing: 10
            bottomPadding: 5
            leftPadding: 15  
            
            Text {
                font.bold:rootItemId.jiacu === 1
                text: "本次油耗"
				font.family: rootItemId.ziti
                color: DataSource.dayNightMode === 0x02 ? "#ffffff" : "#333333"
                font.pixelSize: 25  
                width: 60
                anchors.bottom: parent.bottom
            }
            
            Row {
                spacing: 5
                layoutDirection: Qt.RightToLeft
                width: parent.width - 90 - parent.spacing
                anchors.bottom: parent.bottom
                anchors.bottomMargin: 5
                
                Text {
                    font.bold:rootItemId.jiacu === 1
                    text: "升"
					font.family: rootItemId.ziti
                    color: DataSource.dayNightMode === 0x02 ? "#ffffff" : "#333333"
                    font.pixelSize: 20  
                    anchors.baseline: parent.bottom
                }
                
                Text {
                    font.bold:rootItemId.jiacu === 1
                    text: fuelConsumption
					font.family: rootItemId.ziti
                    color: DataSource.dayNightMode === 0x02 ? "#ffffff" : "#333333"
                    font.pixelSize: 30  
                    anchors.baseline: parent.bottom
                }
            }
        }
        
        // 本次费用
        Row {
            width: parent.width
            height: parent.height / 7
            spacing: 10
            bottomPadding: 5
            leftPadding: 15  
            
            Text {
                font.bold:rootItemId.jiacu === 1
                text: "本次费用"
				font.family: rootItemId.ziti
                color: DataSource.dayNightMode === 0x02 ? "#ffffff" : "#333333"
                font.pixelSize: 25  
                width: 60
                anchors.bottom: parent.bottom
            }
            
            Row {
                spacing: 5
                layoutDirection: Qt.RightToLeft
                width: parent.width - 90 - parent.spacing
                anchors.bottom: parent.bottom
                anchors.bottomMargin: 5
                
                Text {
                    font.bold:rootItemId.jiacu === 1
                    text: "元"
					font.family: rootItemId.ziti
                    color: DataSource.dayNightMode === 0x02 ? "#ffffff" : "#333333"
                    font.pixelSize: 20  
                    anchors.baseline: parent.bottom
                }
                
                Text {
                    font.bold:rootItemId.jiacu === 1
                    text: tripCost
					font.family: rootItemId.ziti
                    color: DataSource.dayNightMode === 0x02 ? "#ffffff" : "#333333"
                    font.pixelSize: 30  
                    anchors.baseline: parent.bottom
                }
            }
        }
        
Row {
    width: parent.width
    height: parent.height / 7
    spacing: 10
    bottomPadding: 5
    leftPadding: 15  
    
    Text {
        font.bold:rootItemId.jiacu === 1
        text: "上次充电"
		font.family: rootItemId.ziti
        color: DataSource.dayNightMode === 0x02 ? "#ffffff" : "#333333"
        font.pixelSize: 25  
        width: 60
        anchors.bottom: parent.bottom
    }
    
Row {
    spacing: 5
    layoutDirection: Qt.RightToLeft
    width: parent.width - 90 - parent.spacing
    anchors.bottom: parent.bottom
    anchors.bottomMargin: 5
    
    // 评估等级文本（彩色）
    Text {
        font.bold:rootItemId.jiacu === 1
        id: levelText
        text: {
            if (calculatedValueRounded < 0.9) {
                return "差";
            } else if (calculatedValueRounded >= 0.9 && calculatedValueRounded <= 1.1) {
                return "良";
            } else {
                return "优";
            }
        }
        font.family: rootItemId.ziti
        color: {
            if (calculatedValueRounded < 0.9) {
                return "#b30000";  // 红色
            } else if (calculatedValueRounded >= 0.9 && calculatedValueRounded <= 1.1) {
                return "#0066cc";  // 蓝色
            } else {  // calculatedValueRounded > 1.1
                return "#006600";  // 绿色
            }
        }
        
        font.pixelSize: 25
        anchors.baseline: parent.bottom
    }
    
    // 分隔符"|"
    Text {
        font.bold:rootItemId.jiacu === 1
        text: "|"
		font.family: rootItemId.ziti
        color: DataSource.dayNightMode === 0x02 ? "#ffffff" : "#333333"
        font.pixelSize: 25
        anchors.baseline: parent.bottom
    }
    
    // SOC增量
    Text {
        font.bold:rootItemId.jiacu === 1
        text: socIncreaseRounded + "%"
		font.family: rootItemId.ziti
        color: DataSource.dayNightMode === 0x02 ? "#ffffff" : "#333333"
        font.pixelSize: 25
        anchors.baseline: parent.bottom
    }
    
    // 分隔符"|"
    Text {
        font.bold:rootItemId.jiacu === 1
        text: "|"
		font.family: rootItemId.ziti
        color: DataSource.dayNightMode === 0x02 ? "#ffffff" : "#333333"
        font.pixelSize: 25
        anchors.baseline: parent.bottom
    }
    
    // 充电度数
    Text {
        font.bold:rootItemId.jiacu === 1
        text: chargeAmountRounded + "度"
		font.family: rootItemId.ziti
        color: DataSource.dayNightMode === 0x02 ? "#ffffff" : "#333333"
        font.pixelSize: 25
        anchors.baseline: parent.bottom
    }
}
}
        // 近期能耗
Row {
    width: parent.width
    height: parent.height / 7
    spacing: 10
    bottomPadding: 0 // 最后一行不需要底部padding
    leftPadding: 15  
    
    Text {
        font.bold:rootItemId.jiacu === 1
        text: "近期能耗"
		font.family: rootItemId.ziti
        color: DataSource.dayNightMode === 0x02 ? "#ffffff" : "#333333"
        font.pixelSize: 25  
        width: 60
        anchors.bottom: parent.bottom
    }
    
    Item {
        width: parent.width - 90 - parent.spacing
        height: parent.height
        
        Row {
            anchors.right: parent.right
            anchors.bottom: parent.bottom
            spacing: 0
            
            Text {
                font.bold:rootItemId.jiacu === 1
                font.family: rootItemId.ziti
                text: "("+DataSource.recent50PowerValue+"度"+DataSource.recent50FuelValue+"升"+")"+"/百公里"
                color: DataSource.dayNightMode === 0x02 ? "#ffffff" : "#333333"
                font.pixelSize: 25
                anchors.bottom: parent.bottom
            }
                }
            }
        }
    }
}

Item {
    id: tirePressureDisplay2
    visible: DataSource.menuNeedDisplay === DataSource.UI_DISPLAY
z: 100   
    
    // 胎压车模图片显示
Image {
    id: tirePressureCarImage2
    x: 240+107
    y: 240
    visible: parent.visible 
    source: DataSource.dayNightMode === 0x01 && DataSource.lfTirePressureColor === 1 ? "qrc:/images10_25/display_always/1-1.png" :
            DataSource.dayNightMode === 0x01 && DataSource.lfTirePressureColor === 2 ? "qrc:/images10_25/display_always/1-2.png" :
            DataSource.dayNightMode === 0x01 && DataSource.lfTirePressureColor === 3 ? "qrc:/images10_25/display_always/1-3.png" :
            DataSource.dayNightMode === 0x02 && DataSource.lfTirePressureColor === 1 ? "qrc:/images10_25/display_always/2-1.png" :
            DataSource.dayNightMode === 0x02 && DataSource.lfTirePressureColor === 2 ? "qrc:/images10_25/display_always/2-2.png" :
            DataSource.dayNightMode === 0x02 && DataSource.lfTirePressureColor === 3 ? "qrc:/images10_25/display_always/2-3.png" :
            ""
}    
    // 车内温度显示
    Text {
        font.bold:rootItemId.jiacu === 1
        id: cabinTempValue2
        font.pixelSize: 30
        x: 295 - (cabinTempValue2.width + cabinTempUnit2.width) / 2 + 107
        y: 245 - cabinTempValue2.height + 120
        text: cabinTemp
		font.family: rootItemId.ziti
        visible: parent.visible
        color: (DataSource.dayNightMode === 0x02 || DataSource.powerGear !== 3) ? "#ffffff" : "#333333"
    }

    Text {
        font.bold:rootItemId.jiacu === 1
        id: cabinTempUnit2
        text: "℃"
		font.family: rootItemId.ziti
        font.pixelSize: 22
        anchors.left: cabinTempValue2.right
        anchors.leftMargin: 3
        anchors.bottom: cabinTempValue2.bottom
        anchors.bottomMargin: 4
        visible: parent.visible
        color: (DataSource.dayNightMode === 0x02 || DataSource.powerGear !== 3) ? "#ffffff" : "#333333"
    }
    
    // 左前轮胎
    Text {
        font.bold:rootItemId.jiacu === 1
        id: lfTireValue2
        font.pixelSize: 30
        x: 129 + 107
        y: 266-2
        text: DataSource.lfTirePressureValue
		font.family: rootItemId.ziti
        states: [
            State {
                name: "white"
                when: DataSource.lfTirePressureColor === 1
                PropertyChanges {
                    target: lfTireValue2
                    color: (DataSource.dayNightMode === 0x02 || DataSource.powerGear !== 3) ? "#ffffff" : "#333333"
                }
            },
            State {
                name: "yellow"
                when: DataSource.lfTirePressureColor === 2
                PropertyChanges {
                    target: lfTireValue2
                    color: "#ffff00"
                }
            },
            State {
                name: "red"
                when: DataSource.lfTirePressureColor === 3
                PropertyChanges {
                    target: lfTireValue2
                    color: "#ff0000"
                }
            }
        ]
    }
    
    Text {
        font.bold:rootItemId.jiacu === 1
        id: lfTireUnit2
        text: qsTr("kPa")
		font.family: rootItemId.ziti
        font.pixelSize: 22
        anchors.left: lfTireValue2.right
        anchors.leftMargin: 3
        anchors.bottom: lfTireValue2.bottom
        anchors.bottomMargin: 2
        visible: lfTireValue2.visible
        color: DataSource.lfTirePressureColor === 1 ? (DataSource.dayNightMode === 0x02 ? "#ffffff" : "#333333") : lfTireValue2.color
        states: [
            State {
                name: "bar"
                when: DataSource.tirePressureUnit === 1
                PropertyChanges {
                    target: lfTireUnit2
                    text: "bar"
                }
            },
            State {
                name: "psi"
                when: DataSource.tirePressureUnit === 2
                PropertyChanges {
                    target: lfTireUnit2
                    text: "psi"
                }
            },
            State {
                name: "kPa"
                when: DataSource.tirePressureUnit === 3
                PropertyChanges {
                    target: lfTireUnit2
                    text: "kPa"
                }
            }
        ]
    }

    Rectangle {
        width: lfTireValue2.width + lfTireUnit2.width + 3
        height: 1
        x: lfTireValue2.x
        y: 296
        color: DataSource.lfTirePressureColor === 1 ? (DataSource.dayNightMode === 0x02 ? "#ffffff" : "#333333") : lfTireValue2.color
        opacity: 0
    }

    Text {
        font.bold:rootItemId.jiacu === 1
        id: lfTireTempValue2
        text: DataSource.lfTireTempValue
		font.family: rootItemId.ziti
        font.pixelSize: 30
        x: 149 + 107
        y: 301-6
        states: [
            State {
                name: "white"
                when: DataSource.lfTireTempColor === 1
                PropertyChanges {
                    target: lfTireTempValue2
                    color: (DataSource.dayNightMode === 0x02 || DataSource.powerGear !== 3) ? "#ffffff" : "#333333"
                }
            },
            State {
                name: "yellow"
                when: DataSource.lfTireTempColor === 2
                PropertyChanges {
                    target: lfTireTempValue2
                    color: "#ffff00"
                }
            },
            State {
                name: "red"
                when: DataSource.lfTireTempColor === 3
                PropertyChanges {
                    target: lfTireTempValue2
                    color: "#ff0000"
                }
            }
        ]
    }

    Text {
        font.bold:rootItemId.jiacu === 1
        id: lfTireTempUnit2
        text: DataSource.tireTempUnit !== 1 ? "°C" : "°F"
		font.family: rootItemId.ziti
        anchors.left: lfTireTempValue2.right
        anchors.leftMargin: 3
        anchors.bottom: lfTireTempValue2.bottom
        anchors.bottomMargin: 2
        font.pixelSize: 22
        horizontalAlignment: Text.AlignHCenter
        color: DataSource.lfTireTempColor === 1 ? (DataSource.dayNightMode === 0x02 ? "#ffffff" : "#333333") : lfTireTempValue2.color
    }

    // 右前轮胎
    Text {
        font.bold:rootItemId.jiacu === 1
        id: rfTireValue2
        font.pixelSize: 30
        x: 365 + 107
        y: 266-2
        text: DataSource.rfTirePressureValue
		font.family: rootItemId.ziti
        states: [
            State {
                name: "white"
                when: DataSource.rfTirePressureColor === 1
                PropertyChanges {
                    target: rfTireValue2
                    color: (DataSource.dayNightMode === 0x02 || DataSource.powerGear !== 3) ? "#ffffff" : "#333333"
                }
            },
            State {
                name: "yellow"
                when: DataSource.rfTirePressureColor === 2
                PropertyChanges {
                    target: rfTireValue2
                    color: "#ffff00"
                }
            },
            State {
                name: "red"
                when: DataSource.rfTirePressureColor === 3
                PropertyChanges {
                    target: rfTireValue2
                    color: "#ff0000"
                }
            }
        ]
    }
    
    Text {
        font.bold:rootItemId.jiacu === 1
        id: rfTireUnit2
        text: qsTr("kPa")
		font.family: rootItemId.ziti
        font.pixelSize: 22
        anchors.left: rfTireValue2.right
        anchors.leftMargin: 3
        anchors.bottom: rfTireValue2.bottom
        anchors.bottomMargin: 2
        visible: rfTireValue2.visible
        color: DataSource.rfTirePressureColor === 1 ? (DataSource.dayNightMode === 0x02 ? "#ffffff" : "#333333") : rfTireValue2.color
        states: [
            State {
                name: "bar"
                when: DataSource.tirePressureUnit === 1
                PropertyChanges {
                    target: rfTireUnit2
                    text: "bar"
                }
            },
            State {
                name: "psi"
                when: DataSource.tirePressureUnit === 2
                PropertyChanges {
                    target: rfTireUnit2
                    text: "psi"
                }
            },
            State {
                name: "kPa"
                when: DataSource.tirePressureUnit === 3
                PropertyChanges {
                    target: rfTireUnit2
                    text: "kPa"
                }
            }
        ]
    }

    Rectangle {
        width: rfTireValue2.width + rfTireUnit2.width + 3
        height: 1
        x: rfTireValue2.x
        y: 296
        color: DataSource.rfTirePressureColor === 1 ? (DataSource.dayNightMode === 0x02 ? "#ffffff" : "#333333") : rfTireValue2.color
        opacity: 0
    }

    Text {
        font.bold:rootItemId.jiacu === 1
        id: rfTireTempValue2
        font.pixelSize: 30
        x: 385 + 107
        y: 301-6
        text: DataSource.rfTireTempValue
		font.family: rootItemId.ziti
        states: [
            State {
                name: "white"
                when: DataSource.rfTireTempColor === 1
                PropertyChanges {
                    target: rfTireTempValue2
                    color: (DataSource.dayNightMode === 0x02 || DataSource.powerGear !== 3) ? "#ffffff" : "#333333"
                }
            },
            State {
                name: "yellow"
                when: DataSource.rfTireTempColor === 2
                PropertyChanges {
                    target: rfTireTempValue2
                    color: "#ffff00"
                }
            },
            State {
                name: "red"
                when: DataSource.rfTireTempColor === 3
                PropertyChanges {
                    target: rfTireTempValue2
                    color: "#ff0000"
                }
            }
        ]
    }

    Text {
        font.bold:rootItemId.jiacu === 1
        id: rfTireTempUnit2
        text: DataSource.tireTempUnit !== 1 ? "°C" : "°F"
		font.family: rootItemId.ziti
        anchors.left: rfTireTempValue2.right
        anchors.leftMargin: 3
        anchors.bottom: rfTireTempValue2.bottom
        anchors.bottomMargin: 2
        font.pixelSize: 22
        horizontalAlignment: Text.AlignHCenter
        color: DataSource.rfTireTempColor === 1 ? (DataSource.dayNightMode === 0x02 ? "#ffffff" : "#333333") : rfTireTempValue2.color
    }

    // 左后轮胎
    Text {
        font.bold:rootItemId.jiacu === 1
        id: lrTireValue2
        text: DataSource.lrTirePressureValue
		font.family: rootItemId.ziti
        font.pixelSize: 30
        x: 129 + 107
        y: 394-2
        states: [
            State {
                name: "white"
                when: DataSource.lrTirePressureColor === 1
                PropertyChanges {
                    target: lrTireValue2
                    color: (DataSource.dayNightMode === 0x02 || DataSource.powerGear !== 3) ? "#ffffff" : "#333333"
                }
            },
            State {
                name: "yellow"
                when: DataSource.lrTirePressureColor === 2
                PropertyChanges {
                    target: lrTireValue2
                    color: "#ffff00"
                }
            },
            State {
                name: "red"
                when: DataSource.lrTirePressureColor === 3
                PropertyChanges {
                    target: lrTireValue2
                    color: "#ff0000"
                }
            }
        ]
    }
    
    Text {
        font.bold:rootItemId.jiacu === 1
        id: lrTireUnit2
        text: qsTr("kPa")
		font.family: rootItemId.ziti
        font.pixelSize: 22
        anchors.left: lrTireValue2.right
        anchors.leftMargin: 3
        anchors.bottom: lrTireValue2.bottom
        anchors.bottomMargin: 2
        visible: lrTireValue2.visible
        color: DataSource.lrTirePressureColor === 1 ? (DataSource.dayNightMode === 0x02 ? "#ffffff" : "#333333") : lrTireValue2.color
        states: [
            State {
                name: "bar"
                when: DataSource.tirePressureUnit === 1
                PropertyChanges {
                    target: lrTireUnit2
                    text: "bar"
                }
            },
            State {
                name: "psi"
                when: DataSource.tirePressureUnit === 2
                PropertyChanges {
                    target: lrTireUnit2
                    text: "psi"
                }
            },
            State {
                name: "kPa"
                when: DataSource.tirePressureUnit === 3
                PropertyChanges {
                    target: lrTireUnit2
                    text: "kPa"
                }
            }
        ]
    }

    Rectangle {
        width: lrTireValue2.width + lrTireUnit2.width + 3
        height: 1
        x: lrTireValue2.x
        y: 424
        color: DataSource.lrTirePressureColor === 1 ? (DataSource.dayNightMode === 0x02 ? "#ffffff" : "#333333") : lrTireValue2.color
        opacity: 0
    }

    Text {
        font.bold:rootItemId.jiacu === 1
        id: lrTireTempValue2
        text: DataSource.lrTireTempValue
		font.family: rootItemId.ziti
        font.pixelSize: 30
        x: 149 + 107
        y: 429-6
        states: [
            State {
                name: "white"
                when: DataSource.lrTireTempColor === 1
                PropertyChanges {
                    target: lrTireTempValue2
                    color: (DataSource.dayNightMode === 0x02 || DataSource.powerGear !== 3) ? "#ffffff" : "#333333"
                }
            },
            State {
                name: "yellow"
                when: DataSource.lrTireTempColor === 2
                PropertyChanges {
                    target: lrTireTempValue2
                    color: "#ffff00"
                }
            },
            State {
                name: "red"
                when: DataSource.lrTireTempColor === 3
                PropertyChanges {
                    target: lrTireTempValue2
                    color: "#ff0000"
                }
            }
        ]
    }

    Text {
        font.bold:rootItemId.jiacu === 1
        id: lrTireTempUnit2
        text: DataSource.tireTempUnit !== 1 ? "°C" : "°F"
		font.family: rootItemId.ziti
        anchors.left: lrTireTempValue2.right
        anchors.leftMargin: 3
        anchors.bottom: lrTireTempValue2.bottom
        anchors.bottomMargin: 2
        color: DataSource.lrTireTempColor === 1 ? (DataSource.dayNightMode === 0x02 ? "#ffffff" : "#333333") : lrTireTempValue2.color
        font.pixelSize: 22
        horizontalAlignment: Text.AlignHCenter
    }

    // 右后轮胎
    Text {
        font.bold:rootItemId.jiacu === 1
        id: rrTireValue2
        font.pixelSize: 30
        x: 365 + 107
        y: 394-2
        text: DataSource.rrTirePressureValue
		font.family: rootItemId.ziti
        states: [
            State {
                name: "white"
                when: DataSource.rrTirePressureColor === 1
                PropertyChanges {
                    target: rrTireValue2
                    color: (DataSource.dayNightMode === 0x02 || DataSource.powerGear !== 3) ? "#ffffff" : "#333333"
                }
            },
            State {
                name: "yellow"
                when: DataSource.rrTirePressureColor === 2
                PropertyChanges {
                    target: rrTireValue2
                    color: "#ffff00"
                }
            },
            State {
                name: "red"
                when: DataSource.rrTirePressureColor === 3
                PropertyChanges {
                    target: rrTireValue2
                    color: "#ff0000"
                }
            }
        ]
    }
    
    Text {
        font.bold:rootItemId.jiacu === 1
        id: rrTireUnit2
        text: qsTr("kPa")
		font.family: rootItemId.ziti
        font.pixelSize: 22
        anchors.left: rrTireValue2.right
        anchors.leftMargin: 3
        anchors.bottom: rrTireValue2.bottom
        anchors.bottomMargin: 2
        visible: rrTireValue2.visible
        color: DataSource.rrTirePressureColor === 1 ? (DataSource.dayNightMode === 0x02 ? "#ffffff" : "#333333") : rrTireValue2.color
        states: [
            State {
                name: "bar"
                when: DataSource.tirePressureUnit === 1
                PropertyChanges {
                    target: rrTireUnit2
                    text: "bar"
                }
            },
            State {
                name: "psi"
                when: DataSource.tirePressureUnit === 2
                PropertyChanges {
                    target: rrTireUnit2
                    text: "psi"
                }
            },
            State {
                name: "kPa"
                when: DataSource.tirePressureUnit === 3
                PropertyChanges {
                    target: rrTireUnit2
                    text: "kPa"
                }
            }
        ]
    }

    Rectangle {
        width: rrTireValue2.width + rrTireUnit2.width + 3
        height: 1
        x: rrTireValue2.x
        y: 424
        color: DataSource.rrTirePressureColor === 1 ? (DataSource.dayNightMode === 0x02 ? "#ffffff" : "#333333") : rrTireValue2.color
        opacity: 0
    }

    Text {
        font.bold:rootItemId.jiacu === 1
        id: rrTireTempValue2
        font.pixelSize: 30
        x: 385 + 107
        y: 429-6
        text: DataSource.rrTireTempValue
		font.family: rootItemId.ziti
        states: [
            State {
                name: "white"
                when: DataSource.rrTireTempColor === 1
                PropertyChanges {
                    target: rrTireTempValue2
                    color: (DataSource.dayNightMode === 0x02 || DataSource.powerGear !== 3) ? "#ffffff" : "#333333"
                }
            },
            State {
                name: "yellow"
                when: DataSource.rrTireTempColor === 2
                PropertyChanges {
                    target: rrTireTempValue2
                    color: "#ffff00"
                }
            },
            State {
                name: "red"
                when: DataSource.rrTireTempColor === 3
                PropertyChanges {
                    target: rrTireTempValue2
                    color: "#ff0000"
                }
            }
        ]
    }

    Text {
        font.bold:rootItemId.jiacu === 1
        id: rrTireTempUnit2
        text: DataSource.tireTempUnit !== 1 ? "°C" : "°F"
		font.family: rootItemId.ziti
        anchors.left: rrTireTempValue2.right
        anchors.leftMargin: 3
        anchors.bottom: rrTireTempValue2.bottom
        anchors.bottomMargin: 2
        font.pixelSize: 22
        horizontalAlignment: Text.AlignHCenter
        color: DataSource.rrTireTempColor === 1 ? (DataSource.dayNightMode === 0x02 ? "#ffffff" : "#333333") : rrTireTempValue2.color
    }
}
Timer {
    id: hideApiMessageTimer
    interval: 20000 
    onTriggered: {
        apiMessageBox.visible = false;
    }
}	

// Add this rectangle and text component with rounded corners
Rectangle {
    id: apiMessageBox
    x: 10
    y: 180
    z: 9999
    width: Math.min(450, apiMessageText.implicitWidth + 30)  // 动态宽度，最大450，加30px边距
    height: apiMessageText.implicitHeight + 30  // 动态高度，完全由内容决定
    radius: 10  // 圆角
    color: DataSource.dayNightMode === 0x02 ? "#000000" : "#ffffff" // 80%透明度黑/白背景
    visible: false 
    
    // 确保圆角正确裁剪
    layer.enabled: true
    layer.effect: OpacityMask {
        maskSource: Rectangle {
            width: apiMessageBox.width
            height: apiMessageBox.height
            radius: apiMessageBox.radius
        }
    }
    
    // 直接使用Text，不再用Flickable
    Text {
        font.bold:rootItemId.jiacu === 1
        id: apiMessageText
        anchors.fill: parent
        anchors.margins: 15  // 内边距
        text: apiMessage
		font.family: rootItemId.ziti
        color: DataSource.dayNightMode === 0x02 ? "#ffffff" : "#333333" // 文字颜色
        font.pixelSize: 28
        wrapMode: Text.WordWrap  // 自动换行
        horizontalAlignment: Text.AlignLeft
        verticalAlignment: Text.AlignTop
    }
}
function initWebSocket() {
    if (webSocket) {
        webSocket.destroy()
    }
    
    webSocket = Qt.createQmlObject('import QtWebSockets 1.1; WebSocket {}', rootItemId)
    webSocket.url = "ws://localhost:8698"
    webSocket.active = true
    
    webSocket.onTextMessageReceived.connect(function(message) {
        webSocketMessage = message;
        console.log("WebSocket message received:", message);  
try {
    var jsonObj = JSON.parse(message);
	if (jsonObj["字体"]) {
    ziti = jsonObj["字体"];
	haogeSettings.storedziti = ziti;
    return;
    }		
	if (jsonObj["字体加粗"]) {
    jiacu = jsonObj["字体加粗"];
	haogeSettings.storedjiacu = jiacu;
    return;
    }	
	if (jsonObj["地图延迟"]) {
    maptime = jsonObj["地图延迟"];
	haogeSettings.storedmaptime = maptime;
    return;
}		
	if (jsonObj["单位显示"]) {
    danwei = jsonObj["单位显示"];
	haogeSettings.storeddanwei = danwei;
    return;
}	
	if (jsonObj["速度y"]) {
    suduy = jsonObj["速度y"];
	haogeSettings.storedsuduy = suduy;
    return;
}
	if (jsonObj["时间X"]) {
    timeX = jsonObj["时间X"];
    haogeSettings.storedTimeX = timeX;
    return;
}
	if (jsonObj["时间Y"]) {
    timeY = jsonObj["时间Y"];
    haogeSettings.storedTimeY = timeY;
    return;
}
	if (jsonObj["方位X"]) {
    fangweiX = jsonObj["方位X"];
    haogeSettings.storedFangweiX = fangweiX;
    return;
}
	if (jsonObj["方位Y"]) {
    fangweiY = jsonObj["方位Y"];
    haogeSettings.storedFangweiY = fangweiY;
    return;
}
	if (jsonObj["温度X"]) {
    tempX = jsonObj["温度X"];
    haogeSettings.storedTempX = tempX;
    return;
}
	if (jsonObj["温度Y"]) {
    tempY = jsonObj["温度Y"];
    haogeSettings.storedTempY = tempY;
    return;
}
	if (jsonObj["ECO_X"]) {
    ecoX = jsonObj["ECO_X"];
    haogeSettings.storedEcoX = ecoX;
    return;
}
	if (jsonObj["ECO_Y"]) {
    ecoY = jsonObj["ECO_Y"];
    haogeSettings.storedEcoY = ecoY;
    return;
}
	if (jsonObj["SPORT_X"]) {
    sportX = jsonObj["SPORT_X"];
    haogeSettings.storedSportX = sportX;
    return;
}
	if (jsonObj["SPORT_Y"]) {
    sportY = jsonObj["SPORT_Y"];
    haogeSettings.storedSportY = sportY;
    return;
}
	if (jsonObj["NORMAL_X"]) {
    normalX = jsonObj["NORMAL_X"];
    haogeSettings.storedNormalX = normalX;
    return;
}
	if (jsonObj["NORMAL_Y"]) {
    normalY = jsonObj["NORMAL_Y"];
    haogeSettings.storedNormalY = normalY;
    return;
}
	if (jsonObj["EV_X"]) {
    evX = jsonObj["EV_X"];
    haogeSettings.storedEvX = evX;
    return;
}
	if (jsonObj["EV_Y"]) {
    evY = jsonObj["EV_Y"];
    haogeSettings.storedEvY = evY;
    return;
}
	if (jsonObj["HEV_X"]) {
    hevX = jsonObj["HEV_X"];
    haogeSettings.storedHevX = hevX;
    return;
}
	if (jsonObj["HEV_Y"]) {
    hevY = jsonObj["HEV_Y"];
    haogeSettings.storedHevY = hevY;
    return;
}
	if (jsonObj["OK_X"]) {
    okX = jsonObj["OK_X"];
    haogeSettings.storedOkX = okX;
    return;
}
	if (jsonObj["OK_Y"]) {
    okY = jsonObj["OK_Y"];
    haogeSettings.storedOkY = okY;
    return;
}
// 自动驻车 AVH
	if (jsonObj["AVH_X"]) {
    autoHoldX = jsonObj["AVH_X"];
    haogeSettings.storedAutoHoldX = autoHoldX;
    return;
}
	if (jsonObj["AVH_Y"]) {
    autoHoldY = jsonObj["AVH_Y"];
    haogeSettings.storedAutoHoldY = autoHoldY;
    return;
}
// 电子驻车 EPB
	if (jsonObj["EPB_X"]) {
    epbX = jsonObj["EPB_X"];
    haogeSettings.storedEpbX = epbX;
    return;
}
	if (jsonObj["EPB_Y"]) {
    epbY = jsonObj["EPB_Y"];
    haogeSettings.storedEpbY = epbY;
    return;
}
// 近光灯
	if (jsonObj["LowBeam_X"]) {
    lowBeamX = jsonObj["LowBeam_X"];
    haogeSettings.storedLowBeamX = lowBeamX;
    return;
}
	if (jsonObj["LowBeam_Y"]) {
    lowBeamY = jsonObj["LowBeam_Y"];
    haogeSettings.storedLowBeamY = lowBeamY;
    return;
}
// 小灯
	if (jsonObj["SmallLight_X"]) {
    smallLightX = jsonObj["SmallLight_X"];
    haogeSettings.storedSmallLightX = smallLightX;
    return;
}
	if (jsonObj["SmallLight_Y"]) {
    smallLightY = jsonObj["SmallLight_Y"];
    haogeSettings.storedSmallLightY = smallLightY;
    return;
}
// 远光灯
	if (jsonObj["HighBeam_X"]) {
    highBeamX = jsonObj["HighBeam_X"];
    haogeSettings.storedHighBeamX = highBeamX;
    return;
}
	if (jsonObj["HighBeam_Y"]) {
    highBeamY = jsonObj["HighBeam_Y"];
    haogeSettings.storedHighBeamY = highBeamY;
    return;
}
// 左转灯
	if (jsonObj["LeftTurn_X"]) {
    leftTurnX = jsonObj["LeftTurn_X"];
    haogeSettings.storedLeftTurnX = leftTurnX;
    return;
}
	if (jsonObj["LeftTurn_Y"]) {
    leftTurnY = jsonObj["LeftTurn_Y"];
    haogeSettings.storedLeftTurnY = leftTurnY;
    return;
}
// 右转灯
	if (jsonObj["RightTurn_X"]) {
    rightTurnX = jsonObj["RightTurn_X"];
    haogeSettings.storedRightTurnX = rightTurnX;
    return;
}
	if (jsonObj["RightTurn_Y"]) {
    rightTurnY = jsonObj["RightTurn_Y"];
    haogeSettings.storedRightTurnY = rightTurnY;
    return;
}
// 后雾灯
	if (jsonObj["RearFog_X"]) {
    rearFogX = jsonObj["RearFog_X"];
    haogeSettings.storedRearFogX = rearFogX;
    return;
}
	if (jsonObj["RearFog_Y"]) {
    rearFogY = jsonObj["RearFog_Y"];
    haogeSettings.storedRearFogY = rearFogY;
    return;
}
	if (jsonObj["SeatBelt_X"]) {
    seatBeltX = jsonObj["SeatBelt_X"];
    haogeSettings.storedSeatBeltX = seatBeltX;
    return;
}
	if (jsonObj["SeatBelt_Y"]) {
    seatBeltY = jsonObj["SeatBelt_Y"];
    haogeSettings.storedSeatBeltY = seatBeltY;
    return;
}
	if (jsonObj["CruiseMain_X"]) {
    cruiseMainX = jsonObj["CruiseMain_X"];
    haogeSettings.storedCruiseMainX = cruiseMainX;
    return;
}
	if (jsonObj["CruiseMain_Y"]) {
    cruiseMainY = jsonObj["CruiseMain_Y"];
    haogeSettings.storedCruiseMainY = cruiseMainY;
    return;
}
// 定速巡航设定指示灯
	if (jsonObj["CruiseSet_X"]) {
    cruiseSetX = jsonObj["CruiseSet_X"];
    haogeSettings.storedCruiseSetX = cruiseSetX;
    return;
}
	if (jsonObj["CruiseSet_Y"]) {
    cruiseSetY = jsonObj["CruiseSet_Y"];
    haogeSettings.storedCruiseSetY = cruiseSetY;
    return;
}
	if (jsonObj["TrafficSign2_X"]) {
    trafficSign2X = jsonObj["TrafficSign2_X"];
    haogeSettings.storedTrafficSign2X = trafficSign2X;
    return;
}
	if (jsonObj["TrafficSign2_Y"]) {
    trafficSign2Y = jsonObj["TrafficSign2_Y"];
    haogeSettings.storedTrafficSign2Y = trafficSign2Y;
    return;
}
	if (jsonObj["Window_X"]) {
    windowX = jsonObj["Window_X"];
    haogeSettings.storedWindowX = windowX;
    return;
}
	if (jsonObj["Window_Y"]) {
    windowY = jsonObj["Window_Y"];
    haogeSettings.storedWindowY = windowY;
    return;
}
	if (jsonObj["方位未来X"]) {
    fangweiFutureX = jsonObj["方位未来X"];
    haogeSettings.storedFangweiFutureX = fangweiFutureX;
    return;
}
	if (jsonObj["方位未来Y"]) {
    fangweiFutureY = jsonObj["方位未来Y"];
    haogeSettings.storedFangweiFutureY = fangweiFutureY;
    return;
}
	if (jsonObj["时间未来X"]) {
    timeFutureX = jsonObj["时间未来X"];
    haogeSettings.storedTimeFutureX = timeFutureX;
    return;
}
	if (jsonObj["时间未来Y"]) {
    timeFutureY = jsonObj["时间未来Y"];
    haogeSettings.storedTimeFutureY = timeFutureY;
    return;
}
	if (jsonObj["温度未来X"]) {
    tempFutureX = jsonObj["温度未来X"];
    haogeSettings.storedTempFutureX = tempFutureX;
    return;
}
	if (jsonObj["温度未来Y"]) {
    tempFutureY = jsonObj["温度未来Y"];
    haogeSettings.storedTempFutureY = tempFutureY;
    return;
}
    if (jsonObj["平台图标X"]) {
    platformIconX = jsonObj["平台图标X"];
    haogeSettings.storedPlatformIconX = platformIconX;
    return;
}
    if (jsonObj["平台图标Y"]) {
    platformIconY = jsonObj["平台图标Y"];
    haogeSettings.storedPlatformIconY = platformIconY;
    return;
}
    if (jsonObj["PEM_X"]) {
    pemLightX = jsonObj["PEM_X"];
    haogeSettings.storedPemLightX = pemLightX;
    return;
}
    if (jsonObj["PEM_Y"]) {
    pemLightY = jsonObj["PEM_Y"];
    haogeSettings.storedPemLightY = pemLightY;
    return;
}
    if (jsonObj["PRND_X"]) {
    prndSliderX = jsonObj["PRND_X"];
    haogeSettings.storedPrndSliderX = prndSliderX;
    return;
}
    if (jsonObj["PRND_Y"]) {
    prndSliderY = jsonObj["PRND_Y"];
    haogeSettings.storedPrndSliderY = prndSliderY;
    return;
}
    if (jsonObj["档位X"]) {
    gearModeX = jsonObj["档位X"];
    haogeSettings.storedGearModeX = gearModeX;
    return;
}
    if (jsonObj["档位Y"]) {
    gearModeY = jsonObj["档位Y"];
    haogeSettings.storedGearModeY = gearModeY;
    return;
}
    if (jsonObj["车内温度X"]) {
    cabinTempX = jsonObj["车内温度X"];
    haogeSettings.storedCabinTempX = cabinTempX;
    return;
}
    if (jsonObj["车内温度Y"]) {
    cabinTempY = jsonObj["车内温度Y"];
    haogeSettings.storedCabinTempY = cabinTempY;
    return;
}
    if (jsonObj["未来车内温度X"]) {
    cabinTempFutureX = jsonObj["未来车内温度X"];
    haogeSettings.storedCabinTempFutureX = cabinTempFutureX;
    return;
}
    if (jsonObj["未来车内温度Y"]) {
    cabinTempFutureY = jsonObj["未来车内温度Y"];
    haogeSettings.storedCabinTempFutureY = cabinTempFutureY;
    return;
}
    if (jsonObj["温度单位X"]) {
    tempUnit2X = jsonObj["温度单位X"];
    haogeSettings.storedTempUnit2X = tempUnit2X;
    return;
}
    if (jsonObj["温度单位Y"]) {
    tempUnit2Y = jsonObj["温度单位Y"];
    haogeSettings.storedTempUnit2Y = tempUnit2Y;
    return;
}
    if (jsonObj["温度单位未来X"]) {
    tempUnit2FutureX = jsonObj["温度单位未来X"];
    haogeSettings.storedTempUnit2FutureX = tempUnit2FutureX;
    return;
}
    if (jsonObj["温度单位未来Y"]) {
    tempUnit2FutureY = jsonObj["温度单位未来Y"];
    haogeSettings.storedTempUnit2FutureY = tempUnit2FutureY;
    return;
}
    if (jsonObj["近光未来X"]) {
    lowBeamFutureX = jsonObj["近光未来X"];
    haogeSettings.storedLowBeamFutureX = lowBeamFutureX;
    return;
}
    if (jsonObj["近光未来Y"]) {
    lowBeamFutureY = jsonObj["近光未来Y"];
    haogeSettings.storedLowBeamFutureY = lowBeamFutureY;
    return;
}
    if (jsonObj["远光未来X"]) {
    highBeamFutureX = jsonObj["远光未来X"];
    haogeSettings.storedHighBeamFutureX = highBeamFutureX;
    return;
}
    if (jsonObj["远光未来Y"]) {
    highBeamFutureY = jsonObj["远光未来Y"];
    haogeSettings.storedHighBeamFutureY = highBeamFutureY;
    return;
}
    if (jsonObj["小灯未来X"]) {
    smallLightFutureX = jsonObj["小灯未来X"];
    haogeSettings.storedSmallLightFutureX = smallLightFutureX;
    return;
}
    if (jsonObj["小灯未来Y"]) {
    smallLightFutureY = jsonObj["小灯未来Y"];
    haogeSettings.storedSmallLightFutureY = smallLightFutureY;
    return;
}
    if (jsonObj["READY_X"]) {
    readyX = jsonObj["READY_X"];
    haogeSettings.storedReadyX = readyX;
    return;
}
    if (jsonObj["READY_Y"]) {
    readyY = jsonObj["READY_Y"];
    haogeSettings.storedReadyY = readyY;
    return;
}
    if (jsonObj["模式图标X"]) {
    moshiX = jsonObj["模式图标X"];
    haogeSettings.storedMoshiX = moshiX;
    return;
}
    if (jsonObj["模式图标Y"]) {
    moshiY = jsonObj["模式图标Y"];
    haogeSettings.storedMoshiY = moshiY;
    return;
}
    if (jsonObj["限速框2X"]) {
    trafficBorder2X = jsonObj["限速框2X"];
    haogeSettings.storedTrafficBorder2X = trafficBorder2X;
    return;
}
    if (jsonObj["限速框2Y"]) {
    trafficBorder2Y = jsonObj["限速框2Y"];
    haogeSettings.storedTrafficBorder2Y = trafficBorder2Y;
    return;
}
    if (jsonObj["能量X"]) { 
    energyX = jsonObj["能量X"]; 
    haogeSettings.storedEnergyX = energyX; 
    return; 
}
    if (jsonObj["能量Y"]) { 
    energyY = jsonObj["能量Y"]; 
    haogeSettings.storedEnergyY = energyY; 
    return; 
}

	if (jsonObj["小屏adas"]) {
    xpadas = jsonObj["小屏adas"];
	haogeSettings.storedxpadas = xpadas;
    return;
}	
	if (jsonObj["小屏adasa"]) {
    xpadasa = jsonObj["小屏adasa"];
	haogeSettings.storedxpadasa = xpadasa;
    return;
}
	if (jsonObj["小屏adasb"]) {
    xpadasb = jsonObj["小屏adasb"];
	haogeSettings.storedxpadasb = xpadasb;
    return;
}
	if (jsonObj["小屏adasc"]) {
    xpadasc = jsonObj["小屏adasc"];
	haogeSettings.storedxpadasc = xpadasc;
    return;
}
	if (jsonObj["adasx"]) {
    adasx = jsonObj["adasx"];
	haogeSettings.storedadasx = adasx;
    return;
}
	if (jsonObj["下"]) {
    xia = jsonObj["下"];
    return;
}
	if (jsonObj["高"]) {
    gao = jsonObj["高"];
    return;
}
	if (jsonObj["指南针倍数"]) {
	if(DataSource.naviTypeStore === 0) {
    beishu1 = jsonObj["指南针倍数"];
	haogeSettings.storedbeishu1 = beishu1;
	}else if(DataSource.naviTypeStore === 1 && smallMap === 0) {
	beishu2 = jsonObj["指南针倍数"];
	haogeSettings.storedbeishu2 = beishu2;
	}else if(DataSource.naviTypeStore === 1 && smallMap === 1) {
	beishu3 = jsonObj["指南针倍数"];
	haogeSettings.storedbeishu3 = beishu3;
	}else if(DataSource.naviTypeStore === 2) {
	beishu4 = jsonObj["指南针倍数"];
	haogeSettings.storedbeishu4 = beishu4;
	}
    return;
}
	if (jsonObj["指南针x"]) {
	if(DataSource.naviTypeStore === 0) {
    zhinanzhenx1 = jsonObj["指南针x"];
	haogeSettings.storedzhinanzhenx1 = zhinanzhenx1;
	}else if(DataSource.naviTypeStore === 1 && smallMap === 0) {
	zhinanzhenx2 = jsonObj["指南针x"];
	haogeSettings.storedzhinanzhenx2 = zhinanzhenx2;
	}else if(DataSource.naviTypeStore === 1 && smallMap === 1) {
	zhinanzhenx3 = jsonObj["指南针x"];
	haogeSettings.storedzhinanzhenx3 = zhinanzhenx3;
	}else if(DataSource.naviTypeStore === 2) {
	zhinanzhenx4 = jsonObj["指南针x"];
	haogeSettings.storedzhinanzhenx4 = zhinanzhenx4;
	}
    return;
}	
	if (jsonObj["指南针y"]) {
	if(DataSource.naviTypeStore === 0) {
    zhinanzheny1 = jsonObj["指南针y"];
	haogeSettings.storedzhinanzheny1 = zhinanzheny1;
	}else if(DataSource.naviTypeStore === 1 && smallMap === 0) {
	zhinanzheny2 = jsonObj["指南针y"];
	haogeSettings.storedzhinanzheny2 = zhinanzheny2;
	}else if(DataSource.naviTypeStore === 1 && smallMap === 1) {
	zhinanzheny3 = jsonObj["指南针y"];
	haogeSettings.storedzhinanzheny3 = zhinanzheny3;
	}else if(DataSource.naviTypeStore === 2) {
	zhinanzheny4 = jsonObj["指南针y"];
	haogeSettings.storedzhinanzheny4 = zhinanzheny4;
	}
    return;
}
	if (jsonObj["指南针"]) {
	if(DataSource.naviTypeStore === 0) {
    zhinanzhen1 = jsonObj["指南针"];
	haogeSettings.storedzhinanzhen1 = zhinanzhen1;
	}else if(DataSource.naviTypeStore === 1 && smallMap === 0) {
	zhinanzhen2 = jsonObj["指南针"];
	haogeSettings.storedzhinanzhen2 = zhinanzhen2;
	}else if(DataSource.naviTypeStore === 1 && smallMap === 1) {
	zhinanzhen3 = jsonObj["指南针"];
	haogeSettings.storedzhinanzhen3 = zhinanzhen3;
	}else if(DataSource.naviTypeStore === 2) {
	zhinanzhen4 = jsonObj["指南针"];
	haogeSettings.storedzhinanzhen4 = zhinanzhen4;
	}
    return;
}
	if (jsonObj["指南针开关"]) {
	if(DataSource.naviTypeStore === 0) {
    zhinanzhenkg1 = jsonObj["指南针开关"];
	haogeSettings.storedzhinanzhenkg1 = zhinanzhenkg1;
	}else if(DataSource.naviTypeStore === 1 && smallMap === 0) {
	zhinanzhenkg2 = jsonObj["指南针开关"];
	haogeSettings.storedzhinanzhenkg2 = zhinanzhenkg2;
	}else if(DataSource.naviTypeStore === 1 && smallMap === 1) {
	zhinanzhenkg3 = jsonObj["指南针开关"];
	haogeSettings.storedzhinanzhenkg3 = zhinanzhenkg3;
	}else if(DataSource.naviTypeStore === 2) {
	zhinanzhenkg4 = jsonObj["指南针开关"];
	haogeSettings.storedzhinanzhenkg4 = zhinanzhenkg4;
	}
    return;
}
	if (jsonObj["速度大小"]) {
    sududaxiao = jsonObj["速度大小"];
	haogeSettings.storedsududaxiao = sududaxiao;
    return;
}	
	if (jsonObj["车窗"]) {
    chechuang = jsonObj["车窗"];
	haogeSettings.storedchechuang = chechuang;
    return;
}	
if (jsonObj["全屏地图"]) {
    quanping = jsonObj["全屏地图"];
	updateFullNaviDayNightModeChangeBgImageSource()
	checkAndLoadTestComponent()
	updateAdasContainer()
	haogeSettings.storedquanping = quanping;	
    return;
}
	if (jsonObj["档位特效"]) {
    tanqi = jsonObj["档位特效"];
	haogeSettings.storedtanqi = tanqi;
    return;
}
	if (jsonObj["adasy"]) {
    adasy = jsonObj["adasy"];
	haogeSettings.storedadasy = adasy;
    return;
}
if (jsonObj["速度颜色"]) {
if(DataSource.dayNightMode === 0x01) {
    suduyanse1 = jsonObj["速度颜色"];
	haogeSettings.storedsuduyanse1 = suduyanse1;
	}else{
    suduyanse2 = jsonObj["速度颜色"];
	haogeSettings.storedsuduyanse2 = suduyanse2;
    }	
    return;
}
if (jsonObj["发光颜色"]) {
if(DataSource.dayNightMode === 0x01) {
    faguang1 = jsonObj["发光颜色"];
	haogeSettings.storedfaguang1 = faguang1;
	}else{
    faguang2 = jsonObj["发光颜色"];
	haogeSettings.storedfaguang2 = faguang2;
    }	
    return;
}
if (jsonObj["发光半径"]) {
    banjing = jsonObj["发光半径"];
	haogeSettings.storedbanjing = banjing;
    return;
}	
if (jsonObj["电色开始"]) {
    diansebegin = jsonObj["电色开始"];
	haogeSettings.storeddiansebegin = diansebegin;
    return;
}
if (jsonObj["电色结束"]) {
    dianseend = jsonObj["电色结束"];
	haogeSettings.storeddianseend = dianseend;
    return;
}
if (jsonObj["油色开始"]) {
    yousebegin = jsonObj["油色开始"];
	haogeSettings.storedyousebegin = yousebegin;
    return;
}
if (jsonObj["油色结束"]) {
    youseend = jsonObj["油色结束"];
	haogeSettings.storedyouseend = youseend;
    return;
}	
if (jsonObj["测试"]) {
	sendPostRequest({ '导航': DataSource.routeRemainDisAuto + "@" + DataSource.routeRemainTimeAuto + "@" + DataSource.etaArrivalTime.slice(2, DataSource.etaArrivalTime.length - 1) });
    return;
}
if (jsonObj["限速"]) {
    valueThree = jsonObj["限速"];
    return;
}
if (jsonObj["沉浸"]) {
    chenjin = jsonObj["沉浸"];
	haogeSettings.storedchenjin = chenjin;
    return;
}
if (jsonObj["车子"]) {
    car = jsonObj["车子"];
	haogeSettings.storedcar = car;
    return;
}
if (jsonObj["自定义车子"]) {
    zdycar = jsonObj["自定义车子"];
	haogeSettings.storedzdycar = zdycar;
    return;
}
if (jsonObj["天际坐标"]) {
    tianji = jsonObj["天际坐标"];
	haogeSettings.storedtianji = tianji;
    return;
}
if (jsonObj["天际坐标2"]) {
    tianji2 = jsonObj["天际坐标2"];
	haogeSettings.storedtianji2 = tianji2;
    return;
}
if (jsonObj["acc激活颜色"]) {
    if (DataSource.dayNightMode === 0x02) {
        accyanse4 = jsonObj["acc激活颜色"];
        haogeSettings.storedaccYanse4 = accyanse4;
    } else {
        accyanse3 = jsonObj["acc激活颜色"];
        haogeSettings.storedaccYanse3 = accyanse3;
    }
    return;
}
if (jsonObj["acc未激活颜色"]) {
    if (DataSource.dayNightMode === 0x02) {
        accyanse2 = jsonObj["acc未激活颜色"];
        haogeSettings.storedaccYanse2 = accyanse2;
    } else {
        accyanse1 = jsonObj["acc未激活颜色"];
        haogeSettings.storedaccYanse1 = accyanse1;
    }
    return;
}	
if (jsonObj["高亮歌词颜色"]) {
    if (DataSource.dayNightMode === 0x02) {
        yanse2 = jsonObj["高亮歌词颜色"];
        haogeSettings.storedYanse2 = yanse2;
    } else {
        yanse1 = jsonObj["高亮歌词颜色"];
        haogeSettings.storedYanse1 = yanse1;
    }
    return;
}
if (jsonObj["地图切换"]) {
    var laoliu = jsonObj["地图切换"];
	if(laoliu === "小屏导航") {
	DataSource.sendPluginMsgInt(DataSource.RECV_MSG_ID_NAVI_TYPE, 3);
	DataSource.sendPluginMsgInt(DataSource.RECV_MSG_ID_MENU_NAVI_TYPE, 1);
	}
	if(laoliu === "全屏导航") {
	DataSource.sendPluginMsgInt(DataSource.RECV_MSG_ID_NAVI_TYPE, 4);
	DataSource.sendPluginMsgInt(DataSource.RECV_MSG_ID_MENU_NAVI_TYPE, 2);
	}
	if(laoliu === "关闭仪表导航") {
	DataSource.sendPluginMsgInt(DataSource.RECV_MSG_ID_NAVI_TYPE, 1);
	DataSource.sendPluginMsgInt(DataSource.RECV_MSG_ID_MENU_NAVI_TYPE, 3);
	}
    return;
}
if (jsonObj["电机功率"]) {
    dianji = jsonObj["电机功率"];
	haogeSettings.storeddianji = dianji;
    return;
}
if (jsonObj["动能回收"]) {
    dongneng = jsonObj["动能回收"];
	haogeSettings.storeddongneng = dongneng;
    return;
}
if (jsonObj["未来"]) {
    weilai = jsonObj["未来"];
	haogeSettings.storedweilai = weilai;
    return;
}
if (jsonObj["x1"]) {
    x1 = jsonObj["x1"];
    return;
}
if (jsonObj["x2"]) {
    x2 = jsonObj["x2"];
    return;
}
if (jsonObj["x3"]) {
    x3 = jsonObj["x3"];
    return;
}
if (jsonObj["x5"]) {
    x5 = jsonObj["x5"];
    return;
}
if (jsonObj["x6"]) {
    x6 = jsonObj["x6"];
    return;
}
if (jsonObj["x7"]) {
    x7 = jsonObj["x7"];
    return;
}
if (jsonObj["x8"]) {
    x8 = jsonObj["x8"];
    return;
}
if (jsonObj["x4"]) {
    x4 = jsonObj["x4"];
    return;
}
if (jsonObj["y1"]) {
    y1 = jsonObj["y1"];
    return;
}
if (jsonObj["y2"]) {
    y2 = jsonObj["y2"];
    return;
}
if (jsonObj["y3"]) {
    y3 = jsonObj["y3"];
    return;
}
if (jsonObj["y4"]) {
    y4 = jsonObj["y4"];
    return;
}
if (jsonObj["y5"]) {
    y5 = jsonObj["y5"];
    return;
}
if (jsonObj["y6"]) {
    y6 = jsonObj["y6"];
    return;
}					
if (jsonObj["y7"]) {
    y7 = jsonObj["y7"];
    return;
}
if (jsonObj["y8"]) {
    y8 = jsonObj["y8"];
    return;
}			
if (jsonObj["剁椒鱼头"]) {
    duoJiao = jsonObj["剁椒鱼头"];
    return;			
}			

if (jsonObj["未知封面"]) {
    weiFeng = jsonObj["未知封面"];
    return;			
}			
if (jsonObj["蒙版打开"]) {
    if (DataSource.dayNightMode === 1 && DataSource.powerGear === 3 && DataSource.naviTypeStore === 0) {
        
        baiSegg = '0';
        haogeSettings.storedBaiSegg = baiSegg;
    } else if (DataSource.dayNightMode === 2 && DataSource.powerGear === 3 && DataSource.naviTypeStore === 0) {
        
        heiSegg = '0';
        haogeSettings.storedHeiSegg = heiSegg;
    } else if (smallMap === 0 && DataSource.dayNightMode === 1 && DataSource.powerGear === 3 && DataSource.naviTypeStore === 1) {
        
        baiZhonggg = '0';
        haogeSettings.storedBaiZhonggg = baiZhonggg;
    } else if (smallMap === 1 && DataSource.dayNightMode === 1 && DataSource.powerGear === 3 && DataSource.naviTypeStore === 1) {
        
        baiYougg = '0';
        haogeSettings.storedBaiYougg = baiYougg;
    } else if (smallMap === 0 && DataSource.dayNightMode === 2 && DataSource.powerGear === 3 && DataSource.naviTypeStore === 1) {
        
        heiZhonggg = '0';
        haogeSettings.storedHeiZhonggg = heiZhonggg;
    } else if (smallMap === 1 && DataSource.dayNightMode === 2 && DataSource.powerGear === 3 && DataSource.naviTypeStore === 1) {
        
        heiYougg = '0';
        haogeSettings.storedHeiYougg = heiYougg;
    }
    return;
}
if (jsonObj["蒙版关闭"]) {
    if (DataSource.dayNightMode === 1 && DataSource.powerGear === 3 && DataSource.naviTypeStore === 0) {
        
        baiSegg = '1';
        haogeSettings.storedBaiSegg = baiSegg;
    } else if (DataSource.dayNightMode === 2 && DataSource.powerGear === 3 && DataSource.naviTypeStore === 0) {
        
        heiSegg = '1';
        haogeSettings.storedHeiSegg = heiSegg;
    } else if (smallMap === 0 && DataSource.dayNightMode === 1 && DataSource.powerGear === 3 && DataSource.naviTypeStore === 1) {
        
        baiZhonggg = '1';
        haogeSettings.storedBaiZhonggg = baiZhonggg;
    } else if (smallMap === 1 && DataSource.dayNightMode === 1 && DataSource.powerGear === 3 && DataSource.naviTypeStore === 1) {
        
        baiYougg = '1';
        haogeSettings.storedBaiYougg = baiYougg;
    } else if (smallMap === 0 && DataSource.dayNightMode === 2 && DataSource.powerGear === 3 && DataSource.naviTypeStore === 1) {
        
        heiZhonggg = '1';
        haogeSettings.storedHeiZhonggg = heiZhonggg;
    } else if (smallMap === 1 && DataSource.dayNightMode === 2 && DataSource.powerGear === 3 && DataSource.naviTypeStore === 1) {
        
        heiYougg = '1';
        haogeSettings.storedHeiYougg = heiYougg;
    }
    return;
}
        if (jsonObj["发动机"]) {
            if (!isFetchingVehicleData) {
                isFetchingVehicleData = true;
                vehicleDataFetchTimer.start();
                fetchTimeoutTimer.restart();
            } else {
                fetchTimeoutTimer.restart();
            }
            return;
        }			
if (jsonObj["multimediaPlayStatus"]) {
    multimediaPlayStatus = jsonObj["multimediaPlayStatus"]; 
        checkAndLoadTestComponentb();
        if (moShi === "隐藏模式") {
            checkAndLoadTestComponent();
        }  
        if (multimediaPlayStatus === 1) {
		latestmultimediaPlayStatus = 1
            lyricSyncTimer.restart();
        } else if (multimediaPlayStatus === 2) {
		meDia.restart();
            lyricHideTimer.restart();
            lyricSyncTimer.stop();
        }
    return;			
}						
if (jsonObj["自定义壁纸"]) {
    const customWallpaper = jsonObj["自定义壁纸"];
    if (DataSource.naviTypeStore === 1) {
        if (DataSource.dayNightMode === 0x02) {
            if (smallMap === 0) {
                if (xiaoPingnight1 < 13) {
                    if (nightZhanggea1 === "" || (nightZhanggea1 !== "" && nightZhanggea2 !== "" && nightZhanggea3 !== "")) {
                        nightZhanggea1 = customWallpaper;
                        xiaoPingnight1 = 13;
                        haogeSettings.storedXiaoPingnight1 = xiaoPingnight1;
                        
                        haogeSettings.storedNightZhanggea1 = nightZhanggea1;
                        if (xiaoPingnight1 === 13) {
                            updateFullNaviDayNightModeChangeBgImageSource();
                        }
                    } else if (nightZhanggea1 !== "" && nightZhanggea2 === "") {
                        nightZhanggea2 = customWallpaper;
                        xiaoPingnight1 = 14;
                        haogeSettings.storedXiaoPingnight1 = xiaoPingnight1;
                        
                        haogeSettings.storedNightZhanggea2 = nightZhanggea2;
                        if (xiaoPingnight1 === 14) {
                            updateFullNaviDayNightModeChangeBgImageSource();
                        }
                    } else if (nightZhanggea2 !== "" && nightZhanggea3 === "") {
                        nightZhanggea3 = customWallpaper;
                        xiaoPingnight1 = 15;
                        haogeSettings.storedXiaoPingnight1 = xiaoPingnight1;
                        
                        haogeSettings.storedNightZhanggea3 = nightZhanggea3;
                        if (xiaoPingnight1 === 15) {
                            updateFullNaviDayNightModeChangeBgImageSource();
                        }
                    }
                } else if (xiaoPingnight1 === 13) {
                    nightZhanggea1 = customWallpaper;
                    
                    haogeSettings.storedNightZhanggea1 = nightZhanggea1;
                    if (xiaoPingnight1 === 13) {
                        updateFullNaviDayNightModeChangeBgImageSource();
                    }
                } else if (xiaoPingnight1 === 14) {
                    nightZhanggea2 = customWallpaper;
                    
                    haogeSettings.storedNightZhanggea2 = nightZhanggea2;
                    if (xiaoPingnight1 === 14) {
                        updateFullNaviDayNightModeChangeBgImageSource();
                    }
                } else if (xiaoPingnight1 === 15) {
                    nightZhanggea3 = customWallpaper;
                    
                    haogeSettings.storedNightZhanggea3 = nightZhanggea3;
                    if (xiaoPingnight1 === 15) {
                        updateFullNaviDayNightModeChangeBgImageSource();
                    }
                }
            } else if (smallMap === 1) {
                if (xiaoPingnight2 < 13) {
                    if (nightZhanggeb1 === "" || (nightZhanggeb1 !== "" && nightZhanggeb2 !== "" && nightZhanggeb3 !== "")) {
                        nightZhanggeb1 = customWallpaper;
                        xiaoPingnight2 = 13;
                        haogeSettings.storedXiaoPingnight2 = xiaoPingnight2;
                        
                        haogeSettings.storedNightZhanggeb1 = nightZhanggeb1;
                        if (xiaoPingnight2 === 13) {
                            updateFullNaviDayNightModeChangeBgImageSource();
                        }
                    } else if (nightZhanggeb1 !== "" && nightZhanggeb2 === "") {
                        nightZhanggeb2 = customWallpaper;
                        xiaoPingnight2 = 14;
                        haogeSettings.storedXiaoPingnight2 = xiaoPingnight2;
                        
                        haogeSettings.storedNightZhanggeb2 = nightZhanggeb2;
                        if (xiaoPingnight2 === 14) {
                            updateFullNaviDayNightModeChangeBgImageSource();
                        }
                    } else if (nightZhanggeb2 !== "" && nightZhanggeb3 === "") {
                        nightZhanggeb3 = customWallpaper;
                        xiaoPingnight2 = 15;
                        haogeSettings.storedXiaoPingnight2 = xiaoPingnight2;
                        
                        haogeSettings.storedNightZhanggeb3 = nightZhanggeb3;
                        if (xiaoPingnight2 === 15) {
                            updateFullNaviDayNightModeChangeBgImageSource();
                        }
                    }
                } else if (xiaoPingnight2 === 13) {
                    nightZhanggeb1 = customWallpaper;
                    
                    haogeSettings.storedNightZhanggeb1 = nightZhanggeb1;
                    if (xiaoPingnight2 === 13) {
                        updateFullNaviDayNightModeChangeBgImageSource();
                    }
                } else if (xiaoPingnight2 === 14) {
                    nightZhanggeb2 = customWallpaper;
                    
                    haogeSettings.storedNightZhanggeb2 = nightZhanggeb2;
                    if (xiaoPingnight2 === 14) {
                        updateFullNaviDayNightModeChangeBgImageSource();
                    }
                } else if (xiaoPingnight2 === 15) {
                    nightZhanggeb3 = customWallpaper;
                    
                    haogeSettings.storedNightZhanggeb3 = nightZhanggeb3;
                    if (xiaoPingnight2 === 15) {
                        updateFullNaviDayNightModeChangeBgImageSource();
                    }
                }
            }
        } else if (DataSource.dayNightMode === 0x01) {
            if (smallMap === 0) {
                if (xiaoPingday1 < 12) {
                    if (dayZhanggea1 === "" || (dayZhanggea1 !== "" && dayZhanggea2 !== "" && dayZhanggea3 !== "")) {
                        dayZhanggea1 = customWallpaper;
                        xiaoPingday1 = 12;
                        haogeSettings.storedXiaoPingday1 = xiaoPingday1;
                        
                        haogeSettings.storedDayZhanggea1 = dayZhanggea1;
                        if (xiaoPingday1 === 12) {
                            updateFullNaviDayNightModeChangeBgImageSource();
                        }
                    } else if (dayZhanggea1 !== "" && dayZhanggea2 === "") {
                        dayZhanggea2 = customWallpaper;
                        xiaoPingday1 = 13;
                        haogeSettings.storedXiaoPingday1 = xiaoPingday1;
                        
                        haogeSettings.storedDayZhanggea2 = dayZhanggea2;
                        if (xiaoPingday1 === 13) {
                            updateFullNaviDayNightModeChangeBgImageSource();
                        }
                    } else if (dayZhanggea2 !== "" && dayZhanggea3 === "") {
                        dayZhanggea3 = customWallpaper;
                        xiaoPingday1 = 14;
                        haogeSettings.storedXiaoPingday1 = xiaoPingday1;
                        
                        haogeSettings.storedDayZhanggea3 = dayZhanggea3;
                        if (xiaoPingday1 === 14) {
                            updateFullNaviDayNightModeChangeBgImageSource();
                        }
                    }
                } else if (xiaoPingday1 === 12) {
                    dayZhanggea1 = customWallpaper;
                    
                    haogeSettings.storedDayZhanggea1 = dayZhanggea1;
                    if (xiaoPingday1 === 12) {
                        updateFullNaviDayNightModeChangeBgImageSource();
                    }
                } else if (xiaoPingday1 === 13) {
                    dayZhanggea2 = customWallpaper;
                    
                    haogeSettings.storedDayZhanggea2 = dayZhanggea2;
                    if (xiaoPingday1 === 13) {
                        updateFullNaviDayNightModeChangeBgImageSource();
                    }
                } else if (xiaoPingday1 === 14) {
                    dayZhanggea3 = customWallpaper;
                    
                    haogeSettings.storedDayZhanggea3 = dayZhanggea3;
                    if (xiaoPingday1 === 14) {
                        updateFullNaviDayNightModeChangeBgImageSource();
                    }
                }
            } else if (smallMap === 1) {
                if (xiaoPingday2 < 12) {
                    if (dayZhanggeb1 === "" || (dayZhanggeb1 !== "" && dayZhanggeb2 !== "" && dayZhanggeb3 !== "")) {
                        dayZhanggeb1 = customWallpaper;
                        xiaoPingday2 = 12;
                        haogeSettings.storedXiaoPingday2 = xiaoPingday2;
                        
                        haogeSettings.storedDayZhanggeb1 = dayZhanggeb1;
                        if (xiaoPingday2 === 12) {
                            updateFullNaviDayNightModeChangeBgImageSource();
                        }
                    } else if (dayZhanggeb1 !== "" && dayZhanggeb2 === "") {
                        dayZhanggeb2 = customWallpaper;
                        xiaoPingday2 = 13;
                        haogeSettings.storedXiaoPingday2 = xiaoPingday2;
                        
                        haogeSettings.storedDayZhanggeb2 = dayZhanggeb2;
                        if (xiaoPingday2 === 13) {
                            updateFullNaviDayNightModeChangeBgImageSource();
                        }
                    } else if (dayZhanggeb2 !== "" && dayZhanggeb3 === "") {
                        dayZhanggeb3 = customWallpaper;
                        xiaoPingday2 = 14;
                        haogeSettings.storedXiaoPingday2 = xiaoPingday2;
                        
                        haogeSettings.storedDayZhanggeb3 = dayZhanggeb3;
                        if (xiaoPingday2 === 14) {
                            updateFullNaviDayNightModeChangeBgImageSource();
                        }
                    }
                } else if (xiaoPingday2 === 12) {
                    dayZhanggeb1 = customWallpaper;
                    
                    haogeSettings.storedDayZhanggeb1 = dayZhanggeb1;
                    if (xiaoPingday2 === 12) {
                        updateFullNaviDayNightModeChangeBgImageSource();
                    }
                } else if (xiaoPingday2 === 13) {
                    dayZhanggeb2 = customWallpaper;
                    
                    haogeSettings.storedDayZhanggeb2 = dayZhanggeb2;
                    if (xiaoPingday2 === 13) {
                        updateFullNaviDayNightModeChangeBgImageSource();
                    }
                } else if (xiaoPingday2 === 14) {
                    dayZhanggeb3 = customWallpaper;
                    
                    haogeSettings.storedDayZhanggeb3 = dayZhanggeb3;
                    if (xiaoPingday2 === 14) {
                        updateFullNaviDayNightModeChangeBgImageSource();
                    }
                }
            }
        }
        return;
    } else if (DataSource.naviTypeStore === 2) {
        if (DataSource.dayNightMode === 0x02) {
            if (mapcurrentNightBgIndex < 13) {
                if (nightHaogea === "" || (nightHaogea !== "" && nightHaogeb !== "" && nightHaogec !== "")) {
                    nightHaogea = customWallpaper;
                    mapcurrentNightBgIndex = 13;
                    haogeSettings.storedmapcurrentNightBgIndex = mapcurrentNightBgIndex;
                    haogeSettings.storednightHaogea = nightHaogea;
                    if (mapcurrentNightBgIndex === 13) {
                        updateFullNaviDayNightModeChangeBgImageSource();
                    }
                } else if (nightHaogea !== "" && nightHaogeb === "") {
                    nightHaogeb = customWallpaper;
                    mapcurrentNightBgIndex = 14;
                    haogeSettings.storedmapcurrentNightBgIndex = mapcurrentNightBgIndex;
                    haogeSettings.storednightHaogeb = nightHaogeb;
                    if (mapcurrentNightBgIndex === 14) {
                        updateFullNaviDayNightModeChangeBgImageSource();
                    }
                } else if (nightHaogeb !== "" && nightHaogec === "") {
                    nightHaogec = customWallpaper;
                    mapcurrentNightBgIndex = 15;
                    haogeSettings.storedmapcurrentNightBgIndex = mapcurrentNightBgIndex;
                    haogeSettings.storednightHaogec = nightHaogec;
                    if (mapcurrentNightBgIndex === 15) {
                        updateFullNaviDayNightModeChangeBgImageSource();
                    }
                }
            } else if (mapcurrentNightBgIndex === 13) {
                nightHaogea = customWallpaper;
                haogeSettings.storednightHaogea = nightHaogea;
                if (mapcurrentNightBgIndex === 13) {
                    updateFullNaviDayNightModeChangeBgImageSource();
                }
            } else if (mapcurrentNightBgIndex === 14) {
                nightHaogeb = customWallpaper;
                haogeSettings.storednightHaogeb = nightHaogeb;
                if (mapcurrentNightBgIndex === 14) {
                    updateFullNaviDayNightModeChangeBgImageSource();
                }
            } else if (mapcurrentNightBgIndex === 15) {
                nightHaogec = customWallpaper;
                haogeSettings.storednightHaogec = nightHaogec;
                if (mapcurrentNightBgIndex === 15) {
                    updateFullNaviDayNightModeChangeBgImageSource();
                }
            }
        } else if (DataSource.dayNightMode === 0x01) {
            if (mapcurrentDayBgIndex < 12) {
                if (dayHaogea === "" || (dayHaogea !== "" && dayHaogeb !== "" && dayHaogec !== "")) {
                    dayHaogea = customWallpaper;
                    mapcurrentDayBgIndex = 12;
                    haogeSettings.storedmapcurrentDayBgIndex = mapcurrentDayBgIndex;
                    haogeSettings.storeddayHaogea = dayHaogea;
                    if (mapcurrentDayBgIndex === 12) {
                        updateFullNaviDayNightModeChangeBgImageSource();
                    }
                } else if (dayHaogea !== "" && dayHaogeb === "") {
                    dayHaogeb = customWallpaper;
                    mapcurrentDayBgIndex = 13;
                    haogeSettings.storedmapcurrentDayBgIndex = mapcurrentDayBgIndex;
                    haogeSettings.storeddayHaogeb = dayHaogeb;
                    if (mapcurrentDayBgIndex === 13) {
                        updateFullNaviDayNightModeChangeBgImageSource();
                    }
                } else if (dayHaogeb !== "" && dayHaogec === "") {
                    dayHaogec = customWallpaper;
                    mapcurrentDayBgIndex = 14;
                    haogeSettings.storedmapcurrentDayBgIndex = mapcurrentDayBgIndex;
                    haogeSettings.storeddayHaogec = dayHaogec;
                    if (mapcurrentDayBgIndex === 14) {
                        updateFullNaviDayNightModeChangeBgImageSource();
                    }
                }
            } else if (mapcurrentDayBgIndex === 12) {
                dayHaogea = customWallpaper;
                haogeSettings.storeddayHaogea = dayHaogea;
                if (mapcurrentDayBgIndex === 12) {
                    updateFullNaviDayNightModeChangeBgImageSource();
                }
            } else if (mapcurrentDayBgIndex === 13) {
                dayHaogeb = customWallpaper;
                haogeSettings.storeddayHaogeb = dayHaogeb;
                if (mapcurrentDayBgIndex === 13) {
                    updateFullNaviDayNightModeChangeBgImageSource();
                }
            } else if (mapcurrentDayBgIndex === 14) {
                dayHaogec = customWallpaper;
                haogeSettings.storeddayHaogec = dayHaogec;
                if (mapcurrentDayBgIndex === 14) {
                    updateFullNaviDayNightModeChangeBgImageSource();
                }
            }
        }
        return;
    } else if (DataSource.naviTypeStore === 0) {
        if (DataSource.dayNightMode === 0x02) {
            if (currentNightBgIndex < 13) {
                if (nightHaoge1 === "" || (nightHaoge1 !== "" && nightHaoge2 !== "" && nightHaoge3 !== "")) {
                    nightHaoge1 = customWallpaper;
                    currentNightBgIndex = 13;
                    haogeSettings.storedCurrentNightBgIndex = currentNightBgIndex;
                    
                    haogeSettings.storedNightHaoge1 = nightHaoge1;
                    if (currentNightBgIndex === 13) {
                        updateBgImageSource();
                    }
                } else if (nightHaoge1 !== "" && nightHaoge2 === "") {
                    nightHaoge2 = customWallpaper;
                    currentNightBgIndex = 14;
                    haogeSettings.storedCurrentNightBgIndex = currentNightBgIndex;
                    
                    haogeSettings.storedNightHaoge2 = nightHaoge2;
                    if (currentNightBgIndex === 14) {
                        updateBgImageSource();
                    }
                } else if (nightHaoge2 !== "" && nightHaoge3 === "") {
                    nightHaoge3 = customWallpaper;
                    currentNightBgIndex = 15;
                    haogeSettings.storedCurrentNightBgIndex = currentNightBgIndex;
                    
                    haogeSettings.storedNightHaoge3 = nightHaoge3;
                    if (currentNightBgIndex === 15) {
                        updateBgImageSource();
                    }
                }
            } else if (currentNightBgIndex === 13) {
                nightHaoge1 = customWallpaper;
                
                haogeSettings.storedNightHaoge1 = nightHaoge1;
                if (currentNightBgIndex === 13) {
                    updateBgImageSource();
                }
            } else if (currentNightBgIndex === 14) {
                nightHaoge2 = customWallpaper;
                
                haogeSettings.storedNightHaoge2 = nightHaoge2;
                if (currentNightBgIndex === 14) {
                    updateBgImageSource();
                }
            } else if (currentNightBgIndex === 15) {
                nightHaoge3 = customWallpaper;
                
                haogeSettings.storedNightHaoge3 = nightHaoge3;
                if (currentNightBgIndex === 15) {
                    updateBgImageSource();
                }
            }
        } else if (DataSource.dayNightMode === 0x01) {
            if (currentDayBgIndex < 12) {
                if (dayHaoge1 === "" || (dayHaoge1 !== "" && dayHaoge2 !== "" && dayHaoge3 !== "")) {
                    dayHaoge1 = customWallpaper;
                    currentDayBgIndex = 12;
                    haogeSettings.storedCurrentDayBgIndex = currentDayBgIndex;
                    
                    haogeSettings.storedDayHaoge1 = dayHaoge1;
                    if (currentDayBgIndex === 12) {
                        updateBgImageSource();
                    }
                } else if (dayHaoge1 !== "" && dayHaoge2 === "") {
                    dayHaoge2 = customWallpaper;
                    currentDayBgIndex = 13;
                    haogeSettings.storedCurrentDayBgIndex = currentDayBgIndex;
                    
                    haogeSettings.storedDayHaoge2 = dayHaoge2;
                    if (currentDayBgIndex === 13) {
                        updateBgImageSource();
                    }
                } else if (dayHaoge2 !== "" && dayHaoge3 === "") {
                    dayHaoge3 = customWallpaper;
                    currentDayBgIndex = 14;
                    haogeSettings.storedCurrentDayBgIndex = currentDayBgIndex;
                    
                    haogeSettings.storedDayHaoge3 = dayHaoge3;
                    if (currentDayBgIndex === 14) {
                        updateBgImageSource();
                    }
                }
            } else if (currentDayBgIndex === 12) {
                dayHaoge1 = customWallpaper;
                
                haogeSettings.storedDayHaoge1 = dayHaoge1;
                if (currentDayBgIndex === 12) {
                    updateBgImageSource();
                }
            } else if (currentDayBgIndex === 13) {
                dayHaoge2 = customWallpaper;
                
                haogeSettings.storedDayHaoge2 = dayHaoge2;
                if (currentDayBgIndex === 13) {
                    updateBgImageSource();
                }
            } else if (currentDayBgIndex === 14) {
                dayHaoge3 = customWallpaper;
                
                haogeSettings.storedDayHaoge3 = dayHaoge3;
                if (currentDayBgIndex === 14) {
                    updateBgImageSource();
                }
            }
        }
        return;
    }
    return;
}
if (jsonObj["车模上一个"]) {
    let currentIndex;
    let maxCount;
    currentIndex = parseInt(cheXing);
    maxCount = 18;

    currentIndex = currentIndex - 1;

    if (currentIndex < 1) {
        currentIndex = maxCount;
    }

    var currentCarModelIndex = currentIndex.toString().padStart(3, '0');

    cheXing = currentCarModelIndex;
	haogeSettings.storedCheXing = cheXing;
    return;
}
if (jsonObj["车模下一个"]) {
    let currentIndex;
    let maxCount;
    currentIndex = parseInt(cheXing);
    maxCount = 18;

    currentIndex = currentIndex + 1;

    if (currentIndex > maxCount) {
        currentIndex = 1;
    }

    var currentCarModelIndex = currentIndex.toString().padStart(3, '0');

    cheXing = currentCarModelIndex;
	haogeSettings.storedCheXing = cheXing;
    return;
}
if (jsonObj["车辆信息上一个"]) {
    let currentIndex;
    let maxCount;
    currentIndex = parseInt(carInfob);
    maxCount = 9;
    currentIndex = currentIndex - 1;    
    if (currentIndex < 1) {
        currentIndex = maxCount;
    }    
    carInfob = currentIndex;
    checkAndLoadTestComponentb();
    haogeSettings.storedCarInfob = carInfob;
    return;
}
if (jsonObj["车辆信息下一个"]) {
    let currentIndex;
    let maxCount;
    currentIndex = parseInt(carInfob);
    maxCount = 9;   
    currentIndex = currentIndex + 1;  
    if (currentIndex > maxCount) {
        currentIndex = 1;
    }
    carInfob = currentIndex;
    checkAndLoadTestComponentb();
    haogeSettings.storedCarInfob = carInfob;
    return;
}
if (jsonObj["壁纸上一张"]) {
    if (DataSource.naviTypeStore === 1) {
        let currentIndex;
        let maxCount;
        
        if (DataSource.dayNightMode === 0x02) {
            if (smallMap === 0) {
                currentIndex = parseInt(xiaoPingnight1);
                if (nightZhanggea1 === "") {
                    maxCount = 12;
                } else if (nightZhanggea1 !== "" && nightZhanggea2 === "") {
                    maxCount = 13;
                } else if (nightZhanggea2 !== "" && nightZhanggea3 === "") {
                    maxCount = 14;
                } else if (nightZhanggea3 !== "") {
                    maxCount = 15;
                } else {
                    maxCount = 15;
                }
                
                currentIndex = currentIndex - 1;
                if (currentIndex < 1) {
                    currentIndex = maxCount; 
                }
                xiaoPingnight1 = currentIndex.toString().padStart(3, '0');
                updateFullNaviDayNightModeChangeBgImageSource();
				haogeSettings.storedXiaoPingnight1 = xiaoPingnight1;
            } else if (smallMap === 1) {
                currentIndex = parseInt(xiaoPingnight2);
                if (nightZhanggeb1 === "") {
                    maxCount = 12;
                } else if (nightZhanggeb1 !== "" && nightZhanggeb2 === "") {
                    maxCount = 13;
                } else if (nightZhanggeb2 !== "" && nightZhanggeb3 === "") {
                    maxCount = 14;
                } else if (nightZhanggeb3 !== "") {
                    maxCount = 15;
                } else {
                    maxCount = 15;
                }
                
                currentIndex = currentIndex - 1;
                if (currentIndex < 1) {
                    currentIndex = maxCount; 
                }
                xiaoPingnight2 = currentIndex.toString().padStart(3, '0');
				updateFullNaviDayNightModeChangeBgImageSource();
                haogeSettings.storedXiaoPingnight2 = xiaoPingnight2;
            }
        } else {
            if (smallMap === 0) {
                currentIndex = parseInt(xiaoPingday1);
                if (dayZhanggea1 === "") {
                    maxCount = 11;
                } else if (dayZhanggea1 !== "" && dayZhanggea2 === "") {
                    maxCount = 12;
                } else if (dayZhanggea2 !== "" && dayZhanggea3 === "") {
                    maxCount = 13;
                } else if (dayZhanggea3 !== "") {
                    maxCount = 14;
                } else {
                    maxCount = 14;
                }
                
                currentIndex = currentIndex - 1;
                if (currentIndex < 1) {
                    currentIndex = maxCount; 
                }
                xiaoPingday1 = currentIndex.toString().padStart(3, '0');
                updateFullNaviDayNightModeChangeBgImageSource();
				haogeSettings.storedXiaoPingday1 = xiaoPingday1;
            } else if (smallMap === 1) {
                currentIndex = parseInt(xiaoPingday2);
                if (dayZhanggeb1 === "") {
                    maxCount = 11;
                } else if (dayZhanggeb1 !== "" && dayZhanggeb2 === "") {
                    maxCount = 12;
                } else if (dayZhanggeb2 !== "" && dayZhanggeb3 === "") {
                    maxCount = 13;
                } else if (dayZhanggeb3 !== "") {
                    maxCount = 14;
                } else {
                    maxCount = 14;
                }
                
                currentIndex = currentIndex - 1;
                if (currentIndex < 1) {
                    currentIndex = maxCount; 
                }
                xiaoPingday2 = currentIndex.toString().padStart(3, '0');
                updateFullNaviDayNightModeChangeBgImageSource();
				haogeSettings.storedXiaoPingday2 = xiaoPingday2;
            }
        }      
        return;
    } else if (DataSource.naviTypeStore === 2) {
        let currentIndex;
        let maxCount;
        
        if (DataSource.dayNightMode === 0x02) {
            currentIndex = parseInt(mapcurrentNightBgIndex);
            if (nightHaogea === "") {
                maxCount = 12;
            } else if (nightHaogea !== "" && nightHaogeb === "") {
                maxCount = 13;
            } else if (nightHaogeb !== "" && nightHaogec === "") {
                maxCount = 14;
            } else if (nightHaogec !== "") {
                maxCount = 15;
            } else {
                maxCount = 15;
            }
            
            currentIndex = currentIndex - 1;
            if (currentIndex < 1) {
                currentIndex = maxCount; 
            }
            mapcurrentNightBgIndex = currentIndex.toString().padStart(3, '0');
            updateFullNaviDayNightModeChangeBgImageSource();
            haogeSettings.storedmapcurrentNightBgIndex = mapcurrentNightBgIndex;        
        } else {
            currentIndex = parseInt(mapcurrentDayBgIndex);
            if (dayHaogea === "") {
                maxCount = 11;
            } else if (dayHaogea !== "" && dayHaogeb === "") {
                maxCount = 12;
            } else if (dayHaogeb !== "" && dayHaogec === "") {
                maxCount = 13;
            } else if (dayHaogec !== "") {
                maxCount = 14;
            } else {
                maxCount = 14;
            }
            
            currentIndex = currentIndex - 1;
            if (currentIndex < 1) {
                currentIndex = maxCount; 
            }
            mapcurrentDayBgIndex = currentIndex.toString().padStart(3, '0');
            updateFullNaviDayNightModeChangeBgImageSource();
            haogeSettings.storedmapcurrentDayBgIndex = mapcurrentDayBgIndex;
        }
        return;
    } else if (DataSource.naviTypeStore === 0) {
        let currentIndex;
        let maxCount;
        
        if (DataSource.dayNightMode === 0x02) {
            currentIndex = parseInt(currentNightBgIndex);
            if (nightHaoge1 === "") {
                maxCount = 12;
            } else if (nightHaoge1 !== "" && nightHaoge2 === "") {
                maxCount = 13;
            } else if (nightHaoge2 !== "" && nightHaoge3 === "") {
                maxCount = 14;
            } else if (nightHaoge3 !== "") {
                maxCount = 15;
            } else {
                maxCount = 15;
            }
            
            currentIndex = currentIndex - 1;
            if (currentIndex < 1) {
                currentIndex = maxCount; 
            }
            currentNightBgIndex = currentIndex.toString().padStart(3, '0');
            updateBgImageSource();
			haogeSettings.storedCurrentNightBgIndex = currentNightBgIndex;		
        } else {
            currentIndex = parseInt(currentDayBgIndex);
            if (dayHaoge1 === "") {
                maxCount = 11;
            } else if (dayHaoge1 !== "" && dayHaoge2 === "") {
                maxCount = 12;
            } else if (dayHaoge2 !== "" && dayHaoge3 === "") {
                maxCount = 13;
            } else if (dayHaoge3 !== "") {
                maxCount = 14;
            } else {
                maxCount = 14;
            }
            
            currentIndex = currentIndex - 1;
            if (currentIndex < 1) {
                currentIndex = maxCount; 
            }
            currentDayBgIndex = currentIndex.toString().padStart(3, '0');
            updateBgImageSource();
			haogeSettings.storedCurrentDayBgIndex = currentDayBgIndex;
        }
        return;
    }
    return;
}
if (jsonObj["壁纸下一张"]) {
    if (DataSource.naviTypeStore === 1) {
        let currentIndex;
        let maxCount;
        
        if (DataSource.dayNightMode === 0x02) {
            if (smallMap === 0) {
                currentIndex = parseInt(xiaoPingnight1);
                if (nightZhanggea1 === "") {
                    maxCount = 12;
                } else if (nightZhanggea1 !== "" && nightZhanggea2 === "") {
                    maxCount = 13;
                } else if (nightZhanggea2 !== "" && nightZhanggea3 === "") {
                    maxCount = 14;
                } else if (nightZhanggea3 !== "") {
                    maxCount = 15;
                } else {
                    maxCount = 15;
                }
                
                currentIndex = currentIndex + 1; 
                if (currentIndex > maxCount) {
                    currentIndex = 1; 
                }
                xiaoPingnight1 = currentIndex.toString().padStart(3, '0');
                updateFullNaviDayNightModeChangeBgImageSource();
				haogeSettings.storedXiaoPingnight1 = xiaoPingnight1;
            } else if (smallMap === 1) {
                currentIndex = parseInt(xiaoPingnight2);
                if (nightZhanggeb1 === "") {
                    maxCount = 12;
                } else if (nightZhanggeb1 !== "" && nightZhanggeb2 === "") {
                    maxCount = 13;
                } else if (nightZhanggeb2 !== "" && nightZhanggeb3 === "") {
                    maxCount = 14;
                } else if (nightZhanggeb3 !== "") {
                    maxCount = 15;
                } else {
                    maxCount = 15;
                }
                
                currentIndex = currentIndex + 1; 
                if (currentIndex > maxCount) {
                    currentIndex = 1; 
                }
                xiaoPingnight2 = currentIndex.toString().padStart(3, '0');
                updateFullNaviDayNightModeChangeBgImageSource();
                haogeSettings.storedXiaoPingnight2 = xiaoPingnight2;
            }
        } else {
            if (smallMap === 0) {
                currentIndex = parseInt(xiaoPingday1);
                if (dayZhanggea1 === "") {
                    maxCount = 11;
                } else if (dayZhanggea1 !== "" && dayZhanggea2 === "") {
                    maxCount = 12;
                } else if (dayZhanggea2 !== "" && dayZhanggea3 === "") {
                    maxCount = 13;
                } else if (dayZhanggea3 !== "") {
                    maxCount = 14;
                } else {
                    maxCount = 14;
                }
                
                currentIndex = currentIndex + 1; 
                if (currentIndex > maxCount) {
                    currentIndex = 1; 
                }
                xiaoPingday1 = currentIndex.toString().padStart(3, '0');
                updateFullNaviDayNightModeChangeBgImageSource();
				haogeSettings.storedXiaoPingday1 = xiaoPingday1;
            } else if (smallMap === 1) {
                currentIndex = parseInt(xiaoPingday2);
                if (dayZhanggeb1 === "") {
                    maxCount = 11;
                } else if (dayZhanggeb1 !== "" && dayZhanggeb2 === "") {
                    maxCount = 12;
                } else if (dayZhanggeb2 !== "" && dayZhanggeb3 === "") {
                    maxCount = 13;
                } else if (dayZhanggeb3 !== "") {
                    maxCount = 14;
                } else {
                    maxCount = 14;
                }
                
                currentIndex = currentIndex + 1; 
                if (currentIndex > maxCount) {
                    currentIndex = 1; 
                }
                xiaoPingday2 = currentIndex.toString().padStart(3, '0');
                updateFullNaviDayNightModeChangeBgImageSource();
				haogeSettings.storedXiaoPingday2 = xiaoPingday2;
            }
        }
        return;
    } else if (DataSource.naviTypeStore === 2) {
        let currentIndex;
        let maxCount;
        
        if (DataSource.dayNightMode === 0x02) {
            currentIndex = parseInt(mapcurrentNightBgIndex);
            if (nightHaogea === "") {
                maxCount = 12;
            } else if (nightHaogea !== "" && nightHaogeb === "") {
                maxCount = 13;
            } else if (nightHaogeb !== "" && nightHaogec === "") {
                maxCount = 14;
            } else if (nightHaogec !== "") {
                maxCount = 15;
            } else {
                maxCount = 15;
            }
            
            currentIndex = currentIndex + 1; 
            if (currentIndex > maxCount) {
                currentIndex = 1; 
            }
            mapcurrentNightBgIndex = currentIndex.toString().padStart(3, '0');
            updateFullNaviDayNightModeChangeBgImageSource();
            haogeSettings.storedmapcurrentNightBgIndex = mapcurrentNightBgIndex;        
        } else {
            currentIndex = parseInt(mapcurrentDayBgIndex);
            if (dayHaogea === "") {
                maxCount = 11;
            } else if (dayHaogea !== "" && dayHaogeb === "") {
                maxCount = 12;
            } else if (dayHaogeb !== "" && dayHaogec === "") {
                maxCount = 13;
            } else if (dayHaogec !== "") {
                maxCount = 14;
            } else {
                maxCount = 14;
            }
            
            currentIndex = currentIndex + 1;
            if (currentIndex > maxCount) {
                currentIndex = 1;
            }
            mapcurrentDayBgIndex = currentIndex.toString().padStart(3, '0');
            updateFullNaviDayNightModeChangeBgImageSource();
            haogeSettings.storedmapcurrentDayBgIndex = mapcurrentDayBgIndex;    
        }
        return;
    } else if (DataSource.naviTypeStore === 0) {
        let currentIndex;
        let maxCount;
        
        if (DataSource.dayNightMode === 0x02) {
            currentIndex = parseInt(currentNightBgIndex);
            if (nightHaoge1 === "") {
                maxCount = 12;
            } else if (nightHaoge1 !== "" && nightHaoge2 === "") {
                maxCount = 13;
            } else if (nightHaoge2 !== "" && nightHaoge3 === "") {
                maxCount = 14;
            } else if (nightHaoge3 !== "") {
                maxCount = 15;
            } else {
                maxCount = 15;
            }
            
            currentIndex = currentIndex + 1; 
            if (currentIndex > maxCount) {
                currentIndex = 1; 
            }
            currentNightBgIndex = currentIndex.toString().padStart(3, '0');
            updateBgImageSource();
			haogeSettings.storedCurrentNightBgIndex = currentNightBgIndex;		
        } else {
            currentIndex = parseInt(currentDayBgIndex);
            if (dayHaoge1 === "") {
                maxCount = 11;
            } else if (dayHaoge1 !== "" && dayHaoge2 === "") {
                maxCount = 12;
            } else if (dayHaoge2 !== "" && dayHaoge3 === "") {
                maxCount = 13;
            } else if (dayHaoge3 !== "") {
                maxCount = 14;
            } else {
                maxCount = 14;
            }
            
            currentIndex = currentIndex + 1;
            if (currentIndex > maxCount) {
                currentIndex = 1;
            }
            currentDayBgIndex = currentIndex.toString().padStart(3, '0');
            updateBgImageSource();
			haogeSettings.storedCurrentDayBgIndex = currentDayBgIndex;	
        }
        return;
    }
    return;
}
if (jsonObj["密钥"]) {
    miYue = jsonObj["密钥"];
    haogeSettings.storedMiYue = miYue;
    sendPostRequestx({ '密钥': miYue });
    return;
}	
if (jsonObj["定速播报"]) {
    dingSu = jsonObj["定速播报"];
    haogeSettings.storedDingSu = dingSu;
    return;
}
if (jsonObj["简易关图"]) {
    xiMen = jsonObj["简易关图"];
    haogeSettings.storedXiMen = xiMen;
    return;
}			
if (jsonObj["安全"]) {
    anQuan = jsonObj["安全"];
    haogeSettings.storedAnQuan = anQuan;
    return;			
}
if (jsonObj["出行"]) {
    chuXing = jsonObj["出行"];
    haogeSettings.storedChuXing = chuXing;
    if (chuXing === 0) {
        anQuan = 0;
        haogeSettings.storedAnQuan = 0;
    }
    return;			
}
						
if (jsonObj["动次打次"]) {
    faDong = jsonObj["动次打次"];
    haogeSettings.storedFaDong = faDong;
    return;			
}

if (jsonObj["进度条"]) {
    jinDu = jsonObj["进度条"];
    haogeSettings.storedJinDu = jinDu;
    return;			
}

if (jsonObj["小屏透度"]) {
    laoBan = jsonObj["小屏透度"];
    haogeSettings.storedLaoBan = laoBan;
    updateFullNaviDayNightModeChangeBgImageSource();
    return;			
}

if (jsonObj["电价"]) {
    dianJia = jsonObj["电价"];
    haogeSettings.storedDianJia = dianJia;
    return;			
}	
if (jsonObj["油价"]) {
    youJia = jsonObj["油价"];
    haogeSettings.storedYouJia = youJia;
    return;			
}

if (jsonObj["电池包"]) {
    dianChi = jsonObj["电池包"];
    haogeSettings.storedDianChi = dianChi;
    return;			
}

if (jsonObj["车模"]) {
    cheMo = jsonObj["车模"];	
    return;			
}

if (jsonObj["没有L2"]) {
    noL2 = jsonObj["没有L2"];
    haogeSettings.storedNoL2 = noL2;
    updateAdasContainer();
    checkAndLoadTestComponentb();
    return;			
}

if (jsonObj["2d流动"]) {
    xiaoXiao = jsonObj["2d流动"];
    haogeSettings.storedXiaoXiao = xiaoXiao;
    return;			
}
if (jsonObj["简易歌词"]) {
    jianYi = jsonObj["简易歌词"];
    haogeSettings.storedJianYi = jianYi;
    checkAndLoadTestComponentb();
    return;			
}

if (jsonObj["歌名大小"]) {
    haoYu = jsonObj["歌名大小"];
    haogeSettings.storedHaoYu = haoYu;
    return;			
}

if (jsonObj["adas"]) {
    adAs = jsonObj["adas"];
    haogeSettings.storedAdAs = adAs;
    updateAdasContainer();
    return;			
}

if (jsonObj["小屏地图"]) {
    smallMap = jsonObj["小屏地图"];
    haogeSettings.storedSmallMap = smallMap;
    return;			
}

if (jsonObj["速度变红"]) {
    daoLu = jsonObj["速度变红"];
    haogeSettings.storedDaoLu = daoLu;
    return;			
}

if (jsonObj["预警播报"]) {
    yuJing = jsonObj["预警播报"];
    haogeSettings.storedYuJing = yuJing;
    return;			
}

if (jsonObj["剁椒鱼头"]) {
    duoJiao = jsonObj["剁椒鱼头"];
    return;			
}			
if (jsonObj["歌词大小"]) {
    shuHan = jsonObj["歌词大小"];
    haogeSettings.storedShuHan = shuHan;
    return;			
}

if (jsonObj["限速提醒"]) {
    shanGan = jsonObj["限速提醒"];
    haogeSettings.storedShanGan = shanGan;
    return;			
}

if (jsonObj["盲区"]) {
    wuNai = jsonObj["盲区"];
    haogeSettings.storedWuNai = wuNai;
    return;			
}

if (jsonObj["虚线"]) {
    xuXian = jsonObj["虚线"];
    haogeSettings.storedXuXian = xuXian;
    return;			
}

if (jsonObj["休息模式"]) {
    xiuXi = jsonObj["休息模式"];
    haogeSettings.storedXiuXi = xiuXi;
    return;			
}

if (jsonObj["媒体"]) {
    meiTi = jsonObj["媒体"];
    haogeSettings.storedMeiTi = meiTi;
    return;			
}

if (jsonObj["油电量"]) {
    haoGe = jsonObj["油电量"];
    haogeSettings.storedHaoGe = haoGe;
    return;			
}

if (jsonObj["微信播放"]) {
    weiBo = jsonObj["微信播放"];
    haogeSettings.storedWeiBo = weiBo;
    return;			
}		
if (jsonObj["仪表歌词模式"]) {
    moShi = jsonObj["仪表歌词模式"];
    haogeSettings.storedMoShi = moShi;
    checkAndLoadTestComponent();
    return;			
}

if (jsonObj["仪表歌词"]) {
    yiBiao = jsonObj["仪表歌词"];
    haogeSettings.storedYiBiao = yiBiao;
    return;			
}							
if (jsonObj["微信消息"]) {
    apiMessage = jsonObj["微信消息"];
    apiMessageBox.visible = true;
    hideApiMessageTimer.restart();
    if (weiBo === 1) {
        var punctuationRegex = /[，,]/g;
        var processedMessage = apiMessage.replace(punctuationRegex, '。');
        sendPostRequestc("播报" + processedMessage);	
    }
    return;			
}					
            if (jsonObj["数据更新"]) {
                fetchVehicleData();
                return;			
            }			
            if (jsonObj["摄像头限速"]) {
                valueTwo = jsonObj["摄像头限速"];
                return;			
            }    
            if (jsonObj["道路限速"]) {
                valueThree = jsonObj["道路限速"];
                return;			
            } 			
            if (jsonObj["仪表测试"]) {
                ceShi = jsonObj["仪表测试"];
                return;			
            }			
			
if (jsonObj["音源"]) {
    yinYuan = jsonObj["音源"];
    if (yinYuan === 99) {
        coverImageData = weiFeng;
    }   
    return;
}			
        // 处理歌曲消息（包含歌名和歌词）
        if (jsonObj["歌曲"]) {
            processLyricMessage(message);
            return;
        }        
        // 处理歌词定位消息
        if (jsonObj["歌词定位"]) {
            processLyricMessage(message);
            return;
        }
            
            // 处理封面图消息
            if (jsonObj["封面"]) {
                var imageData = jsonObj["封面"];
                coverImageData = imageData;
                return;
            }
        } catch(e) {
            console.log("不是JSON格式的消息，继续按原方式处理:", e);
            // JSON 解析失败，按原方式处理
        }
        
        // 处理封面图消息
        if (message.startsWith("仪表封面图")) {
            var base64Data = message.substring(5); // 去掉"仪表封面图"前缀
            // 直接使用完整的数据，不添加前缀
            coverImageData = base64Data;
            return;
        }
        
        // 处理歌名消息
        if (message.startsWith("歌名")) {
            var songText = message.substring(2); // 去掉"歌名"前缀
            songName = songText;
            return;
        }
        
        // 处理歌词消息
        if (message.startsWith("lrc_line_")) {
            processLyricMessage(message);
            return;
        }
    });
    
    webSocket.onStatusChanged.connect(function(status) {
        if (status === WebSocket.Open) {
            console.log("WebSocket connected");
            webSocketConnected = true;
            reconnectTimerRunning = false;
            if (reconnectTimer) reconnectTimer.stop();
        } else if (status === WebSocket.Closed) {
            console.log("WebSocket disconnected");
            webSocketConnected = false;
            if (!reconnectTimerRunning && reconnectTimer) {
                reconnectTimer.start();
                reconnectTimerRunning = true;
            }
        } else if (status === WebSocket.Error) {
            console.log("WebSocket error:", webSocket.errorString);
            webSocketConnected = false;
            if (!reconnectTimerRunning && reconnectTimer) {
                reconnectTimer.start();
                reconnectTimerRunning = true;
            }
        }
    });
	    initSecondWebSocket();
}
function initSecondWebSocket() {
    if (webSocket2) {
        webSocket2.destroy()
    }
    
    webSocket2 = Qt.createQmlObject('import QtWebSockets 1.1; WebSocket {}', rootItemId)
    webSocket2.url = "ws://localhost:9521/ws"
    webSocket2.active = true    
    webSocket2.onTextMessageReceived.connect(function(message) {
        webSocket2Message = message;
        try {
            var jsonObj = JSON.parse(message);
if (jsonObj["isPlaying"] === "playing") {
    checkAndLoadTestComponentb();
    if (moShi === "隐藏模式") {
        checkAndLoadTestComponent();
    }
    multimediaPlayStatus = 1;
    latestmultimediaPlayStatus = 1;
    lyricSyncTimer.restart();
    return;
} else if (jsonObj["isPlaying"] === "paused") {
    multimediaPlayStatus = 2;
    meDia.restart();
    lyricHideTimer.restart();
    lyricSyncTimer.stop();
    return;
}			
if (jsonObj["mediaSource"]) {
    yinYuan = jsonObj["mediaSource"];
    if (yinYuan === 99) {
        coverImageData = weiFeng;
    }   
    return;
}			
        if (jsonObj["musicInfo"]) {
            processLyricMessage(message);
            return;
        }        
        if (jsonObj["position"]) {
            processLyricMessage(message);
            return;
        }
            if (jsonObj["albumArtUri"]) {
                var imageData = jsonObj["albumArtUri"];
                coverImageData = imageData;
                return;
            }
        } catch(e) {           
        }
    });    
    webSocket2.onStatusChanged.connect(function(status) {
        if (status === WebSocket.Open) {     
            webSocket2Connected = true;
            reconnectTimer2Running = false;
            if (reconnectTimer2) reconnectTimer2.stop();
        } else if (status === WebSocket.Closed) {            
            webSocket2Connected = false;
            if (!reconnectTimer2Running && reconnectTimer2) {
                reconnectTimer2.start();
                reconnectTimer2Running = true;
            }
        } else if (status === WebSocket.Error) {            
            webSocket2Connected = false;
            if (!reconnectTimer2Running && reconnectTimer2) {
                reconnectTimer2.start();
                reconnectTimer2Running = true;
            }
        }
    });
}
Timer {
    id: reconnectTimer
    interval: 10000
    repeat: true
    onTriggered: {
        initWebSocket()
    }
}
Timer {
    id: reconnectTimer2
    interval: 10000
    repeat: kunkun < 4
    running: false
    onTriggered: {
	    kunkun++;
        initSecondWebSocket();
    }
}
Component.onDestruction: {
    if (webSocket) {
        webSocket.active = false;
        webSocket.destroy();
    }
    if (webSocket2) {
        webSocket2.active = false;
        webSocket2.destroy();
    }
}

function sendPostRequest(data) {
    var xhr = new XMLHttpRequest();
    xhr.open("POST", "http://localhost:8699/ws", true);
    xhr.setRequestHeader("Content-Type", "application/json;charset=utf-8");
    xhr.setRequestHeader("persistent", "1");    
    xhr.send(JSON.stringify(data));
}
function sendPostRequestx(data) {
    var xhr = new XMLHttpRequest();
    xhr.open("POST", "http://localhost:8182", true);
    xhr.setRequestHeader("Content-Type", "application/json;charset=utf-8");
    xhr.onreadystatechange = function() {
        if (xhr.readyState === 4 && xhr.status === 200) {
            var response = JSON.parse(xhr.responseText);
            if (response.status === "ok" && response.message === "Data saved") {
                laoJi++;
				haogeSettings.storedLaoJi = laoJi;
            }
        }
    };  
    xhr.send(JSON.stringify(data));
}
function sendPostRequestc(cmdContent) {
    var xhr = new XMLHttpRequest();
    xhr.open("POST", "http://localhost:8988/api/sendCmd", true);
    xhr.setRequestHeader("Content-Type", "application/x-www-form-urlencoded;charset=utf-8");
    xhr.send("cmd=" + encodeURIComponent(cmdContent));
}
Rectangle {
    id: musicInfoContainernew
    x: DataSource.naviTypeStore === 1 && smallMap === 1 && xpadas === 1 ? (1920-lyricDisplayPanelnew.width)/2 : DataSource.naviTypeStore === 1 && smallMap === 0 && xpadas === 1 ? 1520 : DataSource.naviTypeStore === 2 && quanping === 1 ? 1420+100:smallMap === 0 && DataSource.naviTypeStore === 1 && DataSource.themeIndex === 0x02 ? 80 : (DataSource.naviTypeStore === 1 && DataSource.themeIndex === 0x02) ? 180 : 1380 
    y: 180
    width: 240
    height: 240
    color: "transparent"
    visible: anQuan === 0 && moShi === "简单模式" && latestmultimediaPlayStatus === 1 && !(DataSource.naviTypeStore === 2 && quanping === 0) && DataSource.themeIndex === 0x02 && DataSource.powerGear === 3 && lyricsArray.length > 0 && !(weilai === 1 && DataSource.naviTypeStore === 1 && xpadas === 0) && !((DataSource.carBodyNeedDisplay === DataSource.UI_DISPLAY ||
DataSource.carKeyWarningInfoDisplay !== 0x0 ||
DataSource.accErrorMesDisplay === 0x02 ||
DataSource.commonWarningInfoNeedDisplay === DataSource.UI_DISPLAY ||
DataSource.cumErrorWarningInfoNeedDisplay === DataSource.UI_DISPLAY ||
DataSource.dmsAnimNeedDisplay === DataSource.UI_DISPLAY ||
DataSource.generPowerWarningInfoNeedDisplay === DataSource.UI_DISPLAY ||
DataSource.maintainWarningInfoDisplay === DataSource.UI_DISPLAY ||
DataSource.modeSwitchWarningInfoNeedDisplay === DataSource.UI_DISPLAY ||
DataSource.phonePromptNeedDisplay === DataSource.UI_DISPLAY ||
DataSource.speedWarningInfoNeedDisplay === DataSource.UI_DISPLAY ||
DataSource.tireWarningInfoNeedDisplay === DataSource.UI_DISPLAY) && DataSource.naviTypeStore === 1 && smallMap === 1 && xpadas === 1)
    
    Item {
        id: songCoverContainernew
        x: 0
        y: songTitleTextnew.height/2-songTitleTextnew.height-haoYu+23
        width: (haoYu+28)*2+10
        height: (haoYu+28)*2+10
        
        Rectangle {
            id: masknew
            anchors.fill: parent
            radius: 5
            visible: false
        }
        
        Image {
            id: songCoverImagenew
            anchors.fill: parent
            fillMode: Image.PreserveAspectCrop
            source: coverImageData !== "" ? coverImageData : ""
            visible: coverImageData !== ""
            cache: false
            layer.enabled: true
            layer.effect: OpacityMask {
                maskSource: masknew
            }
        }
        
        Image {
            id: musicLabelIconnew
            anchors.left: parent.left 
            anchors.bottom: parent.bottom   
            anchors.leftMargin: 3
            anchors.bottomMargin: 5  
            width: 15
            height: 15
            source: "qrc:/images10_25/MediaInfo/标.png" 
            visible: coverImageData !== "" && (yinYuan === 1 || yinYuan === 2 || yinYuan === 4 || yinYuan === 6 || yinYuan === 99)
            layer.enabled: true
            layer.effect: OpacityMask {
                maskSource: Rectangle {
                    width: 15
                    height: 15
                    visible: true
                }
            }
        }        
        Image {
            id: platformIconnew
            x: 5 + platformIconX
            y: 5 + platformIconY
            width: 20
            height: 20
            source: rootItemId.yinYuan === 21 ? 
                    "qrc:/images10_25/MediaInfo/mediaIcon21.png" : 
					rootItemId.yinYuan === 31 ? 
                    "qrc:/images10_25/MediaInfo/mediaIcon31.png" :
                    rootItemId.yinYuan === 20 ? 
                    "qrc:/images10_25/MediaInfo/mediaIcon20.png" :
                    rootItemId.yinYuan === 30 ? 
                    "qrc:/images10_25/MediaInfo/mediaIcon30.png" :					
                    rootItemId.yinYuan === 99 ? 
                    "qrc:/images10_25/MediaInfo/mediaIcon99.png" :
                    "qrc:/images10_25/MediaInfo/mediaIcon" + DataSource.mediaInfoIconId + ".png"
            visible: coverImageData !== ""
            layer.enabled: true
            layer.effect: OpacityMask {
                maskSource: Rectangle {
                    width: 20
                    height: 20
                    visible: false
                }
            }
        }
    }
    
Text {
    font.bold:rootItemId.jiacu === 1
    id: songTitleTextnew
    y: 56 - songTitleTextnew.height
    visible: musicInfoContainernew.visible
    wrapMode: Text.WordWrap
    maximumLineCount: 2
    font.pixelSize: haoYu + 28
    color: DataSource.dayNightMode === 0x02 ? "#ffffff" : "#333333"
    text: songName
    font.family: rootItemId.ziti
    horizontalAlignment: Text.AlignHCenter
}

Binding {
    target: songTitleTextnew
    property: "width"
    value: (songCoverContainernew.width * 2 + songTitleTextnew.implicitWidth) < 360 
           ? 360 
           : (360 - songCoverContainernew.width)
}

Binding {
    target: songTitleTextnew
    property: "x"
    value: (songCoverContainernew.width * 2 + songTitleTextnew.implicitWidth) < 360 
           ? 0 
           : songCoverContainernew.width
}
    
    Rectangle {
        id: lyricDisplayPanelnew
        x: 0
        y: 76
        width: 360
        height: 180+60
        color: "transparent"
        visible: musicInfoContainernew.visible
        clip: true
        
        ListView {
            id: lyricListViewnew
            anchors.fill: parent
            anchors.margins: 5
            model: lyricsArray
            spacing: 5
            interactive: false
            verticalLayoutDirection: ListView.TopToBottom
            highlightRangeMode: ListView.ApplyRange
            preferredHighlightBegin: 0.5
            preferredHighlightEnd: 0.5
            highlightFollowsCurrentItem: true
            currentIndex: currentLyricIndex
            
            onModelChanged: {
                if (currentLyricIndex >= 0) {
                    positionViewAtIndex(currentLyricIndex, ListView.Center);
                }
            }
            
            onCurrentIndexChanged: {
                if (currentIndex >= 0) {
                    positionViewAtIndex(currentIndex, ListView.Center);
                }
            }
            
            delegate: Item {
                id: lyricItemnew
                width: lyricListViewnew.width
                height: Math.max(lyricTextnew.implicitHeight + 3, 25)
                property bool isCurrentLyric: index === currentLyricIndex
                
                Text {
                    id: lyricTextnew
                    anchors.centerIn: parent
                    width: parent.width - 10
                    text: modelData.text
					font.family: rootItemId.ziti
                    color: {
  if (isCurrentLyric) {
    DataSource.dayNightMode === 0x02 ? yanse2 : yanse1
  } else {
    DataSource.dayNightMode === 0x02 ? "#ffffff" : "#333333"
  }
}
                    font.pixelSize: isCurrentLyric ? shuHan+25 : shuHan+20
                    font.bold:rootItemId.jiacu === 1
                    wrapMode: Text.WrapAtWordBoundaryOrAnywhere
                    horizontalAlignment: Text.AlignHCenter
                    verticalAlignment: Text.AlignVCenter
                    maximumLineCount: 0
                    opacity: isCurrentLyric ? 1.0 : 0.8
                    
                    Behavior on color {
                        ColorAnimation { duration: 130; easing.type: Easing.InOutQuad }
                    }
                    
                    Behavior on font.pixelSize {
                        NumberAnimation { duration: 130; easing.type: Easing.InOutQuad }
                    }
                }
            }
        }
    }
    
    Rectangle {
        id: musicProgressContainernew
        x: 0
        y: 320
        width: 360
        height: 40
        color: "transparent"
        visible: musicInfoContainernew.visible && jinDu === 0
        
        Rectangle {
            id: progressBarBackgroundnew
            anchors.verticalCenter: parent.verticalCenter
            width: parent.width
            height: 5
            radius: 2.5
            color: "#707070"
        }
        
        Rectangle {
            id: progressBarForegroundnew
            anchors.left: parent.left
            anchors.verticalCenter: parent.verticalCenter
            width: songDuration > 0 ? Math.min((currentLyricTime / songDuration) * parent.width, parent.width) : 0
            height: 5
            radius: 2.5
            color: DataSource.dayNightMode === 0x02 ? "#FFFFFF" : "#000000"
            
            Behavior on width {
                NumberAnimation { duration: 100; easing.type: Easing.Linear }
            }
        }
        
        Rectangle {
            id: progressBarHandlenew
            anchors.verticalCenter: parent.verticalCenter
            x: songDuration > 0 ? Math.min((currentLyricTime / songDuration) * parent.width - 5, parent.width - 10) : -5
            width: 10
            height: 10
            radius: 5
            color: DataSource.dayNightMode === 0x02 ? "#FFFFFF" : "#000000"
            
            Behavior on x {
                NumberAnimation { duration: 100; easing.type: Easing.Linear }
            }
        }
        
        Text {
            font.bold:rootItemId.jiacu === 1
            font.family: rootItemId.ziti
            id: currentTimeDisplaynew
            anchors.top: progressBarBackgroundnew.bottom
            anchors.topMargin: 5
            anchors.left: progressBarBackgroundnew.left
            color: DataSource.dayNightMode === 0x02 ? "#ffffff" : "#333333"
            font.pixelSize: 20
            text: formatTime(currentLyricTime)
        }
        
        Text {
            font.bold:rootItemId.jiacu === 1
            font.family: rootItemId.ziti
            id: totalTimeDisplaynew
            anchors.top: progressBarBackgroundnew.bottom
            anchors.topMargin: 5
            anchors.right: progressBarBackgroundnew.right
            color: DataSource.dayNightMode === 0x02 ? "#ffffff" : "#333333"
            font.pixelSize: 20
            text: formatTime(songDuration)
        }
    }
}
Rectangle {
    id: cdHybridModeContainer
    x: DataSource.naviTypeStore === 1 && smallMap === 1 && xpadas === 1 ? 830 : DataSource.naviTypeStore === 1 && smallMap === 0 && xpadas === 1 ? 1580 : DataSource.naviTypeStore === 2 && quanping === 1 ? 1420+160:DataSource.naviTypeStore === 0 ? 1420 : (smallMap === 0 && DataSource.naviTypeStore === 1) ? 100 : 200
    y: 200
    width: 500
    height: 280
    color: "transparent"
    visible: anQuan === 0 && (moShi === "混合模式" || moShi === "混合模式2") && latestmultimediaPlayStatus === 1 && DataSource.themeIndex === 0x02 && DataSource.powerGear === 3 && !(weilai === 1 && DataSource.naviTypeStore === 1 && xpadas === 0) && !(DataSource.naviTypeStore === 2 && quanping === 0) && !((DataSource.carBodyNeedDisplay === DataSource.UI_DISPLAY ||
DataSource.carKeyWarningInfoDisplay !== 0x0 ||
DataSource.accErrorMesDisplay === 0x02 ||
DataSource.commonWarningInfoNeedDisplay === DataSource.UI_DISPLAY ||
DataSource.cumErrorWarningInfoNeedDisplay === DataSource.UI_DISPLAY ||
DataSource.dmsAnimNeedDisplay === DataSource.UI_DISPLAY ||
DataSource.generPowerWarningInfoNeedDisplay === DataSource.UI_DISPLAY ||
DataSource.maintainWarningInfoDisplay === DataSource.UI_DISPLAY ||
DataSource.modeSwitchWarningInfoNeedDisplay === DataSource.UI_DISPLAY ||
DataSource.phonePromptNeedDisplay === DataSource.UI_DISPLAY ||
DataSource.speedWarningInfoNeedDisplay === DataSource.UI_DISPLAY ||
DataSource.tireWarningInfoNeedDisplay === DataSource.UI_DISPLAY) && smallMap === 1 && DataSource.naviTypeStore === 1 && xpadas === 1)
    
    Item {
        id: leftCoverWithReflection
        x: 0
        y: 0
        width: 200
        height: 200
        
        Item {
            id: leftFullCoverContainer
            width: 200
            height: 200
            
            Rectangle {
                id: leftFullCoverMask
                anchors.fill: parent
                radius: 15  
                visible: false
            }
            
            Image {
                id: leftFullCoverImage
                anchors.fill: parent
                fillMode: Image.PreserveAspectCrop
                source: coverImageData !== "" ? coverImageData : ""
                visible: coverImageData !== ""
                cache: false
                layer.enabled: true
                layer.effect: OpacityMask {
                    maskSource: leftFullCoverMask
                }
            }
        }
        
        Item {
            id: reflectionContainer
            x: 0
            y: 210 
            width: 200
            height: 67 
            clip: true

            Image {
                id: reflectionImage
                width: 200
                height: 200
                source: leftFullCoverImage.source
                fillMode: Image.PreserveAspectCrop
                visible: leftFullCoverImage.visible
                opacity: 0.1
                transform: Scale {
                    yScale: -1  
                    origin.y: 67  
                }
            }
            
            Rectangle {
                anchors.fill: parent
                gradient: Gradient {
                    GradientStop { position: 0.0; color: "transparent" }
                    GradientStop { position: 0.2; color: "transparent" }
                }
            }
            
            Rectangle {
                id: reflectionTopRoundMask
                x: 0
                y: 0
                width: 200
                height: 15  
                radius: 15 
                visible: false
            }

            layer.enabled: true
            layer.effect: OpacityMask {
                maskSource: Rectangle {
                    width: 200
                    height: 67
                    radius: 15
                }
            }
        }
    }

    Item {
        id: rightHalfCdContainer
        x: 200  
        y: 10   
        width: 90  
        height: 180
        clip: true

        Item {
            id: cdWithCover
            x: -90  
            y: 0
            width: 180
            height: 180
            
            Rectangle {
                id: cdCircleContainer
                anchors.fill: parent
                radius: width / 2
                color: "transparent"
                
                Image {
                    id: cdCoverImage
                    anchors.fill: parent
                    fillMode: Image.PreserveAspectCrop
                    source: coverImageData !== "" ? coverImageData : ""
                    visible: coverImageData !== ""
                    cache: false
                    layer.enabled: true
                    layer.effect: OpacityMask {
                        maskSource: Rectangle {
                            width: cdCircleContainer.width
                            height: cdCircleContainer.height
                            radius: cdCircleContainer.radius
                        }
                    }
                }
                
                Rectangle {
                    anchors.centerIn: parent
                    width: parent.width - 30
                    height: parent.height - 30
                    radius: (parent.width - 30) / 2
                    color: "transparent"
                    border.width: 2
                    border.color: DataSource.dayNightMode === 0x02 ? "rgba(255,255,255,0.3)" : "rgba(0,0,0,0.2)"
                }
                
                Rectangle {
                    anchors.centerIn: parent
                    width: 20
                    height: 20
                    radius: 10
                    color: DataSource.dayNightMode === 0x02 ? "rgba(255,255,255,0.5)" : "rgba(0,0,0,0.4)"
                }
            }
            
            RotationAnimation {
                id: cdHybridRotation
                target: cdCircleContainer
                property: "rotation"
                from: 0
                to: 360
                duration: 12000
                loops: Animation.Infinite
                running: latestmultimediaPlayStatus === 1
            }
        }
    }
Text {
    font.bold:rootItemId.jiacu === 1
    id: songTitlehaoge
    y: 250
	width: 290
    wrapMode: Text.WordWrap
    maximumLineCount: 2
    font.pixelSize: haoYu + 28
    color: DataSource.dayNightMode === 0x02 ? "#ffffff" : "#333333"
    text: songName
    font.family: rootItemId.ziti
    horizontalAlignment: Text.AlignHCenter
	visible: lyricsArray.length === 0 || moShi === "混合模式2"
}    
Rectangle {
    id: lyricBoxhaoge
    y: 250
    width: 290
    height: 200
    visible: moShi !== "混合模式2"
    color: "transparent"
    clip: false  
    
    ListView {
        id: lyricListhaoge
        anchors.fill: parent
        anchors.margins: 5
        
        model: lyricsArray
        spacing: 8
        interactive: false
        verticalLayoutDirection: ListView.TopToBottom
        
        highlightRangeMode: ListView.StrictlyEnforceRange
        preferredHighlightBegin: 0
        preferredHighlightEnd: 0
        highlightFollowsCurrentItem: true
        
        currentIndex: currentLyricIndex
        
        onModelChanged: {
            if (currentLyricIndex >= 0) {
                positionViewAtIndex(currentLyricIndex, ListView.Beginning)
            }
        }
        
        onCurrentIndexChanged: {
            if (currentIndex >= 0) {
                positionViewAtIndex(currentIndex, ListView.Beginning)
            }
        }
        
        delegate: Item {
            id: lyricDelegatehaoge
            width: lyricListhaoge.width
            height: Math.max(lyricTexthaoge.implicitHeight + lyricTextNexthaoge.implicitHeight + 10, 50)
            
            property bool isCurrentLyric: index === currentLyricIndex
            property bool hasNextLyric: index < lyricsArray.length - 1
            
            Text {
                id: lyricTexthaoge
                anchors.horizontalCenter: parent.horizontalCenter
                y: 0
                text: modelData.text
                font.family: rootItemId.ziti
                color: {
                    if (isCurrentLyric) {
                        DataSource.dayNightMode === 0x02 ? yanse2 : yanse1
                    } else {
                        DataSource.dayNightMode === 0x02 ? "#ffffff" : "#333333"
                    }
                }
                font.pixelSize: isCurrentLyric ? shuHan+25 : shuHan+20
                font.bold:rootItemId.jiacu === 1
                wrapMode: Text.WrapAtWordBoundaryOrAnywhere
                horizontalAlignment: Text.AlignHCenter
                verticalAlignment: Text.AlignVCenter
                maximumLineCount: 0
                opacity: isCurrentLyric ? 1.0 : 0.8
                visible: isCurrentLyric  
                Behavior on color {
                    ColorAnimation { duration: 130; easing.type: Easing.InOutQuad }
                }
                
                Behavior on font.pixelSize {
                    NumberAnimation { duration: 130; easing.type: Easing.InOutQuad }
                }
            }
            
            Text {
                id: lyricTextNexthaoge
                anchors.top: lyricTexthaoge.bottom
                anchors.topMargin: 5
                anchors.horizontalCenter: parent.horizontalCenter
                width: parent.width - 10
                text: hasNextLyric ? lyricsArray[index + 1].text : ""
                font.family: rootItemId.ziti
                color: DataSource.dayNightMode === 0x02 ? "#ffffff" : "#333333"
                font.pixelSize: shuHan + 23
                font.bold:rootItemId.jiacu === 1
                font.letterSpacing: 0
                wrapMode: Text.WrapAtWordBoundaryOrAnywhere
                horizontalAlignment: Text.AlignHCenter
                verticalAlignment: Text.AlignVCenter
                maximumLineCount: 1
                opacity: isCurrentLyric && hasNextLyric ? 0.5 : 0
                visible: isCurrentLyric && hasNextLyric

                Behavior on opacity {
                    NumberAnimation { duration: 130; easing.type: Easing.InOutQuad }
                }
            }
        }
    }
}
}
Rectangle {
    id: musicInfoContainer
    x: DataSource.naviTypeStore === 1 && smallMap === 1 && xpadas === 1 ? 680 : DataSource.naviTypeStore === 1 && smallMap === 0 && xpadas === 1 ? 1470 : DataSource.naviTypeStore === 2 && quanping === 1 ? 1420+50:DataSource.naviTypeStore === 0 ? 50+1210 : (DataSource.naviTypeStore === 1 && smallMap === 0) ? 20 :50
    y: 240
    width: 240
    height: 240
    color: "transparent"
    visible: anQuan === 0 && moShi !== "关闭" && (moShi === "矩形原版" || moShi === "矩形模式" || (moShi !== "CD模式" && moShi !== "隐藏模式" && lyricsArray.length === 0 && moShi !== "天际模式" && moShi !== "混合模式")) && latestmultimediaPlayStatus === 1 && DataSource.themeIndex === 0x02 && DataSource.powerGear === 3 && !(weilai === 1 && DataSource.naviTypeStore === 1 && xpadas === 0) && !(DataSource.naviTypeStore === 2 && quanping === 0) && !((DataSource.carBodyNeedDisplay === DataSource.UI_DISPLAY ||
DataSource.carKeyWarningInfoDisplay !== 0x0 ||
DataSource.accErrorMesDisplay === 0x02 ||
DataSource.commonWarningInfoNeedDisplay === DataSource.UI_DISPLAY ||
DataSource.cumErrorWarningInfoNeedDisplay === DataSource.UI_DISPLAY ||
DataSource.dmsAnimNeedDisplay === DataSource.UI_DISPLAY ||
DataSource.generPowerWarningInfoNeedDisplay === DataSource.UI_DISPLAY ||
DataSource.maintainWarningInfoDisplay === DataSource.UI_DISPLAY ||
DataSource.modeSwitchWarningInfoNeedDisplay === DataSource.UI_DISPLAY ||
DataSource.phonePromptNeedDisplay === DataSource.UI_DISPLAY ||
DataSource.speedWarningInfoNeedDisplay === DataSource.UI_DISPLAY ||
DataSource.tireWarningInfoNeedDisplay === DataSource.UI_DISPLAY) && smallMap === 1 && DataSource.naviTypeStore === 1 && xpadas === 1)
    
    Item {
        id: songCoverContainer
        x: 0
        y: moShi === "矩形模式" && lyricsArray.length > 0 && ((DataSource.naviTypeStore === 1 && smallMap === 0) || (DataSource.naviTypeStore === 2 && quanping === 1)) ? -50 : 0
        width: 240
        height: 240
		scale: moShi === "矩形模式" && lyricsArray.length > 0 && ((DataSource.naviTypeStore === 1 && smallMap === 0) || (DataSource.naviTypeStore === 2 && quanping === 1)) ? 0.8 : 1.0
		transformOrigin: moShi === "矩形模式" && lyricsArray.length > 0 && ((DataSource.naviTypeStore === 1 && smallMap === 0) || (DataSource.naviTypeStore === 2 && quanping === 1)) ? Item.BottomLeft : Item.Center		
        
        Rectangle {
            id: mask
            anchors.fill: parent
            radius: 15
            visible: false
        }
        
        Image {
            id: songCoverImage
            anchors.fill: parent
            fillMode: Image.PreserveAspectCrop
            source: coverImageData !== "" ? coverImageData : ""
            visible: coverImageData !== ""
            cache: false
            layer.enabled: true
            layer.effect: OpacityMask {
                maskSource: mask
            }
        }
        Image {
            anchors.left: parent.left 
            anchors.bottom: parent.bottom   
            anchors.leftMargin: 10
            anchors.bottomMargin: 10  
            width: 30
            height: 30
            source: "qrc:/images10_25/MediaInfo/标.png" 
            visible: coverImageData !== "" && (yinYuan === 1 || yinYuan === 2 || yinYuan === 4 || yinYuan === 6 || yinYuan === 99)
            layer.enabled: true
            layer.effect: OpacityMask {
                maskSource: Rectangle {
                    width: 30
                    height: 30
                    visible: true
                }
            }
        }        
        Image {
            id: qqMusicIcon
            x: 5 + platformIconX
            y: 5 + platformIconY
            //anchors.right: parent.right
            //anchors.bottom: parent.bottom
            //anchors.rightMargin: 10
            //anchors.bottomMargin: 10
            width: 40
            height: 40
            source: rootItemId.yinYuan === 21 ? 
                    "qrc:/images10_25/MediaInfo/mediaIcon21.png" : 
					rootItemId.yinYuan === 31 ? 
                    "qrc:/images10_25/MediaInfo/mediaIcon31.png" :
                    rootItemId.yinYuan === 20 ? 
                    "qrc:/images10_25/MediaInfo/mediaIcon20.png" :
	                    rootItemId.yinYuan === 30 ? 
                    "qrc:/images10_25/MediaInfo/mediaIcon30.png" :					
					rootItemId.yinYuan === 99 ? 
                    "qrc:/images10_25/MediaInfo/mediaIcon99.png" :
                    "qrc:/images10_25/MediaInfo/mediaIcon" + DataSource.mediaInfoIconId + ".png"
            visible: coverImageData !== ""
            layer.enabled: true
            layer.effect: OpacityMask {
                maskSource: Rectangle {
                    width: 40
                    height: 40
                    visible: false
                }
            }
        }
    }
}

Text {
    id: mediaInfoText
    x: moShi === "矩形模式" && lyricsArray.length > 0 && ((DataSource.naviTypeStore === 1 && smallMap === 0) || (DataSource.naviTypeStore === 2 && quanping === 1)) ? musicInfoContainer.x : musicInfoContainer.x + 250
    y: (moShi === "矩形模式" && lyricsArray.length > 0) ? musicInfoContainer.y - 10 - mediaInfoText.height : musicInfoContainer.y + 20
    visible: musicInfoContainer.visible
    width: ((DataSource.naviTypeStore === 1 && smallMap === 0) || (DataSource.naviTypeStore === 2 && quanping === 1)) ? 190 : (lyricsArray.length === 0 ||  moShi === "矩形原版") ? 240 : 340
    wrapMode: Text.WordWrap
    maximumLineCount: lyricsArray.length > 0 ? 2 : 0
    font.pixelSize: haoYu+28
    color: DataSource.dayNightMode === 0x02 ? "#ffffff" : "#333333"
    text: songName
	font.family: rootItemId.ziti
    horizontalAlignment: (moShi === "矩形模式" && lyricsArray.length > 0) ? Text.AlignHCenter : Text.AlignLeft	
}

Rectangle {
    id: lyricDisplayBox
    x: ((DataSource.naviTypeStore === 1 && smallMap === 0) || (DataSource.naviTypeStore === 2 && quanping === 1)) ? musicInfoContainer.x + 200 : musicInfoContainer.x + 250
    y: ((DataSource.naviTypeStore === 1 && smallMap === 0) || (DataSource.naviTypeStore === 2 && quanping === 1)) ? musicInfoContainer.y-mediaInfoText.height / 2 : musicInfoContainer.y
    width: ((DataSource.naviTypeStore === 1 && smallMap === 0) || (DataSource.naviTypeStore === 2 && quanping === 1)) ? 240 : 340
    height: ((DataSource.naviTypeStore === 1 && smallMap === 0) || (DataSource.naviTypeStore === 2 && quanping === 1)) ? 240+mediaInfoText.height / 2 : 200+(jinDu === 1 ? 40 : 0)
    color: "transparent"
    visible: moShi === "矩形模式" && lyricsArray.length > 0 && musicInfoContainer.visible
    clip: true
    
    ListView {
        id: simpleLyricListView
        anchors.fill: parent
        anchors.margins: 5
        model: lyricsArray
        spacing: 5
        interactive: false
        verticalLayoutDirection: ListView.TopToBottom
        highlightRangeMode: ListView.ApplyRange
        preferredHighlightBegin: 0.5
        preferredHighlightEnd: 0.5
        highlightFollowsCurrentItem: true
        currentIndex: currentLyricIndex
        
        onModelChanged: {
            if (currentLyricIndex >= 0) {
                positionViewAtIndex(currentLyricIndex, ListView.Center);
            }
        }
        
        onCurrentIndexChanged: {
            if (currentIndex >= 0) {
                positionViewAtIndex(currentIndex, ListView.Center);
            }
        }
        
        delegate: Item {
            id: simpleLyricDelegate
            width: simpleLyricListView.width
            height: Math.max(simpleLyricText.implicitHeight + 3, 25)
            property bool isCurrentLyric: index === currentLyricIndex
            
            Text {
                id: simpleLyricText
                anchors.centerIn: parent
                width: parent.width - 10
                text: modelData.text
				font.family: rootItemId.ziti
                color: {
  if (isCurrentLyric) {
    DataSource.dayNightMode === 0x02 ? yanse2 : yanse1
  } else {
    DataSource.dayNightMode === 0x02 ? "#ffffff" : "#333333"
  }
}
                font.pixelSize: isCurrentLyric ? shuHan+25 : shuHan+20
                font.bold:rootItemId.jiacu === 1
                wrapMode: Text.WrapAtWordBoundaryOrAnywhere
                horizontalAlignment: Text.AlignHCenter
                verticalAlignment: Text.AlignVCenter
                maximumLineCount: 0
                opacity: isCurrentLyric ? 1.0 : 0.8
                
                Behavior on color {
                    ColorAnimation { duration: 130; easing.type: Easing.InOutQuad }
                }
                
                Behavior on font.pixelSize {
                    NumberAnimation { duration: 130; easing.type: Easing.InOutQuad }
                }
            }
        }
    }
}

Rectangle {
    id: simpleMusicProgressContainer
    x: moShi === "矩形模式" && lyricsArray.length > 0 && ((DataSource.naviTypeStore === 1 && smallMap === 0) || (DataSource.naviTypeStore === 2 && quanping === 1)) ? musicInfoContainer.x : musicInfoContainer.x + 250
    y: musicInfoContainer.y + 200
    width: ((DataSource.naviTypeStore === 1 && smallMap === 0) || (DataSource.naviTypeStore === 2 && quanping === 1)) ? 190 : (lyricsArray.length === 0 ||  moShi === "矩形原版" || (((DataSource.naviTypeStore === 1 && smallMap === 0) || (DataSource.naviTypeStore === 2 && quanping === 1)))) ? 240 : 340
    height: 40
    color: "transparent"
    visible: musicInfoContainer.visible && jinDu === 0
    
    Rectangle {
        id: simpleProgressBarBg
        anchors.verticalCenter: parent.verticalCenter
        width: parent.width
        height: 5
        radius: 2.5
        color: "#707070"
    }
    
    Rectangle {
        id: simpleProgressBarFg
        anchors.left: parent.left
        anchors.verticalCenter: parent.verticalCenter
        width: songDuration > 0 ? Math.min((currentLyricTime / songDuration) * parent.width, parent.width) : 0
        height: 5
        radius: 2.5
        color: DataSource.dayNightMode === 0x02 ? "#FFFFFF" : "#000000"
        
        Behavior on width {
            NumberAnimation { duration: 100; easing.type: Easing.Linear }
        }
    }
    
    Rectangle {
        id: simpleProgressBall
        anchors.verticalCenter: parent.verticalCenter
        x: songDuration > 0 ? Math.min((currentLyricTime / songDuration) * parent.width - 5, parent.width - 10) : -5
        width: 10
        height: 10
        radius: 5
        color: DataSource.dayNightMode === 0x02 ? "#FFFFFF" : "#000000"
        
        Behavior on x {
            NumberAnimation { duration: 100; easing.type: Easing.Linear }
        }
    }
    
    Text {
        id: simpleCurrentTimeText
        anchors.top: simpleProgressBarBg.bottom
        anchors.topMargin: 5
        anchors.left: simpleProgressBarBg.left
        color: DataSource.dayNightMode === 0x02 ? "#ffffff" : "#333333"
        font.pixelSize: 20
        text: formatTime(currentLyricTime)
    }
    
    Text {
        id: simpleTotalTimeText
        anchors.top: simpleProgressBarBg.bottom
        anchors.topMargin: 5
        anchors.right: simpleProgressBarBg.right
        color: DataSource.dayNightMode === 0x02 ? "#ffffff" : "#333333"
        font.pixelSize: 20
        text: formatTime(songDuration)
    }
}
Rectangle {
    id: musicContainer
    x: xpadas === 0 ? 150 : 150+640
    y: 180
    width: 200
    height: 200
    color: "transparent"
    visible: anQuan === 0 && !(DataSource.naviTypeStore === 1 && smallMap === 0) && moShi === "隐藏模式" && latestmultimediaPlayStatus === 1 && DataSource.naviTypeStore === 1 && DataSource.themeIndex === 0x02 && DataSource.powerGear === 3 && !(weilai === 1 && DataSource.naviTypeStore === 1 && xpadas === 1) && !((DataSource.carBodyNeedDisplay === DataSource.UI_DISPLAY ||
DataSource.carKeyWarningInfoDisplay !== 0x0 ||
DataSource.accErrorMesDisplay === 0x02 ||
DataSource.commonWarningInfoNeedDisplay === DataSource.UI_DISPLAY ||
DataSource.cumErrorWarningInfoNeedDisplay === DataSource.UI_DISPLAY ||
DataSource.dmsAnimNeedDisplay === DataSource.UI_DISPLAY ||
DataSource.generPowerWarningInfoNeedDisplay === DataSource.UI_DISPLAY ||
DataSource.maintainWarningInfoDisplay === DataSource.UI_DISPLAY ||
DataSource.modeSwitchWarningInfoNeedDisplay === DataSource.UI_DISPLAY ||
DataSource.phonePromptNeedDisplay === DataSource.UI_DISPLAY ||
DataSource.speedWarningInfoNeedDisplay === DataSource.UI_DISPLAY ||
DataSource.tireWarningInfoNeedDisplay === DataSource.UI_DISPLAY) && DataSource.naviTypeStore === 1 && smallMap === 1 && xpadas === 1)
    
    Item {
        id: albumArtBox
        x: -11
        y: 0
        width: 200
        height: 200
        
        Rectangle {
            id: roundedMask
            anchors.fill: parent
            radius: 20
            visible: false
        }
        
        Image {
            id: albumArtImage
            anchors.fill: parent
            fillMode: Image.PreserveAspectCrop
            source: coverImageData !== "" ? coverImageData : ""
            visible: coverImageData !== ""
            cache: false
            layer.enabled: true
            layer.effect: OpacityMask {
                maskSource: roundedMask
            }
        }
        
        Image {
            id: musicSourceIcon
            x: 5 + platformIconX
            y: 5 + platformIconY
            //anchors.right: parent.right
            //anchors.bottom: parent.bottom
            //anchors.rightMargin: 10
            //anchors.bottomMargin: 10
            width: 40
            height: 40
            source: rootItemId.yinYuan === 21 ? 
                    "qrc:/images10_25/MediaInfo/mediaIcon21.png" : 
					rootItemId.yinYuan === 31 ? 
                    "qrc:/images10_25/MediaInfo/mediaIcon31.png" :
                    rootItemId.yinYuan === 20 ? 
                    "qrc:/images10_25/MediaInfo/mediaIcon20.png" :
	                    rootItemId.yinYuan === 30 ? 
                    "qrc:/images10_25/MediaInfo/mediaIcon30.png" :					
                    "qrc:/images10_25/MediaInfo/mediaIcon" + DataSource.mediaInfoIconId + ".png"
            visible: coverImageData !== ""
            layer.enabled: true
            layer.effect: OpacityMask {
                maskSource: Rectangle {
                    width: 40
                    height: 40
                    visible: false
                }
            }
        }
    }
}

Text {
    id: trackTitleLabel
    x: musicContainer.x + 220
    y: musicContainer.y - 34
    visible: musicContainer.visible
    width: lyricsArray.length === 0 ||  moShi === "矩形原版"? 240 : 340
    wrapMode: Text.WordWrap
    maximumLineCount: lyricsArray.length > 0 ? 2 : 0
    font.pixelSize: haoYu+28
    color: DataSource.dayNightMode === 0x02 ? "#ffffff" : "#333333"
    text: songName
	font.family: rootItemId.ziti
    horizontalAlignment: Text.AlignHCenter	
}

Rectangle {
    id: lyricsPanel
    x: musicContainer.x + 220
    y: musicContainer.y + trackTitleLabel.height - 24
    width: 340
    height: 360-trackTitleLabel.height+24
    color: "transparent"
    visible: moShi === "隐藏模式" && musicContainer.visible
    clip: true
    
    ListView {
        id: lyricsListView
        anchors.fill: parent
        anchors.margins: 5
        model: lyricsArray
        spacing: 5
        interactive: false
        verticalLayoutDirection: ListView.TopToBottom
        highlightRangeMode: ListView.ApplyRange
        preferredHighlightBegin: 0.5
        preferredHighlightEnd: 0.5
        highlightFollowsCurrentItem: true
        currentIndex: currentLyricIndex
        
        onModelChanged: {
            if (currentLyricIndex >= 0) {
                positionViewAtIndex(currentLyricIndex, ListView.Center);
            }
        }
        
        onCurrentIndexChanged: {
            if (currentIndex >= 0) {
                positionViewAtIndex(currentIndex, ListView.Center);
            }
        }
        
        delegate: Item {
            id: lyricItem
            width: lyricsListView.width
            height: Math.max(lyricText.implicitHeight + 3, 25)
            property bool isActiveLyric: index === currentLyricIndex
            
            Text {
                id: lyricText
                anchors.centerIn: parent
                width: parent.width - 10
                text: modelData.text
				font.family: rootItemId.ziti
                color: {
  if (isActiveLyric) {
    DataSource.dayNightMode === 0x02 ? yanse2 : yanse1
  } else {
    DataSource.dayNightMode === 0x02 ? "#ffffff" : "#333333"
  }
}
                font.pixelSize: isActiveLyric ? shuHan+25 : shuHan+20
                font.bold:rootItemId.jiacu === 1
                wrapMode: Text.WrapAtWordBoundaryOrAnywhere
                horizontalAlignment: Text.AlignHCenter
                verticalAlignment: Text.AlignVCenter
                maximumLineCount: 0
                opacity: isActiveLyric ? 1.0 : 0.8
                
                Behavior on color {
                    ColorAnimation { duration: 130; easing.type: Easing.InOutQuad }
                }
                
                Behavior on font.pixelSize {
                    NumberAnimation { duration: 130; easing.type: Easing.InOutQuad }
                }
            }
        }
    }
}

Rectangle {
    id: progressContainer
    x: musicContainer.x + 220
    y: lyricsArray.length === 0 ? musicContainer.y + 160 : musicContainer.y + 360
    width: lyricsArray.length === 0 ||  moShi === "矩形原版"? 240 : 340
    height: 40
    color: "transparent"
    visible: musicContainer.visible && jinDu === 0
    
    Rectangle {
        id: progressBackground
        anchors.verticalCenter: parent.verticalCenter
        width: parent.width
        height: 5
        radius: 2.5
        color: "#707070"
    }
    
    Rectangle {
        id: progressForeground
        anchors.left: parent.left
        anchors.verticalCenter: parent.verticalCenter
        width: songDuration > 0 ? Math.min((currentLyricTime / songDuration) * parent.width, parent.width) : 0
        height: 5
        radius: 2.5
        color: DataSource.dayNightMode === 0x02 ? "#FFFFFF" : "#000000"
        
        Behavior on width {
            NumberAnimation { duration: 100; easing.type: Easing.Linear }
        }
    }
    
    Rectangle {
        id: progressIndicator
        anchors.verticalCenter: parent.verticalCenter
        x: songDuration > 0 ? Math.min((currentLyricTime / songDuration) * parent.width - 5, parent.width - 10) : -5
        width: 10
        height: 10
        radius: 5
        color: DataSource.dayNightMode === 0x02 ? "#FFFFFF" : "#000000"
        
        Behavior on x {
            NumberAnimation { duration: 100; easing.type: Easing.Linear }
        }
    }
    
    Text {
        id: elapsedTimeLabel
        anchors.top: progressBackground.bottom
        anchors.topMargin: 5
        anchors.left: progressBackground.left
        color: DataSource.dayNightMode === 0x02 ? "#ffffff" : "#333333"
        font.pixelSize: 20
        text: formatTime(currentLyricTime)
    }
    
    Text {
        id: totalTimeLabel
        anchors.top: progressBackground.bottom
        anchors.topMargin: 5
        anchors.right: progressBackground.right
        color: DataSource.dayNightMode === 0x02 ? "#ffffff" : "#333333"
        font.pixelSize: 20
        text: formatTime(songDuration)
    }
}
Rectangle {
    id: musicInfoContainerOriginal
    x: (smallMap === 1 || DataSource.naviTypeStore === 0) ? 770 : 1485+35
    y: 140-10
    width: 240
    height: 240
    color: "transparent"
    visible: (anQuan === 1 || jianYi === 0) && latestmultimediaPlayStatus === 1 && DataSource.themeIndex === 0x02 && DataSource.powerGear === 3 && !(DataSource.naviTypeStore === 2 && quanping === 0)
    
    Item {
        id: songCoverContainerOriginal
        x: 0
        y: 0
        width: 120
        height: 120
		visible: xiMen === 0
        
        Rectangle {
            id: maskOriginal
            anchors.fill: parent
            radius: 15
            visible: false
        }
        
        Image {
            id: songCoverImageOriginal
            anchors.fill: parent
            fillMode: Image.PreserveAspectCrop
            source: coverImageData !== "" ? coverImageData : ""
            visible: coverImageData !== ""
            cache: false
            layer.enabled: true
            layer.effect: OpacityMask {
                maskSource: maskOriginal
            }
        }
        Image {
            anchors.left: parent.left 
            anchors.bottom: parent.bottom   
            anchors.leftMargin: 10
            anchors.bottomMargin: 10  
            width: 15
            height: 15
            source: "qrc:/images10_25/MediaInfo/标.png" 
            visible: coverImageData !== "" && (yinYuan === 1 || yinYuan === 2 || yinYuan === 4 || yinYuan === 6 || yinYuan === 99)
            layer.enabled: true
            layer.effect: OpacityMask {
                maskSource: Rectangle {
                    width: 15
                    height: 15
                    visible: true
                }
            }
        }        
        Image {
            id: qqMusicIconOriginal
            x: 5 + platformIconX
            y: 5 + platformIconY
            //anchors.right: parent.right
            //anchors.bottom: parent.bottom
            //anchors.rightMargin: 10
            //anchors.bottomMargin: 10
            width: 20
            height: 20
            source: rootItemId.yinYuan === 21 ? 
                    "qrc:/images10_25/MediaInfo/mediaIcon21.png" : 
					rootItemId.yinYuan === 31 ? 
                    "qrc:/images10_25/MediaInfo/mediaIcon31.png" :
                    rootItemId.yinYuan === 20 ? 
                    "qrc:/images10_25/MediaInfo/mediaIcon20.png" :
                    rootItemId.yinYuan === 30 ? 
                    "qrc:/images10_25/MediaInfo/mediaIcon30.png" :					
                    rootItemId.yinYuan === 99 ? 
                    "qrc:/images10_25/MediaInfo/mediaIcon99.png" :
                    "qrc:/images10_25/MediaInfo/mediaIcon" + DataSource.mediaInfoIconId + ".png"
            visible: coverImageData !== ""
            layer.enabled: true
            layer.effect: OpacityMask {
                maskSource: Rectangle {
                    width: 20
                    height: 20
                    visible: false
                }
            }
        }
    }
    
    Text {
        id: mediaInfoTextOriginal
        x: xiMen === 1 ? 20 : 140
        y: 0
        visible: anQuan === 0 || lyricsArray.length === 0
        width: xiMen === 1 ? 330 : 210
        wrapMode: Text.WordWrap
        maximumLineCount: 2
        font.pixelSize: haoYu+28
        color: DataSource.dayNightMode === 0x02 ? "#ffffff" : "#333333"
        text: songName
        font.family: rootItemId.ziti
        horizontalAlignment: Text.AlignLeft
    }
    
    // 置顶模式歌词显示（默认且仅此模式）
    Rectangle {
        id: lyricBoxOriginal
        x: xiMen === 1 ? 20 : 140
        y: 0
        width: xiMen === 1 ? 330 : 210
        height: 200
        color: "transparent"
		visible: anQuan === 1 && lyricsArray.length > 0	
        clip: false
        
        ListView {
            id: lyricListViewOriginal
            anchors.fill: parent
            anchors.margins: 5
            
            model: lyricsArray
            spacing: 8
            interactive: false
            verticalLayoutDirection: ListView.TopToBottom
            
            // 置顶模式设置
            highlightRangeMode: ListView.StrictlyEnforceRange
            preferredHighlightBegin: 0
            preferredHighlightEnd: 0
            highlightFollowsCurrentItem: true
            
            currentIndex: currentLyricIndex
            
            onModelChanged: {
                if (currentLyricIndex >= 0) {
                    positionViewAtIndex(currentLyricIndex, ListView.Beginning)
                }
            }
            
            onCurrentIndexChanged: {
                if (currentIndex >= 0) {
                    positionViewAtIndex(currentIndex, ListView.Beginning)
                }
            }
            
            delegate: Item {
                id: lyricDelegateOriginal
                width: lyricListViewOriginal.width
                height: Math.max(lyricTextOriginal.implicitHeight + 3, 25)
                
                property bool isCurrentLyric: index === currentLyricIndex
                
                Text {
                    id: lyricTextOriginal
                    anchors.centerIn: parent
                    width: parent.width - 10
                    text: modelData.text
                    font.family: rootItemId.ziti
                    color: {
  if (isCurrentLyric) {
    DataSource.dayNightMode === 0x02 ? yanse2 : yanse1
  } else {
    DataSource.dayNightMode === 0x02 ? "#ffffff" : "#333333"
  }
}
                    font.pixelSize: isCurrentLyric ? shuHan+25 : shuHan+20
                    font.bold:rootItemId.jiacu === 1
                    wrapMode: Text.WrapAtWordBoundaryOrAnywhere
                    horizontalAlignment: Text.AlignHCenter
                    verticalAlignment: Text.AlignVCenter
                    maximumLineCount: 0
                    opacity: isCurrentLyric ? 1.0 : 0.8
                    visible: isCurrentLyric  // 置顶模式：只显示当前歌词
                    
                    Behavior on color {
                        ColorAnimation { duration: 130; easing.type: Easing.InOutQuad }
                    }
                    
                    Behavior on font.pixelSize {
                        NumberAnimation { duration: 130; easing.type: Easing.InOutQuad }
                    }
                }
            }
        }
    }
    Rectangle {
        id: simpleMusicProgressContainerOriginal
        x: xiMen === 1 ? 20 : 140
        y: 80
        width: xiMen === 1 ? 330 : 210
        height: 40
        color: "transparent"
        visible: (anQuan === 0 || lyricsArray.length === 0) && jinDu === 0
        
        Rectangle {
            id: simpleProgressBarBgOriginal
            anchors.verticalCenter: parent.verticalCenter
            width: parent.width
            height: 5
            radius: 2.5
            color: "#707070"
        }
        
        Rectangle {
            id: simpleProgressBarFgOriginal
            anchors.left: parent.left
            anchors.verticalCenter: parent.verticalCenter
            width: songDuration > 0 ? Math.min((currentLyricTime / songDuration) * parent.width, parent.width) : 0
            height: 5
            radius: 2.5
            color: DataSource.dayNightMode === 0x02 ? "#FFFFFF" : "#000000"
            
            Behavior on width {
                NumberAnimation { duration: 100; easing.type: Easing.Linear }
            }
        }
        
        Rectangle {
            id: simpleProgressBallOriginal
            anchors.verticalCenter: parent.verticalCenter
            x: songDuration > 0 ? Math.min((currentLyricTime / songDuration) * parent.width - 5, parent.width - 10) : -5
            width: 10
            height: 10
            radius: 5
            color: DataSource.dayNightMode === 0x02 ? "#FFFFFF" : "#000000"
            
            Behavior on x {
                NumberAnimation { duration: 100; easing.type: Easing.Linear }
            }
        }
        
        Text {
            id: simpleCurrentTimeTextOriginal
            anchors.top: simpleProgressBarBgOriginal.bottom
            anchors.topMargin: 5
            anchors.left: simpleProgressBarBgOriginal.left
            color: DataSource.dayNightMode === 0x02 ? "#ffffff" : "#333333"
            font.pixelSize: 20
            text: formatTime(currentLyricTime)
        }
        
        Text {
            id: simpleTotalTimeTextOriginal
            anchors.top: simpleProgressBarBgOriginal.bottom
            anchors.topMargin: 5
            anchors.right: simpleProgressBarBgOriginal.right
            color: DataSource.dayNightMode === 0x02 ? "#ffffff" : "#333333"
            font.pixelSize: 20
            text: formatTime(songDuration)
        }
    }
}
        Image {  
		id: jinCheng
	    visible: false
		z: 7878
		source: "qrc:/images10_25/poweron/IMG_000.ktx"
        }
Rectangle {
    id: mediaCoverDisplay
    x: DataSource.naviTypeStore === 1 && smallMap === 1 && xpadas === 1 ? 570 : DataSource.naviTypeStore === 1 && smallMap === 0 && xpadas === 1 ? 1420 : DataSource.naviTypeStore === 2 && quanping === 1 ? 1420:DataSource.naviTypeStore === 0 ? 1170 : (DataSource.naviTypeStore === 1 && smallMap === 0) ? 0 : 50
    y: ((DataSource.naviTypeStore === 1 && smallMap === 0) || (DataSource.naviTypeStore === 2 && quanping === 1)) ? 140 : 210
    width: 700
    height: 360
    scale: ((DataSource.naviTypeStore === 1 && smallMap === 0) || (DataSource.naviTypeStore === 2 && quanping === 1)) ? 0.6 : 0.8
	transformOrigin: ((DataSource.naviTypeStore === 1 && smallMap === 0) || (DataSource.naviTypeStore === 2 && quanping === 1)) ? Item.BottomLeft : Item.Center		
    color: "transparent"
    visible: anQuan === 0 && lyricsArray.length > 0 && moShi === "CD模式" && latestmultimediaPlayStatus === 1 && !(DataSource.naviTypeStore === 2 && quanping === 0) && DataSource.themeIndex === 0x02 && DataSource.powerGear === 3 && DataSource.menuNeedDisplay !== DataSource.UI_DISPLAY && !(weilai === 1 && DataSource.naviTypeStore === 1 && xpadas === 0) && !((DataSource.carBodyNeedDisplay === DataSource.UI_DISPLAY ||
DataSource.carKeyWarningInfoDisplay !== 0x0 ||
DataSource.accErrorMesDisplay === 0x02 ||
DataSource.commonWarningInfoNeedDisplay === DataSource.UI_DISPLAY ||
DataSource.cumErrorWarningInfoNeedDisplay === DataSource.UI_DISPLAY ||
DataSource.dmsAnimNeedDisplay === DataSource.UI_DISPLAY ||
DataSource.generPowerWarningInfoNeedDisplay === DataSource.UI_DISPLAY ||
DataSource.maintainWarningInfoDisplay === DataSource.UI_DISPLAY ||
DataSource.modeSwitchWarningInfoNeedDisplay === DataSource.UI_DISPLAY ||
DataSource.phonePromptNeedDisplay === DataSource.UI_DISPLAY ||
DataSource.speedWarningInfoNeedDisplay === DataSource.UI_DISPLAY ||
DataSource.tireWarningInfoNeedDisplay === DataSource.UI_DISPLAY) && smallMap === 1 && DataSource.naviTypeStore === 1 && xpadas === 1)
    
    Image {
        id: cdLever
        x: 305
        y: ((DataSource.naviTypeStore === 1 && smallMap === 0) || (DataSource.naviTypeStore === 2 && quanping === 1)) ? -258-50 : -258-20
        z: 2
        source: DataSource.dayNightMode === 0x02 ? "qrc:/images10_25/display_always/拨杆白.png" : "qrc:/images10_25/display_always/拨杆黑.png"
        fillMode: Image.PreserveAspectFit
        visible: true
        
        transform: Rotation {
            id: leverRotation
            origin.x: cdLever.width / 2
            origin.y: cdLever.height / 2
            angle: 0
        }
        
        RotationAnimation {
            id: playAnimation
            target: leverRotation
            property: "angle"
            from: 0
            to: 10
            duration: 1000
            easing.type: Easing.InOutQuad
            running: false
        }
        
        RotationAnimation {
            id: pauseAnimation
            target: leverRotation
            property: "angle"
            from: 10
            to: 0
            duration: 1000
            easing.type: Easing.InOutQuad
            running: false
        }
        
        states: [
            State {
                name: "playing"
                when: latestmultimediaPlayStatus === 1
                StateChangeScript {
                    script: {
                        playAnimation.start()
                    }
                }
            },
            State {
                name: "paused"
                when: latestmultimediaPlayStatus === 2
                StateChangeScript {
                    script: {
                        pauseAnimation.start()
                    }
                }
            }
        ]
    }
    
    Rectangle {
        id: cdContainer
        x: 0
        y: ((DataSource.naviTypeStore === 1 && smallMap === 0) || (DataSource.naviTypeStore === 2 && quanping === 1)) ? -50 : -20
        z: 1
        width: 360
        height: 360
        radius: width / 2
        color: "transparent"
        visible: true
        
        Image {
            id: cdDisc
            anchors.centerIn: parent
            width: 360
            height: 360
            source: "qrc:/images10_25/display_always/cd.png"
            fillMode: Image.PreserveAspectFit
            visible: true
        }
        
        Rectangle {
            id: coverImageContainer
            anchors.centerIn: parent
            width: 220
            height: 220
            radius: width / 2
            visible: coverImageData !== ""
            
            layer.enabled: true
            layer.effect: OpacityMask {
                maskSource: Rectangle {
                    width: coverImageContainer.width
                    height: coverImageContainer.height
                    radius: coverImageContainer.radius
                    visible: false
                }
            }
            
            Image {
                id: coverImage
                anchors.centerIn: parent
                width: coverImageContainer.width
                height: coverImageContainer.height
                fillMode: Image.PreserveAspectCrop
                source: coverImageData
                visible: coverImageData !== ""
                cache: false
            }
            
            Rectangle {
                anchors.fill: parent
                radius: parent.radius
                color: "transparent"
                border.width: 2
                border.color: DataSource.dayNightMode === 0x02 ? "rgba(255,255,255,0.4)" : "rgba(0,0,0,0.3)"
            }
        }
        
        RotationAnimation {
            id: cdRotation
            target: cdContainer
            property: "rotation"
            from: 0
            to: 360
            duration: 10000
            loops: Animation.Infinite
            running: latestmultimediaPlayStatus === 1
        }
    }
}
    Rectangle {
        id: songLyricContainer
        x: ((DataSource.naviTypeStore === 1 && smallMap === 0) || (DataSource.naviTypeStore === 2 && quanping === 1)) ? mediaCoverDisplay.x+230 : mediaCoverDisplay.x+380
        y: ((DataSource.naviTypeStore === 1 && smallMap === 0) || (DataSource.naviTypeStore === 2 && quanping === 1)) ? mediaCoverDisplay.y+100 : mediaCoverDisplay.y
        width: ((DataSource.naviTypeStore === 1 && smallMap === 0) || (DataSource.naviTypeStore === 2 && quanping === 1)) ? 250 : 340
        height: ((DataSource.naviTypeStore === 1 && smallMap === 0) || (DataSource.naviTypeStore === 2 && quanping === 1)) ? 290 : 360
        color: "transparent"
		visible: mediaCoverDisplay.visible
        
        Text {
            id: songNameText
            x: 0
            y: -70
            width: ((DataSource.naviTypeStore === 1 && smallMap === 0) || (DataSource.naviTypeStore === 2 && quanping === 1)) ? 250 : 340
            text: songName
			font.family: rootItemId.ziti
            color: DataSource.dayNightMode === 0x02 ? "#ffffff" : "#333333"
            font.pixelSize: haoYu+28
            wrapMode: Text.WordWrap
            maximumLineCount: 2
            verticalAlignment: Text.AlignTop
            horizontalAlignment: Text.AlignHCenter
        }
        
Rectangle {
    id: lyricBox
    x: 0
    y: songNameText.height - 60
    width: ((DataSource.naviTypeStore === 1 && smallMap === 0) || (DataSource.naviTypeStore === 2 && quanping === 1)) ? 250 : 340
    height: ((DataSource.naviTypeStore === 1 && smallMap === 0) || (DataSource.naviTypeStore === 2 && quanping === 1)) ? 320 - songNameText.height : 390 - songNameText.height
    color: "transparent"
    
    clip: true
    
    ListView {
        id: lyricListView
        anchors.fill: parent
        anchors.margins: 5
        
        model: lyricsArray
        spacing: 8
        
        interactive: false
        
        verticalLayoutDirection: ListView.TopToBottom
        
        highlightRangeMode: ListView.ApplyRange
        preferredHighlightBegin: 0.5
        preferredHighlightEnd: 0.5
        highlightFollowsCurrentItem: true
        
        currentIndex: currentLyricIndex
        
        onModelChanged: {
            if (currentLyricIndex >= 0) {
                positionViewAtIndex(currentLyricIndex, ListView.Center);
            }
        }
        
        onCurrentIndexChanged: {
            if (currentIndex >= 0) {
                positionViewAtIndex(currentIndex, ListView.Center);
            }
        }
        
        delegate: Item {
            id: lyricDelegate
            width: lyricListView.width
            height: Math.max(lyricText.implicitHeight + 3, 25)
            
            property bool isCurrentLyric: index === currentLyricIndex
            
            Text {
                id: lyricText
                anchors.centerIn: parent
                width: parent.width - 10
                text: modelData.text
				font.family: rootItemId.ziti
                color: {
  if (isCurrentLyric) {
    DataSource.dayNightMode === 0x02 ? yanse2 : yanse1
  } else {
    DataSource.dayNightMode === 0x02 ? "#ffffff" : "#333333"
  }
}
                font.pixelSize: isCurrentLyric ? shuHan+25 : shuHan+20
                font.bold:rootItemId.jiacu === 1
                wrapMode: Text.WrapAtWordBoundaryOrAnywhere
                horizontalAlignment: Text.AlignHCenter
                verticalAlignment: Text.AlignVCenter
                maximumLineCount: 0
                opacity: isCurrentLyric ? 1.0 : 0.8
                Behavior on color {
                    ColorAnimation { duration: 130; easing.type: Easing.InOutQuad }
                }
                
                Behavior on font.pixelSize {
                    NumberAnimation { duration: 130; easing.type: Easing.InOutQuad }
                }
            }
        }
    }
}
}    
    Rectangle {
        id: musicProgressBarContainer
        x: mediaCoverDisplay.x+130  
        y: mediaCoverDisplay.y+360
        width: ((DataSource.naviTypeStore === 1 && smallMap === 0) || (DataSource.naviTypeStore === 2 && quanping === 1)) ? 330 : 550  
        height: 40
        color: "transparent"
		visible: mediaCoverDisplay.visible && jinDu === 0
        
        Rectangle {
            id: progressBarBg
            anchors.verticalCenter: parent.verticalCenter
            width: parent.width
            height: 5
            radius: 2.5
            color: "#707070"
        }
        
        Rectangle {
            id: progressBarFg
            anchors {
                left: parent.left
                verticalCenter: parent.verticalCenter
            }
            width: songDuration > 0 ? Math.min((currentLyricTime / songDuration) * parent.width, parent.width) : 0
            height: 5
            radius: 2.5
            color: DataSource.dayNightMode === 0x02 ? "#FFFFFF" : "#000000"
            
            Behavior on width {
                NumberAnimation {
                    duration: 100
                    easing.type: Easing.Linear
                }
            }
        }
        
        Rectangle {
            id: progressBall
            anchors.verticalCenter: parent.verticalCenter
            x: songDuration > 0 ? Math.min((currentLyricTime / songDuration) * parent.width - 5, parent.width - 10) : -5
            width: 10
            height: 10
            radius: 5
            color: DataSource.dayNightMode === 0x02 ? "#FFFFFF" : "#000000"
            
            Behavior on x {
                NumberAnimation {
                    duration: 100
                    easing.type: Easing.Linear
                }
            }
        }
        
        Text {
            id: currentTimeText
            anchors {
                top: progressBarBg.bottom
                topMargin: 5
                left: progressBarBg.left
            }
            color: DataSource.dayNightMode === 0x02 ? "#ffffff" : "#333333"
            font.pixelSize: 20
            text: formatTime(currentLyricTime)
        }
        
        Text {
            id: totalTimeText
            anchors {
                top: progressBarBg.bottom
                topMargin: 5
                right: progressBarBg.right
            }
            color: DataSource.dayNightMode === 0x02 ? "#ffffff" : "#333333"
            font.pixelSize: 20
            text: formatTime(songDuration)
        }
    }
Rectangle {
    id: mediaCoverDisplay_new
    x: DataSource.naviTypeStore === 1 && smallMap === 1 && xpadas === 1 ? 725 : DataSource.naviTypeStore === 1 && smallMap === 0 && xpadas === 1 ? 1580 : DataSource.naviTypeStore === 2 && quanping === 1 ? 1420+160:DataSource.naviTypeStore === 0 ? 1350-5 : (DataSource.naviTypeStore === 1 && smallMap === 0) ? 160 : 95
    y: ((DataSource.naviTypeStore === 1 && smallMap === 0) || (DataSource.naviTypeStore === 2 && quanping === 1)) ? 90 : 140
    width: 700
    height: 360
    scale:((DataSource.naviTypeStore === 1 && smallMap === 0) || (DataSource.naviTypeStore === 2 && quanping === 1)) ? 0.6 : 0.8
    transformOrigin: ((DataSource.naviTypeStore === 1 && smallMap === 0) || (DataSource.naviTypeStore === 2 && quanping === 1)) ? Item.BottomLeft : Item.Center		
    color: "transparent"
    visible: anQuan === 0 && lyricsArray.length === 0 && moShi === "CD模式" && latestmultimediaPlayStatus === 1 && DataSource.themeIndex === 0x02 && DataSource.powerGear === 3 && DataSource.menuNeedDisplay !== DataSource.UI_DISPLAY && !(weilai === 1 && DataSource.naviTypeStore === 1 && xpadas === 0) && !(DataSource.naviTypeStore === 2 && quanping === 0) && !((DataSource.carBodyNeedDisplay === DataSource.UI_DISPLAY ||
DataSource.carKeyWarningInfoDisplay !== 0x0 ||
DataSource.accErrorMesDisplay === 0x02 ||
DataSource.commonWarningInfoNeedDisplay === DataSource.UI_DISPLAY ||
DataSource.cumErrorWarningInfoNeedDisplay === DataSource.UI_DISPLAY ||
DataSource.dmsAnimNeedDisplay === DataSource.UI_DISPLAY ||
DataSource.generPowerWarningInfoNeedDisplay === DataSource.UI_DISPLAY ||
DataSource.maintainWarningInfoDisplay === DataSource.UI_DISPLAY ||
DataSource.modeSwitchWarningInfoNeedDisplay === DataSource.UI_DISPLAY ||
DataSource.phonePromptNeedDisplay === DataSource.UI_DISPLAY ||
DataSource.speedWarningInfoNeedDisplay === DataSource.UI_DISPLAY ||
DataSource.tireWarningInfoNeedDisplay === DataSource.UI_DISPLAY) && smallMap === 1 && DataSource.naviTypeStore === 1 && xpadas === 1)
    
    Image {
        id: cdLever_new
        x: 305
        y: ((DataSource.naviTypeStore === 1 && smallMap === 0) || (DataSource.naviTypeStore === 2 && quanping === 1)) ? -258-50 : -258-20
        z: 2
        source: DataSource.dayNightMode === 0x02 ? "qrc:/images10_25/display_always/拨杆白.png" : "qrc:/images10_25/display_always/拨杆黑.png"
        fillMode: Image.PreserveAspectFit
        visible: true
        
        transform: Rotation {
            id: leverRotation_new
            origin.x: cdLever_new.width / 2
            origin.y: cdLever_new.height / 2
            angle: 0
        }
        
        RotationAnimation {
            id: playAnimation_new
            target: leverRotation_new
            property: "angle"
            from: 0
            to: 10
            duration: 1000
            easing.type: Easing.InOutQuad
            running: false
        }
        
        RotationAnimation {
            id: pauseAnimation_new
            target: leverRotation_new
            property: "angle"
            from: 10
            to: 0
            duration: 1000
            easing.type: Easing.InOutQuad
            running: false
        }
        
        states: [
            State {
                name: "playing"
                when: latestmultimediaPlayStatus === 1
                StateChangeScript {
                    script: {
                        playAnimation_new.start()
                    }
                }
            },
            State {
                name: "paused"
                when: latestmultimediaPlayStatus === 2
                StateChangeScript {
                    script: {
                        pauseAnimation_new.start()
                    }
                }
            }
        ]
    }
    
    Rectangle {
        id: cdContainer_new
        x: 0
        y: ((DataSource.naviTypeStore === 1 && smallMap === 0) || (DataSource.naviTypeStore === 2 && quanping === 1)) ? -50 : -20
        z: 1
        width: 360
        height: 360
        radius: width / 2
        color: "transparent"
        visible: true
        
        Image {
            id: cdDisc_new
            anchors.centerIn: parent
            width: 360
            height: 360
            source: "qrc:/images10_25/display_always/cd.png"
            fillMode: Image.PreserveAspectFit
            visible: true
        }
        
        Rectangle {
            id: coverImageContainer_new
            anchors.centerIn: parent
            width: 220
            height: 220
            radius: width / 2
            visible: coverImageData !== ""
            
            layer.enabled: true
            layer.effect: OpacityMask {
                maskSource: Rectangle {
                    width: coverImageContainer_new.width
                    height: coverImageContainer_new.height
                    radius: coverImageContainer_new.radius
                    visible: false
                }
            }
            
            Image {
                id: coverImage_new
                anchors.centerIn: parent
                width: coverImageContainer_new.width
                height: coverImageContainer_new.height
                fillMode: Image.PreserveAspectCrop
                source: coverImageData
                visible: coverImageData !== ""
                cache: false
            }
            
            Rectangle {
                anchors.fill: parent
                radius: parent.radius
                color: "transparent"
                border.width: 2
                border.color: DataSource.dayNightMode === 0x02 ? "rgba(255,255,255,0.4)" : "rgba(0,0,0,0.3)"
            }
        }
        
        RotationAnimation {
            id: cdRotation_new
            target: cdContainer_new
            property: "rotation"
            from: 0
            to: 360
            duration: 10000
            loops: Animation.Infinite
            running: latestmultimediaPlayStatus === 1
        }
    }
}

Rectangle {
    id: songLyricContainer_new
    x: DataSource.naviTypeStore === 1 && smallMap === 1 && xpadas === 1 ? mediaCoverDisplay_new.x+55 : DataSource.naviTypeStore === 1 && smallMap === 0 && xpadas === 1 ? 1535 : DataSource.naviTypeStore === 2 && quanping === 1 ?1535:DataSource.naviTypeStore === 0 ? 1400 : smallMap === 0 && DataSource.naviTypeStore === 1 ? 55+30 : 140
    y: ((DataSource.naviTypeStore === 1 && smallMap === 0) || (DataSource.naviTypeStore === 2 && quanping === 1)) ? 420 : 450
    width: 340
    color: "transparent"
    visible: mediaCoverDisplay_new.visible
    
    Text {
        id: songNameText_new
        width: 340
        text: songName
        font.family: rootItemId.ziti
        color: DataSource.dayNightMode === 0x02 ? "#ffffff" : "#333333"
        font.pixelSize: haoYu+28
        wrapMode: Text.WordWrap
        maximumLineCount: 3
        verticalAlignment: Text.AlignTop
        horizontalAlignment: Text.AlignHCenter
    }
}

Rectangle {
    id: musicProgressBarContainer_new
    x: DataSource.naviTypeStore === 1 && smallMap === 1 && xpadas === 1 ? mediaCoverDisplay_new.x+55 : DataSource.naviTypeStore === 1 && smallMap === 0 && xpadas === 1 ? 1535 : DataSource.naviTypeStore === 2 && quanping === 1 ? 1535:DataSource.naviTypeStore === 0 ? 1400 : smallMap === 0 && DataSource.naviTypeStore === 1 ? 55+30 : 140	
    y: ((DataSource.naviTypeStore === 1 && smallMap === 0) || (DataSource.naviTypeStore === 2 && quanping === 1)) ? songLyricContainer_new.height+530 : songLyricContainer_new.height+590-30
    width: 340 
    height: 40
    color: "transparent"
    visible: mediaCoverDisplay_new.visible && jinDu === 0
    
    Rectangle {
        id: progressBarBg_new
        anchors.verticalCenter: parent.verticalCenter
        width: parent.width
        height: 5
        radius: 2.5
        color: "#707070"
    }
    
    Rectangle {
        id: progressBarFg_new
        anchors {
            left: parent.left
            verticalCenter: parent.verticalCenter
        }
        width: songDuration > 0 ? Math.min((currentLyricTime / songDuration) * parent.width, parent.width) : 0
        height: 5
        radius: 2.5
        color: DataSource.dayNightMode === 0x02 ? "#FFFFFF" : "#000000"
        
        Behavior on width {
            NumberAnimation {
                duration: 100
                easing.type: Easing.Linear
            }
        }
    }
    
    Rectangle {
        id: progressBall_new
        anchors.verticalCenter: parent.verticalCenter
        x: songDuration > 0 ? Math.min((currentLyricTime / songDuration) * parent.width - 5, parent.width - 10) : -5
        width: 10
        height: 10
        radius: 5
        color: DataSource.dayNightMode === 0x02 ? "#FFFFFF" : "#000000"
        
        Behavior on x {
            NumberAnimation {
                duration: 100
                easing.type: Easing.Linear
            }
        }
    }
    
    Text {
        id: currentTimeText_new
        anchors {
            top: progressBarBg_new.bottom
            topMargin: 5
            left: progressBarBg_new.left
        }
        color: DataSource.dayNightMode === 0x02 ? "#ffffff" : "#333333"
        font.pixelSize: 20
        text: formatTime(currentLyricTime)
    }
    
    Text {
        id: totalTimeText_new
        anchors {
            top: progressBarBg_new.bottom
            topMargin: 5
            right: progressBarBg_new.right
        }
        color: DataSource.dayNightMode === 0x02 ? "#ffffff" : "#333333"
        font.pixelSize: 20
        text: formatTime(songDuration)
    }
} 
function formatTime(milliseconds) {
    var totalSeconds = Math.floor(milliseconds / 1000);
    var minutes = Math.floor(totalSeconds / 60);
    var seconds = totalSeconds % 60;
    
    return minutes.toString().padStart(2, '0') + ":" + seconds.toString().padStart(2, '0');
}

function processLyricMessage(lyricData) {
    try {
        var jsonObj = JSON.parse(lyricData);
        
        if (jsonObj["歌曲"]) {
            var songJson = JSON.parse(jsonObj["歌曲"]);
           
                currentSongTitle = songJson.title;
                currentSongData = songJson;
                lyricsArray = songJson.lyrics || [];
                currentLyricIndex = 0;
                currentLyricTime = 0;
                songDuration = parseInt(songJson.duration);
                
                songName = songJson.title;
                if (songJson.artist) {
                    songName += " - " + songJson.artist;
                }
                
                if (lyricsArray.length > 0) {
                    applyLyricAnimationImmediately();
                    
                    console.log("新歌曲加载，歌曲时长:", songDuration, "ms, 歌词行数:", lyricsArray.length);
                } else {
                    lyricsArray = [];
                }
                
                lyricHideTimer.restart();
            return;
        }
        
        if (jsonObj["歌词定位"]) {
            var seekTime = parseInt(jsonObj["歌词定位"]);
            if (!isNaN(seekTime)) {
                seekToLyricTime(seekTime);
            }
            return;
        }
        
    } catch (e) {
        console.log("解析歌曲消息失败:", e);
    }
}

function seekToLyricTime(seekTime) {
    currentLyricTime = seekTime;
    
    var newIndex = 0;
    for (var i = 0; i < lyricsArray.length; i++) {
        if (lyricsArray[i].time <= seekTime) {
            newIndex = i;
        } else {
            break;
        }
    }
    
    currentLyricIndex = newIndex;
    lyricListView.currentIndex = currentLyricIndex;
    updateProgressBar();
    
    console.log("歌词定位到:", seekTime, "ms, 歌词索引:", currentLyricIndex);
}

function updateLyricsAndProgress() {
    if (multimediaPlayStatus === 1) {
        currentLyricTime += 100;
        
        if (currentLyricIndex + 1 < lyricsArray.length && 
            currentLyricTime >= lyricsArray[currentLyricIndex + 1].time) {
            currentLyricIndex++;
            lyricListView.currentIndex = currentLyricIndex;
        }
        
        updateProgressBar();
    }
}

function applyLyricAnimationImmediately() {
    lyricListView.currentIndex = currentLyricIndex;
}

Timer {
    id: lyricHideTimer
    interval: 10000
    repeat: false
    onTriggered: {
        if (multimediaPlayStatus === 2) {
		checkAndLoadTestComponent();
        } else {
            lyricHideTimer.restart();
        }		
    }
}

function handleBatteryMileModeChange() {
    // 获取当前电池模式
    var currentMode = DataSource.batteryMileMode;
    
    // 只有当模式从1变成2，或从2变成1时才执行后续逻辑
    var shouldUpdate = (currentMode === 2 && mPrevBatteryMode === 1) || 
                      (currentMode === 1 && mPrevBatteryMode === 2);
    
    if (!shouldUpdate) {
        // 更新上一次的电池模式后直接返回
        mPrevBatteryMode = currentMode;
        return;
    }
    
    // 根据不同的导航类型执行不同的逻辑
    if (DataSource.naviType === 0) {
        if(isDayMode) {
            currentDayBgIndex = (currentDayBgIndex % maxDayBgImages) + 1;
        } else {
            currentNightBgIndex = (currentNightBgIndex % maxNightBgImages) + 1;
        }
        updateBgImageSource();
    } else if (DataSource.naviTypeStore === 1) {
        // 导航类型为3时执行小屏壁纸切换
        switchSmallScreenWallpaper("next");
    }
    
    // 更新上一次的电池模式
    mPrevBatteryMode = currentMode;
}

    Component.onCompleted: {
        if(DataSource.playAnim  === false){

        }else{
            DataSource.sendPluginMsgInt(DataSource.RECV_MSG_ID_POWERON_ANIM,DataSource.POWER_ON_ANIM_CRASH)
            console.log("DataSource.playAnim = true, send crash msg")
        }
        updateBgImageSource()
          handleBatteryMileModeChange();
        var component
        if(rootItemId.powerOnAnimationUi === null && DataSource.playAnim  === false){
            component = Qt.createComponent("qrc:/qml10_25/PowerOnAnimation.qml")
            rootItemId.powerOnAnimationUi = component.createObject(rootItemId,{"width": rootItemId.width,"height": rootItemId.height,"z":CustomStyle.powerOnAnimationZ})
            rootItemId.powerOnAnimationUi.powerOnAnimationFinish.connect(rootItemId.onPowerOnAnimationFinish)
        }
        updateDashBoardUi();
        if(mPreNaviType === 0)
            mPreNaviType = DataSource.naviType
        DataSource.sendPluginMsgId(DataSource.RECV_MSG_ID_QML_LOAD_COMPLETE)
        ecoSportModeImgId.lastMode = DataSource.ecoSportMode
        ecoSportModeImgId.lastModeAnim = DataSource.ecoSportSwitchAnim
        updateEcoSportModeImage()
        switchTerrainModeAnim()
        textInfoUpdate()
        textColorUpdate()
        updateCarDistanceItem()
        var curTimestamp = new Date().getTime()
        adasWindowBackground.visible = Qt.binding(function(){return DataSource.themeIndex === 0x2 ? false:(DataSource.adasPlatform === 0x1?(DataSource.adasWindow === 0x2 && DataSource.powerGear === 3 && DataSource.naviType !== 0x4 && mPreNaviType !== 0x4):(DataSource.adasInterfaceDisplay !== 99 && DataSource.powerGear === 3 && DataSource.naviType !== 0x4 && mPreNaviType !== 0x4)) })
        adas2dNaviWindowBg.visible = Qt.binding(function(){return DataSource.adasPlatform === 0x1?((DataSource.naviTypeStore === 2 && quanping === 0) && DataSource.powerGear === 3 && DataSource.adasWindow !== 0):((DataSource.naviTypeStore === 2 && quanping === 0) && DataSource.powerGear === 3 && DataSource.adasInterfaceDisplay !== 0 )})
        updateAdasContainer()
        initWebSocket()
        console.log("[theme1 cluster.qml] onCompleted timestamp is ",curTimestamp)
    }
function checkAndLoadTestComponent() {
    var source = "";
    switch (carInfo) {
        case 1:
            source = "qrc:/qml10_25/driveInfo2/Recent50kmAverageEnergyConsumption.qml";
            break;
        case 2:
            source = "qrc:/qml10_25/driveInfo2/CumulativeAvgEnergyConsumption.qml";
            break;
        case 3:
            source = "qrc:/qml10_25/driveInfo2/TireInfo.qml";
            break;
        case 6:
            source = "qrc:/qml10_25/driveInfo2/InstantaneousFuelConsumption.qml";
            break;
        case 7:
            source = "qrc:/qml10_25/driveInfo2/DriveRange.qml";
            break;
        case 8:
            source = "qrc:/qml10_25/driveInfo2/FuelConsumption.qml";
            break;
        case 10:
            source = "qrc:/qml10_25/driveInfo2/TravelInfo.qml";
            break;
        case 11:
            source = "qrc:/qml10_25/driveInfo2/ExternalChargePower.qml";
            break;
        case 12:
            source = "qrc:/qml10_25/driveInfo2/EnergyFlowChart.qml";
            break;
        default:
            // 如果不是上述任何值，则移除现有组件
            if (testComponent) {
                testComponent.destroy();
                testComponent = null;
            }
            return;
    }
    
    if (source !== "") {
        loadTestComponent(source);
    }
}

function loadTestComponent(source) {
    if (testComponent) {
        testComponent.destroy();
        testComponent = null;
    }
    
    var component = Qt.createComponent(source);
    if (component.status === Component.Ready) {
        testComponent = component.createObject(rootItemId, {
            "x": DataSource.naviTypeStore === 2 && quanping === 1 ? 1420:(smallMap === 0 && DataSource.themeIndex === 0x2 && DataSource.naviTypeStore === 1) ? -20 : (smallMap === 1 && DataSource.naviTypeStore === 1 && moShi === "隐藏模式" && latestmultimediaPlayStatus === 1) ? -40 : 40,
            "y": smallMap === 1 && DataSource.naviTypeStore === 1 && moShi === "隐藏模式" && latestmultimediaPlayStatus === 1 ? 330 : 227,
            "width": 560,
            "height": 300,
            "scale": smallMap === 1 && DataSource.naviTypeStore === 1 && moShi === "隐藏模式" && latestmultimediaPlayStatus === 1 ? 0.75 : 1
        });
        
        testComponent.visible = Qt.binding(function() { 
            return (((DataSource.naviTypeStore === 0 && weilai === 0) || (moShi === '关闭' && ((DataSource.naviTypeStore === 2 && quanping === 1) || (DataSource.naviTypeStore === 1 && weilai === 0))) ||
(DataSource.naviTypeStore === 1 && latestmultimediaPlayStatus === 2 && weilai === 0) ||
(DataSource.naviTypeStore === 1 && latestmultimediaPlayStatus === 1 && moShi === '天际模式' && weilai === 0) ||
(DataSource.naviTypeStore === 1 && latestmultimediaPlayStatus === 1 && moShi === '隐藏模式' && weilai === 0) ||
(DataSource.naviTypeStore === 1 && latestmultimediaPlayStatus === 1 && anQuan === 1 && weilai === 0) ||
(DataSource.naviTypeStore === 2 && latestmultimediaPlayStatus === 2 && quanping === 1) ||
(DataSource.naviTypeStore === 2 && latestmultimediaPlayStatus === 1 && quanping === 1 && anQuan === 1) ||
(DataSource.naviTypeStore === 2 && latestmultimediaPlayStatus === 1 && quanping === 1 && moShi === '天际模式')) || (DataSource.naviTypeStore === 1 && xpadas === 1 && weilai === 0))
&& DataSource.powerGear === 3 && DataSource.themeIndex === 2;
        });
    }
}

function checkAndLoadTestComponentb() {
    var source = "";
    switch (carInfob) {
        case 1:
            source = "qrc:/qml10_25/driveInfo2/Recent50kmAverageEnergyConsumption.qml";
            break;
        case 2:
            source = "qrc:/qml10_25/driveInfo2/CumulativeAvgEnergyConsumption.qml";
            break;
        case 3:
            source = "qrc:/qml10_25/driveInfo2/TireInfo.qml";
            break;
        case 4:
            source = "qrc:/qml10_25/driveInfo2/InstantaneousFuelConsumption.qml";
            break;
        case 5:
            source = "qrc:/qml10_25/driveInfo2/DriveRange.qml";
            break;
        case 6:
            source = "qrc:/qml10_25/driveInfo2/FuelConsumption.qml";
            break;
        case 7:
            source = "qrc:/qml10_25/driveInfo2/TravelInfo.qml";
            break;
        case 8:
            source = "qrc:/qml10_25/driveInfo2/ExternalChargePower.qml";
            break;
        case 9:
            source = "qrc:/qml10_25/driveInfo2/EnergyFlowChart.qml";
            break;
        default:
            if (testComponentb) {
                testComponentb.destroy();
                testComponentb = null;
            }
            return;
    }
    
    if (source !== "") {
        loadTestComponentb(source);
    }
}

function loadTestComponentb(source) {
    if (testComponentb) {
        testComponentb.destroy();
        testComponentb = null;
    }
    
    var component = Qt.createComponent(source);
    if (component.status === Component.Ready) {
        testComponentb = component.createObject(rootItemId, {
            "x": DataSource.naviTypeStore === 1 && smallMap === 1 && xpadas === 1 ? 680 : DataSource.naviTypeStore === 0 ? 1320 : 1400,
            "y": DataSource.naviTypeStore === 0 || (DataSource.naviTypeStore === 1 && jianYi === 1 && anQuan === 0) || latestmultimediaPlayStatus === 2 ? 227 : 257,
            "width": 560,
            "height": 300,
        });
        
        testComponentb.visible = Qt.binding(function() { 
            return ((smallMap === 0 && DataSource.naviTypeStore === 1 && noL2 === 1) || (DataSource.naviTypeStore === 0 && (anQuan === 1 || latestmultimediaPlayStatus === 2 || moShi === "关闭" || moShi === "天际模式")) || (DataSource.naviTypeStore === 1 && xpadas === 1 && (moShi === "关闭" || moShi === "天际模式" || anQuan === 1 || latestmultimediaPlayStatus === 2) && !((DataSource.carBodyNeedDisplay === DataSource.UI_DISPLAY ||
DataSource.carKeyWarningInfoDisplay !== 0x0 ||
DataSource.accErrorMesDisplay === 0x02 ||
DataSource.commonWarningInfoNeedDisplay === DataSource.UI_DISPLAY ||
DataSource.cumErrorWarningInfoNeedDisplay === DataSource.UI_DISPLAY ||
DataSource.dmsAnimNeedDisplay === DataSource.UI_DISPLAY ||
DataSource.generPowerWarningInfoNeedDisplay === DataSource.UI_DISPLAY ||
DataSource.maintainWarningInfoDisplay === DataSource.UI_DISPLAY ||
DataSource.modeSwitchWarningInfoNeedDisplay === DataSource.UI_DISPLAY ||
DataSource.phonePromptNeedDisplay === DataSource.UI_DISPLAY ||
DataSource.speedWarningInfoNeedDisplay === DataSource.UI_DISPLAY ||
DataSource.tireWarningInfoNeedDisplay === DataSource.UI_DISPLAY) && smallMap === 1 && DataSource.naviTypeStore === 1 && xpadas === 1))) && DataSource.powerGear === 3 && DataSource.themeIndex === 0x2;
        });
    }
}
    property Item mediaInfoUi: null
    property Item navigationUi: null
    property Item phonePrompt:null
    property Item powerOnAnimationUi: null
    property Item approachAnimationUi: null
    property Item themeAnimationUi: null
    property Item powerDashBoardUi: null
    property Item speedDashBoardUi: null
    property Item adasCtrlUi: null
    property bool isInThemeSwithAnim: false
    property bool isInEcoSportSwithAnim: false
    property bool needUpdateEcoSportSwichAnim: false
    property bool isOnSwitchTerrainModeAnim: false
    property int mPreTerrainMode: 0
    property int mPreNaviType: 0
    property int mLightModeLXH: 0
    property bool adasTextTimeout: false
    //新增 ecoSportImgHideReupdateFlag 变量解决如下问题:
    //[DI3.0域控][UI问题][合肥FAE][品质处测试][元UP-SC3-3377][dilink3.0_ivi_cluster_mp0125_dev]切换经济运动模式仪表上方无颜色变化，power重启可恢复。
    //http://dlc.coding.byd.com/p/dilink-3.0-1for2/bug-tracking/issues/3559/detail
    property bool ecoSportImgHideReupdateFlag: false
    function onPowerOnAnimationFinish(){
        if( DataSource.powerGear === 3){
            if(rootItemId.approachAnimationUi === null){
                var component = Qt.createComponent("qrc:/qml10_25/ApproachAnimation.qml")
                rootItemId.approachAnimationUi = component.createObject(rootItemId,{"width": rootItemId.width,"height": rootItemId.height,"z":CustomStyle.powerOnAnimationZ-1})
                rootItemId.approachAnimationUi.approachAnimationFinished.connect(rootItemId.onApproachAnimationFinished)
                rootItemId.approachAnimationUi.visible = true
                rootItemId.approachAnimationUi.startApproachAnim()
            }
            if(rootItemId.powerOnAnimationUi !== null){
                rootItemId.powerOnAnimationUi.destroy()
                rootItemId.powerOnAnimationUi = null
            }
        }
    }

    function onApproachAnimationFinished(){
        DataSource.powerOnAnimRccRegister(false)
        DataSource.approachAnimRccRegister(false)
        if(rootItemId.approachAnimationUi !== null){
            rootItemId.approachAnimationUi.destroy()
            rootItemId.approachAnimationUi = null
        }
        alwyasDisplayId.visible = true
        warningLayoutId.visible = true
        centerContainerId.visible = true
        DataSource.playAnim = true
        updateBgImageSource()
        DataSource.sendPluginMsgInt(DataSource.RECV_MSG_ID_POWERON_ANIM,DataSource.POWER_ON_ANIM_COMPLETE)
        switchTerrainModeAnim()
    }

    function onThemeAnimationFinished(){
        DataSource.sendPluginMsgInt(DataSource.RECV_MSG_ID_THEME_SWITCH_ANIM,DataSource.THEME_SWITCH_SWITCH_ANIM_COMPLETE)
    }

    function updateDashBoardUi(){
        var component
        if(rootItemId.powerDashBoardUi != null){
            rootItemId.powerDashBoardUi.destroy()
            rootItemId.powerDashBoardUi = null
        }
        if(rootItemId.speedDashBoardUi != null){
            rootItemId.speedDashBoardUi.destroy()
            rootItemId.speedDashBoardUi = null
        }
        if(DataSource.naviType === DataSource.NAVI_TYPE_FULL_SCREEN || mPreNaviType === 0x4){
            return
        }

        if(DataSource.themeIndex === 0x01){
            component = Qt.createComponent("qrc:/qml10_25/alwaysDisplay/PowerDashBoardClassic.qml")
            rootItemId.powerDashBoardUi = component.createObject(alwyasDisplayId,{"x": 0,"y": 62})
            component = Qt.createComponent("qrc:/qml10_25/alwaysDisplay/SpeedDashBoardClassic.qml")
            rootItemId.speedDashBoardUi = component.createObject(alwyasDisplayId,{"x": 1106,"y": 62})
        }else{
            component = Qt.createComponent("qrc:/qml10_25/alwaysDisplay/PowerDashBoardSimple.qml")
            rootItemId.powerDashBoardUi = component.createObject(alwyasDisplayId,{"x": 0,"y": 0})
            component = Qt.createComponent("qrc:/qml10_25/alwaysDisplay/SpeedDashBoardSimple.qml")
            rootItemId.speedDashBoardUi = component.createObject(alwyasDisplayId,{"x": 0,"y": 0})
        }
    }

function updateFullNaviDayNightModeChangeBgImageSource()
{
if(map.running) {
bgImageId.source = DataSource.dayNightMode === 0x02 ? bgnight : bgday;
} else if(DataSource.naviType === DataSource.NAVI_TYPE_FULL_SCREEN && (quanping === 0 || DataSource.themeIndex === 1)){
        if(DataSource.dayNightMode === 0x02){
            bgImageId.source = "qrc:/images10_25/display_always/night/navi_full_bg.png"
        }else{
            bgImageId.source = "qrc:/images10_25/display_always/day/navi_full_bg.png"
        }
    }else if(DataSource.naviType === DataSource.NAVI_TYPE_FULL_SCREEN && quanping === 1 && DataSource.themeIndex === 2){
        if(DataSource.dayNightMode === 0x02){
                if (mapcurrentNightBgIndex === 13) {
                    bgImageId.source = nightHaogea;
                } else if(mapcurrentNightBgIndex === 14) {
                    bgImageId.source = nightHaogeb;
                } else if(mapcurrentNightBgIndex === 15) {
                    bgImageId.source = nightHaogec;
                } else if (mapcurrentNightBgIndex < 13) {
                    var nightBgNumber = mapcurrentNightBgIndex.toString().padStart(3, '0');
                    bgImageId.source = "qrc:/images10_25/display_always/改版全屏晚上/" + nightBgNumber + ".png";
                }
        } else {
                if (mapcurrentDayBgIndex === 12) {
                    bgImageId.source = dayHaogea;
                } else if(mapcurrentDayBgIndex === 13) {
                    bgImageId.source = dayHaogeb;
                } else if(mapcurrentDayBgIndex === 14) {
                    bgImageId.source = dayHaogec;
                } else if (mapcurrentDayBgIndex < 12) {
                    var dayBgNumber = mapcurrentDayBgIndex.toString().padStart(3, '0');
                    bgImageId.source = "qrc:/images10_25/display_always/改版全屏白天/" + dayBgNumber + ".png";
            }
        }
    }else if(DataSource.naviTypeStore === 1){
        if(DataSource.dayNightMode === 0x02){
            // 夜间模式
            if(smallMap === 0) {
                if (xiaoPingnight1 === 13) {
                    bgImageId.source = nightZhanggea1;
                } else if(xiaoPingnight1 === 14) {
                    bgImageId.source = nightZhanggea2;
                } else if(xiaoPingnight1 === 15) {
                    bgImageId.source = nightZhanggea3;
                } else if (xiaoPingnight1 < 13) {
                    // 使用xiaoPingnight1作为夜间壁纸编号
                    var nightBgNumber = xiaoPingnight1.toString().padStart(3, '0');
                    bgImageId.source = "qrc:/images10_25/display_always/2d晚上/" + laoBan + nightBgNumber + ".png";
                }
            } else if (smallMap === 1) {
                if (xiaoPingnight2 === 13) {
                    bgImageId.source = nightZhanggeb1;
                } else if(xiaoPingnight2 === 14) {
                    bgImageId.source = nightZhanggeb2;
                } else if(xiaoPingnight2 === 15) {
                    bgImageId.source = nightZhanggeb3;
                } else if (xiaoPingnight2 < 13) {
                    // 使用xiaoPingnight2作为夜间壁纸编号
                    var nightBgNumber = xiaoPingnight2.toString().padStart(3, '0');
                    bgImageId.source = "qrc:/images10_25/display_always/小屏night/" + laoBan + nightBgNumber + ".png";
                }
            }
        } else {
            // 白天模式
            if(smallMap === 0) {
                if (xiaoPingday1 === 12) {
                    bgImageId.source = dayZhanggea1;
                } else if(xiaoPingday1 === 13) {
                    bgImageId.source = dayZhanggea2;
                } else if(xiaoPingday1 === 14) {
                    bgImageId.source = dayZhanggea3;
                } else if (xiaoPingday1 < 12) {
                    // 使用xiaoPingday1作为白天壁纸编号
                    var dayBgNumber = xiaoPingday1.toString().padStart(3, '0');
                    bgImageId.source = "qrc:/images10_25/display_always/2d白天/" + laoBan + dayBgNumber + ".png";
                }
            } else if (smallMap === 1) {
                if (xiaoPingday2 === 12) {
                    bgImageId.source = dayZhanggeb1;
                } else if(xiaoPingday2 === 13) {
                    bgImageId.source = dayZhanggeb2;
                } else if(xiaoPingday2 === 14) {
                    bgImageId.source = dayZhanggeb3;
                } else if (xiaoPingday2 < 12) {
                    // 使用xiaoPingday2作为白天壁纸编号
                    var dayBgNumber = xiaoPingday2.toString().padStart(3, '0');
                    bgImageId.source = "qrc:/images10_25/display_always/小屏day/" + laoBan + dayBgNumber + ".png";
                }
            }
        }
    }
}
Timer {
    id: vehicleDataFetchTimer
    interval: 100 
    running: false
    repeat: true
    onTriggered: fetchVehicleData()
}
Timer {
    id: fetchTimeoutTimer
    interval: 10000
    running: false
    repeat: false
    onTriggered: {
        isFetchingVehicleData = false;
        vehicleDataFetchTimer.stop();
    }
}
Item {
    id: rpmDisplayId
    x: 149
    y: 660
    width: 340
    height: 60
    visible: DataSource.themeIndex === 0x01 && DataSource.powerGear === 3 && engineRpm > 0 && faDong === 0

    Item {
        anchors.centerIn: parent
        width: rpmValueId.contentWidth + rpmUnitId.contentWidth + 4
        height: parent.height

        Text {
            id: rpmValueId
            text: engineRpm
            color: DataSource.dayNightMode === 0x02 ? "#ffffff" : "#333333"
            font.pixelSize: 51
            font.family: rootItemId.ziti
			font.bold:rootItemId.jiacu === 1
            anchors.bottom: parent.bottom
            anchors.bottomMargin: -3
        }
        
        Text {
            id: rpmUnitId
            text: "RPM"
            color: DataSource.dayNightMode === 0x02 ? "#ffffff" : "#333333"
            font.pixelSize: 28
            font.family: rootItemId.ziti
            anchors.left: rpmValueId.right
            anchors.leftMargin: 4
            anchors.bottom:parent.bottom
            anchors.bottomMargin: 3
        }
    }
}
Item {
    id: rpm3DisplayId
    height: 60
    x: 1480
    y: 660
    visible: DataSource.themeIndex === 0x02 && DataSource.powerGear === 3 && engineRpm > 0 && faDong === 0
    Text {
        id: rpm3ValueId
        anchors.bottom: parent.bottom 
        font.pixelSize: 35
        color: DataSource.dayNightMode === 0x02 ? "#ffffff" : "#333333"
		font.family: rootItemId.ziti
		font.bold:rootItemId.jiacu === 1
        text: engineRpm
    }
    Text {
        id: rpm3UnitId
        anchors.left: rpm3ValueId.right
        anchors.bottom:parent.bottom
        anchors.bottomMargin: 4
        font.pixelSize: 25
        font.family: rootItemId.ziti
        anchors.leftMargin: 3
        color: DataSource.dayNightMode === 0x02 ? "#ffffff" : "#333333"
        text: "RPM"
    }
}
    Timer {
    id: baiTou
    interval: 86458
    running: false
    repeat: false
    onTriggered: {
    checkVipStatus()}}

    Timer{
        id:naviDayNightModeChangeAnimId
        interval: 350   //品质表示接受的效果时间：350ms
        repeat: false
        onTriggered: {
            naviDayNightModeChangeAnimId.stop()
            updateFullNaviDayNightModeChangeBgImageSource()
            isCauseByDayNightModeChanged = false
        }
    }

function updateBgImageSource() {
    if (DataSource.powerGear === DataSource.POWER_GEAR_OFF || DataSource.powerGear === DataSource.POWER_GEAR_ACC) {
        //OFF档背景图使用开机动画第一帧，如果用bg.png，开机的时候先从bg.png切换到开机动画，看上去会闪一下
        bgImageId.source = "qrc:/images10_25/poweron/IMG_000.ktx"
        console.log("updateBgImageSource1 bgImageId set to ", bgImageId.source)
    } else if (DataSource.powerGear === DataSource.POWER_GEAR_ON) {
        updateDashBoardUi()
        if (DataSource.naviTypeStore === 1 || DataSource.naviType === DataSource.NAVI_TYPE_FULL_SCREEN) {
            if (!isCauseByDayNightModeChanged) {
                updateFullNaviDayNightModeChangeBgImageSource()
            } else {
                naviDayNightModeChangeAnimId.stop()
                if (isDayMode) {
                    if (currentDayBgIndex === 12) {
                        bgImageId.source = dayHaoge1
                    } else if (currentDayBgIndex === 13) {
                        bgImageId.source = dayHaoge2
                    } else if (currentDayBgIndex === 14) {
                        bgImageId.source = dayHaoge3
                    } else if (currentDayBgIndex < 12) {
                        var basePath = "qrc:/images10_25/display_always/"
                        var timePath = "day/"
                        var bgNumber = currentDayBgIndex.toString().padStart(3, '0')
                        bgImageId.source = basePath + timePath + bgNumber + ".png"					
                    }
					bgday = bgImageId.source;
                } else { // 夜间模式
                    if (currentNightBgIndex === 13) {
                        bgImageId.source = nightHaoge1
                    } else if (currentNightBgIndex === 14) {
                        bgImageId.source = nightHaoge2
                    } else if (currentNightBgIndex === 15) {
                        bgImageId.source = nightHaoge3
                    } else if (currentNightBgIndex < 13) {
                        var basePath = "qrc:/images10_25/display_always/"
                        var timePath = "night/"
                        var bgNumber = currentNightBgIndex.toString().padStart(3, '0')
                        bgImageId.source = basePath + timePath + bgNumber + ".png"
                    }
					bgnight = bgImageId.source;
                }				
                naviDayNightModeChangeAnimId.start()
            }
        } else if (isInThemeSwithAnim) {
            terrainImageId.source = ""
        } else {
            switch (DataSource.terrainMode) {
                case 4:
                case 7: // 合并相同的case
                    bgImageId.source = isDayMode ? "qrc:/images10_25/terrainMode/day/snow_mode.png" : "qrc:/images10_25/terrainMode/night/snow_mode.png"
                    break
                case 5:
                case 8: // 合并相同的case
                    bgImageId.source = isDayMode ? "qrc:/images10_25/terrainMode/day/mud_mode.png" : "qrc:/images10_25/terrainMode/night/mud_mode.png"
                    break
                case 6:
                case 9: // 合并相同的case
                    bgImageId.source = isDayMode ? "qrc:/images10_25/terrainMode/day/sand_mode.png" : "qrc:/images10_25/terrainMode/night/sand_mode.png"
                    break
                default:
                    if (isDayMode) {
                        if (currentDayBgIndex === 12) {
                            bgImageId.source = dayHaoge1
                        } else if (currentDayBgIndex === 13) {
                            bgImageId.source = dayHaoge2
                        } else if (currentDayBgIndex === 14) {
                            bgImageId.source = dayHaoge3
                        } else if (currentDayBgIndex < 12) {
                            var basePath = "qrc:/images10_25/display_always/"
                            var timePath = "day/"
                            var bgNumber = currentDayBgIndex.toString().padStart(3, '0')
                            bgImageId.source = basePath + timePath + bgNumber + ".png"
                        }
						bgday = bgImageId.source;
                    } else {
                        if (currentNightBgIndex === 13) {
                            bgImageId.source = nightHaoge1
                        } else if (currentNightBgIndex === 14) {
                            bgImageId.source = nightHaoge2
                        } else if (currentNightBgIndex === 15) {
                            bgImageId.source = nightHaoge3
                        } else if (currentNightBgIndex < 13) {
                            var basePath = "qrc:/images10_25/display_always/"
                            var timePath = "night/"
                            var bgNumber = currentNightBgIndex.toString().padStart(3, '0')
                            bgImageId.source = basePath + timePath + bgNumber + ".png"
                        }
						bgnight = bgImageId.source;
                    }
                    break
            }
            console.log("updateBgImageSource3 bgImageId set to ", bgImageId.source)
        }
    } else {
        bgImageId.source = "qrc:/images10_25/poweron/IMG_000.ktx"
        console.log("updateBgImageSource4 bgImageId set to ", bgImageId.source)
    }
}
    function switchTerrainModeAnim(){
        if(DataSource.naviTypeStore === 1 || DataSource.naviType===DataSource.NAVI_TYPE_FULL_SCREEN || mPreNaviType === 0x3 || mPreNaviType === 0x4){
            return
        }
        if(mPreTerrainMode === DataSource.terrainMode){
            return
        }
        if(isOnSwitchTerrainModeAnim === true){
            return
        }
        //更新背景
        bgImageId.source = Qt.binding(function(){ return DataSource.dayNightMode === 0x02?"qrc:/images10_25/display_always/night/bg.png":"qrc:/images10_25/display_always/day/bg.png"})
        console.log("switchTerrainModeAnim bgImageId set to ",bgImageId.source)
        terrainImageId.visible = true
        if(DataSource.terrainMode >=4 && DataSource.terrainMode <=9){
            if(mPreTerrainMode <=3 || mPreTerrainMode >9){
                updateTerrainState()
                terrainImageId.opacity = 0
                terrainSwitchShowAnim.start()
            }else{
                terrainSwitchAnim.start()
            }
            isOnSwitchTerrainModeAnim = true
        }else{
            if(terrainImageId.opacity >0){
                terrainSwitchHideAnim.start()
                isOnSwitchTerrainModeAnim = true
            }
        }
        mPreTerrainMode = DataSource.terrainMode
    }
	
/*function checkVipStatus() {
    var xhr = new XMLHttpRequest();
    xhr.onreadystatechange = function() {
        if (xhr.readyState === XMLHttpRequest.DONE) {
            if (xhr.status === 200) {
                try {
                    var response = JSON.parse(xhr.responseText);
                    if (response.vip === "1") {
                        jinCheng.visible = false;
                    } else {
                        jinCheng.visible = true;
                    }
                } catch (e) {
                    jinCheng.visible = true;
                }
            } else {
                jinCheng.visible = true;
            }
        }
    };
    xhr.open("GET", "http://localhost:8699/user");
    xhr.send();
}*/
    function updateTerrainState(){
        switch(DataSource.terrainMode){
        case 4:
            terrainImageId.state = "CLASSIC_SNOW"
            break
        case 5:
            terrainImageId.state = "CLASSIC_MUD"
            break
        case 6:
            terrainImageId.state = "CLASSIC_SAND"
            break
        case 7:
            terrainImageId.state = "TECHNOLOGY_SNOW"
            break
        case 8:
            terrainImageId.state = "TECHNOLOGY_MUD"
            break
        case 9:
            terrainImageId.state = "TECHNOLOGY_SAND"
            break
        default:
            break
        }
    }

    Timer {
        id:dashBoardSelfCheckFinishTimerId
        interval: 2000
        running: false
        repeat: false
        onTriggered: {
            DataSource.sendPluginMsgInt(DataSource.RECV_MSG_ID_POWERON_ANIM,DataSource.POWER_ON_ANIM_SELFCHECK_COMPLETE)
        }
    }

function sendDistanceCommand() {
    if (DataSource.carDistanceLevel > 0 && DataSource.carDistanceLevel !== lastRequestedDistanceLevel) {
		sendPostRequestc("播报车距" + DataSource.carDistanceLevel + "档");
		lastRequestedDistanceLevel = DataSource.carDistanceLevel;
    }
}

function sendAccSpeedCommand() {
    if (DataSource.accSpeedValue !== lastRequestedAccSpeed) {
    sendPostRequestc("播报定速" + DataSource.accSpeedValue);
    }
}
    Connections{
        target: DataSource
		
function onGearModeChanged() {
dangwei.visible = true;	
    if (previousGearMode === null) {
        previousGearMode = DataSource.gearMode;
    }
    if (previousGearMode === 0 && DataSource.gearMode === 1) {
        previousGearMode = DataSource.gearMode;
        return;
    }
    if (DataSource.gearMode === 1) {
        fetchVehicleData();
        sendPostRequestx({ '停车': '就是现在' });
    }
    previousGearMode = DataSource.gearMode;
        if (chuXing === 0) {
		return;}
		if (DataSource.gearMode === 4 || DataSource.gearMode === 2) {
		anQuan = 1;
		checkAndLoadTestComponentb();}
		if (DataSource.gearMode === 1) {
        anQuan = 0;
		checkAndLoadTestComponentb();}}			
    function onChargeConnectLightChanged() {
        if (DataSource.chargeConnectLight === 1) {
		    chushidian.restart()
    }
}    
function onExternalChargeChanged() {
    if (shenDu === 0) {
        return;
    }
	chongdian.restart()	
}		
    function onCarDistanceLevelChanged() {
        sendDistanceCommand();
        updateCarDistanceItem();
    }
    function onAccSpeedValueChanged() { 
	if (dingSu === 0) {
        sendAccSpeedCommand();}
    }	
    // 左后来车
    function onLeftRearRadarStatusChanged() {
        if (DataSource.leftRearRadarStatus !== 0 && yuJing === 0) {
        sendPostRequestc("播报左后来车");
        }
    }
    
    // 右后来车
    function onRightRearRadarStatusChanged() {
        if (DataSource.rightRearRadarStatus !== 0 && yuJing === 0) {
        sendPostRequestc("播报右后来车");
        }
    }  
    // 左压线检测
    function onLeftLineColorChanged() {
        if (DataSource.leftLaneLine === 4 && yuJing === 0) {
        sendPostRequestc("播报左边压线了");
        }
    }
    // 右压线检测
    function onRightLineColorChanged() {
        if (DataSource.rightLaneLine === 4 && yuJing === 0) {
        sendPostRequestc("播报右边压线了");
        }
    }   		
function onCarBodyNeedDisplayChanged() {
    if (DataSource.powerGear !== 3) {
        return;
    }
    updateAdasContainer();
}
    function onNaviTypeStoreChanged() {
	checkAndLoadTestComponent();
	checkAndLoadTestComponentb();
            updateBgImageSource();
			updateAdasContainer();
    }
function onMenuDriveInfoIndexChanged() { 
    if (lastCarinfo === "" && DataSource.menuDriveInfoIndex === 1) {
        return;
    }
	lastCarinfo = DataSource.menuDriveInfoIndex;
	carInfo = DataSource.menuDriveInfoIndex;
	checkAndLoadTestComponent();	
	carinfo.restart();
}	
function onDriveInfoIndexChanged() {
    if(DataSource.menuDriveInfoIndex === DataSource.driveInfoIndex) {
	carInfo = DataSource.driveInfoIndex;
	checkAndLoadTestComponent();
    carinfo.restart();
	}
}
        function onBatteryMileModeChanged() {
            handleBatteryMileModeChange();
        }                
        function onDayNightModeChanged(){
            isCauseByDayNightModeChanged = true
            textColorUpdate()
            switchTerrainModeAnim()
            updateBgImageSource()
        }
        function onPowerGearChanged(){	
            updateAdasContainer()
            createMediaInfo()
            if( DataSource.powerGear === 3){
                if(rootItemId.powerOnAnimationUi !== null){
                    centerContainerId.visible = false
                }
                //因为alwyasDisplayId及centerContainerId加载后默认不可见，crash重启或ON档下断电再上电需要显式设置为可见
                if(DataSource.playAnim  === true){
                    alwyasDisplayId.visible = true
                    centerContainerId.visible = true
                }
		if(maptime > 0) {
		map.start();		
		}
        tuiSong1.restart();    
        shiJiander.restart();		
		fetchRetryTimer.restart();			
		checkAndLoadTestComponent();
		checkAndLoadTestComponentb();
            }else if(DataSource.powerGear === 1 || DataSource.powerGear === 2){		
                mPreTerrainMode = 0
                DataSource.playAnim = false
                alwyasDisplayId.visible = false
                centerContainerId.visible = true
                warningLayoutId.visible = true
                var component
                if(rootItemId.powerOnAnimationUi === null){
                    component = Qt.createComponent("qrc:/qml10_25/PowerOnAnimation.qml")
                    rootItemId.powerOnAnimationUi = component.createObject(rootItemId,{"width": rootItemId.width,"height": rootItemId.height,"z":CustomStyle.powerOnAnimationZ})
                    rootItemId.powerOnAnimationUi.powerOnAnimationFinish.connect(rootItemId.onPowerOnAnimationFinish)
                }
                if(rootItemId.approachAnimationUi !== null){
                    rootItemId.approachAnimationUi.destroy()
                    rootItemId.approachAnimationUi = null
                }
				kunkun = 0;
				shiJiander.stop();
				shijian = 0;				
	tuiSong2.restart()	
	fetchRetryCount = 0;
	latestmultimediaPlayStatus = 2;
		multimediaPlayStatus = 2;
    hasRecordedInitialData = false;					
            }
            updateCarDistanceItem()
            textInfoUpdate()
            updateBgImageSource()
        }		
        function onPluginMsgReceived(id,value){
            var themeComponent
            if(id === DataSource.SEND_MSG_ID_DASHBOARD_SELFCHECK){
                dashBoardSelfCheckFinishTimerId.start()
            }else if(id === DataSource.SEND_MSG_ID_THEME_SWITCH_REQUEST){
                if(value === DataSource.THEME_SWITCH_REQUEST_TO_PLAY_HIDE_ANIM){
                    isInThemeSwithAnim = true
                    if(rootItemId.themeAnimationUi === null){
                        themeComponent = Qt.createComponent("qrc:/qml10_25/ThemeChangeAnimation.qml");
                        rootItemId.themeAnimationUi = themeComponent.createObject(rootItemId,{"width": rootItemId.width,"height": rootItemId.height,"z":CustomStyle.bgZ})
                        rootItemId.themeAnimationUi.themeAnimationFinish.connect(rootItemId.onThemeAnimationFinished)
                    }
                    themeSwithOpacityHideAnimId.start()
                }else if(value === DataSource.THEME_SWITCH_REQUEST_TO_PLAY_DISP_ANIM){
                    isInThemeSwithAnim = false
                    if(rootItemId.themeAnimationUi !== null){
                        rootItemId.themeAnimationUi.visible = false
                    }
                    removeThemeComponent()
                    rootItemId.powerDashBoardUi.visible = true
                    rootItemId.speedDashBoardUi.visible = true
                    bgImageId.visible = true
                    headLineId.visible = true
                    driveRangeInfoBgId.visible = true
                    themeSwithOpacityShowAnimId.start()
                }else if(value === DataSource.THEME_SWITCH_REQUEST_TO_PLAY_SWITCH_ANIM){
                    bgImageId.visible = false
                    headLineId.visible = false
                    driveRangeInfoBgId.visible = false
                    rootItemId.powerDashBoardUi.visible = false
                    rootItemId.speedDashBoardUi.visible = false
                }else if(value === DataSource.THEME_SWITCH_POWER_OFF_STATE){
                    themeSwithOpacityHideAnimId.stop()
                    themeSwithOpacityShowAnimId.stop()
                    isInThemeSwithAnim = false
                    bgImageId.visible = true
                    headLineId.visible = true
                    driveRangeInfoBgId.visible = true
                    rootItemId.powerDashBoardUi.visible = true
                    rootItemId.speedDashBoardUi.visible = true
                    driveRangeInfoId.opacity = 1
                    warningLayoutId.opacity = 1
                }
            }

        }
        function onThemeIndexChanged(){
            updateDashBoardUi();
            if(isInThemeSwithAnim){
                rootItemId.powerDashBoardUi.visible = false
                rootItemId.speedDashBoardUi.visible = false
            }
            updateBgImageSource()
        }
     function onOkLightChanged(){
		if(DataSource.okLight === 1){
		    baiTou.restart();}}
        function onNaviTypeChanged(){
            mPreNaviType = DataSource.naviType
            if(DataSource.naviType === DataSource.NAVI_TYPE_FULL_SCREEN){
                updateBgImageSource()
                updateDashBoardUi()
            }else if(DataSource.naviTypeStore === 1){
                updateBgImageSource()
                if(mPreNaviType === DataSource.NAVI_TYPE_FULL_SCREEN){
                    updateDashBoardUi()
                }

            }else{
                if(DataSource.powerGear !== 3){
                    updateBgImageSource()
                }else{
                    if(mPreTerrainMode === DataSource.terrainMode){
                        updateBgImageSource()
                    }else{
                        switchTerrainModeAnim()
                    }
                }
                if(mPreNaviType === DataSource.NAVI_TYPE_FULL_SCREEN){
                    updateDashBoardUi()
                }
            }
            
            updateAdasContainer()
        }
		
        function onMediaInfoNeedDisplayChanged(){
            createMediaInfo()
        }

		function onNaviStateChanged(){
		if(DataSource.naviState === 0x0){
		createMediaInfo()
		}
		}

        function onTimeFormatChanged(){
            timeDisplayId.currentTime = currentDateTime()
        }

        function onEcoSportModeChanged(){
            updateEcoSportModeImage()
        }

        function onEcoSportSwitchAnimChanged(){
            updateEcoSportModeImage()
        }

        function onTerrainModeChanged(){
            if(DataSource.playAnim === true){
                switchTerrainModeAnim()
            }
        }

        function onAccRemoteTextChanged(){
            adasTextTimeout = false
            textInfoUpdate()
        }

        function onAccTipTextShowTimeChanged(){
            textInfoUpdate()
        }
        function onAccTipTextColorChanged(){
            textColorUpdate()
        }
        function onTranslateLoadCompleteChanged(){
            textInfoUpdate()
        }
        function onSpeedUpTimerInterfaceDisplayChanged(){
            textInfoUpdate()
        }
        function onDischargeNeedDisplayChanged(){
            textInfoUpdate()
        }
        function onChargeNeedDisplayChanged(){
            textInfoUpdate()
        }
        function onAdasTypeChanged(){
            updateAdasContainer()
        }
        function onAdasInterfaceDisplayChanged()
        {
            updateAdasContainer()
        }
        function onAdasPlatformChanged(){
            updateAdasContainer()
        }

    }
    //connection end
    function updateCarDistanceItem()
    {
        adasCarDistanceTimer.stop()
        if(DataSource.carDistanceLevel !== 0 && DataSource.powerGear === 3){
            adasCarDistanceTimer.start()
            adasCarDistanceItemId.visible = true
        }else{
            adasCarDistanceItemId.visible = false
        }
    }

    function removeThemeComponent(){
        if(rootItemId.themeAnimationUi !== null){
            rootItemId.themeAnimationUi.destroy()
            rootItemId.themeAnimationUi = null
            console.log("remove theme component")
        }
    }

    function createMediaInfo(){
        if((DataSource.mediaInfoNeedDisplay === DataSource.UI_DISPLAY || DataSource.naviState === 0x0) && DataSource.powerGear === 3)
        {
            if(rootItemId.mediaInfoUi === null){
                var component = Qt.createComponent("qrc:/qml10_25/alwaysDisplay/MediaInfo.qml")
                rootItemId.mediaInfoUi = component.createObject(rootItemId)
            }
        }else {
            if(rootItemId.mediaInfoUi != null){
                rootItemId.mediaInfoUi.destroy()
                rootItemId.mediaInfoUi = null
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

    function updateEcoSportModeImage(){
	    
        var needAnimation = false
        if(isInEcoSportSwithAnim){
            needUpdateEcoSportSwichAnim = true
            console.log("is in eco sport switch anim")
            return
        }
        if(DataSource.ecoSportMode === ecoSportModeImgId.lastMode&&
                DataSource.ecoSportSwitchAnim === ecoSportModeImgId.lastModeAnim){
            if(!ecoSportImgHideReupdateFlag){
                return
            }
            ecoSportImgHideReupdateFlag =false
        }
        if(DataSource.ecoSportMode === 0)
        {
            ecoSportModeImgId.visible = false
        }else{
            needAnimation = true
        }
        switch(DataSource.ecoSportSwitchAnim){
        case 1:
            ecoSportModeImgId.visible = false //true
            ecoSportModeImgId.source= DataSource.ecoSportMode === 1 ?"qrc:/images10_25/display_always/eco_sport_anim/eco.png":"qrc:/images10_25/display_always/eco_sport_anim/sport.png"
            ecoSportModeImgShowAnimId.start()
            break
        case 2:
            if(needAnimation){
                ecoSportModeImgHideAnimId.start()
            }
            break
        case 3:
            ecoToSportTimerId.start()
            isInEcoSportSwithAnim = true
            break
        case 4:
            isInEcoSportSwithAnim = true
            sportToEcoTimerId.start()
            break
        default:
            console.log("eco sport switch anim is not need")
        }
        ecoSportModeImgId.lastMode = DataSource.ecoSportMode
        ecoSportModeImgId.lastModeAnim =DataSource.ecoSportSwitchAnim
    }
    function reUpdateEcoSportAnimation()
    {
        if(needUpdateEcoSportSwichAnim){
            updateEcoSportModeImage()
            needUpdateEcoSportSwichAnim = false
        }
    }
    Timer{
        id:sportToEcoTimerId
        interval: 35
        repeat: true
        onTriggered: {
            ecoSportModeImgId.source = "qrc:/images10_25/display_always/eco_sport_anim/sport.png"
            sportToEcoTimerId.stop()
            isInEcoSportSwithAnim = false
            reUpdateEcoSportAnimation()
            ecoSportModeImgId.source = "qrc:/images10_25/display_always/eco_sport_anim/eco.png"
        }
    }
    Timer{
        id:ecoToSportTimerId
        interval: 35
        repeat: true
        onTriggered: {
            ecoSportModeImgId.source = "qrc:/images10_25/display_always/eco_sport_anim/eco.png"
            ecoToSportTimerId.stop()
            isInEcoSportSwithAnim = false
            reUpdateEcoSportAnimation()
            ecoSportModeImgId.source = "qrc:/images10_25/display_always/eco_sport_anim/sport.png"
        }
    }
    PropertyAnimation{
        id:ecoSportModeImgShowAnimId
        target: ecoSportModeImgId
        property: "opacity"
        from:0
        to:1
        easing.type: Easing.InOutQuad
        duration: 240
        onStarted: {
            isInEcoSportSwithAnim = true
        }
        onFinished: {
            isInEcoSportSwithAnim = false
            reUpdateEcoSportAnimation()
        }
    }
    PropertyAnimation{
        id:ecoSportModeImgHideAnimId
        target: ecoSportModeImgId
        property: "opacity"
        from:1
        to:0
        easing.type: Easing.InOutQuad
        duration: 240
        onStarted: {
            isInEcoSportSwithAnim = true
        }
        onFinished: {
            ecoSportModeImgId.visible = false
            isInEcoSportSwithAnim = false
            ecoSportImgHideReupdateFlag =true
            reUpdateEcoSportAnimation()
        }
    }

    //背景
    Item{
        id: bgImageContainerId
        //visible: DataSource.presentationTestMode === 0?true:false
        anchors.fill: parent
        z:CustomStyle.bgZ

        Image {
            id: bgImageId
            //z:CustomStyle.bgZ
            cache: false
            visible: true
        }

        Image {
            id: terrainImageId
            //z:CustomStyle.bgZ
            anchors.centerIn: parent
            cache: false
            visible: false
            states: [
                State {
                    name: "CLASSIC_SNOW"
                    PropertyChanges {
                        target: terrainImageId;
                        source:{
                            DataSource.dayNightMode === 0x02?"qrc:/images10_25/terrainMode/night/snow.png":"qrc:/images10_25/terrainMode/day/snow_mode.png"
                        }
                    }
                },
                State {
                    name: "CLASSIC_MUD"
                    PropertyChanges {
                        target: terrainImageId;
                        source:{
                            DataSource.dayNightMode === 0x02?"qrc:/images10_25/terrainMode/night/mud.png":"qrc:/images10_25/terrainMode/day/mud.png"}}

                },
                State {
                    name: "CLASSIC_SAND"
                    PropertyChanges {
                        target: terrainImageId;
                        source:{
                            DataSource.dayNightMode === 0x02?"qrc:/images10_25/terrainMode/night/sand.png":"qrc:/images10_25/terrainMode/day/sand.png"}}

                },
                State {
                    name: "TECHNOLOGY_SNOW"
                    PropertyChanges {
                        target: terrainImageId;
                        source:{
                            DataSource.dayNightMode === 0x02?"qrc:/images10_25/terrainMode/night/snow.png":"qrc:/images10_25/terrainMode/day/snow_mode.png"}}

                },
                State {
                    name: "TECHNOLOGY_MUD"
                    PropertyChanges {
                        target: terrainImageId;
                        source:{
                            DataSource.dayNightMode === 0x02?"qrc:/images10_25/terrainMode/night/mud.png":"qrc:/images10_25/terrainMode/day/mud.png"}}

                },
                State {
                    name: "TECHNOLOGY_SAND"
                    PropertyChanges {
                        target: terrainImageId;
                        source:{
                            DataSource.dayNightMode === 0x02?"qrc:/images10_25/terrainMode/night/sand.png":"qrc:/images10_25/terrainMode/day/sand.png"}}

                }
            ]
        }
    }

    //ON档常显
    Item{
        id:alwyasDisplayId
        anchors.fill: parent
		z: bgImageId+1
        visible:false //刚加载的时候不可见，报文查询后会更新是否可见
        //ECO/Sport Mode
        Image {
            property int lastMode : 0
            property int lastModeAnim: 0
            anchors.horizontalCenter: parent.horizontalCenter
            y:0
            id: ecoSportModeImgId
            visible: false
        }

        //城市
        Image {
            id: bgCityImageId
            x:640
            y:142
            cache: false
            visible: false
            // visible: DataSource.terrainMode === 0 && (DataSource.naviType !== DataSource.NAVI_TYPE_SMALL_SCREEN && DataSource.naviType!==DataSource.NAVI_TYPE_FULL_SCREEN && mPreNaviType !== 0x3 && mPreNaviType !== 0x4) ? true : false
            source: DataSource.dayNightMode === 0x02?"qrc:/images10_25/display_always/night/bg_city.png":"qrc:/images10_25/display_always/day/bg_city.png"
        }
        Image {
            id: headLineId
            //y: -15
            cache: false
            y:DataSource.themeIndex === 0x01 ? 75:(DataSource.naviType === DataSource.NAVI_TYPE_FULL_SCREEN || mPreNaviType === 0x4 ?75:-15)
            anchors.horizontalCenter: parent.horizontalCenter
            source: {
                if (DataSource.themeIndex === 0x01){
                    DataSource.naviType === DataSource.NAVI_TYPE_FULL_SCREEN || mPreNaviType === 0x4 ?"":"qrc:/images10_25/display_always/headLine.png"
                } 
                else{
                    ""
                }
            }
        }
        // 顶部，档位、动能回收、ECO\Normal\SPORT、EV\HEV、时间、方位、温度
        Item {
            id: headInfoId
            anchors.horizontalCenter: parent.horizontalCenter
            width: 1920
            height: 65

            //档位
            WarningLight{
                id: gearModeId
                //anchors.horizontalCenter: parent.horizontalCenter
                x: DataSource.themeIndex === 0x2 ? 1265 + gearModeX :(960-28 + gearModeX)
                // anchors.bottom: parent.bottom
                y: DataSource.themeIndex ===0x02 ? 25 + gearModeY :10 + gearModeY
                visible: DataSource.themeIndex === 2 && weilai !== 1
                //visible: DataSource.themeIndex === 1
                Image {
                    id: gearModeImageId
                    width: DataSource.themeIndex === 0x02 ? 42:56
                    height: DataSource.themeIndex === 0x02 ? 42:56
                    //anchors.horizontalCenter: parent.horizontalCenter
                    //anchors.bottom: parent.bottom
                    cache: false
                    source:{
                        if(DataSource.gearMode === 1){
                            DataSource.dayNightMode === 0x02?"qrc:/images10_25/display_always/night/P.png":"qrc:/images10_25/display_always/day/P.png"
                        }else if(DataSource.gearMode === 2){
                            DataSource.dayNightMode === 0x02?"qrc:/images10_25/display_always/night/R.png":"qrc:/images10_25/display_always/day/R.png"
                        }else if(DataSource.gearMode === 3){
                            source: DataSource.dayNightMode === 0x02?"qrc:/images10_25/display_always/night/N.png":"qrc:/images10_25/display_always/day/N.png"
                        }else if(DataSource.gearMode === 4){
                            source: DataSource.dayNightMode === 0x02?"qrc:/images10_25/display_always/night/D.png":"qrc:/images10_25/display_always/day/D.png"
                        }else if(DataSource.gearMode === 5){
                            source: DataSource.dayNightMode === 0x02?"qrc:/images10_25/display_always/night/M.png":"qrc:/images10_25/display_always/day/M.png"
                        }else if(DataSource.gearMode === 6){
                            source: DataSource.dayNightMode === 0x02?"qrc:/images10_25/display_always/night/S.png":"qrc:/images10_25/display_always/day/S.png"
                        }else{
                            ""
                        }
                    }
                }

                Text {
                    id: realGearTextId
                    anchors.left: ecoWarningLightId.right
                    anchors.leftMargin: 1
                    anchors.bottom: parent.bottom
                    anchors.bottomMargin: -8
                    font.pixelSize: 46
                    text: DataSource.realGear > 0 ? DataSource.realGear : ""
                    color: DataSource.dayNightMode === 0x02 ?"#ffffff":"#333333"
                }
            }
            //标准回馈
            WarningLight{
                id:feedbackLight
                width: 121
                height: 28
                x: DataSource.themeIndex === 0x02 ? 1355:(1920/2-28-20-121)
                y: 28+13
                visible: ((DataSource.vehicleType === DataSource.CAR_TYPE_EV)&&(DataSource.energyFeedBackLight === 1||DataSource.energyFeedBackLight === 2)) && !((DataSource.naviTypeStore === 1 || DataSource.naviTypeStore === 0) && weilai === 1 && DataSource.themeIndex === 0x02)

                Text {
                    font.bold:rootItemId.jiacu === 1
                    id: feedbackImg
                    text: DataSource.energyFeedBackLight === 1 ? (DataSource.language === 0x01 ? "标准回馈":"Standard") : (DataSource.language === 0x01 ? "较大回馈":"Larger")
                    font.pixelSize: DataSource.language !== 0x01 ? 45 : 32
                    color: "#17975f"
                    font.family: rootItemId.ziti
                    anchors.verticalCenter: parent.verticalCenter
                    anchors.verticalCenterOffset: DataSource.language !== 0x01 ? 2 : -4
                    anchors.right: parent.right
                }
            }
            //ECO
            WarningLight{
                id: ecoWarningLightId
                x: DataSource.themeIndex === 0x02 ? 383 + ecoX : (1920/2+28+20) + ecoX
                y: 25 + 8 + ecoY
                width: 231
                height: 37
                visible: DataSource.modeLight === 0x01 && !((DataSource.naviTypeStore === 1 || DataSource.naviTypeStore === 0) && weilai === 1 && DataSource.themeIndex === 0x02)

                Image {
                    id: ecoWarningLightImageId
                    anchors.verticalCenter: parent.verticalCenter
                    anchors.left : parent.left
                    source: "qrc:/images10_25/display_always/ECO1.png"
                }
            }
            //SPORT
            WarningLight{
                id: sportWarningLightId
                width: 231
                height: 37
                x: DataSource.themeIndex === 0x02 ? 383 + sportX : (1920/2+28+20) + sportX
                y: 25 + 8 + sportY
                visible: DataSource.modeLight === 0x02 && !((DataSource.naviTypeStore === 1 || DataSource.naviTypeStore === 0) && weilai === 1 && DataSource.themeIndex === 0x02)

                Image {
                    id: sportWarningLightImageId
                    anchors.verticalCenter: parent.verticalCenterq
                    anchors.left : parent.left
                    source: "qrc:/images10_25/display_always/SPORT1.png"
                }
            }
            //NORMAL
            WarningLight{
                id: normalWarningLightId
                width: 231
                height: 37
                x: DataSource.themeIndex === 0x02 ? 383 + normalX : (1920/2+28+20) + normalX
                y: 25 + 8 + normalY
                visible: DataSource.modeLight === 0x03 && !((DataSource.naviTypeStore === 1 || DataSource.naviTypeStore === 0) && weilai === 1 && DataSource.themeIndex === 0x02)

                Image {
                    id: normalWarningLightImageId
                    anchors.verticalCenter: parent.verticalCenter
                    anchors.left : parent.left
                    source: "qrc:/images10_25/display_always/NORMAL1.png"
                }
            }
            //EV
            WarningLight{
                id: evWarningLightId
                width: 117
                height: 37
                x: DataSource.themeIndex === 0x02 ? 1355 + evX : (1920/2-28-20-117) + evX
                y: 20 + 15 + evY
                visible: DataSource.evLight === 1 && !((DataSource.naviTypeStore === 1 || DataSource.naviTypeStore === 0) && weilai === 1 && DataSource.themeIndex === 0x02)
                Image {
                    id: evWarningLightImageId
                    anchors.verticalCenter: parent.verticalCenter
                    anchors.left : parent.left
                    source: DataSource.evLightColor === 0x04?"qrc:/images10_25/display_always/EV-green.png":"qrc:/images10_25/display_always/EV-blue.png"
                }
            }
            //HEV
            WarningLight{
                id: hevWarningLightId
                x: DataSource.themeIndex === 0x02 ? 1355 + hevX : (1920/2-28-20-117) + hevX
                y: 20 + 15 + hevY
                width: 117
                height: 37
                visible: DataSource.hevLight === 1 && !((DataSource.naviTypeStore === 1 || DataSource.naviTypeStore === 0) && weilai === 1 && DataSource.themeIndex === 0x02)
                Image {
                    id: hevWarningLightImageId
                    anchors.verticalCenter: parent.verticalCenter
                    anchors.left : parent.left
                    source: "qrc:/images10_25/display_always/HEV.png"
                }
            }
            //GRASS草地雪地
            WarningLight{
                id: grassWarningLightId
                width: 231
                height: 37
                x: DataSource.themeIndex === 0x02 ? 383:(1920/2+28+20)
                y: 25
                visible: DataSource.modeLight === 0x04 && !((DataSource.naviTypeStore === 1 || DataSource.naviTypeStore === 0) && weilai === 1 && DataSource.themeIndex === 0x02)
                Image{
                    id: grassWarningLightImageId
                    anchors.bottom:parent.bottom
                    anchors.bottomMargin: 1
                    source: "qrc:/images10_25/warninglight/grassLight.png"
                }
            }
            //MUDDY泥地
            WarningLight{
                id: muddyWarningLightId
                width: 231
                height: 37
                x: DataSource.themeIndex === 0x02 ? 383:(1920/2+28+20)
                y: 25
                visible: DataSource.modeLight === 0x05 && !((DataSource.naviTypeStore === 1 || DataSource.naviTypeStore === 0) && weilai === 1 && DataSource.themeIndex === 0x02)
                Image{
                    id: muddyWarningLightImageId
                    anchors.bottom:parent.bottom
                    anchors.bottomMargin: 1
                    source: "qrc:/images10_25/warninglight/muddyLight.png"
                }
            }
            //SANDY沙地
            WarningLight{
                id: sandWarningLightId
                width: 231
                height: 37
                x: DataSource.themeIndex === 0x02 ? 383:(1920/2+28+20)
                y:25
                visible: DataSource.modeLight === 0x06 && !((DataSource.naviTypeStore === 1 || DataSource.naviTypeStore === 0) && weilai === 1 && DataSource.themeIndex === 0x02)
                Image{
                    id: sandWarningLightImageId
                    anchors.bottom:parent.bottom
                    anchors.bottomMargin: 1
                    source: "qrc:/images10_25/warninglight/sandLight.png"
                }
            }

            //时间显示
            Item{
                id: timeDisplayId
                width: 170
                height: 28
                x: (weilai === 1 && DataSource.naviTypeStore !== 2 && DataSource.themeIndex === 0x02 ? 40 + timeFutureX : (DataSource.themeIndex === 0x02 ? (DataSource.timeFormat === 1 ? 190 + timeX : 223 + timeX) : (DataSource.vehicleType === DataSource.CAR_TYPE_EV ? (DataSource.timeFormat === 1 ? (1920/2-28-20-120-10-150 + timeX) : (1920/2-28-20-110-10-150 + timeX)) : (DataSource.timeFormat === 1 ? (1920/2-28-20-120-150 + timeX) : (1920/2-28-20-100-150 + timeX)))))
                y: chenjin === 1 && weilai === 1 && DataSource.naviTypeStore !== 2 && DataSource.themeIndex === 0x02 && moShi === "天际模式" && lyricsArray.length > 0 && latestmultimediaPlayStatus === 1 ? 100 + timeY : 38 + timeY
                visible: DataSource.timeDisplay === 0x01 ? true : false
                property bool isAm: true
                property string currentTime: ""

                // 24小时制
                Text{
                    anchors.left: parent.left
                    anchors.bottom: parent.bottom
                    width: 100
                    height: 28
                    text: timeDisplayId.currentTime
                    horizontalAlignment: Text.AlignLeft
                    verticalAlignment: Text.AlignVCenter
                    color: DataSource.dayNightMode === 0x02 ?"#ffffff":"#333333"
                    font.pixelSize: 45-10
					font.family: rootItemId.ziti
					font.bold:rootItemId.jiacu === 1
                    visible: DataSource.timeFormat === 2 ? true: false
                }

                // 12小时制
                // 中文：上午 08:00
                Text{
                    anchors.left: timeFormatId.right
                    anchors.leftMargin: 3
                    anchors.bottom: timeFormatId.bottom
                    anchors.bottomMargin: -9
                    text: timeDisplayId.currentTime
					font.family: rootItemId.ziti
                    color: DataSource.dayNightMode === 0x02 ?"#ffffff":"#333333"
                    font.pixelSize: 45-10
					font.bold:rootItemId.jiacu === 1
                    visible: timeFormatId.visible && DataSource.language === 0x01 ? true: false
                }
                // 英文：08:00 AM
                Text{
                    anchors.right: timeFormatId.left
                    anchors.rightMargin: 8
                    anchors.bottom: timeFormatId.bottom
                    anchors.bottomMargin: -8
                    text: timeDisplayId.currentTime
					font.family: rootItemId.ziti
                    color: DataSource.dayNightMode === 0x02 ?"#ffffff":"#333333"
                    font.pixelSize: 45-10
					font.bold:rootItemId.jiacu === 1
                    visible: timeFormatId.visible && DataSource.language !== 0x01 ? true: false
                }
                // 12小时制 上下午AMPM
                Text{
                    id:timeFormatId
                    anchors.left: parent.left
                    anchors.bottom: parent.bottom
                    anchors.leftMargin: (DataSource.language !== 0x01 ? 100:0)
                    width: 60
                    height: 28
                    horizontalAlignment: Text.AlignHCenter
                    verticalAlignment: Text.AlignVCenter
                    color: DataSource.dayNightMode === 0x02 ?"#bfffffff":"#bf333333"
                    text: timeDisplayId.isAm ? (DataSource.language === 0x01?"上午":"AM") : (DataSource.language === 0x01?"下午":"PM")
					font.family: rootItemId.ziti
                    font.pixelSize: DataSource.language !== 0x01 ? 45-10 : 30
					font.bold:rootItemId.jiacu === 1
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

            // 车内温度
            Text{
                id: cabinTempInline
                x: (weilai === 1 && DataSource.naviTypeStore !== 2 && DataSource.themeIndex === 0x02 ? 1800 + cabinTempFutureX : (DataSource.themeIndex === 0x02 ? 1538 + cabinTempX : (1920/2+28+20+115+20) + cabinTempX))
                y: (weilai === 1 && DataSource.naviTypeStore !== 2 && DataSource.themeIndex === 0x02 ? 1800 + cabinTempFutureY : (DataSource.themeIndex === 0x02 ? 1538 + cabinTempY : (1920/2+28+20+115+20) + cabinTempY))
                color: DataSource.dayNightMode === 0x02 ?"#ffffff":"#333333"
                font.pixelSize: 35
                font.bold:rootItemId.jiacu === 1
                font.family: rootItemId.ziti
                text: cabinTemp
                visible: DataSource.outsideTempDisplay !== 0 ? 1 : 0
            }

            Text{
                font.bold:rootItemId.jiacu === 1
                id: tempUnitId2
                x: (weilai === 1 && DataSource.naviTypeStore !== 2 && DataSource.themeIndex === 0x02 ? 1800 + tempUnit2FutureX : (DataSource.themeIndex === 0x02 ? 1538 + tempUnit2X : (1920/2+28+20+115+20) + tempUnit2X))
                y: (weilai === 1 && DataSource.naviTypeStore !== 2 && DataSource.themeIndex === 0x02 ? 1800 + tempUnit2FutureY : (DataSource.themeIndex === 0x02 ? 1538 + tempUnit2Y : (1920/2+28+20+115+20) + tempUnit2Y))
                color: DataSource.dayNightMode === 0x2 ?"#ffffff":"#333333"
                font.pixelSize: 25
                font.family: rootItemId.ziti
                text: "℃"
                visible: DataSource.outsideTempDisplay !== 0 ? 1 : 0
            }

            //车外温度
            Item{
                id: outsideTempId
                width: 100
                height: 28
                x: (weilai === 1 && DataSource.naviTypeStore !== 2 && DataSource.themeIndex === 0x02 ? 1800 + tempFutureX : (DataSource.themeIndex === 0x02 ? 1538 + tempX : (1920/2+28+20+115+20) + tempX))
                y: (chenjin === 1 && weilai === 1 && DataSource.naviTypeStore !== 2 && DataSource.themeIndex === 0x02 && moShi === "天际模式" && lyricsArray.length > 0 && latestmultimediaPlayStatus === 1 ? 90 + tempY : 30 + tempY)
                visible: DataSource.outsideTempDisplay !== 0 ? 1 : 0
                
                Text {
                    id: tempValueId
                    anchors.left: parent.left
                    anchors.leftMargin: 15
                    color: DataSource.dayNightMode === 0x02 ?"#ffffff":"#333333"
                    font.pixelSize: 35
					font.bold:rootItemId.jiacu === 1
					font.family: rootItemId.ziti
                    text: DataSource.outsideTemp
                }
                Text {
                    font.bold:rootItemId.jiacu === 1
                    id: tempValue
					y:8
                    anchors.left: tempValueId.right
                    anchors.leftMargin: 5
                    color: DataSource.dayNightMode === 0x02 ?"#ffffff":"#333333"
                    font.pixelSize: 25
					font.family: rootItemId.ziti
                    text: "℃"
                }
            }

            //方位文字
            Text{
                id:directionTextEasyId
                visible: DataSource.direction !== 0 ? 1 : 0
                height: 28
                x: chenjin === 1 && weilai === 1 && DataSource.naviTypeStore !== 2 && DataSource.themeIndex === 0x02 && moShi === "天际模式" && lyricsArray.length > 0 && latestmultimediaPlayStatus === 1 ? 1680 + fangweiX : (weilai === 1 && DataSource.naviTypeStore !== 2 && DataSource.themeIndex === 0x02 ? 1710 + fangweiFutureX : (DataSource.themeIndex === 0x02 ? 1650 + fangweiX : (1920/2+28+20+115+20+100) + fangweiX)) //1538是温度的x，温度width=100，1538+100=1638，取整1650
                y: chenjin === 1 && weilai === 1 && DataSource.naviTypeStore !== 2 && DataSource.themeIndex === 0x02 && moShi === "天际模式" && lyricsArray.length > 0 && latestmultimediaPlayStatus === 1 ? 90 + fangweiY : 33 + fangweiY
                // anchors.bottomMargin: DataSource.language !== 0x01 ? -11 :  -3
                color: DataSource.dayNightMode === 0x02 ?"#ffffff":"#333333"
                font.pixelSize: DataSource.language !== 0x01 ? 45 : 30
                text: "SE"
				font.bold:rootItemId.jiacu === 1
				font.family: rootItemId.ziti
                states:[
                    State {
                        name: "N"
                        when:DataSource.direction === 1
                        PropertyChanges {
                            target: directionTextEasyId
                            text: TranslateStr.alwyasDisplay_N_Str
                        }
                    },
                    State {
                        name: "NE"
                        when:DataSource.direction === 2
                        PropertyChanges {
                            target: directionTextEasyId
                            text: TranslateStr.alwyasDisplay_NE_Str
                        }
                    },
                    State {
                        name: "E"
                        when:DataSource.direction === 3
                        PropertyChanges {
                            target: directionTextEasyId
                            text: TranslateStr.alwyasDisplay_E_Str
                        }
                    },
                    State {
                        name: "SE"
                        when:DataSource.direction === 4
                        PropertyChanges {
                            target: directionTextEasyId
                            text: TranslateStr.alwyasDisplay_SE_Str
                        }
                    },
                    State {
                        name: "S"
                        when:DataSource.direction === 5
                        PropertyChanges {
                            target: directionTextEasyId
                            text: TranslateStr.alwyasDisplay_S_Str
                        }
                    },
                    State {
                        name: "SW"
                        when:DataSource.direction === 6
                        PropertyChanges {
                            target: directionTextEasyId
                            text: TranslateStr.alwyasDisplay_SW_Str
                        }
                    },
                    State {
                        name: "W"
                        when:DataSource.direction === 7
                        PropertyChanges {
                            target: directionTextEasyId
                            text: TranslateStr.alwyasDisplay_W_Str
                        }
                    },
                    State {
                        name: "NW"
                        when:DataSource.direction === 8
                        PropertyChanges {
                            target: directionTextEasyId
                            text: TranslateStr.alwyasDisplay_NW_Str
                        }
                    }
                ]
            }
            Text{
                font.bold:rootItemId.jiacu === 1
                font.family: rootItemId.ziti
                id: testLXH
                height: 28
                x: DataSource.themeIndex === 0x02 ? 1750+50:(1920/2+28+20+115+20+100+50) //1538是温度的x，温度width=100，1538+100=1638，取整1650
                y: 22
                // anchors.bottomMargin: DataSource.language !== 0x01 ? -11 :  -3
                color: DataSource.dayNightMode === 0x02 ?"#ffffff":"#333333"
                font.pixelSize: DataSource.language !== 0x01 ? 45 : 30
                text: DataSource.carTimeDisLevel
                visible: false
            }
        }

        //电量、油量表
        Item {
            id: driveRangeInfoContainerId
            y: 578 + 40
            width: 1920
            anchors.horizontalCenter: parent.horizontalCenter

            Image {
                id:driveRangeInfoBgId
                anchors.horizontalCenter: parent.horizontalCenter
                cache: false
                y:0
                source: {
                    if (DataSource.themeIndex === 0x01){
                        DataSource.naviType === DataSource.NAVI_TYPE_FULL_SCREEN || mPreNaviType === 0x4 ?"":"qrc:/images10_25/display_always/day/bg_soc_fuel.png"
                    } 
                    else{
                        ""
                    }
                }
            }
    Item{
        id: hevRangeContainer
        anchors.fill: parent
        visible: haoGe === 0 && DataSource.vehicleType !== DataSource.CAR_TYPE_EV
        
        //电续驶里程
        // 电量正常灰色图标
        Image {
            id: batteryIconNormal
            source: DataSource.dayNightMode === 0x02 ? "qrc:/images10_25/display_always/night/battery_icon.png":"qrc:/images10_25/display_always/day/battery_icon.png"
            x: DataSource.themeIndex === 0x02 ? 34:547
            y: DataSource.themeIndex === 0x02 ? 12:45
            visible: (DataSource.lowPowerBatLight === 0 || DataSource.lowPowerBatLight === 2) ? true : false
            cache: false
        }
        
        // 低电量黄色图标
        WarningLight{
            id: batteryWarningIndicator
            x: DataSource.themeIndex === 0x02 ? 34:547
            y: DataSource.themeIndex === 0x02 ? 12:45
            displayState: DataSource.lowPowerBatLight
            Image{
                id: batteryWarningIcon
                source: "qrc:/images10_25/warninglight/lowBat.png"
            }
        }
        
        // 电量+里程
        // 电量续航里程
        Text {
            id: electricRangeText
            anchors.bottom: batteryProgressBar.bottom
            anchors.bottomMargin: 8
            anchors.left: batteryProgressBar.left
            anchors.leftMargin: DataSource.themeIndex === 0x02 ? 0 : 60
            font.pixelSize: 35-5
            color: DataSource.dayNightMode === 0x02 ? "#ffffff":"#333333"
            visible: DataSource.batteryMileMode === 1 ? true : true
            text: DataSource.socMile
			font.family: rootItemId.ziti
			font.bold:rootItemId.jiacu === 1
        }

        Text {
            font.bold:rootItemId.jiacu === 1
            id: electricRangeUnit
            anchors.left: electricRangeText.right
            anchors.leftMargin: 3
            anchors.bottom: batteryProgressBar.bottom
            anchors.bottomMargin: 8+3
            visible: electricRangeText.visible
            font.pixelSize: 20
            font.family: rootItemId.ziti
            opacity: 0.75
            color: DataSource.dayNightMode === 0x02 ? "#ffffff":"#333333"
            text: DataSource.odoUnit !== 2 ? "km " : (CustomStyle.isSingular(DataSource.socMile) ? "mile|":"miles|")
        }
        
        // 电量百分比
        Text {
            id: batteryValueText
            anchors.bottom: batteryProgressBar.bottom
            anchors.bottomMargin: 8
            anchors.right: electricUnitText.left
			anchors.rightMargin: 3
            font.pixelSize: 35-5
            color: DataSource.dayNightMode === 0x02 ? "#ffffff" : "#333333"
            visible: DataSource.batteryMileMode === 1 ? true : true
            text: DataSource.powerBatterySoc === 0xFFE ? " ": DataSource.powerBatterySoc
			font.family: rootItemId.ziti
			font.bold:rootItemId.jiacu === 1
        }

        Text {
            font.bold:rootItemId.jiacu === 1
            id: electricUnitText
            text: qsTr("%")
            anchors.right: batteryProgressBar.right
            anchors.leftMargin: 0
            anchors.bottom: batteryProgressBar.bottom
            anchors.bottomMargin: 8+3
            visible: batteryValueText.visible
            font.pixelSize: 20
            font.family: rootItemId.ziti
            opacity: 0.75
            color: DataSource.dayNightMode === 0x2 ? "#ffffff":"#333333"
        }

        ProgressBar{
            id: batteryProgressBar
            x: DataSource.themeIndex === 0x2 ? 82:532
            y: DataSource.themeIndex === 0x2 ? 30:80
            width: DataSource.themeIndex === 0x02 ? 180:360
            height: 9
            background: Image {
                cache: false
                source: DataSource.dayNightMode === 0x02 ?"qrc:/images10_25/display_always/night/bg_progress.png":"qrc:/images10_25/display_always/day/bg_progress.png"
            }

            contentItem: Item{
                Rectangle {
                    id: batteryProgressFill
                    width: batteryProgressBar.visualPosition * parent.width
                    height: parent.height
                    radius: 5
                }
                LinearGradient{
                    anchors.fill: batteryProgressFill
                    gradient: Gradient{
                        GradientStop { position: 0.0; color: DataSource.batteryAlarm === 1 ? diansebegin : "#ff0000"}
                        GradientStop { position: 1.0; color: DataSource.batteryAlarm === 1 ? dianseend : "#ff0000"}
                    }
                    source: batteryProgressFill
                    start: Qt.point(0,0)
                    end: Qt.point(batteryProgressFill.width,0)
                }
            }
            value: DataSource.powerBatterySoc !==0xFFE ? DataSource.powerBatterySoc/100 : 0
        }

        //燃油续驶里程
        Image {
            id: fuelIconNormal
            source: DataSource.dayNightMode === 0x02 ?"qrc:/images10_25/display_always/night/fuel_icon.png":"qrc:/images10_25/display_always/day/fuel_icon.png"
            x: DataSource.themeIndex === 0x02 ? 34:1043
            y: DataSource.themeIndex === 0x02 ? 58:41
            cache: false
            visible: (DataSource.lowFuelLight === 0 || DataSource.lowFuelLight === 2) ? true : false
        }
        
        WarningLight{
            id: fuelWarningIndicator
            x: DataSource.themeIndex === 0x02 ? 34:1043
            y: DataSource.themeIndex === 0x02 ? 58:41
            displayState: DataSource.lowFuelLight
            Image{
                id: fuelWarningIcon
                source: "qrc:/images10_25/warninglight/lowFuelLight.png"
            }
        }
        
        // 燃油里程
        Text {
            id: fuelRangeText
            anchors.bottom: fuelProgressBar.bottom
            anchors.bottomMargin: 8
            anchors.left: fuelProgressBar.left
            anchors.leftMargin: DataSource.themeIndex === 0x02 ? 0 : 60
            font.pixelSize: DataSource.themeIndex === 0x02 ? 35-5:35-5
            color: DataSource.dayNightMode === 0x02 ? "#ffffff":"#333333"
            visible: DataSource.fuelMile !== "0" ? true : false
            text: DataSource.fuelMile
			font.family: rootItemId.ziti
			font.bold:rootItemId.jiacu === 1
        }

        Text {
            font.bold:rootItemId.jiacu === 1
            id: fuelRangeUnit
            anchors.left: fuelRangeText.right
            anchors.leftMargin: 3
            anchors.bottom: fuelProgressBar.bottom
            anchors.bottomMargin: 8+3
            visible: fuelRangeText.visible
            font.pixelSize: DataSource.themeIndex === 0x02 ? 20:20
            font.family: rootItemId.ziti
            opacity: 0.75
            color: DataSource.dayNightMode === 0x02 ? "#ffffff":"#333333"
            text: DataSource.odoEvUnit !== 2 ? "km " : (CustomStyle.isSingular(DataSource.fuelMile) ? "mile|":"miles|")
        }
        
        // 燃油量
        Text {
            id: fuelPercentText
            anchors.right: fuelUnitText.left			
			anchors.rightMargin: 3
            anchors.bottom: fuelProgressBar.bottom
            anchors.bottomMargin: 8
            font.pixelSize: DataSource.themeIndex === 0x02 ? 35-5:35-5
            color: DataSource.dayNightMode === 0x02 ? "#ffffff" : "#333333"
            visible: fuelRangeText.visible 
            text: isNaN(DataSource.fuelMile) ? "---" : DataSource.fuelPercent.toFixed(0) 
            font.family: rootItemId.ziti
			font.bold:rootItemId.jiacu === 1
        }

        Text {
            font.bold:rootItemId.jiacu === 1
            id: fuelUnitText
            text: qsTr("%")
            anchors.right: fuelProgressBar.right
            anchors.rightMargin: 0
            anchors.bottom: fuelProgressBar.bottom
            anchors.bottomMargin: 8+3
            visible: fuelRangeText.visible
            font.pixelSize: DataSource.themeIndex === 0x02 ? 20:20
            font.family: rootItemId.ziti
            opacity: 0.75
            color: DataSource.dayNightMode === 0x02 ? "#ffffff":"#333333"
        }
        
        ProgressBar{
            id: fuelProgressBar
            x: DataSource.themeIndex === 0x02 ? 82:1028
            y: 80
            width: DataSource.themeIndex === 0x02 ? 180:360
            height: 9
            background: Image {
                cache: false
                source: DataSource.dayNightMode === 0x02 ?"qrc:/images10_25/display_always/night/bg_progress.png":"qrc:/images10_25/display_always/day/bg_progress.png"
            }

            contentItem: Item{
                Rectangle {
                    id: fuelProgressFill
                    width: fuelProgressBar.visualPosition * parent.width
                    height: parent.height
                    radius: 5
                }
                LinearGradient{
                    anchors.fill: fuelProgressFill
                    gradient: Gradient{
                        GradientStop { position: 0.0; color: DataSource.lowFuelAlarm === 1 ? yousebegin : "#ff0000"}
                        GradientStop { position: 1.0; color: DataSource.lowFuelAlarm === 1 ? youseend : "#ff0000"}
                    }
                    source: fuelProgressFill
                    start: Qt.point(0,0)
                    end: Qt.point(fuelProgressFill.width,0)
                }
            }
            value: DataSource.fuelPercent/100
        }

        Text {
            id: totalRangeText
            x: DataSource.themeIndex === 0x02 ?  fuelProgressBar.x+180+16:(1920-totalRangeText.width)/2
            y: 100
            anchors.bottom: fuelProgressBar.bottom
            anchors.bottomMargin: DataSource.themeIndex === 0x02 ? -11:20
            font.pixelSize: 35
            color: DataSource.dayNightMode === 0x02 ? "#ffffff" : "#333333"
            text: isNaN(DataSource.fuelMile) ? Number(DataSource.socMile) : Number(DataSource.fuelMile) + Number(DataSource.socMile)
			font.family: rootItemId.ziti
			font.bold:rootItemId.jiacu === 1
        }
        
        Text {
            font.bold:rootItemId.jiacu === 1
            id: totalRangeUnit
            anchors.left: DataSource.themeIndex === 0x02 ? totalRangeText.right : totalRangeText.left
            anchors.leftMargin: DataSource.themeIndex === 0x02 ? 8:(totalRangeText.width-totalRangeUnit.width)/2
            anchors.bottom: fuelProgressBar.bottom
			anchors.bottomMargin: DataSource.themeIndex === 0x02 ? -9:0
            font.pixelSize: 25
            font.family: rootItemId.ziti
            color: DataSource.dayNightMode === 0x02 ? "#ffffff" : "#333333"
            text: DataSource.odoUnit !== 2 ? "km" : (CustomStyle.isSingular(DataSource.socMile) ? "mile":"miles")
        }
WarningLight {
    id: pemLight2
    x: 290 + pemLightX
    y: 10 + pemLightY 
    visible: false  //DataSource.pemLight === 1
    Image {
        source: DataSource.language === 0x02 ? "qrc:/images10_25/warninglight/pemLightEn.png"
                                             : "qrc:/images10_25/warninglight/pemLight.png"
    }		
    }}

Item {
    id: driveRangeInfoId
    anchors.fill: parent
    //hev电量、油量表
    Item{
        id:hevDriveRangeInfoId
        anchors.fill: parent
        visible: haoGe === 1 || DataSource.vehicleType === DataSource.CAR_TYPE_EV
        //电续驶里程
        // 电量正常灰色图标
        Image {
            id: batteryLightId
            source: DataSource.dayNightMode === 0x02 ? "qrc:/images10_25/display_always/night/battery_icon.png":"qrc:/images10_25/display_always/day/battery_icon.png"
            x: DataSource.themeIndex === 0x02 ? 34:547
            y: DataSource.themeIndex === 0x02 ? 62:45
            visible: (DataSource.lowPowerBatLight === 0 || DataSource.lowPowerBatLight === 2) ? true : false
            cache: false
        }
        // 低电量黄色图标
        WarningLight{
            id: batteryWarningLightId
            x: DataSource.themeIndex === 0x02 ? 34:547
            y: DataSource.themeIndex === 0x02 ? 62:45
            displayState: DataSource.lowPowerBatLight
            Image{
                id: batteryWarningLightImageId
                source: "qrc:/images10_25/warninglight/lowBat.png"
            }
        }
        // 电量+里程
        // 电量续航里程
        Text {
            id: socMileId
            anchors.bottom: socProgressId.bottom
            anchors.bottomMargin: 8
            anchors.left: socProgressId.left
			anchors.leftMargin: DataSource.themeIndex === 0x02 ? 0 : 60
            font.pixelSize: 35-5
            color: DataSource.dayNightMode === 0x02 ? "#ffffff":"#333333"
            visible: DataSource.batteryMileMode === 1 ? true : true
            text: DataSource.socMile
            font.family: rootItemId.ziti
            font.bold:rootItemId.jiacu === 1
        }

        Text {
            font.bold:rootItemId.jiacu === 1
            id: socMileUnitId
            anchors.left: socMileId.right
            anchors.leftMargin: 3
            anchors.bottom: socProgressId.bottom
            anchors.bottomMargin: 8+3
            visible: socMileId.visible
            font.pixelSize: 20
            font.family: rootItemId.ziti
            opacity: DataSource.dayNightMode === 0x02 ? 0.75:1.00
            color: DataSource.dayNightMode === 0x02 ? "#ffffff":"#333333"
            text: DataSource.odoUnit !== 2 ? "km " : (CustomStyle.isSingular(DataSource.socMile) ? "mile|":"miles|")
        }
        // 电量百分比
        Text {
            id: socVauleId
            anchors.bottom: socProgressId.bottom
            anchors.bottomMargin: 8
            anchors.right: socUnitId.left
            anchors.rightMargin: 3
            font.pixelSize: 35-5
            color: DataSource.dayNightMode === 0x02 ? "#ffffff" : "#333333"
            visible: DataSource.batteryMileMode === 1 ? true : true
            text: DataSource.powerBatterySoc === 0xFFE ? " ": DataSource.powerBatterySoc
            font.family: rootItemId.ziti
            font.bold:rootItemId.jiacu === 1
        }

        Text {
            font.bold:rootItemId.jiacu === 1
            id: socUnitId
            text: qsTr("%")
            anchors.right: socProgressId.right
            anchors.bottom: socProgressId.bottom
            anchors.bottomMargin: 8+3
            visible: socVauleId.visible
            font.pixelSize: 20
            font.family: rootItemId.ziti
            opacity: DataSource.dayNightMode === 0x02 ? 0.75:1.00
            color: DataSource.dayNightMode === 0x02 ? "#ffffff":"#333333"
        }

        ProgressBar{
            id: socProgressId
            x: DataSource.themeIndex === 0x02 ? 82:532
            y: 80
            width: DataSource.themeIndex === 0x02 ? 180:360
            height: 9
            background: Image {
                cache: false
                source: DataSource.dayNightMode === 0x02 ?"qrc:/images10_25/display_always/night/bg_progress.png":"qrc:/images10_25/display_always/day/bg_progress.png"
            }

            contentItem: Item{
                Rectangle {
                    id: socRect
                    width: socProgressId.visualPosition * parent.width
                    height: parent.height
                    radius: 5
                }
                LinearGradient{
                    anchors.fill: socRect
                    gradient: Gradient{
                        GradientStop { position: 0.0; color: DataSource.batteryAlarm === 1 ? diansebegin : "#ff0000"}
                        GradientStop { position: 1.0; color: DataSource.batteryAlarm === 1 ? dianseend : "#ff0000"}
                    }
                    source: socRect
                    start: Qt.point(0,0)
                    end: Qt.point(socRect.width,0)
                }
            }
            value: DataSource.powerBatterySoc !==0xFFE ? DataSource.powerBatterySoc/100 : 0
        }
        Item {
            id: fuelRangeItem
            visible: DataSource.vehicleType !== DataSource.CAR_TYPE_EV
            
            //燃油续驶里程
            Image {
                id: fuelLightId
                source: DataSource.dayNightMode === 0x02 ?"qrc:/images10_25/display_always/night/fuel_icon.png":"qrc:/images10_25/display_always/day/fuel_icon.png"
                x: DataSource.themeIndex === 0x02 ? 341-60:1043
                y: DataSource.themeIndex === 0x02 ? 58:41
                cache: false
                visible: (DataSource.lowFuelLight === 0 || DataSource.lowFuelLight === 2) ? true : false
            }
            WarningLight{
                id: fuelWarningLightId
                x: DataSource.themeIndex === 0x02 ? 341-60:1043
                y: DataSource.themeIndex === 0x02 ? 58:41
                displayState: DataSource.lowFuelLight
                Image{
                    id: fuelWarningLightImageId
                    source: "qrc:/images10_25/warninglight/lowFuelLight.png"
                }
            }
            // 燃油里程
            Text {
                id: fuelMileId
                anchors.bottom: fuelProgressId.bottom
                anchors.bottomMargin: 8
                anchors.left: fuelProgressId.left
				anchors.leftMargin: DataSource.themeIndex === 0x02 ? 0 : 60
                font.pixelSize: DataSource.themeIndex === 0x02 ? 35-5:35-5
                color: DataSource.dayNightMode === 0x02 ? "#ffffff":"#333333"
                visible: DataSource.fuelMile !== "0" ? true : false
                text: DataSource.fuelMile
                font.family: rootItemId.ziti
                font.bold:rootItemId.jiacu === 1
            }

            Text {
                font.bold:rootItemId.jiacu === 1
                id: fuelMileUnitId
                anchors.left: fuelMileId.right
                anchors.leftMargin: 3
                anchors.bottom: fuelProgressId.bottom
                anchors.bottomMargin: 8+3
                visible: fuelMileId.visible
                font.pixelSize: DataSource.themeIndex === 0x02 ? 20:20
                font.family: rootItemId.ziti
                opacity: DataSource.dayNightMode === 0x02 ? 0.75:1.00
                color: DataSource.dayNightMode === 0x02 ? "#ffffff":"#333333"
                text: DataSource.odoEvUnit !== 2 ? "km " : (CustomStyle.isSingular(DataSource.fuelMile) ? "mile|":"miles|")
            }
            // 燃油量
            Text {
                id: fuelValueId
                anchors.right: fuelUnitId.left
                anchors.rightMargin: 3
                anchors.bottom: fuelProgressId.bottom
                anchors.bottomMargin: 8
                font.pixelSize: DataSource.themeIndex === 0x02 ? 35-5:35-5
                color: DataSource.dayNightMode === 0x02 ? "#ffffff" : "#333333"
                visible: fuelMileId.visible 
                text: isNaN(DataSource.fuelMile) ? "---" : DataSource.fuelPercent.toFixed(0)  
                font.family: rootItemId.ziti
                font.bold:rootItemId.jiacu === 1
            }

            Text {
                font.bold:rootItemId.jiacu === 1
                id: fuelUnitId
                text: qsTr("%")
                anchors.right: fuelProgressId.right
                anchors.bottom: fuelProgressId.bottom
                anchors.bottomMargin: 8+3
                visible: fuelMileId.visible
                font.pixelSize: DataSource.themeIndex === 0x02 ? 20:20
                font.family: rootItemId.ziti
                opacity: DataSource.dayNightMode === 0x02 ? 0.75:1.00
                color: DataSource.dayNightMode === 0x02 ? "#ffffff":"#333333"
            }

            ProgressBar{
                id: fuelProgressId
                x: DataSource.themeIndex === 0x02 ? 388-60:1028
                y: 80
                width: DataSource.themeIndex === 0x02 ? 180:360
                height: 9
                background: Image {
                    cache: false
                    source: DataSource.dayNightMode === 0x02 ?"qrc:/images10_25/display_always/night/bg_progress.png":"qrc:/images10_25/display_always/day/bg_progress.png"
                }

                contentItem: Item{
                    Rectangle {
                        id: fuelRect
                        width: fuelProgressId.visualPosition * parent.width
                        height: parent.height
                        radius: 5
                    }
                    LinearGradient{
                        anchors.fill: fuelRect
                        gradient: Gradient{
                            GradientStop { position: 0.0; color: DataSource.lowFuelAlarm === 1 ? yousebegin : "#ff0000"}
                            GradientStop { position: 1.0; color: DataSource.lowFuelAlarm === 1 ? youseend : "#ff0000"}
                        }
                        source: fuelRect
                        start: Qt.point(0,0)
                        end: Qt.point(fuelRect.width,0)
                    }
                }
                value: DataSource.fuelPercent/100
            }
            Text {
                id: totalValueId
                x: DataSource.vehicleType === DataSource.CAR_TYPE_EV ? 281 : DataSource.themeIndex === 0x02 ? 644-120:(1920-totalValueId.width)/2
                anchors.bottom: fuelProgressId.bottom
                anchors.bottomMargin: DataSource.themeIndex === 0x02 ? -11:20
                font.pixelSize: 35
                color: DataSource.dayNightMode === 0x02 ? "#ffffff" : "#333333"
                text: isNaN(DataSource.fuelMile) ? Number(DataSource.socMile) : Number(DataSource.fuelMile) + Number(DataSource.socMile)
                font.family: rootItemId.ziti
                font.bold:rootItemId.jiacu === 1
				visible:DataSource.vehicleType !== DataSource.CAR_TYPE_EV
            }
            Text {
                font.bold:rootItemId.jiacu === 1
                id: totalValueUnitId
                anchors.left: DataSource.themeIndex === 0x02 ? totalValueId.right : totalValueId.left
                anchors.leftMargin: DataSource.themeIndex === 0x02 ? 3:(totalValueId.width-totalValueUnitId.width)/2
                anchors.bottom: fuelProgressId.bottom
                anchors.bottomMargin: DataSource.themeIndex === 0x02 ? -9:0
                font.pixelSize: 25
                font.family: rootItemId.ziti
                color: DataSource.dayNightMode === 0x02 ? "#ffffff" : "#333333"
                text: DataSource.odoUnit !== 2 ? "km" : (CustomStyle.isSingular(DataSource.socMile) ? "mile":"miles")
				visible:DataSource.vehicleType !== DataSource.CAR_TYPE_EV
            }
        }
    }
}
}

        //里程
        Item {
            id: odoItemId
            x: 1630
            anchors.bottom: parent.bottom
            Text {
                font.bold:rootItemId.jiacu === 1
                id: odoNameId
                anchors.bottom: parent.bottom
				anchors.bottomMargin: 2
                font.pixelSize: 30
                font.family: rootItemId.ziti
                color: DataSource.dayNightMode === 0x02 ? "#ffffff":"#333333"
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
            }

            Text {
                id: odoValueId
                anchors.bottom: parent.bottom
                //anchors.bottomMargin: -5
                anchors.left: odoNameId.right
                anchors.leftMargin: 11
                font.pixelSize: 35
                visible: DataSource.odoIndex !== 0 ? true : false
                color: DataSource.dayNightMode === 0x02 ? "#ffffff":"#333333"
                text: DataSource.odoValue
				font.family: rootItemId.ziti
				font.bold:rootItemId.jiacu === 1
            }

            Text {
                font.bold:rootItemId.jiacu === 1
                id: totalOdoUnitId
                anchors.bottom: parent.bottom
				anchors.bottomMargin: 2
                anchors.left: odoValueId.right
                anchors.leftMargin: 8
                visible: odoValueId.visible && DataSource.odoIndex === 1
                font.pixelSize: 30-5
				font.family: rootItemId.ziti
                color: DataSource.dayNightMode === 0x02 ? "#b3ffffff":"#333333"
                text: DataSource.odoUnit !== 2 ? "km" : (CustomStyle.isSingular(DataSource.odoValue) ? "mile":"miles")
            }

            Text {
                font.bold:rootItemId.jiacu === 1
                id: odo1UnitId
                anchors.left: odoValueId.right
                anchors.leftMargin: 8
                visible: odoValueId.visible && (DataSource.odoIndex === 2 || DataSource.odoIndex === 3)
                font.pixelSize: 30-5
				font.family: rootItemId.ziti
                color: DataSource.dayNightMode === 0x02 ? "#b3ffffff":"#333333"
                text: DataSource.odo1Unit !== 2 ? "km" : (CustomStyle.isSingular(DataSource.odoValue) ? "mile":"miles")
                anchors.bottom: parent.bottom
				anchors.bottomMargin: 2
            }

            Text {
                font.bold:rootItemId.jiacu === 1
                id: odoEvUnitId
                anchors.left: odoValueId.right
                anchors.leftMargin: 8
                visible: odoValueId.visible && (DataSource.odoIndex === 4 || DataSource.odoIndex === 5)
                font.pixelSize: 30-5
				font.family: rootItemId.ziti
                color: DataSource.dayNightMode === 0x02 ? "#b3ffffff":"#333333"
                text: DataSource.odoEvUnit !== 2 ? "km" : (CustomStyle.isSingular(DataSource.odoValue) ? "mile":"miles")
                anchors.bottom: parent.bottom
				anchors.bottomMargin: 2
            }
        }

        // 全屏，功率显示左下角
        Item {
            id: naviPowerId
            x: DataSource.themeIndex === 0x02 ? 1350:149 //1200:149
            y: DataSource.themeIndex === 0x02 && DataSource.powerGear === 3 && engineRpm > 0 && faDong === 0 ? 610 : DataSource.themeIndex === 0x02 ? 635:625
            width: 340
            height: 60
            visible: DataSource.naviTypeStore === 2 && DataSource.themeIndex === 0x01

            Item {
                anchors.centerIn: parent
                width: powerValueId.contentWidth + powerUnitId.contentWidth + 9
                height: parent.height

                Text {
                    id: powerValueId
                    text: DataSource.power
                    color: DataSource.dayNightMode === 0x02?"#ffffff":"#333333"
                    font.pixelSize: DataSource.themeIndex === 0x02 ? 51-10:113
                    font.family: rootItemId.ziti
					font.bold:rootItemId.jiacu === 1
                    anchors.bottom: parent.bottom
                    anchors.bottomMargin: DataSource.themeIndex === 0x02 ? -16:-12
                    visible: DataSource.power === 1001 ? false : true
                }
                Text {
                    font.bold:rootItemId.jiacu === 1
                    id: powerUnitId
                    text: DataSource.powerUnit === 2 ? "HP" : "kW"
                    color: DataSource.dayNightMode === 0x02?"#ffffff":"#333333"
                    font.pixelSize: DataSource.themeIndex === 0x02 ? 28-5:45
                    font.family: rootItemId.ziti
                    anchors.left: powerValueId.right
                    anchors.leftMargin: 4
                    anchors.bottom: parent.bottom
                    anchors.bottomMargin: DataSource.themeIndex === 0x02 ? -10:10
                    visible: DataSource.power === 1001 ? false : true
                }
            }
        }
	
        // 全屏，速度显示右下角
        Item {
            id: naviSpeedId
            x: DataSource.themeIndex === 0x02 ?(1920-340)/2:1455
            y: DataSource.themeIndex === 0x02 ? 20+suduy:625  //630:590
            width: 340
            height: 72
            visible: (DataSource.naviTypeStore === 2 || DataSource.themeIndex === 0x02) && !((DataSource.naviTypeStore === 1 || DataSource.naviTypeStore === 0) && weilai === 1)

            Item {
                anchors.centerIn: parent
                width: speedValueId.contentWidth + speedUnitId.contentWidth + 2
                height: parent.height

                Text {
                    id: speedValueId
                    text: DataSource.speed
                    color: (valueThree > 0 && valueThree < DataSource.speed && daoLu === 0) ? "#FF0000" : DataSource.dayNightMode === 0x02?suduyanse2:suduyanse1
                font.pixelSize: 123+sududaxiao
				
                font.family: "HFBUBU-Neue"
                    anchors.left: parent.left
                    anchors.leftMargin: DataSource.themeIndex === 0x02 ? (parent.width-speedValueId.width)/2:0
                    anchors.bottom: parent.bottom
                    anchors.bottomMargin: DataSource.themeIndex === 0x02 ? -24:0
    layer.enabled: true
    layer.effect: Glow {
        id: speedGlow
        color: DataSource.dayNightMode === 0x02?faguang2:faguang1
        radius: banjing
        spread: 0.5
        samples: 16
        transparentBorder: true
    }					
                    visible: DataSource.speed === -1 ? false : true
                }
                Text {
                    font.bold:rootItemId.jiacu === 1
                    id: speedUnitId
                    text: DataSource.speedUnit === 2 ? "mph" : "km/h"
                    color:  (valueThree > 0 && valueThree < DataSource.speed && daoLu === 0) ? "#FF0000" : DataSource.dayNightMode === 0x02?suduyanse2:suduyanse1
                    font.pixelSize: DataSource.themeIndex === 0x02 ? 30:45
					font.family: rootItemId.ziti
                    anchors.left: DataSource.themeIndex === 0x02 ? speedValueId.left:speedValueId.right
                    anchors.leftMargin: DataSource.themeIndex === 0x02 ? (speedValueId.width-speedUnitId.width)/2:2
                    anchors.bottom: parent.bottom
                    anchors.bottomMargin: DataSource.themeIndex === 0x02 ? -35:22
                    visible: danwei === 1
                }
            }
        }
    }
 Image {
        id: adasWindowBackground
        x: 1266.5
        y: 392
        opacity: 0.8
        source: DataSource.dayNightMode === 0x01?"qrc:/images10_25/adas2d/window_light_new.png":"qrc:/images10_25/adas2d/window_night_new.png"
        cache: false
        visible: DataSource.themeIndex === 0x2 ? false:(DataSource.adasPlatform === 0x1?(DataSource.adasWindow === 0x2 && DataSource.naviType !== 0x4 && mPreNaviType !== 0x4 ?false:true)
                                                :(DataSource.adasInterfaceDisplay !== 99 && DataSource.naviType !== 0x4 && mPreNaviType !== 0x4 ?false:true))
    }
    Image {
        id: adas2dNaviWindowBg
        x: 1410
        y: 310
        // x:1305
        // y:264
        opacity: 0.8
        scale: 2
        visible: DataSource.themeIndex === 0x2 ? false:(DataSource.adasPlatform === 0x1?((DataSource.naviTypeStore === 2 || mPreNaviType === 0x4) && DataSource.adasWindow !== 0 ?true:false)
                                                 :((DataSource.naviTypeStore === 2 || mPreNaviType === 0x4) && DataSource.adasInterfaceDisplay !== 0 ? true:false))
        source: DataSource.dayNightMode === 0x01?"qrc:/images10_25/adas2d/window_light_new.png":"qrc:/images10_25/adas2d/window_night_new.png"
        // source: DataSource.dayNightMode === 0x02?"qrc:/images10_25/adas2d/navi_bg_night.png":"qrc:/images10_25/adas2d/navi_bg_day.png"
    }
    Rectangle{
        id:adasContainerParentId
        x: DataSource.themeIndex === 0x2 && DataSource.naviTypeStore === 1 && smallMap === 0 && xpadas === 1 ? 700+xpadasa : DataSource.themeIndex === 0x2 && DataSource.naviTypeStore === 1 && smallMap === 1 && xpadas === 1 ? 1505+xpadasb:(DataSource.themeIndex === 0x2 && DataSource.naviTypeStore === 2 && quanping === 1) ? 700+adasx : (smallMap === 0 && DataSource.themeIndex === 0x2 && (DataSource.naviTypeStore === 1 || DataSource.naviType === 3)) ? 1469-30 : (DataSource.naviTypeStore === 2 || DataSource.themeIndex === 0x1) ? 1326 : 652
        y: DataSource.themeIndex === 0x2 && DataSource.naviTypeStore === 1 && xpadas === 1 ? 341+xpadasc:(DataSource.themeIndex === 0x2 && DataSource.naviTypeStore === 2 && quanping === 1) ? 365+adasy : DataSource.naviTypeStore === 2 ? 295+20 : (DataSource.themeIndex === 0x1 && DataSource.naviType !== 0x4) ? 445 : 295+20
        z:3
        width: DataSource.naviTypeStore === 2 ? 608 : 
       (DataSource.themeIndex === 0x1 && DataSource.naviType !== 0x4) ? 189 : 806 //DataSource.themeIndex === 0x2 ? 378:(DataSource.naviTypeStore === 2 ? 378:189)
        height: DataSource.naviTypeStore === 2 ? 340 : 
       (DataSource.themeIndex === 0x1 && DataSource.naviType !== 0x4) ? 120 : 340
        clip: false
        visible: true
        radius: DataSource.naviTypeStore === 2 ? 10:10
        color: "transparent"
        layer.enabled: true
        layer.effect: OpacityMask{
            maskSource: Rectangle {
                width: DataSource.naviTypeStore === 2 ? 608 : 
       (DataSource.themeIndex === 0x1 && DataSource.naviType !== 0x4) ? 189 : 806 //DataSource.themeIndex === 0x2 ? 378:(DataSource.naviTypeStore === 2 ? 378:189)
                height: DataSource.naviTypeStore === 2 ? 340 : 
       (DataSource.themeIndex === 0x1 && DataSource.naviType !== 0x4) ? 120 : 340
                radius: DataSource.naviTypeStore === 2 ? 10:10
            }
        }
        Loader {
            id:adasLoaderId			
            x: ((smallMap === 0 && DataSource.themeIndex === 0x2 && DataSource.naviTypeStore === 1) || DataSource.naviTypeStore === 2) ? -557 :
       (DataSource.themeIndex === 0x1 && DataSource.naviType !== 0x4) ? -465 : -659
            y: ((smallMap === 0 && DataSource.themeIndex === 0x2 && DataSource.naviTypeStore === 1) || DataSource.naviTypeStore === 2) ? -235 : 
       (DataSource.themeIndex === 0x1 && DataSource.naviType !== 0x4) ? -188 : -285
            z:3
            scale: ((smallMap === 0 && DataSource.themeIndex === 0x2 && DataSource.naviTypeStore === 1) || DataSource.naviTypeStore === 2) ? 0.75 : 
       (DataSource.themeIndex === 0x1 && DataSource.naviType !== 0x4) ? 0.39 : 1.0
            source: DataSource.adasPlatform === 0x1 
    ? (
        (((DataSource.adasWindow === 0x2) || (DataSource.adasWindow === 0x1 && DataSource.naviTypeStore === 2)) 
        && DataSource.powerGear === 3 
        && adAs === 0 && !(smallMap === 0 && DataSource.themeIndex === 0x2 && DataSource.naviTypeStore === 1 && noL2 === 1)
        && ((DataSource.carBodyNeedDisplay === DataSource.UI_DISPLAY 
              && (DataSource.naviTypeStore === 2 || DataSource.rearLeftBelt !== 0x01 || DataSource.rearMiddleBelt !== 0x01 || DataSource.rearRightBelt !== 0x01 
                  || (DataSource.naviTypeStore === 1 && smallMap === 0)))
            || DataSource.carBodyNeedDisplay !== DataSource.UI_DISPLAY)) 
        ? "qrc:/qml10_25/adas2d/Adas3R1V.qml" 
        : ""
      )
    : (
        (!(quanping === 1 && DataSource.naviTypeStore === 2)&&((DataSource.adasInterfaceDisplay !== 99) || (DataSource.adasInterfaceDisplay !== 99 && DataSource.naviTypeStore === 2)) 
        && DataSource.powerGear === 3 
        && adAs === 0 && !(smallMap === 0 && DataSource.themeIndex === 0x2 && DataSource.naviTypeStore === 1 && noL2 === 1)
        && ((DataSource.carBodyNeedDisplay === DataSource.UI_DISPLAY
              && (DataSource.naviTypeStore === 2 || DataSource.rearLeftBelt !== 0x01 || DataSource.rearMiddleBelt !== 0x01 || DataSource.rearRightBelt !== 0x01 
                  || (DataSource.naviTypeStore === 1 && smallMap === 0)))
            || DataSource.carBodyNeedDisplay !== DataSource.UI_DISPLAY)) 
        ? "qrc:/qml10_25/adas2d/Adas.qml" 
        : ""
      )

onStatusChanged: {
    if (adasLoaderId.status === Loader.Ready) {
        adasLoaderId.visible = DataSource.adasPlatform === 0x1
            ? (
                ((DataSource.adasWindow === 0x2) || (DataSource.adasWindow === 0x1 && DataSource.naviTypeStore === 2)) 
                && adAs === 0 && !(smallMap === 0 && DataSource.themeIndex === 0x2 && DataSource.naviTypeStore === 1 && noL2 === 1) 
                ? true 
                : false
              )
            : (
                ((DataSource.adasInterfaceDisplay !== 99) || (DataSource.adasInterfaceDisplay !== 99 && DataSource.naviTypeStore === 2)) 
                && adAs === 0 && !(smallMap === 0 && DataSource.themeIndex === 0x2 && DataSource.naviTypeStore === 1 && noL2 === 1) 
                ? true 
                : false
              )
    }
}
        }
        Adas3dContainer{
            id:adas3dContainerId
            x: DataSource.themeIndex === 0x2 && ((DataSource.naviTypeStore === 1 && xpadas === 1) || (DataSource.naviTypeStore === 2 && quanping === 1)) ? 100 :((smallMap === 0 && DataSource.themeIndex === 0x2 && DataSource.naviTypeStore === 1) || DataSource.naviTypeStore === 2) ? 30 : 
       (DataSource.themeIndex === 0x1 && DataSource.naviType !== 0x4) ? -10 : 40
            y: DataSource.themeIndex === 0x2 && ((DataSource.naviTypeStore === 1 && xpadas === 1) || (DataSource.naviTypeStore === 2 && quanping === 1)) ? -158 : ((smallMap === 0 && DataSource.themeIndex === 0x2 && DataSource.naviTypeStore === 1) || DataSource.naviTypeStore === 2) ? -228-20 : 
       (DataSource.themeIndex === 0x1 && DataSource.naviType !== 0x4) ? -98 : -277-20
            z:3
            width: 608
            height: 290
            scale: DataSource.naviTypeStore === 1 && xpadas === 1 ? 0.6:(DataSource.themeIndex === 0x2 && DataSource.naviTypeStore === 2 && quanping === 1) ? 0.6 : ((smallMap === 0 && DataSource.themeIndex === 0x2 && DataSource.naviTypeStore === 1) || DataSource.naviTypeStore === 2) ? 0.78 : 
       (DataSource.themeIndex === 0x1 && DataSource.naviType !== 0x4) ? 0.39 : 1.0
            transformOrigin:Item.TopLeft
            visible:false
        }
    }

    //ADAS车间时距
    Item {
        id: adasCarDistanceItemId
        scale: DataSource.naviTypeStore === 2 || (DataSource.themeIndex === 0x2 && (DataSource.naviType === 0 || (DataSource.naviTypeStore === 1 && smallMap === 1))) ? 2 : 1
        z:10
        visible: false
        width: 305
        height: 260
        x: DataSource.themeIndex === 0x2 ?1410:(DataSource.naviTypeStore === 2 || mPreNaviType === 0x4? 1410:1266.5) //-15是由于背景切图有部分留白
        y: DataSource.themeIndex === 0x2 ?310:(DataSource.naviTypeStore === 2 || mPreNaviType === 0x4? 310:392)
        Image {
            visible: true
            opacity: 0.8
            source: DataSource.dayNightMode === 0x01?"qrc:/images10_25/adas2d/window_light_new.png":"qrc:/images10_25/adas2d/window_night_new.png"
            cache: false
        }
        Text {
            font.bold:rootItemId.jiacu === 1
            font.family: rootItemId.ziti
            anchors.horizontalCenter: parent.horizontalCenter
            text: TranslateStr.adasCarTimeSet
            font.pixelSize: 18
            color: DataSource.dayNightMode === 0x02 ?"#DAE1EB":"#1D2C36"
            y:73
        }

        Text {
            font.bold:rootItemId.jiacu === 1
            anchors.horizontalCenter: parent.horizontalCenter
            text: DataSource.carDistanceLevel + TranslateStr.menu_acGearStr
            font.pixelSize: 18
            font.family: rootItemId.ziti
            color: DataSource.dayNightMode === 0x02 ?"#DAE1EB":"#1D2C36"
            y:102
        }

        Image{
            y:122
            anchors.horizontalCenter: parent.horizontalCenter
            //car body type 0 is car ,1 is suv
            source:(DataSource.carBodyType === 0 ? "qrc:/images10_25/adas2d/car/acc_" :"qrc:/images10_25/adas2d/suv/acc_") + DataSource.carDistanceLevel + ".png"
        }
    }

    Center{
        z:3
        id:centerContainerId
        visible: false //刚加载的时候不可见，报文查询后会更新是否可见
    }

    Loader{
        id:presentationLoaderId
        z:CustomStyle.presentationZ
        source: DataSource.dilinkName === 0x01?"qrc:/qml10_25/alwaysDisplay/Presentation.qml":""
        asynchronous: true
    }


    WarinLightLayout{
        id:warningLayoutId
        anchors.fill: parent
        z:CustomStyle.warningLightZ
        rootItemRef: rootItemId
    }

    //ADAS begin
    Loader{
        id:adasDebugLoaderId
        x:250
        y:200
        z:6
        source: DataSource.selfStudyResultShow === 1 ||  DataSource.adasDebugMode === 1?"qrc:/qml10_25/adas2d/AdasDebug.qml":""
    }

    /**
    ADAS文字信息
    */
    Image{
        id:adasTipTextBg
        source:DataSource.dayNightMode === 0x1 ? "qrc:/images10_25/adas2d/pop-light.png" : "qrc:/images10_25/adas2d/pop-night.png"
        anchors.horizontalCenter: parent.horizontalCenter
        y:520+15-4
        z:CustomStyle.adasTip
        width:adasTipText.contentWidth +14+4
        height: 42+4
        Text{
            font.bold:rootItemId.jiacu === 1
            font.family: rootItemId.ziti
            id: adasTipText
            font.pixelSize: 28
            anchors.horizontalCenter: parent.horizontalCenter
            //anchors.verticalCenter: parent.verticalCenter
            y:(42-adasTipText.height)/2+4
        }
    }

    Text {
        id: adasTextTip3R1V
        y:520+22
        z:CustomStyle.adasTip
        anchors.horizontalCenter: parent.horizontalCenter
        font.pixelSize: 28
        visible: DataSource.adasTextTip !== 0 && DataSource.powerGear === 3 ? true : false
        color: DataSource.dayNightMode === 0x01?"#333333":"#ffffff"
        text: {
            switch(DataSource.adasTextTip){
            case 0x1:
                TranslateStr.adasTip3R1v_0x1   //自适应巡航已开启
                break
            case 0x2:
                TranslateStr.adasTip3R1v_0x2   //自适应巡航已取消
                break
            case 0x3:
                TranslateStr.adasTip3R1v_0x3   //自适应巡航已激活
                break
            case 0x4:
                TranslateStr.adasTip3R1v_0x4   //自适应巡航无法激活
                break
            case 0x5:
                TranslateStr.adasTip3R1v_0x5   //请系好主驾安全带
                break
            case 0x6:
                TranslateStr.adasTip3R1v_0x6    //请确认车门是否关好
                break
            case 0x7:
                TranslateStr.adasTip3R1v_0x7    //请确认挡位是否在D挡
                break
            case 0x8:
                TranslateStr.adasTip3R1v_0x8     //请释放 EPB
                break
            case 0x9:
                TranslateStr.adasTip3R1v_0x9      //请开启 ESP
                break
            default:
                ""
                break
            }
        }
    }

    //交通标志
    WarningLight{
        id: trafficSymbolId
        x:DataSource.naviTypeStore === 2 || mPreNaviType === 0x4? 1704:(DataSource.themeIndex === 0x2?1292:1269)
        y:DataSource.naviTypeStore === 2 || mPreNaviType === 0x4? 183 :(DataSource.themeIndex === 0x2?314:181)
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

    //ADAS Text Info
    function textInfoUpdate(){
        if(DataSource.powerGear !== 3){
            adasTipText.visible = false
            adasTipTextBg.visible = false
            return
        }
        switch(DataSource.accRemoteText)
        {
        case 0x1:
            //紧急制动中
            adasTipText.text = TranslateStr.adasTip_0x1
            break
        case 0x2:
            //请轻转方向盘
            adasTipText.text = TranslateStr.adasTip_0x2
            break;
        case 0x3:
            //请立即接管
            adasTipText.text = TranslateStr.adasTip_0x3
            break
        case 0x4:
            //请制动
            adasTipText.text = TranslateStr.adasTip_0x4
            break
        case 0x5:
            //请接管
            adasTipText.text = TranslateStr.adasTip_0x5
            break
        case 0x6:
            //请保持安全车距
            adasTipText.text = TranslateStr.adasTip_0x6
            break
        case 0x7:
            //前方自动导航即将退出，请注意接管车辆
            adasTipText.text = TranslateStr.adasTip_0x7
            break
        case 0x8:
            //辅助变道即将退出，请接管
            adasTipText.text = TranslateStr.adasTip_0x8
            break
        case 0x9:
            //开门请注意
            adasTipText.text = TranslateStr.adasTip_0x9
            break
        case 0xA:
            //驾驶辅助功能受限
            adasTipText.text = TranslateStr.adasTip_0xA
            break
        case 0xB:
            //环境受限，智能摄像头不可用
            adasTipText.text = TranslateStr.adasTip_0xB
            break
        case 0xC:
            //超越加速中
            adasTipText.text = TranslateStr.adasTip_0xC
            break
        case 0xD:
            //请确认是否调整限速至识别限速
            adasTipText.text = TranslateStr.adasTip_0xD
            break
        case 0xE:
            //请确认安全带是否系好
            adasTipText.text = TranslateStr.adasTip_0xE
            break
        case 0xF:
            //请确认车门是否关好
            adasTipText.text = TranslateStr.adasTip_0xF
            break
        case 0x10:
            //请确认挡位是否在D档
            adasTipText.text = TranslateStr.adasTip_0x10
            break
        case 0x11:
            //请释放EPB
            adasTipText.text = TranslateStr.adasTip_0x11
            break
        case 0x12:
            //请开启ESP
            adasTipText.text = TranslateStr.adasTip_0x12
            break
        case 0x13:
            //前车已驶离，请踩加速踏板起步
            adasTipText.text = TranslateStr.adasTip_0x13
            break
        case 0x14:
            //即将进入匝道
            adasTipText.text = TranslateStr.adasTip_0x14
            break
        case 0x15:
            //即将汇入主路
            adasTipText.text = TranslateStr.adasTip_0x15
            break
        case 0x16:
            //当前不适合变道
            adasTipText.text = TranslateStr.adasTip_0x16
            break
        case 0x17:
            //变道已取消
            adasTipText.text = TranslateStr.adasTip_0x17
            break
        case 0x18:
            //变道已完成
            adasTipText.text = TranslateStr.adasTip_0x18
            break
        case 0x19:
            //ACC 无法激活
            adasTipText.text = TranslateStr.adasTip_0x19
            break
        case 0x1A:
            //ACC 已退出
            adasTipText.text = DataSource.carNameType === DataSource.CARNAME_SC3E_8_8 ? TranslateStr.adasTip_0x33
                                                                                      : TranslateStr.adasTip_0x1A
            break
        case 0x1B:
            //ACC 已激活
            adasTipText.text = TranslateStr.adasTip_0x1B
            break
        case 0x1C:
            //高速智能领航已退出
            adasTipText.text = TranslateStr.adasTip_0x1C
            break
        case 0x1D:
            //高速智能领航已开启
            adasTipText.text = TranslateStr.adasTip_0x1D
            break
        case 0x1E:
            //智能领航已退出
            adasTipText.text = DataSource.carNameType === DataSource.CARNAME_SC3E_8_8 ? TranslateStr.adasTip_0x33
                                                                                      : TranslateStr.adasTip_0x1E
            break
        case 0x1F:
            //智能领航已激活
            adasTipText.text = TranslateStr.adasTip_0x1F
            break
        case 0x20:
            //车道辅助功能已关闭
            adasTipText.text = TranslateStr.adasTip_0x20
            break
        case 0x21:
            //车道偏离报警功能已开启
            adasTipText.text = TranslateStr.adasTip_0x21
            break
        case 0x22:
            //车道纠偏辅助功能已开启
            adasTipText.text = TranslateStr.adasTip_0x22
            break
        case 0x23:
            //紧急车道偏离辅助开启
            adasTipText.text = TranslateStr.adasTip_0x23
            break
        case 0x24:
            //请握住方向盘
            adasTipText.text = TranslateStr.adasTip_0x24
            break
        case 0x25:
            //前车已启动，请注意周边环境
            adasTipText.text = TranslateStr.adasTip_0x25
            break
        case 0x26:
            //当前路况不满足智能领航激活条件
            adasTipText.text = TranslateStr.adasTip_0x26
            break
        case 0x27:
            //辅助变道已退出，请接管
            adasTipText.text = TranslateStr.adasTip_0x27
            break
        case 0x28:
            //车道保持功能已开启
            adasTipText.text = TranslateStr.adasTip_0x28
            break
        case 0x29:
            //车道偏离预警和车道保持功能已开启
            adasTipText.text = TranslateStr.adasTip_0x29
            break
        case 0x30:
            //驾驶辅助系统热保护，请开空调
            adasTipText.text = TranslateStr.adasTip_0x30
            break
        case 0x31:
            //正在小幅避让，稍后恢复居中
            adasTipText.text = TranslateStr.adasTip_0x31
            break
        case 0x32:
            //请先切换至舒适/经济/运动模式
            adasTipText.text = TranslateStr.adasTip_0x32
            break
	case 0x33:
            //变道辅助暂不可用
            adasTipText.text = TranslateStr.adasTip_0x34
            break
        default:
            adasTipText.text = ""
            break
        }

        if((DataSource.chargeNeedDisplay === 0
            &&DataSource.dischargeNeedDisplay === 0
            &&DataSource.speedUpTimerInterfaceDisplay === 0)
                &&DataSource.accRemoteText > 0 && !adasTextTimeout){
            adasTipText.visible = true
            adasTipTextBg.visible = true
        }else{
            adasTipText.visible = false
            adasTipTextBg.visible = false
        }
    }
    function textColorUpdate()
    {
        switch(DataSource.accTipTextColor){
        case 0:
            adasTipText.color = DataSource.dayNightMode === 0x01?"#333333":"#ffffff"
            break
        case 1:
            adasTipText.color = "#EE7600"
            break
        case 2:
            adasTipText.color = "red"
            break
        default:
            adasTipText.color = DataSource.dayNightMode === 0x01?"#333333":"#ffffff"
            break
        }
    }

    /*
    *设置ADAS小窗口容器显示
    **/
 function updateAdasContainer(){
        if(DataSource.powerGear !== 3 && adAs === 1){
            //非ON挡下让ADAS小窗口显示在背景下面，让3D ADAS在用户不知情的情况下提前加载，避免切换ON后有因为ADAS加载导致卡顿的情况，影响用户体验
            adasContainerParentId.z = -10
            adas3dContainerId.visible = true
        }else
        {
            adasContainerParentId.z = 3
            adas3dContainerId.visible = !(DataSource.themeIndex === 0x2 && DataSource.naviTypeStore !== 0 && noL2 === 1) && adAs === 1 && ((DataSource.carBodyNeedDisplay === DataSource.UI_DISPLAY && (DataSource.naviTypeStore === 2 || DataSource.rearLeftBelt !== 0x01 || DataSource.rearMiddleBelt !== 0x01 || DataSource.rearRightBelt !== 0x01 || (DataSource.naviTypeStore === 1 && smallMap === 0))) || DataSource.carBodyNeedDisplay !== DataSource.UI_DISPLAY) ? true : false
        }
    }
    Timer{
        id:adasCarDistanceTimer
        repeat: true
        running: false
        interval: 5000
        onTriggered: {
            adasCarDistanceTimer.stop()
            adasCarDistanceItemId.visible = false
        }
    }
    //ADAS end

    //ek提示:请切换到P挡
    Image{
        id:ekShiftPInfo
        source:(DataSource.dayNightMode === 0x2 || DataSource.trackModeNeedDisplay === 1)? "qrc:/images10_25/adas2d/pop-night.png" : "qrc:/images10_25/adas2d/pop-light.png"
        anchors.horizontalCenter: parent.horizontalCenter
        y:DataSource.trackModeNeedDisplay === 1?583:520+15-4
        z:CustomStyle.adasTip
        width:ekShiftPInfoText.contentWidth +14+4
        height: 42+4
        visible: DataSource.ekShiftPInfoDisplay === 1 && DataSource.chargeNeedDisplay === 0
                 &&DataSource.dischargeNeedDisplay === 0
                 &&DataSource.speedUpTimerInterfaceDisplay === 0 && DataSource.accRemoteText === 0 && DataSource.adasTextTip === 0?true:false//该提示和ADAS文字弹窗重合，该提示优先级最低
        Text{
            font.bold:rootItemId.jiacu === 1
            font.family: rootItemId.ziti
            id: ekShiftPInfoText
            font.pixelSize: 28
            anchors.horizontalCenter: parent.horizontalCenter
            y:(42-ekShiftPInfoText.height)/2+4
            color: (DataSource.dayNightMode === 0x2 || DataSource.trackModeNeedDisplay === 1)?"#ffffff":"#333333"
            text: TranslateStr.shiftPWarningInfoStr
        }
    }

    //动效 begin
    ParallelAnimation{
        id:themeSwithOpacityHideAnimId
        PropertyAnimation{
            //id:driveRangeInfoHideAnimId
            target: driveRangeInfoId
            property: "opacity"
            from:1
            to:0
            easing.type: Easing.InOutQuad
            duration: CustomStyle.themeOpacityChangeTimer
        }
        PropertyAnimation{
            //id:warningLayoutIdHideAnimId
            target: warningLayoutId
            property: "opacity"
            from:1
            to:0
            easing.type: Easing.InOutQuad
            duration: CustomStyle.themeOpacityChangeTimer
        }
        onFinished: {
            DataSource.sendPluginMsgInt(DataSource.RECV_MSG_ID_THEME_SWITCH_ANIM,DataSource.THEME_SWITCH_HIDE_ANIM_COMPLETE)
        }
    }

    ParallelAnimation{
        id:themeSwithOpacityShowAnimId
        PropertyAnimation{
            //id:driveRangeInfoShowAnimId
            target: driveRangeInfoId
            property: "opacity"
            from:0
            to:1
            easing.type: Easing.InOutQuad
            duration: CustomStyle.themeOpacityChangeTimer
        }
        PropertyAnimation{
            //id:warningLayoutIdShowAnimId
            target: warningLayoutId
            property: "opacity"
            from:0
            to:1
            easing.type: Easing.InOutQuad
            duration: CustomStyle.themeOpacityChangeTimer
        }
        onFinished: {
            DataSource.sendPluginMsgInt(DataSource.RECV_MSG_ID_THEME_SWITCH_ANIM,DataSource.THEME_SWITCH_DISP_ANIM_COMPLETE)
        }
    }

    PropertyAnimation{
        id:terrainSwitchAnim
        target:terrainImageId
        property: "opacity"
        duration: CustomStyle.terrainModeAnimationTimer/2
        from: 1
        to:0
        onFinished: {
            updateTerrainState()
            terrainSwitchAnimSec.start()
        }
    }
    PropertyAnimation{
        id:terrainSwitchAnimSec
        target:terrainImageId
        property: "opacity"
        duration: CustomStyle.terrainModeAnimationTimer/2
        from: 0
        to:1
        onFinished: {
            isOnSwitchTerrainModeAnim = false
            switchTerrainModeAnim()
            updateBgImageSource()
            terrainImageId.visible = false
        }
    }
    ParallelAnimation{
        id:terrainSwitchShowAnim
        PropertyAnimation{
            target: terrainImageId
            property: "opacity"
            from:0
            to:1
            duration: CustomStyle.terrainModeAnimationTimer
        }
        PropertyAnimation{
            target: bgCityImageId
            property: "opacity"
            from:1
            to:0
            duration: CustomStyle.terrainModeAnimationTimer
            onFinished: {
                isOnSwitchTerrainModeAnim = false
                switchTerrainModeAnim()
            }
        }
        onFinished: {
            isOnSwitchTerrainModeAnim = false
            switchTerrainModeAnim()
            updateBgImageSource()
            terrainImageId.visible = false
        }
    }
    ParallelAnimation{
        id:terrainSwitchHideAnim
        PropertyAnimation{
            target: terrainImageId
            duration: CustomStyle.terrainModeAnimationTimer
            property: "opacity"
            from:1
            to:0
        }
        PropertyAnimation{
            target: bgCityImageId
            duration: CustomStyle.terrainModeAnimationTimer
            property: "opacity"
            from:0
            to:1
        }
        onFinished: {
            isOnSwitchTerrainModeAnim = false
            switchTerrainModeAnim()
        }
    }
    //动效 end
}
