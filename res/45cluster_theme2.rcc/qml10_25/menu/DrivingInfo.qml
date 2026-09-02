import QtQuick 2.12
import QtQml.Models 2.15
import com.byd.DataSource 1.0
import com.byd.CenterChild 1.0
import QtQuick.Controls 2.0
import QtQuick.Window 2.0
import "qrc:/common/singleton"

Item {
    id: driveId
    height: 300
    y: 60+15+14
    x: 17+75
    width: 560
    clip: true

    property alias pathView: pathviewInfo
    property int drivePage: pathviewInfo.currentIndex
    property bool switchAnimNeed:false
    property alias bgImage: switchBgId
    property alias driveItem: driveInfoItemId
    property alias upAnim: upAnimId
    property alias downAnim: downAnimId
    property alias upReboundAnim: upReboundAnimId1
    property alias downReboundAnim: downReboundAnimId1
    property int easeType:Easing.OutCirc
    property int pageEaseType:Easing.OutQuad
    property int reboundEaseType1:Easing.InCubic
    property int reboundEaseType2:Easing.OutCubic
    property int switchAnimDuration: 240
    property int upDownState: 0
    property bool isUpAnimPlay: false
    property bool isDownAnimPlay: false
    property bool isUpReboundAnimPlay: false
    property bool isDownReboundAnimPlay: false
    property bool isHasIndex: false
    property ListModel listmodelInfo: Global.driveInfoModel
    property int pageCount: listmodelInfo.count

    Connections{
        target: DataSource


        function onMenuNeedDisplayChanged(){
            if(DataSource.menuNeedDisplay === DataSource.UI_DISPLAY){
                createDriveInfoQml();
            }
        }
    }

    Component.onCompleted: {
        createDriveInfoQml()
    }

    onPageCountChanged: {
        createDriveInfoQml()
    }

    Image {
        id: lineImg
        source: DataSource.dayNightMode === 0x02?"qrc:/images10_25/driveInfo/night/vertical_line_bg.png":"qrc:/images10_25/driveInfo/day/vertical_line_bg.png"
        y:15
        anchors.right: parent.right
        anchors.rightMargin: 25
        cache: false
        visible: pageCount > 1 ? true : false
        BorderImage {
            id: pageImg
            anchors.horizontalCenter: parent.horizontalCenter
            //anchors.horizontalCenterOffset: 1
            cache: false
            width: sourceSize.width
            height: pageCount === 0 ? 0 : Math.ceil(lineImg.height / pageCount)
            y: pathviewInfo.currentIndex * (308/pageCount)
            border { left: 3; top: 3; right: 3; bottom: 3 }
            source: DataSource.dayNightMode === 0x02 ? "qrc:/images10_25/driveInfo/night/page_2.png" : "qrc:/images10_25/driveInfo/day/page_2.png"
            visible: pageCount === 0 ? false : true
        }
    }

    Image{
        id: switchBgId
        width: 560
        height: 300
        visible: false
    }

    function createDriveInfoQml(){
        var hasDriveIndex = false;
        for (var i = 0; i < listmodelInfo.count; i++) {
            if(listmodelInfo.get(i).page === DataSource.menuDriveInfoIndex){
                pathviewInfo.currentIndex = i
                listmodelInfo.setProperty(i, "fromY", 0)
                listmodelInfo.setProperty(i, "toY", 0)
                hasDriveIndex = true;
                isHasIndex = true;
                pageTimerId.restart()
                //break;
            }else{
                listmodelInfo.setProperty(i, "fromY", 300)
                listmodelInfo.setProperty(i, "toY", 300)
            }
        }
        if(listmodelInfo.count > 0 && !hasDriveIndex){
            isHasIndex = false;
            pageTimerId.restart()
            listmodelInfo.setProperty(0, "fromY", 0)
            listmodelInfo.setProperty(0, "toY", 0)
        }
    }

    Timer{
        id: pageTimerId
        interval: 200; running: false; repeat: false
        onTriggered: {
            console.log("pageTimerId time: " + new Date().getTime())
            if(isHasIndex){
                DataSource.sendPluginMsgInt(DataSource.RECV_MSG_ID_MENU_DRIVEINFO_PAGE, DataSource.menuDriveInfoIndex)
            }else{
                if(listmodelInfo.count > 0){
                    DataSource.sendPluginMsgInt(DataSource.RECV_MSG_ID_MENU_DRIVEINFO_PAGE, listmodelInfo.get(0).page)
                }else{
                    console.log("send Msg fail,because listmodel count is 0")
                }
            }
        }
    }

    Item {
        id: driveInfoItemId
        anchors.fill:parent;

        PathView{
            id: pathviewInfo
            anchors.fill:parent;
            delegate: delegateInfo;
            model: listmodelInfo;
            pathItemCount: 1
            preferredHighlightBegin:0.5;
            preferredHighlightEnd:0.5;

            path: Path{}
        }

        Component {
            id: delegateInfo;

            Rectangle{
                id:rectId
                anchors.fill: parent
                color: "transparent"

                required property var toY
                required property var fromY
                required property var src

                Loader{
                    id:loaderId
                    width: parent.width
                    y:toY
                    source: src
                    Behavior on y{
                        PropertyAnimation{
                            from:fromY
                            to:toY
                            duration: switchAnimDuration
                            easing.type: easeType
                        }
                    }
                }
            }
        }
    }

    onDrivePageChanged: {
        if(switchAnimNeed){
            driveItem.visible = true
            driveItem.opacity = 0
            if(upDownState == 1){
                upAnimId.start()
                listmodelInfo.setProperty(pathviewInfo.currentIndex, "fromY", -190)
                listmodelInfo.setProperty(pathviewInfo.currentIndex, "toY", 0)
                for (var i = 0; i < listmodelInfo.count; i++) {
                    if(pathviewInfo.currentIndex != i){
                        listmodelInfo.setProperty(i, "fromY", 300)
                        listmodelInfo.setProperty(i, "toY", 300)
                    }
                }
            }else if(upDownState == 2){
                downAnimId.start()
                listmodelInfo.setProperty(pathviewInfo.currentIndex, "fromY", 300)
                listmodelInfo.setProperty(pathviewInfo.currentIndex, "toY", 0)
                for (var i = 0; i < listmodelInfo.count; i++) {
                    if(pathviewInfo.currentIndex != i){
                        listmodelInfo.setProperty(i, "fromY", 300)
                        listmodelInfo.setProperty(i, "toY", 300)
                    }
                }
            }
            switchAnimNeed = false
        }
    }

    ParallelAnimation{
        id: upAnimId
        PropertyAnimation{
            target: switchBgId
            property: "y"
            from:0
            to:300
            easing.type: easeType
            duration: switchAnimDuration
        }
        PropertyAnimation{
            target: switchBgId
            property: "opacity"
            from:1
            to:0
            easing.type: easeType
            duration: switchAnimDuration
        }

        PropertyAnimation{
            target: driveInfoItemId
            property: "opacity"
            from:0
            to:1
            easing.type: easeType
            duration: switchAnimDuration
        }
        PropertyAnimation{
            target: driveInfoItemId
            property: "y"
            from:-190
            to:0
            easing.type: easeType
            duration: switchAnimDuration
        }
        PropertyAnimation{
            target: pageImg
            property: "y"
            from: pathviewInfo.currentIndex === (listmodelInfo.count-1)?(listmodelInfo.count-1)*(308/pageCount):(pathviewInfo.currentIndex+1) * (308/pageCount)
            to: pathviewInfo.currentIndex === (listmodelInfo.count-1)?(listmodelInfo.count-1)*(308/pageCount):pathviewInfo.currentIndex * (308/pageCount)
            easing.type: pageEaseType
            duration: switchAnimDuration
        }
        onFinished: {
            switchBgId.visible = false
            isUpAnimPlay = false
        }
    }
    ParallelAnimation{
        id: downAnimId
        PropertyAnimation{
            target: switchBgId
            property: "y"
            from:0
            to:-190
            easing.type: easeType
            duration: switchAnimDuration
        }
        PropertyAnimation{
            target: switchBgId
            property: "opacity"
            from:1
            to:0
            easing.type: easeType
            duration: switchAnimDuration
        }
        PropertyAnimation{
            target: driveInfoItemId
            property: "opacity"
            from:0
            to:1
            easing.type: easeType
            duration: switchAnimDuration
        }
        PropertyAnimation{
            target: driveInfoItemId
            property: "y"
            from:300
            to:0
            easing.type: easeType
            duration: switchAnimDuration
        }
        PropertyAnimation{
            target: pageImg
            property: "y"
            from:pathviewInfo.currentIndex === 0?0:(pathviewInfo.currentIndex-1) * (308/pageCount)
            to:pathviewInfo.currentIndex === 0?0:pathviewInfo.currentIndex * (308/pageCount)
            easing.type: pageEaseType
            duration: switchAnimDuration
        }
        onFinished: {
            switchBgId.visible = false
            isDownAnimPlay = false
        }
    }

    ParallelAnimation{
        id:upReboundAnimId1
        PropertyAnimation{
            target: switchBgId
            property: "y"
            from:0
            to:211
            easing.type: reboundEaseType1
            duration: switchAnimDuration
        }
        PropertyAnimation{
            target: switchBgId
            property: "opacity"
            from:1
            to:0.3
            easing.type: reboundEaseType1
            duration: switchAnimDuration
        }
        PropertyAnimation{
            target: pageImg
            property: "height"
            from: 308/pageCount
            to: 308/pageCount/2
            easing.type: reboundEaseType1
            duration: switchAnimDuration
        }
        onFinished: {
            switchBgId.opacity = 0.3
            upReboundAnimId2.start()
        }
    }
    ParallelAnimation{
        id:upReboundAnimId2
        PropertyAnimation{
            target: switchBgId
            property: "y"
            from:211
            to:0
            easing.type: reboundEaseType2
            duration: switchAnimDuration
        }
        PropertyAnimation{
            target: switchBgId
            property: "opacity"
            from:0.3
            to:1
            easing.type: reboundEaseType2
            duration: switchAnimDuration
        }
        PropertyAnimation{
            target: pageImg
            property: "height"
            from: 308/pageCount/2
            to: 308/pageCount
            easing.type: reboundEaseType2
            duration: switchAnimDuration
        }
        onFinished: {
            driveInfoItemId.visible = true
            switchBgId.visible = false
            isUpReboundAnimPlay = false
        }
    }

    ParallelAnimation{
        id:downReboundAnimId1
        PropertyAnimation{
            target: switchBgId
            property: "y"
            from:0
            to:-181
            easing.type: reboundEaseType1
            duration: switchAnimDuration
        }
        PropertyAnimation{
            target: switchBgId
            property: "opacity"
            from:1
            to:0.3
            easing.type: reboundEaseType1
            duration: switchAnimDuration
        }
        PropertyAnimation{
            target: pageImg
            property: "y"
            from:(308/pageCount)*(listmodelInfo.count-1)
            to:((308/pageCount)*(listmodelInfo.count-1))+(308/pageCount/2)
            easing.type: reboundEaseType1
            duration: switchAnimDuration
        }
        PropertyAnimation{
            target: pageImg
            property: "height"
            from: 308/pageCount
            to: 308/pageCount/2
            easing.type: reboundEaseType1
            duration: switchAnimDuration
        }
        onFinished: {
            switchBgId.opacity = 0.3
            downReboundAnimId2.start()
        }
    }
    ParallelAnimation{
        id:downReboundAnimId2
        PropertyAnimation{
            target: switchBgId
            property: "y"
            from:-181
            to:0
            easing.type: reboundEaseType2
            duration: switchAnimDuration
        }
        PropertyAnimation{
            target: switchBgId
            property: "opacity"
            from:0.3
            to:1
            easing.type: reboundEaseType2
            duration: switchAnimDuration
        }
        PropertyAnimation{
            target: pageImg
            property: "y"
            from:((308/pageCount)*(listmodelInfo.count-1))+(308/pageCount/2)
            to:(308/pageCount)*(listmodelInfo.count-1)
            easing.type: reboundEaseType2
            duration:switchAnimDuration
        }
        PropertyAnimation{
            target: pageImg
            property: "height"
            from: (308/pageCount/2)
            to: (308/pageCount)
            easing.type: reboundEaseType2
            duration: switchAnimDuration
        }
        onFinished: {
            driveInfoItemId.visible = true
            switchBgId.visible = false
            isDownReboundAnimPlay = false
        }
    }
}
