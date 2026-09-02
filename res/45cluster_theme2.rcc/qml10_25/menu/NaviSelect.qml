import QtQuick 2.0
import com.byd.DataSource 1.0
import QtQml.Models 2.15
import "qrc:/common/singleton"

Item {
    height: 281
    y: 69 + 9
    x: 14
    width: 710

    property var naviView: listView
    property int viewIndex: listView.currentIndex
    property var model: listModel

    Connections{
        target: DataSource

        function onNaviTypeStoreChanged(){
            updateNaviTypeStore()
        }

        function onTranslateLoadCompleteChanged(){
            updateNaviModel()
            updateNaviSelect()
        }
    }

    Text{
        font.bold:rootItemId.jiacu === 1
        font.family: rootItemId.ziti
        id:textTipId
        text: TranslateStr.menu_AmapAutoCustomTipStr
        font.pixelSize: 27
        anchors.horizontalCenter: parent.horizontalCenter
        anchors.bottom: parent.bottom
        anchors.bottomMargin: -25
        color:"#828282"
    }

    onViewIndexChanged: {
        console.log("onViewIndexChanged currentIndex=", listView.currentIndex)
        updateNaviSelect()
    }

    function updateNaviSelect(){
        if(listView.currentIndex < 0){
            return
        }

        listModel.setProperty(listView.currentIndex, "rectH", 77)
        listModel.setProperty(listView.currentIndex, "size1", 42)

        for (var i = 0; i < listModel.count; i++) {
            if(listView.currentIndex !== i){
                listModel.setProperty(i, "rectH", 57)
                listModel.setProperty(i, "size1", 26)
            }
        }
    }

    function updateNaviModel(){
        listModel.clear()
        if(DataSource.dilinkName === 0x01){
            listModel.append({mapName: TranslateStr.menu_closeNaviStr, rectH:65, size1:30,  state:1});
            listModel.append({mapName: TranslateStr.menu_smallScreenNaviStr, rectH:57, size1:30, state:3});
            listModel.append({mapName: TranslateStr.menu_fullScreenNaviStr, rectH:57, size1:30, state:4});
            
        }else{
           listModel.append({mapName: TranslateStr.menu_closeNaviStr, rectH:65, size1:30,  state:1});
            listModel.append({mapName: TranslateStr.menu_smallScreenNaviStr, rectH:57, size1:30, state:3});
            listModel.append({mapName: TranslateStr.menu_fullScreenNaviStr, rectH:57, size1:30, state:4});
            
        }
        listModel.completed = true
        updateNaviTypeStore()
    }

    function updateNaviTypeStore(){
        if(DataSource.dilinkName === 0x02){
            listView.currentIndex = DataSource.naviTypeStore
        }else{
            listView.currentIndex = DataSource.naviTypeStore
            // if(DataSource.naviTypeStore >= 1){
            //     listView.currentIndex = 1
            // }else{
            //     listView.currentIndex = DataSource.naviTypeStore
            // }
        }
    }

    Rectangle{
        x: 67
        y: DataSource.dilinkName === 0x01 ? 25 : 25 + 57
        height: 260
        width: 565
        color: "transparent"

        Image {
            id: naviBorder
            source: DataSource.language === 0x02?"qrc:/images10_25/menu/day/navi_border_en.png":"qrc:/images10_25/menu/day/navi_border.png"
            x:DataSource.language === 0x02 ? 235 - 72 - 67 : 235 - 67
            //y: DataSource.naviTypeStore*57+30
            y: listView.currentIndex * 57 + 30 - 25
            cache: false
        }

        ListModel{
            id: listModel
            property bool completed:false
            Component.onCompleted: {
                updateNaviModel()
            }
        }

        ListView {
            id:listView
            anchors.fill: parent
            model: listModel
            delegate: listDel
            orientation: ListView.Vertical
        }

        Component{
            id:listDel
            Rectangle{
                id:rect
                x: 187
                height: rectH
                width: 187
                color: "transparent"
                Text {
                    font.bold:rootItemId.jiacu === 1
                    font.family: rootItemId.ziti
                    anchors.verticalCenter: parent.verticalCenter
                    anchors.horizontalCenter: parent.horizontalCenter
                    font.pixelSize: size1
                    text: mapName
                    color:DataSource.dayNightMode === 0x02?"#ffffff":"#333333"
                }
            }
        }
    }
}
