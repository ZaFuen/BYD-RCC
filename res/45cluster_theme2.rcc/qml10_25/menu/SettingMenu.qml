import QtQuick 2.12
import com.byd.DataSource 1.0
import com.byd.CenterChild 1.0
import QtQml.Models 2.15

CenterChild{
    id: settingMenuId
    width: 751
    height: 453
    y: 140
    x: 588
    property int keyCount: 0
    property var firstQml: null
    property alias keyTimer: keyTimerId
    Component.onCompleted: {
        //        DataSource.sendPluginMsgInt(DataSource.RECV_MSG_ID_MENU_DISPLAY_STATE, 1)
        var component = Qt.createComponent("qrc:/qml10_25/menu/FirstMenu.qml");
        if(firstQml){
            firstQml.destroy()
        }
        firstQml = component.createObject(settingMenuId)
        firstQml.pathView.positionViewAtIndex(DataSource.menuIndex,PathView.Center)
        //        keyTimerId.start()
        //        DataSource.sendPluginMsgInt(DataSource.RECV_MSG_ID_MENU_DISPLAY_PAGE, DataSource.menuIndex)
    }

    Timer{
        id: menuTimerId
        interval: 2000; running: false; repeat: false
        onTriggered: {
            if (firstQml.airVolumeQml){
                firstQml.airVolumeQml.volumeValue = Qt.binding(function(){ return DataSource.acVolumeLevel})
            }else if(firstQml.airTempQml){
                firstQml.airTempQml.tempValue = Qt.binding(function(){ return DataSource.acTemperature})
            }else if(firstQml.speedReminderQml){
                firstQml.speedReminderQml.speedValue = Qt.binding(function(){ return DataSource.speedReminder})
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

    Timer{
        id: keyTimerId
        interval: 1000;
        running: false;
        repeat: true;
        onTriggered: {
            keyCount ++
            if (keyCount > 7) {
                console.log("keyTimerId.onTriggered + Time === " +  new Date().getTime())
                if (DataSource.menuNeedDisplay === DataSource.UI_DISPLAY) {
                    DataSource.sendPluginMsgInt(DataSource.RECV_MSG_ID_MENU_DISPLAY_STATE, 2)
                }
                keyTimerId.stop()
            }
        }
    }

    function menuGrabToImage(value){
        var preTimeStamp =new Date().getTime()
        firstQml.menuItem.grabToImage(function(result) {
            console.log("menu grabToImage use "+(new Date().getTime() - preTimeStamp))
            firstQml.menuItem.visible = false
            firstQml.bgImage.source = result.url
            firstQml.bgImage.visible = true
            firstQml.menuSwitchAnimNeed = true
            if(value === DataSource.SEND_MSG_ID_KEY_RIGHT){
                firstQml.pathView.incrementCurrentIndex()
                DataSource.sendPluginMsgInt(DataSource.RECV_MSG_ID_MENU_DISPLAY_PAGE, firstQml.pathView.currentIndex)
            }else if(value === DataSource.SEND_MSG_ID_KEY_LEFT){
                firstQml.pathView.decrementCurrentIndex()
                DataSource.sendPluginMsgInt(DataSource.RECV_MSG_ID_MENU_DISPLAY_PAGE, firstQml.pathView.currentIndex)
            }
        })
    }

    function driveGrabToImage(value){
        var preTimeStamp =new Date().getTime()
        firstQml.driveInfoQml.driveItem.grabToImage(function(result) {
            console.log("drive grabToImage use "+(new Date().getTime() - preTimeStamp))
            firstQml.driveInfoQml.driveItem.visible = false
            firstQml.driveInfoQml.bgImage.source = result.url
            firstQml.driveInfoQml.bgImage.visible = true
            firstQml.driveInfoQml.switchAnimNeed = true

            if(value === DataSource.SEND_MSG_ID_KEY_UP){
                firstQml.driveInfoQml.upDownState = 1
                if(firstQml.driveInfoQml.pathView.currentIndex === 0){
                    firstQml.driveInfoQml.pathView.currentIndex =  firstQml.driveInfoQml.listmodelInfo.count-1
                }else{
                    firstQml.driveInfoQml.pathView.decrementCurrentIndex()
                }
                DataSource.sendPluginMsgInt(DataSource.RECV_MSG_ID_MENU_DRIVEINFO_PAGE, firstQml.driveInfoQml.listmodelInfo.get(firstQml.driveInfoQml.pathView.currentIndex).page)
            }else if(value === DataSource.SEND_MSG_ID_KEY_DOWN){
                firstQml.driveInfoQml.upDownState = 2
                if(firstQml.driveInfoQml.pathView.currentIndex === firstQml.driveInfoQml.listmodelInfo.count-1){
                    firstQml.driveInfoQml.pathView.currentIndex = 0
                }else{
                    firstQml.driveInfoQml.pathView.incrementCurrentIndex()
                }
                DataSource.sendPluginMsgInt(DataSource.RECV_MSG_ID_MENU_DRIVEINFO_PAGE, firstQml.driveInfoQml.listmodelInfo.get(firstQml.driveInfoQml.pathView.currentIndex).page)
            }
        })
    }

    function driveReboundGrabToImage(value){
        var preTimeStamp =new Date().getTime()
        firstQml.driveInfoQml.driveItem.grabToImage(function(result) {
            console.log("drive rebound grabToImage use "+(new Date().getTime() - preTimeStamp))
            firstQml.driveInfoQml.driveItem.visible = false
            firstQml.driveInfoQml.bgImage.source = result.url
            firstQml.driveInfoQml.bgImage.visible = true

            if(value === DataSource.SEND_MSG_ID_KEY_UP){
                firstQml.driveInfoQml.upReboundAnim.start()
            }else if(value === DataSource.SEND_MSG_ID_KEY_DOWN){
                firstQml.driveInfoQml.downReboundAnim.start()
            }
        })
    }

    onKeyMsgSignal: {
        keyCount = 0
        keyTimerId.restart()
        console.log("keyTimerId.restart() + Time === " +  new Date().getTime())
        if(key === DataSource.SEND_MSG_ID_KEY_RIGHT){
            menuGrabToImage(DataSource.SEND_MSG_ID_KEY_RIGHT)
        } else if (key === DataSource.SEND_MSG_ID_KEY_LEFT){
            menuGrabToImage(DataSource.SEND_MSG_ID_KEY_LEFT)
        } else if (key === DataSource.SEND_MSG_ID_KEY_UP){
            switch(firstQml.model.get(firstQml.pathView.currentIndex).page){
            case 1:
                /*
                if(firstQml.driveInfoQml.pathView.currentIndex === 0){
                    if(!firstQml.driveInfoQml.isUpReboundAnimPlay && !firstQml.driveInfoQml.isUpAnimPlay){
                        firstQml.driveInfoQml.isUpReboundAnimPlay = true
                        driveReboundGrabToImage(DataSource.SEND_MSG_ID_KEY_UP)
                    }
                }else{
                    if(!firstQml.driveInfoQml.isUpAnimPlay && !firstQml.driveInfoQml.isUpReboundAnimPlay){
                        firstQml.driveInfoQml.isUpAnimPlay = true
                        driveGrabToImage(DataSource.SEND_MSG_ID_KEY_UP)
                    }
                }
                */
                if(firstQml.driveInfoQml.pathView.count < 2){
                    console.log("Key ignored, because drive info count < 2")
                    return
                }
                if(!firstQml.driveInfoQml.isUpAnimPlay){
                    firstQml.driveInfoQml.isUpAnimPlay = true
                    driveGrabToImage(DataSource.SEND_MSG_ID_KEY_UP)
                }
                break;
            case 2:
                firstQml.naviSelectQml.naviView.decrementCurrentIndex()
                break;
            case 3:
                turnUpSpeedReminder()
                break;

            case 4:
                turnUpAcTemp()
                break;
            case 5:
                if(DataSource.historyFaultCount !==0 ){
                    firstQml.historyQml.listView.decrementCurrentIndex()
                }
                break;
            case 6:
                turnUpAcVolume()
                break;
            }
        } else if (key === DataSource.SEND_MSG_ID_KEY_DOWN){
            switch(firstQml.model.get(firstQml.pathView.currentIndex).page){
            case 1:
                /*
                if(firstQml.driveInfoQml.pathView.currentIndex === firstQml.driveInfoQml.model.count-1){
                    if(!firstQml.driveInfoQml.isDownReboundAnimPlay && !firstQml.driveInfoQml.isDownAnimPlay){
                        firstQml.driveInfoQml.isDownReboundAnimPlay = true
                        driveReboundGrabToImage(DataSource.SEND_MSG_ID_KEY_DOWN)
                    }
                }else{
                    if(!firstQml.driveInfoQml.isDownAnimPlay && !firstQml.driveInfoQml.isDownReboundAnimPlay){
                        firstQml.driveInfoQml.isDownAnimPlay = true
                        driveGrabToImage(DataSource.SEND_MSG_ID_KEY_DOWN)
                    }
                }
                */
                if(firstQml.driveInfoQml.pathView.count < 2){
                    console.log("Key ignored, because drive info count < 2")
                    return
                }
                if(!firstQml.driveInfoQml.isDownAnimPlay){
                    firstQml.driveInfoQml.isDownAnimPlay = true
                    driveGrabToImage(DataSource.SEND_MSG_ID_KEY_DOWN)
                }
                break;
            case 2:
                firstQml.naviSelectQml.naviView.incrementCurrentIndex()
                break;
            case 3:
                turnDownSpeedReminder()
                break;

            case 4:
                turnDownAcTemp()
                break;
            case 5:
                if(DataSource.historyFaultCount !==0 ){
                    firstQml.historyQml.listView.incrementCurrentIndex()
                }
                break;
            case 6:
                turnDownAcVolume()
                break;
            }
        } else if (key === DataSource.SEND_MSG_ID_KEY_OK){
            sendTimerId.stop()
            switch(firstQml.model.get(firstQml.pathView.currentIndex).page){
            case 1:
                if(firstQml.driveInfoQml.listmodelInfo.count <= 0){
                    console.log(" OK has returned , because driveinfo count <=0")
                    return
                }
                DataSource.sendPluginMsgInt(DataSource.RECV_MSG_ID_DRIVEINFO_DISPLAY_PAGE, firstQml.driveInfoQml.listmodelInfo.get(firstQml.driveInfoQml.pathView.currentIndex).page)
                if(DataSource.menuSendScheme === 0){
                    sendTimerId.start()
                }
                console.log("press ok driveinfo time: " + new Date().getTime())
                break;
            case 2:
                DataSource.sendPluginMsgInt(DataSource.RECV_MSG_ID_NAVI_TYPE, firstQml.naviSelectQml.model.get(firstQml.naviSelectQml.naviView.currentIndex).state)
                if(DataSource.menuSendScheme === 0){
                    sendTimerId.start()
                }
                console.log("press ok navi time: " + new Date().getTime())
                if(firstQml.naviSelectQml.model.get(firstQml.naviSelectQml.naviView.currentIndex).state !== 1){
                    if(centerContainerId.isNaviMap === true){
                        centerContainerId.isNaviMap = false
                    }
                    centerContainerId.isNaviMap = true
                }
                console.log("isNaviMap = : " + centerContainerId.isNaviMap)
                //20231010,xiaofan add for dilink-4.0#13169
                DataSource.sendPluginMsgInt(DataSource.RECV_MSG_ID_MENU_NAVI_TYPE, firstQml.naviSelectQml.naviView.currentIndex)
                console.log("firstQml.naviSelectQml.naviView.currentIndex = : " + firstQml.naviSelectQml.naviView.currentIndex)
                break;
            case 3:
                DataSource.sendPluginMsgInt(DataSource.RECV_MSG_ID_MENU_DISPLAY_STATE, 2)
                console.log("press ok speedReminder time: " + new Date().getTime())
                break;

            case 4:
                DataSource.sendPluginMsgInt(DataSource.RECV_MSG_ID_MENU_DISPLAY_STATE, 2)
                console.log("press ok airTemp time: " + new Date().getTime())
                break;
            case 5:
                DataSource.sendPluginMsgInt(DataSource.RECV_MSG_ID_MENU_DISPLAY_STATE, 2)
                console.log("press ok historyFault time: " + new Date().getTime())
                break;
            case 6:
                DataSource.sendPluginMsgInt(DataSource.RECV_MSG_ID_MENU_DISPLAY_STATE, 2)
                console.log("press ok airVolume time: " + new Date().getTime())
                break;
            case 7:
                DataSource.sendPluginMsgInt(DataSource.RECV_MSG_ID_MENU_ACCELERATE_TIMER, 1)
                if(DataSource.menuSendScheme === 0){
                    sendTimerId.start()
                }
                console.log("press ok acc time: " + new Date().getTime())
                break;
            }
        }else if (key === DataSource.SEND_MSG_ID_KEY_BACK){
            DataSource.sendPluginMsgInt(DataSource.RECV_MSG_ID_MENU_DISPLAY_STATE, 2)
        }else if(key === DataSource.SEND_MSG_ID_KEY_LONG_PRESS){
            if(firstQml.pathView.currentIndex === 0){
                if(firstQml.driveInfoQml.listmodelInfo.count <= 0){
                    console.log("Long press has returned , because driveinfo count <=0")
                    return
                }
                sendTimerId.stop()
                switch(firstQml.driveInfoQml.listmodelInfo.get(firstQml.driveInfoQml.pathView.currentIndex).page){
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
                }
            }
        }
    }

    function turnUpAcVolume(){
        menuTimerId.stop()
        if (firstQml.airVolumeQml.volumeValue === 7){
            firstQml.airVolumeQml.volumeValue = 7
        }

        if (firstQml.airVolumeQml.volumeValue < 7){
            firstQml.airVolumeQml.volumeValue++
        }
        DataSource.sendPluginMsgInt(DataSource.RECV_MSG_ID_MENU_AC_VOLUME,firstQml.airVolumeQml.volumeValue)
        menuTimerId.start()
    }

    function turnDownAcVolume(){
        menuTimerId.stop()
        if (firstQml.airVolumeQml.volumeValue > 1){
            firstQml.airVolumeQml.volumeValue--
            DataSource.sendPluginMsgInt(DataSource.RECV_MSG_ID_MENU_AC_VOLUME,firstQml.airVolumeQml.volumeValue)
        }else {
            firstQml.airVolumeQml.volumeValue = 0
            DataSource.sendPluginMsgInt(DataSource.RECV_MSG_ID_MENU_AC_VOLUME,8)
        }
        menuTimerId.start()
    }

    function turnUpAcTemp(){
        if(firstQml.airTempQml.acVentilationFlag){
            firstQml.airTempQml.acVentilationFlag=false
        }
        menuTimerId.stop()
        if(DataSource.acTemperatureUnit === 1){
            upAcTemp(91, 64)
        }else{
            upAcTemp(33, 17)
        }
        DataSource.sendPluginMsgInt(DataSource.RECV_MSG_ID_MENU_AC_TEMPERATURE,firstQml.airTempQml.tempValue)
        menuTimerId.start()
    }
    function upAcTemp(max, min){
        if (firstQml.airTempQml.tempValue === max){
            return
        }

        if (firstQml.airTempQml.tempValue < min){
            firstQml.airTempQml.tempValue = min
        }else if (firstQml.airTempQml.tempValue < max){
            firstQml.airTempQml.tempValue++;
        }else{
            firstQml.airTempQml.tempValue = max
        }
    }

    function turnDownAcTemp(){
        if(firstQml.airTempQml.acVentilationFlag){
            firstQml.airTempQml.acVentilationFlag=false
        }
        menuTimerId.stop()
        if(DataSource.acTemperatureUnit === 1){
            downAcTemp(91, 64)
        }else{
            downAcTemp(33, 17)
        }
        DataSource.sendPluginMsgInt(DataSource.RECV_MSG_ID_MENU_AC_TEMPERATURE,firstQml.airTempQml.tempValue)
        menuTimerId.start()
    }

    function downAcTemp(max, min){
        if (firstQml.airTempQml.tempValue === min){
            return
        }

        if (firstQml.airTempQml.tempValue > max){
            firstQml.airTempQml.tempValue = max;
        }else if (firstQml.airTempQml.tempValue > min){
            firstQml.airTempQml.tempValue--;
        }else{
            firstQml.airTempQml.tempValue = min;
        }
    }

    function turnUpSpeedReminder(){
        menuTimerId.stop()
        if(DataSource.speedReminderUnit !== 2){
            upSpeedReminder(150, 60, 10)
        }else{
            upSpeedReminder(93, 35, 5)
        }
        DataSource.sendPluginMsgInt(DataSource.RECV_MSG_ID_MENU_SPEED_REMINDER,firstQml.speedReminderQml.speedValue)
        menuTimerId.start()
    }

    function turnDownSpeedReminder(){
        menuTimerId.stop()
        if(DataSource.speedReminderUnit !== 2){
            downSpeedReminder(150, 60, 10)
        }else{
            downSpeedReminder(90, 35, 5)
        }
        DataSource.sendPluginMsgInt(DataSource.RECV_MSG_ID_MENU_SPEED_REMINDER,firstQml.speedReminderQml.speedValue)
        menuTimerId.start()
    }

    function upSpeedReminder(max, min, step){
        if (firstQml.speedReminderQml.speedValue < min){
            firstQml.speedReminderQml.speedValue = min
        } else if(firstQml.speedReminderQml.speedValue < max){
            if(firstQml.speedReminderQml.speedValue%step !==0){
                firstQml.speedReminderQml.speedValue = step*Math.ceil(firstQml.speedReminderQml.speedValue/step)
            }else{
                if(firstQml.speedReminderQml.speedValue+step > max){
                    return
                }else{
                    firstQml.speedReminderQml.pathView.decrementCurrentIndex()
                    firstQml.speedReminderQml.speedValue += step
                }
            }
        }else if (firstQml.speedReminderQml.speedValue === 241){
            firstQml.speedReminderQml.pathView.decrementCurrentIndex()
            firstQml.speedReminderQml.speedValue = min
        }else {
            firstQml.speedReminderQml.speedValue = max
        }
    }
    function downSpeedReminder(max, min, step){
        if(firstQml.speedReminderQml.speedValue === 241){
            return
        }
        if (firstQml.speedReminderQml.speedValue > max){
            firstQml.speedReminderQml.speedValue = max
        } else if(firstQml.speedReminderQml.speedValue >= min){
            if(firstQml.speedReminderQml.speedValue%step !==0){
                firstQml.speedReminderQml.speedValue = step*Math.floor(firstQml.speedReminderQml.speedValue/step)
            }else{
                firstQml.speedReminderQml.pathView.incrementCurrentIndex()
                if(firstQml.speedReminderQml.speedValue-step < min){
                    firstQml.speedReminderQml.speedValue = 241
                }else{
                    firstQml.speedReminderQml.speedValue -= step
                }
            }
        } else {
            firstQml.speedReminderQml.speedValue = 241
        }
    }
}

