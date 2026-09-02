import QtQuick 2.15
import com.byd.DataSource 1.0
import com.byd.WarningLight 1.0
import com.byd.CenterChild 1.0
import "qrc:/common/singleton"
CenterChild {
    id:dischargeInterfaceId
    width:1920
    height:720
    Image{
        id:bgImageId
        source:DataSource.dayNightMode === 0x02?rootItemId.bgnight:rootItemId.bgday
        anchors.fill: parent
        cache:false
        visible: DataSource.dischargeInterfaceIndex === 1||DataSource.dischargeInterfaceIndex === 2||DataSource.dischargeInterfaceIndex === 3||DataSource.dischargeInterfaceIndex === 4||DataSource.dischargeInterfaceIndex === 5
    }
    Item{
        id:item_time
        x:265
        anchors.bottom: title.bottom
        anchors.bottomMargin: -8
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

    Item{
        id:title
        anchors.horizontalCenter: bgImageId.horizontalCenter
        y:28
        height:46
        width:1643
        visible: bgImageId.visible

        Text{
            id:title_text
            anchors.horizontalCenter: parent.horizontalCenter
            anchors.bottom: parent.bottom
            anchors.bottomMargin: 5
            height: 40
            verticalAlignment: Text.Text.AlignVCenter
            color:DataSource.dayNightMode === 0x02?"white":"black"
            font.pixelSize: 42
            horizontalAlignment: Text.AlignHCenter
            text: {
                if(DataSource.dischargeInterfaceIndex === 0x01){
                    TranslateStr.dischargeInterface_connectStr
                }else if(DataSource.dischargeInterfaceIndex === 0x02){
                    TranslateStr.dischargeInterface_dischargingStr
                }else if(DataSource.dischargeInterfaceIndex === 0x03){
                    TranslateStr.dischargeInterface_dischargingEndStr
                }else if(DataSource.dischargeInterfaceIndex === 0x04){
                    TranslateStr.dischargeInterface_dischargingFailStr
                }else if(DataSource.dischargeInterfaceIndex === 0x05){
                    TranslateStr.dischargeInterface_dischargingInterruptStr
                }else{
                    ""
                }
            }
        }
    }

    Image {
        id: topline
        source: "qrc:/images10_25/chargeDischarge/topline.png"
        anchors.horizontalCenter: bgImageId.horizontalCenter
        cache:false
        anchors.top: title.bottom
        anchors.topMargin: 8
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
        function onDischargeInterfaceIndexChanged() {
            updateDischargeInterfaceDisplay()
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

    function updateDischargeInterfaceDisplay(){
        switch(DataSource.dischargeInterfaceIndex){
        case 1:
            loader.source = "qrc:/qml10_25/dischargeInterface/DischargeConnecting.qml"
            break
        case 2:
        case 3:
        case 4:
        case 5:
            loader.source = "qrc:/qml10_25/dischargeInterface/Discharging.qml"
            break
        default:
            loader.source = ""
            break
        }
    }
}
