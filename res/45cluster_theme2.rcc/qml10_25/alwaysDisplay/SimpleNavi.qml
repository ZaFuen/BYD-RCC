import QtQuick 2.0
import QtQuick.Controls 1.5
import QtQuick.Layouts 1.3
import com.byd.DataSource 1.0
import com.byd.CenterChild 1.0
import "qrc:/common/singleton"
CenterChild {
    y: 193

    Connections{
        target: DataSource

        function onDayNightModeChanged(){
            updateIcon(DataSource.turnIconId,DataSource.roungAboutNum,nextIconImg,"nextIcon")
            updateIcon(DataSource.nextNextTurnIconId,DataSource.nextRoungAboutNum,nextNextTurnIconImg,"nextNextIcon")
            updateNextNextInfo()
        }
        //下个路口图标
        function onTurnIconIdChanged(){
            updateIcon(DataSource.turnIconId,DataSource.roungAboutNum,nextIconImg,"nextIcon")
        }
        //下个路口环岛出口序号
        function onRoungAboutNumChanged(){
            updateIcon(DataSource.turnIconId,DataSource.roungAboutNum,nextIconImg,"nextIcon")
            updateNextNextInfo()
        }
        function onNextRoadDisAutoChanged(){
            updateNextRoadDisAuto()
        }
        //下下个路口图标
        function onNextNextTurnIconIdChanged(){
            updateNextNextInfo()
        }
        //下下个路口环岛出口序号
        function onNextRoungAboutNumChanged(){
            updateNextNextInfo()
        }

        function onRouteRemainDisAutoChanged(){
            updateRouteRemainInfo()
        }
        function onRouteRemainTimeAutoChanged(){
            updateRouteRemainInfo()
        }
        function onEtaArrivalTimeChanged(){
            updateRouteRemainInfo()
        }
        function onNextNextRoadDistChanged(){
            updateNextNextInfo()
        }
    }

    function updateNextNextInfoText(){
        var distance = ""
        var unit = ""
        if(DataSource.nextNextRoadDist<1000){
            distance = DataSource.nextNextRoadDist
            unit = "米"
            nextNextInfoText.text = "随后"+distance+unit
        }else if(1000<=DataSource.nextNextRoadDist && DataSource.nextNextRoadDist<10000){
            distance = Math.floor(DataSource.nextNextRoadDist/100)/10
            unit = "公里"
            nextNextInfoText.text = "随后"+distance+unit
        }else if(DataSource.nextNextRoadDist === 10000){
            distance = "隧道内分岔"
            unit = ""
            nextNextInfoText.text = distance
        }else if(DataSource.nextNextRoadDist === 20000){
            distance = "出隧道后"
            unit = ""
            nextNextInfoText.text = distance
        }else if(30000<=DataSource.nextNextRoadDist && DataSource.nextNextRoadDist<40000){
            distance = DataSource.nextNextRoadDist-30000
            unit = distance<1000?"米":"公里"
            nextNextInfoText.text = "左侧随后"+distance+unit
        }else if(40000<=DataSource.nextNextRoadDist && DataSource.nextNextRoadDist<50000){
            distance = DataSource.nextNextRoadDist-40000
            unit = distance<1000?"米":"公里"
            nextNextInfoText.text = "右侧随后"+distance+unit
        }else{
            distance = Math.round(DataSource.nextNextRoadDist/1000)
            unit = "公里"
            nextNextInfoText.text = "随后"+distance+unit
        }
    }

    function updateNextRoadDisAuto(){
        if (DataSource.nextRoadDisAuto.slice(-1) === "米"){
            nextDistanceId.text = DataSource.nextRoadDisAuto.slice(0, -1)
            nextDisUnitId.text = "米"
            nextDistanceId.font.pixelSize = 60
            nextDisUnitId.visible = 1
            forwardStateId.visible = 1
        }else if(DataSource.nextRoadDisAuto.slice(-1) === "里"){
            nextDistanceId.text = DataSource.nextRoadDisAuto.slice(0, -2)
            nextDisUnitId.text = "公里"
            nextDistanceId.font.pixelSize = 60
            nextDisUnitId.visible = 1
            forwardStateId.visible = 1
        }else {
            nextDistanceId.text = DataSource.nextRoadDisAuto
            nextDistanceId.font.pixelSize = 48
            nextDisUnitId.visible = 0
            forwardStateId.visible = 0
        }
    }

    function updateIcon(iconId,roungaboutNumId,imgId,path){
        iconId = iconId
        path = path
        switch(iconId){
        case 0:
            // imgId.source = ""
            imgId.source = "qrc:/images10_25/navi/simpleNaviIcon/" + path + "/direct.png"
            break;
        case 1:
            imgId.source = "qrc:/images10_25/navi/simpleNaviIcon/" + path + "/self.png"
            break
        case 2:
            imgId.source = "qrc:/images10_25/navi/simpleNaviIcon/" + path + "/turn_left.png"
            break
        case 3:
            imgId.source = "qrc:/images10_25/navi/simpleNaviIcon/" + path + "/turn_right.png"
            break
        case 4:
            imgId.source = "qrc:/images10_25/navi/simpleNaviIcon/" + path + "/left_front.png"
            break
        case 5:
            imgId.source = "qrc:/images10_25/navi/simpleNaviIcon/" + path + "/right_front.png"
            break
        case 6:
            imgId.source = "qrc:/images10_25/navi/simpleNaviIcon/" + path + "/left_back.png"
            break
        case 7:
            imgId.source = "qrc:/images10_25/navi/simpleNaviIcon/" + path + "/right_back.png"
            break
        case 8:
            imgId.source = "qrc:/images10_25/navi/simpleNaviIcon/" + path + "/turn_left_about.png"
            break
        case 9:
            imgId.source = "qrc:/images10_25/navi/simpleNaviIcon/" + path + "/straight.png"
            break
        case 10:
            imgId.source = "qrc:/images10_25/navi/simpleNaviIcon/" + path + "/approach_point.png"
            break
        case 11:
            if(roungaboutNumId >= 1 && roungaboutNumId <= 10){
                imgId.source = "qrc:/images10_25/navi/simpleNaviIcon/"+ path + "/round_right_" + roungaboutNumId + ".png"
            }else{
                imgId.source = "qrc:/images10_25/navi/simpleNaviIcon/" + path + "/enter_right_roundabout.png"
            }
            break
        case 12:
            if(roungaboutNumId >= 1 && roungaboutNumId <= 10){
                imgId.source = "qrc:/images10_25/navi/simpleNaviIcon/"+ path + "/round_right_" + roungaboutNumId + ".png"
            }else{
                imgId.source = "qrc:/images10_25/navi/simpleNaviIcon/" + path + "/make_right_roundabout.png"
            }
            break
        case 13:
            imgId.source = "qrc:/images10_25/navi/simpleNaviIcon/" + path + "/service_area.png"
            break
        case 14:
            imgId.source = "qrc:/images10_25/navi/simpleNaviIcon/" + path + "/toll_station.png"
            break
        case 15:
            imgId.source = "qrc:/images10_25/navi/simpleNaviIcon/" + path + "/destination.png"
            break
        case 16:
            imgId.source = "qrc:/images10_25/navi/simpleNaviIcon/" + path + "/tunnel.png"
            break
        case 17:
            if(roungaboutNumId >= 1 && roungaboutNumId <= 10){
                imgId.source = "qrc:/images10_25/navi/simpleNaviIcon/"+ path + "/round_left_" + roungaboutNumId + ".png"
                console.log("下个路口图标："+nextNextTurnIconImg.source)
            }else{
                imgId.source = "qrc:/images10_25/navi/simpleNaviIcon/" + path + "/enter_left_roundabout.png"
            }
            break
        case 18:
            if(roungaboutNumId >= 1 && roungaboutNumId <= 10){
                imgId.source = "qrc:/images10_25/navi/simpleNaviIcon/"+ path + "/round_left_" + roungaboutNumId + ".png"
            }else{
                imgId.source = "qrc:/images10_25/navi/simpleNaviIcon/" + path + "/make_left_roundabout.png"
            }
            break
        case 19:
            imgId.source = "qrc:/images10_25/navi/simpleNaviIcon/" + path + "/turn_right_about.png"
            break
        case 20:
            imgId.source = "qrc:/images10_25/navi/simpleNaviIcon/" + path + "/direct.png"
            break
        case 21:
            imgId.source = "qrc:/images10_25/navi/simpleNaviIcon/" + path + "/turn_left_roundabout_right_area.png"
            break
        case 22:
            imgId.source = "qrc:/images10_25/navi/simpleNaviIcon/" + path + "/turn_right_roundabout_right_area.png"
            break
        case 23:
            imgId.source = "qrc:/images10_25/navi/simpleNaviIcon/" + path + "/straight_roundabout_right_area.png"
            break
        case 24:
            imgId.source = "qrc:/images10_25/navi/simpleNaviIcon/" + path + "/turn_roundabout_right_area.png"
            break
        case 25:
            imgId.source = "qrc:/images10_25/navi/simpleNaviIcon/" + path + "/turn_left_roundabout_left_area.png"
            break
        case 26:
            imgId.source = "qrc:/images10_25/navi/simpleNaviIcon/" + path + "/turn_right_roundabout_left_area.png"
            break
        case 27:
            imgId.source = "qrc:/images10_25/navi/simpleNaviIcon/" + path + "/straight_roundabout_left_area.png"
            break
        case 28:
            imgId.source = "qrc:/images10_25/navi/simpleNaviIcon/" + path + "/turn_roundabout_left_area.png"
            break
        }
    }

    function updateNextNextInfo(){
        console.log("DataSource.nextNextTurnIconId:"+DataSource.nextNextTurnIconId+" DataSource.nextNextRoadDist:"+DataSource.nextNextRoadDist)

        if(DataSource.nextNextTurnIconId === -1 || DataSource.nextNextRoadDist === -1){
            nextNextTurnIconImg.source = ""
            nextNextInfoText.text = ""
        }else{
            updateIcon(DataSource.nextNextTurnIconId,DataSource.nextRoungAboutNum,nextNextTurnIconImg,"nextNextIcon")
            console.log("nextRoungAboutNumChanged:下下个路口环岛："+DataSource.nextRoungAboutNum)
            updateNextNextInfoText()
        }
    }

    function updateRouteRemainInfo(){
        routeRemainDisText.text = DataSource.routeRemainDisAuto
        routeRemainTimeText.text = DataSource.routeRemainTimeAuto
        etaArrivalTimeText.text = DataSource.etaArrivalTime.slice(2,DataSource.etaArrivalTime.length-1)
    }

    Item{
        id:forwardItem
        y: 71
        // 如果 nextIconImg 可能不存在，则需要避免直接引用它的属性
        property var nextIconImgWidth: (nextIconImg && nextIconImg.width) ? nextIconImg.width : 0

        x:nextDisUnitId.visible === false?(1920-nextDistanceId.width-12-nextIconImg.width)/2:(1920-nextDistanceId.width-12-nextDisUnitId.width-5-forwardStateId.width-12-nextIconImg.width)/2
        // y:0
        // x:nextDisUnitId.visible === false?(1920-nextDistanceId.width)/2:(1920-nextDistanceId.width-12-nextDisUnitId.width-5-forwardStateId.width)/2
        height:71
        Text{
            id:nextDistanceId
            anchors.verticalCenter: parent.verticalCenter
            anchors.left: forwardItem.left
            color: DataSource.dayNightMode === 0x02 ? "#DAE1EB":"#181F24"
            font.pixelSize:60
            font.family: rootItemId.ziti
            font.bold:rootItemId.jiacu === 1
            text: "200"
        }

        Text {
            font.bold:rootItemId.jiacu === 1
            id: nextDisUnitId
            anchors.bottom: nextDistanceId.bottom
            anchors.bottomMargin: 7
            anchors.left: nextDistanceId.right
            anchors.leftMargin: 12
            color: DataSource.dayNightMode === 0x02 ? "#DAE1EB":"#181F24"
            font.pixelSize:30
            text: qsTr("米")
            font.family: rootItemId.ziti
        }
        Text {
            font.bold:rootItemId.jiacu === 1
            id: forwardStateId
            anchors.bottom: nextDisUnitId.bottom
            anchors.left: nextDisUnitId.right
            anchors.leftMargin: 5
            text: qsTr("后")
            color: DataSource.dayNightMode === 0x02 ? "#DAE1EB":"#181F24"
            font.pixelSize: 30
            font.family: rootItemId.ziti
        }
        Image{
            id: nextIconImg
            // y:71
            // x:(1920-nextIconImg.width)/2
            anchors.verticalCenter: parent.verticalCenter
            anchors.left: forwardStateId.right
            anchors.leftMargin: 12
            width: 80
            height: 80
            Component.onCompleted: {
                updateIcon(DataSource.turnIconId,DataSource.roungAboutNum,nextIconImg,"nextIcon")
            }
        }
    }
    Text{
        font.bold:rootItemId.jiacu === 1
        id:nextRoadNameText
        y:157
        x:(1920-nextRoadNameText.width)/2
        color: DataSource.dayNightMode === 0x02 ? "#DAE1EB":"#181F24"
        text: DataSource.nextRoadName.length > 8 ? DataSource.nextRoadName.slice(0,7)+"...":DataSource.nextRoadName
        font.pixelSize: 44
        font.family: rootItemId.ziti
    }
    Item{
        x:(1920-nextNextTurnIconImg.width-10-nextNextInfoText.width)/2
        anchors.top: nextRoadNameText.bottom
        anchors.topMargin: 10
        Image{
            id:nextNextTurnIconImg
            anchors.left: parent.left
            anchors.top: parent.bottom
            width:48
            height: 48
            antialiasing: true
            Component.onCompleted: {
                updateIcon(DataSource.nextNextTurnIconId,DataSource.nextRoungAboutNum,nextNextTurnIconImg,"nextNextIcon")
            }
        }
        Text{
            font.bold:rootItemId.jiacu === 1
            id:nextNextInfoText
            anchors.top: nextNextTurnIconImg.top
            anchors.topMargin: (48-nextNextInfoText.height)/2
            anchors.left: nextNextTurnIconImg.right
            anchors.leftMargin: 10
            color: DataSource.dayNightMode === 0x02 ? "#ffffff":"#333333"
            font.pixelSize: 30
            opacity: DataSource.dayNightMode === 0x02 ? 0.7:1
            text:"随后156米"
            font.family: rootItemId.ziti
        }
    }
    Item{
        id:routeRemainItem
        x:(1920-routeRemainDisText.width-32-routeRemainTimeText.width-32.4-etaArrivalTimeText.width)/2
        y:289
        height: 44
        Text{
            font.bold:rootItemId.jiacu === 1
            id:routeRemainDisText
            anchors.left: routeRemainItem.left
            anchors.verticalCenter: parent.verticalCenter
            verticalAlignment: Text.AlignHCenter
            font.pixelSize: 30
            color: DataSource.dayNightMode === 0x02 ? "#DAE1EB":"#181F24"
            text:"9999公里"
            font.family: rootItemId.ziti
        }
        Text{
            font.bold:rootItemId.jiacu === 1
            id:routeRemainTimeText
            anchors.top: routeRemainDisText.top
            anchors.left: routeRemainDisText.right
            anchors.leftMargin: 32
            verticalAlignment: Text.AlignHCenter
            font.pixelSize: 30
            color: DataSource.dayNightMode === 0x02 ? "#DAE1EB":"#181F24"
            text:"20小时30分"
            font.family: rootItemId.ziti
        }
        Text{
            font.bold:rootItemId.jiacu === 1
            id:etaArrivalTimeText
            anchors.top: routeRemainDisText.top
            anchors.left: routeRemainTimeText.right
            anchors.leftMargin: 32.4
            verticalAlignment: Text.AlignHCenter
            font.pixelSize: 30
            color: DataSource.dayNightMode === 0x02 ? "#DAE1EB":"#181F24"
            text:"20:48到"
            font.family: rootItemId.ziti
        }
    }
    Component.onCompleted: {
        updateNextRoadDisAuto()
        updateNextNextInfo()
        updateRouteRemainInfo()
    }
}
