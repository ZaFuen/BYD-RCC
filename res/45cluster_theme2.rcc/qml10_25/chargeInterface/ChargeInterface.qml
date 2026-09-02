import QtQuick 2.15
import com.byd.DataSource 1.0
import com.byd.WarningLight 1.0
import com.byd.CenterChild 1.0
import "qrc:/common/singleton"
CenterChild {
    id:chargeInterfaceId
    width:1920
    height:720
    Image{
        id:bgImageId
        source:DataSource.dayNightMode === 0x02?rootItemId.bgnight:rootItemId.bgday
        anchors.fill: parent
        cache:false
        visible: DataSource.chargeInterfaceIndex === 2||DataSource.chargeInterfaceIndex === 3||DataSource.chargeInterfaceIndex === 4||DataSource.chargeInterfaceIndex === 5||DataSource.chargeInterfaceIndex === 7
    }
    Item{
        id:item_time
        x:265
        anchors.bottom: title.bottom
        anchors.bottomMargin: -10
        height:36
        width:DataSource.timeFormat === 1?am_pm.width+6+time.width:time.width
        visible: bgImageId.visible
        LayoutMirroring.enabled: DataSource.language === 0x1?true:false
        LayoutMirroring.childrenInherit: DataSource.language === 0x1?true:false
        Text {
            font.bold:rootItemId.jiacu === 1
            font.family: rootItemId.ziti
            id: am_pm
            anchors.left: time.right
            anchors.leftMargin: 6
            anchors.baseline: time.baseline
            anchors.baselineOffset: DataSource.language === 0x1?-3:0
            opacity: 0.75
            font.pixelSize: 30
            color: DataSource.dayNightMode === 0x02?"white":"black"
            text: currentTimeformat()
            visible:DataSource.timeFormat === 1
        }
        Text{
            font.bold:rootItemId.jiacu === 1
            font.family: rootItemId.ziti
            id: time
            anchors.left: item_time.left
            anchors.bottom: parent.bottom
            anchors.bottomMargin: 9
            font.pixelSize: 45
            color: DataSource.dayNightMode === 0x02?"white":"black"
            text: currentDateTime()
        }

        Timer{
            interval:1000
            running:true
            repeat:true
            onTriggered:{
                time.text = currentDateTime()
                am_pm.text = currentTimeformat()
            }
        }
    }

    Rectangle{
        id:title
        anchors.horizontalCenter: bgImageId.horizontalCenter
        y:30
        width:chargeIcon.width+21+title_text.width
        height:41
        color: "transparent"
        visible: bgImageId.visible
        Image{
            id:chargeIcon
            anchors.bottom: title.bottom
            anchors.bottomMargin: DataSource.language === 0x02 ?(41-chargeIcon.height)/2:(41-chargeIcon.height)/2+6
            source:{
                if(DataSource.dayNightMode === 0x02){
                    DataSource.language === 0x02 ?"qrc:/images10_25/chargeDischarge/night/charge_en.png":"qrc:/images10_25/chargeDischarge/night/charge_zh.png"
                }else{
                    DataSource.language === 0x02 ?"qrc:/images10_25/chargeDischarge/day/charge_en.png":"qrc:/images10_25/chargeDischarge/day/charge_zh.png"
                }
            }
            cache:false
        }
        Text{
            id:title_text
            anchors.left: chargeIcon.right
            anchors.leftMargin: 21
            anchors.bottom: title.bottom
            anchors.bottomMargin: -3
            text: {
                if(DataSource.chargeInterfaceIndex === 0x02){
                    TranslateStr.chargeInterface_connectingStr
                }else if(DataSource.chargeInterfaceIndex === 0x03){
                    if(DataSource.safetyBateryDisplay === 1 || DataSource.usingPlanDisplay === 1){
                        TranslateStr.chargeInterface_charging2Str
                    }else{
                        TranslateStr.chargeInterface_chargingStr
                    }
                }else if(DataSource.chargeInterfaceIndex === 0x04){
                    TranslateStr.chargeInterface_chargingCompletedStr
                }else if(DataSource.chargeInterfaceIndex === 0x05){
                    TranslateStr.chargeInterface_chargingSuspendedStr
                }else if(DataSource.chargeInterfaceIndex === 0x07){
                    if(DataSource.vehicleType === 0x1){
                        TranslateStr.chargeInterface_ev_reserveCountdownStr
                    }
                    else if(DataSource.vehicleType === 0x2){
                        TranslateStr.chargeInterface_hev_reserveCountdownStr
                    }else{
                        ""
                    }
                }else{
                    ""
                }
            }
            color:DataSource.dayNightMode === 0x02?"white":"black"
            font.pixelSize: 42
            horizontalAlignment: Text.AlignHCenter
        }
    }

    Image {
        id: topline
        source: "qrc:/images10_25/chargeDischarge/topline.png"
        anchors.horizontalCenter: bgImageId.horizontalCenter
        anchors.top: title.bottom
        anchors.topMargin: 12
        cache:false
        visible: bgImageId.visible
    }

    Loader{
        id:loader
        source:""
    }

    WarningLight{
        id: batteryWarningLightId
        x: 589
        y: 666
        displayState: DataSource.lowPowerBatLight
        Image{
            id: batteryWarningLightImageId
            source: "qrc:/images10_25/warninglight/lowBat.png"
        }
    }

    WarningLight{
        id: fuelWarningLightId
        x: 1259
        y: 667
        displayState: DataSource.lowFuelLight
        Image{
            id: fuelWarningLightImageId
            source: "qrc:/images10_25/warninglight/lowFuelLight.png"
        }
    }

    Connections {
        target:DataSource
        function onChargeInterfaceIndexChanged() {
            updateChargeInterfaceDisplay()
        }
        function onTimeFormatChanged(){
            time.text = currentDateTime()
        }
        function onTranslateLoadCompleteChanged(){
            am_pm.text = currentTimeformat()
        }
    }
    function currentDateTime(){
        if(DataSource.timeFormat === 2){
            return Qt.formatDateTime(new Date(), "hh:mm");
        }else if(DataSource.timeFormat === 1){
            var hour = Qt.formatDateTime(new Date(), "hh")
            if(hour < 1){
                return "12:" + Qt.formatDateTime(new Date(), "mm")
            }else if (hour < 12){
                return Qt.formatDateTime(new Date(), "h:mm")
            }else if(hour < 13) {
                return Qt.formatDateTime(new Date(), "hh:mm")
            }else{
                return (hour-12)+ ":" + Qt.formatDateTime(new Date(), "mm")
            }
        }
    }
    function currentTimeformat(){
        var hour = Qt.formatDateTime(new Date(), "hh")
        if(hour >11){
            return TranslateStr.chargeInterface_pmStr
        }
        else{
            return TranslateStr.chargeInterface_amStr
        }
    }

    function updateChargeInterfaceDisplay(){
        switch(DataSource.chargeInterfaceIndex){
        case 2:
            loader.source = "qrc:/qml10_25/chargeInterface/ChargeConnecting.qml"
            break
        case 3:
        case 4:
        case 5:
            loader.source = "qrc:/qml10_25/chargeInterface/Charging.qml"
            break
        case 7:
            loader.source = "qrc:/qml10_25/chargeInterface/ReserveCountdown.qml"
            break
        default:
            loader.source = ""
            break
        }
    }
}
