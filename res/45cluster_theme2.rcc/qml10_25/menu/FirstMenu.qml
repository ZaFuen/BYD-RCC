import QtQuick 2.12
import com.byd.DataSource 1.0
import com.byd.CenterChild 1.0
import QtQml.Models 2.15

Item {
    id: firstmenuId
    anchors.fill: parent

    property alias pathView: pathview
    property alias level1View: pathview.currentIndex
    property var driveInfoQml: null
    property var speedReminderQml: null
    property var themeQml: null
    property var airVolumeQml: null
    property var airTempQml: null
    property var historyQml: null
    property var accelerateQml: null
    property var naviSelectQml: null
    property bool menuSwitchAnimNeed:false
    property alias bgImage: menuSwitchBgId
    property alias menuItem: menuItemId
    property var model: listModel

    Connections{
        target: DataSource
        function onDilinkNameChanged(){
            updateListModel()
        }
    }

    function createMenuQml(){
        destrotyQml()
        if (level1View === 0){
            createDriveInfoQml()
        }else if (level1View === 1){
            createNaviSelectQml()
        } else if (level1View === 2){
            createSpeedReminderQml()
        }  else if (level1View === 3){
            createAirTempQml()
        } else if (level1View === 4) {
            createAirVolumeQml()
        } else if (level1View === 5) {
            createHistoryFaultQml()
        } else if (level1View === 6) {
            createAccelerationTimerQml()
        }
    }

//    Image {
//        id: bg_shadow_Id
//        source: DataSource.dayNightMode === 0x02?"qrc:/images10_25/menu/night/menu_bg_shadow.png":"qrc:/images10_25/menu/day/menu_bg_shadow.png"
//    }

    Image {
        id: bgId
        x: -400
        y: 8
        source: DataSource.dayNightMode === 0x02?"qrc:/images10_25/menu/night/menu_bg.png":"qrc:/images10_25/menu/day/menu_bg.png"
    }
    Image {
        id: leftIcon
        x: 22+21
        y: 28+13
        source:DataSource.dayNightMode === 0x02?"qrc:/images10_25/menu/night/left_icon.png":"qrc:/images10_25/menu/day/left_icon.png"
    }

    Image {
        id: rightIcon
        anchors.right: parent.right
        anchors.rightMargin: 22+21
        y:28+13
        source:DataSource.dayNightMode === 0x02?"qrc:/images10_25/menu/night/right_icon.png":"qrc:/images10_25/menu/day/right_icon.png"
    }

    Image{
        id: menuSwitchBgId
        anchors.fill: parent
        visible: false
    }

    Item {
        id: menuItemId
        anchors.fill: parent
    }

    PropertyAnimation{
        id: bgAnimId
        target: menuSwitchBgId
        properties: "opacity"
        from:1.0
        to:0
        duration: 240
        easing.type: Easing.InOutQuad
    }

    PropertyAnimation{
        id: menuSwitchAnimId
        target: menuItemId
        properties: "opacity"
        from:0
        to:1.0
        duration: 300
        easing.type: Easing.InOutQuad
        onFinished: {
            menuSwitchBgId.visible = false
        }
    }

    onLevel1ViewChanged: {
        //timerId.start()
        createMenuQml()
        if(menuSwitchAnimNeed){
            menuItemId.visible = true
            menuItemId.opacity = 0
            bgAnimId.start()
            menuSwitchAnimId.start()
            menuSwitchAnimNeed = false
        }
    }

    Timer{
        id: timerId
        interval: 80; running: false; repeat: false
        onTriggered: {
            listModel.setProperty(pathView.currentIndex, "itemScale", 1.2)
            for(var i = 0; i < pathView.count; i++){
                if(i !== pathView.currentIndex){
                    listModel.setProperty(i, "itemScale", 1)
                }
            }
        }
    }

    function updateListModel(){
        listModel.clear()
        listModel.append({day1:"qrc:/images10_25/menu/day/driveInfo.png",day2:"qrc:/images10_25/menu/day/driveInfo_select.png",
                             night1:"qrc:/images10_25/menu/night/driveInfo.png",night2:"qrc:/images10_25/menu/night/driveInfo_select.png", itemScale:1.2,page:1})
        listModel.append({day1:"qrc:/images10_25/menu/day/navi.png",day2:"qrc:/images10_25/menu/day/navi_select.png",
                             night1:"qrc:/images10_25/menu/night/navi.png",night2:"qrc:/images10_25/menu/night/navi_select.png", itemScale:1,page:2})
        listModel.append({day1:"qrc:/images10_25/menu/day/speed_reminder.png",day2:"qrc:/images10_25/menu/day/speed_reminder_select.png",
                             night1:"qrc:/images10_25/menu/night/speed_reminder.png",night2:"qrc:/images10_25/menu/night/speed_reminder_select.png",itemScale:1,page:3})
        listModel.append({day1:"qrc:/images10_25/menu/day/air_temp.png",day2:"qrc:/images10_25/menu/day/air_temp_select.png",
                             night1:"qrc:/images10_25/menu/night/air_temp.png",night2:"qrc:/images10_25/menu/night/air_temp_select.png",itemScale:1,page:4})
        listModel.append({day1:"qrc:/images10_25/menu/day/air_volume.png",day2:"qrc:/images10_25/menu/day/air_volume_select.png",
                             night1:"qrc:/images10_25/menu/night/air_volume.png",night2:"qrc:/images10_25/menu/night/air_volume_select.png",itemScale:1,page:6})
        listModel.append({day1:"qrc:/images10_25/menu/day/history_fault.png",day2:"qrc:/images10_25/menu/day/history_fault_select.png",
                             night1:"qrc:/images10_25/menu/night/history_fault.png",night2:"qrc:/images10_25/menu/night/history_fault_select.png", itemScale:1,page:5})
        listModel.append({day1:"qrc:/images10_25/menu/day/acceleration.png",day2:"qrc:/images10_25/menu/day/acceleration_select.png",
                             night1:"qrc:/images10_25/menu/night/acceleration.png",night2:"qrc:/images10_25/menu/night/acceleration_select.png",itemScale:1,page:7})
    }

    //一级菜单
    Rectangle {
        id: rect
        y: 15+13
        width: 573
        height: 60
        anchors.horizontalCenter: parent.horizontalCenter
        color: "transparent"

        ListModel {  //保存数据
            id:listModel;
            property bool completed:false
            Component.onCompleted: {
                updateListModel()
                completed = true
            }
        }

        PathView {
            id:pathview
            anchors.fill: parent;
            delegate: pathDelegate;
            model: listModel;
            preferredHighlightBegin:0.5;
            preferredHighlightEnd:0.5;
            pathItemCount: 5
            maximumFlickVelocity:20000

            path:Path {
                startX: -30;startY:rect.height/2;
                PathLine {x:rect.width/2; y:rect.height/2;}
                PathPercent {value:0.5}
                PathLine {x:rect.width + 30;y:rect.height/2;}       //终点
                PathPercent {value:1}
            }
        }

        Component {   //代理容器
            id: pathDelegate

            Rectangle {
                id: listItem
                width: 62
                height: 60
                color: "transparent"
                z: PathView.isCurrentItem ? 10 : 0

                Image {
                    id: imgself
                    source: {
                        if (DataSource.dayNightMode === 0x02){
                            listItem.PathView.isCurrentItem ? model.night2 : model.night1
                        }else{
                            listItem.PathView.isCurrentItem ? model.day2 : model.day1
                        }
                    }
                    //scale: model.itemScale
                    anchors.centerIn: parent
                    cache: false
                    Behavior on x{
                        PropertyAnimation{
                            easing.type: Easing.InOutQuad
                        }
                    }
                }
            }
        }

        Component.onCompleted: {
            createMenuQml()
        }
    }

    function createDriveInfoQml(){
        var component = Qt.createComponent("qrc:/qml10_25/menu/DrivingInfo.qml");
        if (component.status === Component.Ready) {
            driveInfoQml = component.createObject(menuItemId)
        }
    }

    function createNaviSelectQml(){
        var component = Qt.createComponent("qrc:/qml10_25/menu/NaviSelect.qml");
        if (component.status === Component.Ready) {
            naviSelectQml = component.createObject(menuItemId)
        }
    }


    function createSpeedReminderQml(){
        var component = Qt.createComponent("qrc:/qml10_25/menu/SpeedReminder.qml");
        if (component.status === Component.Ready) {
            speedReminderQml = component.createObject(menuItemId)
        }
    }

    function createAirVolumeQml() {
        var component = Qt.createComponent("qrc:/qml10_25/menu/AirVolume.qml");
        if (component.status === Component.Ready) {
            airVolumeQml = component.createObject(menuItemId)
        }
    }

    function createThemeQml() {
        var component = Qt.createComponent("qrc:/qml10_25/menu/ThemeSwitch.qml");
        if (component.status === Component.Ready) {
            themeQml = component.createObject(menuItemId)
        }
    }

    function createAirTempQml() {
        var component = Qt.createComponent("qrc:/qml10_25/menu/AirTemp.qml");
        if (component.status === Component.Ready) {
            airTempQml = component.createObject(menuItemId)
        }
    }

    function createHistoryFaultQml() {
        var component = Qt.createComponent("qrc:/qml10_25/menu/HistoryFault.qml");
        if (component.status === Component.Ready) {
            historyQml = component.createObject(menuItemId)
        }
    }

    function createAccelerationTimerQml(){
        var component = Qt.createComponent("qrc:/qml10_25/menu/AccelerationTimer.qml");
        if (component.status === Component.Ready) {
            accelerateQml = component.createObject(menuItemId)
        }
    }

    function destrotyQml(){
        if (driveInfoQml){
            driveInfoQml.destroy()
        }
        if (naviSelectQml){
            naviSelectQml.destroy()
        }
        if (speedReminderQml){
            speedReminderQml.destroy()
        }
        if(themeQml){
            themeQml.destroy()
        }
        if(airVolumeQml) {
            airVolumeQml.destroy()
        }
        if(historyQml){
            historyQml.destroy()
        }
        if(airTempQml){
            airTempQml.destroy()
        }
        if(accelerateQml){
            accelerateQml.destroy()
        }
    }
}
