import QtQuick 2.0
import QtQuick.Controls 1.5
import QtQuick.Layouts 1.3
import com.byd.DataSource 1.0

Rectangle {
    width: parent.width
    height: 72
    y:78
    color: "transparent"
    x:744
    property var roadNameMargin: 3
    property var nextDistanceMargin: -3

    visible: (1 ===DataSource.mediaInfoIconId)?0:1

    Connections{
        target: DataSource

        function onDayNightModeChanged(){
            updateTurnIcon()
        }

        function onTurnIconIdChanged(){
            updateTurnIcon()
        }

        function onRoungAboutNumChanged(){
            updateTurnIcon()
        }
        function onNextRoadDisAutoChanged(){
            updateNextRoadDisAuto()
        }
    }

    function updateNextRoadDisAuto(){
        if (DataSource.nextRoadDisAuto.slice(-1) === "米"){
            nextDistanceId.text = DataSource.nextRoadDisAuto.slice(0, -1)
            nextDisUnitId.text = "米"
            nextDistanceId.font.pixelSize = 72
            nextDisUnitId.visible = 1
            forwardStateId.visible = 1
            roadNameMargin = 3
            nextDistanceMargin = -3
        }else if(DataSource.nextRoadDisAuto.slice(-1) === "里"){
            nextDistanceId.text = DataSource.nextRoadDisAuto.slice(0, -2)
            nextDisUnitId.text = "公里"
            nextDistanceId.font.pixelSize = 72
            nextDisUnitId.visible = 1
            forwardStateId.visible = 1
            roadNameMargin = 3
            nextDistanceMargin = -3
        }else {
            nextDistanceId.text = DataSource.nextRoadDisAuto
            nextDistanceId.font.pixelSize = 48
            nextDisUnitId.visible = 0
            forwardStateId.visible = 0
            roadNameMargin = -72
            nextDistanceMargin = 7
        }
    }

    function updateTurnIcon(){
        console.log("DataSource.roungAboutNum:"+DataSource.roungAboutNum+" DataSource.turnIconId:"+DataSource.turnIconId)
        var path = ""
        if (DataSource.dayNightMode === 0x02){
            path = "night"
        }else{
            path = "day"
        }

        switch(DataSource.turnIconId){
        case 0:
            break;
        case 1:
            arrowId.source = "qrc:/images10_25/navi/" + path + "/self.png"
            break
        case 2:
            arrowId.source = "qrc:/images10_25/navi/" + path + "/turn_left.png"
            break
        case 3:
            arrowId.source = "qrc:/images10_25/navi/" + path + "/turn_right.png"
            break
        case 4:
            arrowId.source = "qrc:/images10_25/navi/" + path + "/left_front.png"
            break
        case 5:
            arrowId.source = "qrc:/images10_25/navi/" + path + "/right_front.png"
            break
        case 6:
            arrowId.source = "qrc:/images10_25/navi/" + path + "/left_back.png"
            break
        case 7:
            arrowId.source = "qrc:/images10_25/navi/" + path + "/right_back.png"
            break
        case 8:
            arrowId.source = "qrc:/images10_25/navi/" + path + "/turn_left_about.png"
            break
        case 9:
            arrowId.source = "qrc:/images10_25/navi/" + path + "/straight.png"
            break
        case 10:
            arrowId.source = "qrc:/images10_25/navi/" + path + "/approach_point.png"
            break
        case 11:
            if(DataSource.roungAboutNum >= 1 && DataSource.roungAboutNum <= 10){
                arrowId.source = "qrc:/images10_25/navi/"+ path + "/round_right_" + DataSource.roungAboutNum + ".png"
            }else{
                arrowId.source = "qrc:/images10_25/navi/" + path + "/enter_right_roundabout.png"
            }
            break
        case 12:
            if(DataSource.roungAboutNum >= 1 && DataSource.roungAboutNum <= 10){
                arrowId.source = "qrc:/images10_25/navi/"+ path + "/round_right_" + DataSource.roungAboutNum + ".png"
            }else{
                arrowId.source = "qrc:/images10_25/navi/" + path + "/make_right_roundabout.png"
            }
            break
        case 13:
            arrowId.source = "qrc:/images10_25/navi/" + path + "/service_area.png"
            break
        case 14:
            arrowId.source = "qrc:/images10_25/navi/" + path + "/toll_station.png"
            break
        case 15:
            arrowId.source = "qrc:/images10_25/navi/" + path + "/destination.png"
            break
        case 16:
            arrowId.source = "qrc:/images10_25/navi/" + path + "/tunnel.png"
            break
        case 17:
            if(DataSource.roungAboutNum >= 1 && DataSource.roungAboutNum <= 10){
                arrowId.source = "qrc:/images10_25/navi/"+ path + "/round_left_" + DataSource.roungAboutNum + ".png"
            }else{
                arrowId.source = "qrc:/images10_25/navi/" + path + "/enter_left_roundabout.png"
            }
            break
        case 18:
            if(DataSource.roungAboutNum >= 1 && DataSource.roungAboutNum <= 10){
                arrowId.source = "qrc:/images10_25/navi/"+ path + "/round_left_" + DataSource.roungAboutNum + ".png"
            }else{
                arrowId.source = "qrc:/images10_25/navi/" + path + "/make_left_roundabout.png"
            }
            break
        case 19:
            arrowId.source = "qrc:/images10_25/navi/" + path + "/turn_right_about.png"
            break
        case 20:
            arrowId.source = "qrc:/images10_25/navi/" + path + "/direct.png"
            break
        case 21:
            arrowId.source = "qrc:/images10_25/navi/" + path + "/turn_left_roundabout_right_area.png"
            break
        case 22:
            arrowId.source = "qrc:/images10_25/navi/" + path + "/turn_right_roundabout_right_area.png"
            break
        case 23:
            arrowId.source = "qrc:/images10_25/navi/" + path + "/straight_roundabout_right_area.png"
            break
        case 24:
            arrowId.source = "qrc:/images10_25/navi/" + path + "/turn_roundabout_right_area.png"
            break
        case 25:
            arrowId.source = "qrc:/images10_25/navi/" + path + "/turn_left_roundabout_left_area.png"
            break
        case 26:
            arrowId.source = "qrc:/images10_25/navi/" + path + "/turn_right_roundabout_left_area.png"
            break
        case 27:
            arrowId.source = "qrc:/images10_25/navi/" + path + "/straight_roundabout_left_area.png"
            break
        case 28:
            arrowId.source = "qrc:/images10_25/navi/" + path + "/turn_roundabout_left_area.png"
            break
        }
    }

    Rectangle{
        id: naviInfoId
        height: 70
        anchors.left: parent.left
        Image {
            id: arrowId
            scale: 0.85
            anchors.verticalCenter: parent.verticalCenter
            Component.onCompleted: {
                updateTurnIcon()
            }
        }

        Text {
            font.bold:rootItemId.jiacu === 1
            font.family: rootItemId.ziti
            id: nextDistanceId
            x: 15
            anchors.left: arrowId.right
            anchors.leftMargin: 11
            anchors.bottom: parent.bottom
            anchors.bottomMargin: nextDistanceMargin
            color: DataSource.dayNightMode === 0x02 ? "#d9ffffff":"#d9333333"
            font.pixelSize:60
        }

        Text {
            font.bold:rootItemId.jiacu === 1
            font.family: rootItemId.ziti
            id: nextDisUnitId
            y: 32
            color: DataSource.dayNightMode === 0x02 ? "#d9ffffff":"#d9333333"
            anchors.left: nextDistanceId.right
            anchors.leftMargin: 7
            anchors.bottom: parent.bottom
            anchors.bottomMargin: 10
            font.pixelSize:28
            text: qsTr("米")
        }

        Text {
            font.bold:rootItemId.jiacu === 1
            font.family: rootItemId.ziti
            id: forwardStateId
            y: 32
            anchors.left: nextDisUnitId.right
            anchors.leftMargin: 29
            anchors.bottom: parent.bottom
            anchors.bottomMargin: 10
            text: qsTr("后"  /*DataSource.forwardState*/)
            color: DataSource.dayNightMode === 0x02 ? "#a6ffffff":"#a6333333"
            font.pixelSize: 28
        }

        Text{
            font.bold:rootItemId.jiacu === 1
            font.family: rootItemId.ziti
            id: nextRoadNameId
            y: 32
            anchors.left: forwardStateId.right
            anchors.leftMargin: roadNameMargin
            anchors.bottom: parent.bottom
            anchors.bottomMargin: 10
            text: DataSource.nextRoadName.length > 8 ? DataSource.nextRoadName.slice(0,7)+"...":DataSource.nextRoadName
            color: DataSource.dayNightMode === 0x02 ? "#e6ffffff":"#e6333333"
            font.pixelSize: 28
            x: forwardStateId.x +forwardStateId.contentWidth +roadNameMargin
            width: 423-nextRoadNameId.x
            elide:Text.ElideRight
        }

        Component.onCompleted: {
            updateNextRoadDisAuto()
        }
    }

}
