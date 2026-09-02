import QtQuick 2.15
import com.byd.DataSource 1.0
import com.byd.CenterChild 1.0
import "qrc:/common/singleton"

CenterChild {
    id: rootId
    y: 215
    width: 600
    height: 350
    anchors.horizontalCenter: parent.horizontalCenter
    Component.onCompleted: {
        updateModeSwitchWarningInfo()
    }

    Item{
        id:modeSwitchItem
        anchors.horizontalCenter: parent.horizontalCenter

        Image{
            id: bgImg
            y: -18
            source: DataSource.dayNightMode === 0x02?"qrc:/images10_25/warningInfo/night_bg.png":"qrc:/images10_25/warningInfo/day_bg.png"
            anchors.horizontalCenter: parent.horizontalCenter
            cache: false
            opacity: 0.8
        }
        Image{
            id:modeIcon
            y:37
            anchors.horizontalCenter: parent.horizontalCenter
            cache:false
            source: "qrc:/images10_25/warningInfo/16B-16C-16D/mode.png"
        }


        Item{
            id: firstItem
            y:92
            width: 154
            height: 46
            anchors.horizontalCenter: parent.horizontalCenter
            Image{
                id:firstIcon
                y: -9
                anchors.horizontalCenter: parent.horizontalCenter
                cache:false
                source: {
                    if(DataSource.modeSwitchStatus === 1 || DataSource.modeSwitchStatus === 2){
                        "qrc:/images10_25/warningInfo/16B-16C-16D/unselected_new.png"
                    }else{
                        firstText.text ==="ECO"||firstText.text ==="SPORT"?
                                "qrc:/images10_25/warningInfo/16B-16C-16D/unselected_short.png" :
                                "qrc:/images10_25/warningInfo/16B-16C-16D/unselected_long.png"
                    }
                }
            }
            Text{
                font.bold:rootItemId.jiacu === 1
                font.family: rootItemId.ziti
                id:firstText
                anchors.verticalCenter: parent.verticalCenter
                anchors.horizontalCenter: parent.horizontalCenter
                font.pixelSize:firstText.text ==="ECO"||firstText.text ==="NORMAL"||firstText.text ==="SPORT"?30:28
                color: "black"
            }
        }
        Item{
            id: secondItem
            y:177
            width: 154
            height: 46
            anchors.horizontalCenter: parent.horizontalCenter

            Image{
                id:secondIcon
                y: -9
                anchors.horizontalCenter: parent.horizontalCenter
                cache:false
                source: {
                    if(DataSource.modeSwitchStatus === 1 || DataSource.modeSwitchStatus === 2){
                        "qrc:/images10_25/warningInfo/16B-16C-16D/selected_new.png"
                    }else{
                        secondText.text ==="ECO"||secondText.text ==="SPORT"?
                            "qrc:/images10_25/warningInfo/16B-16C-16D/selected_short.png" :
                            "qrc:/images10_25/warningInfo/16B-16C-16D/selected_long.png"
                    }
                }
            }
            Text{
                font.bold:rootItemId.jiacu === 1
                font.family: rootItemId.ziti
                id:secondText
                anchors.verticalCenter: parent.verticalCenter
                anchors.horizontalCenter: parent.horizontalCenter
                font.pixelSize:secondText.text ==="ECO"||secondText.text ==="NORMAL"||secondText.text ==="SPORT"?30:28
                color: "white"
            }
        }
        Item{
            id: thirdItem
            y:261
            width: 154
            height: 46
            anchors.horizontalCenter: parent.horizontalCenter
            Image{
                id:thirdIcon
                y: -9
                anchors.horizontalCenter: parent.horizontalCenter
                cache:false
                source: {
                    if(DataSource.modeSwitchStatus === 1 || DataSource.modeSwitchStatus === 2){
                        "qrc:/images10_25/warningInfo/16B-16C-16D/unselected_new.png"
                    }else{
                        thirdText.text ==="ECO"||thirdText.text ==="SPORT"?
                                "qrc:/images10_25/warningInfo/16B-16C-16D/unselected_short.png" :
                                "qrc:/images10_25/warningInfo/16B-16C-16D/unselected_long.png"
                    }
                }
            }
            Text{
                font.bold:rootItemId.jiacu === 1
                font.family: rootItemId.ziti
                id:thirdText
                anchors.verticalCenter: parent.verticalCenter
                anchors.horizontalCenter: parent.horizontalCenter
                font.pixelSize:thirdText.text ==="ECO"||thirdText.text ==="NORMAL"||thirdText.text ==="SPORT"?30:28
                color: "black"
            }
        }
    }

    function updateModeSwitchWarningInfo(){
        if(DataSource.modeSwitchStatus === 2){
            if(DataSource.language === 1)
            {
                switch(DataSource.commonWarningInfoId){
                    case 0x16B:
                        firstText.text = "泥地模式"; secondText.text = "经济模式"; thirdText.text = "普通模式";break
                    case 0x16C:
                        firstText.text = "经济模式"; secondText.text = "普通模式"; thirdText.text = "运动模式";break
                    case 0x16D:
                        firstText.text = "普通模式"; secondText.text = "运动模式"; thirdText.text = "雪地模式";break
                    case 0x1CC:
                        firstText.text = "运动模式"; secondText.text = "雪地模式"; thirdText.text = "沙地模式";break
                    case 0x1CD:
                        firstText.text = "雪地模式"; secondText.text = "沙地模式"; thirdText.text = "泥地模式";break
                    case 0x1CE:
                        firstText.text = "沙地模式"; secondText.text = "泥地模式"; thirdText.text = "经济模式";break
                    default:
                        firstText.text = ""; secondText.text = ""; thirdText.text = ""
                }
            }
            else{
                switch(DataSource.commonWarningInfoId){
                    case 0x16B:
                        firstText.text = "MUDDY LAND"; secondText.text = "ECO"; thirdText.text = "NORMAL";break
                    case 0x16C:
                        firstText.text = "ECO"; secondText.text = "NORMAL"; thirdText.text = "SPORT";break
                    case 0x16D:
                        firstText.text = "NORMAL"; secondText.text = "SPORT"; thirdText.text = "SNOWFIELD";break
                    case 0x1CC:
                        firstText.text = "SPORT"; secondText.text = "SNOWFIELD"; thirdText.text = "SAND LAND";break
                    case 0x1CD:
                        firstText.text = "SNOWFIELD"; secondText.text = "SAND LAND"; thirdText.text = "MUDDY LAND";break
                    case 0x1CE:
                        firstText.text = "SAND LAND"; secondText.text = "MUDDY LAND"; thirdText.text = "ECO";break
                    default:
                        firstText.text = ""; secondText.text = ""; thirdText.text = ""
                }
            }

        }else if(DataSource.modeSwitchStatus === 1){
            if(DataSource.language === 1){
                switch(DataSource.commonWarningInfoId){
                    case 0x16B:
                        firstText.text = "雪地模式"; secondText.text = "经济模式"; thirdText.text = "普通模式";break
                    case 0x16C:
                        firstText.text = "经济模式"; secondText.text = "普通模式"; thirdText.text = "运动模式";break
                    case 0x16D:
                        firstText.text = "普通模式"; secondText.text = "运动模式"; thirdText.text = "雪地模式";break
                    case 0x1CC:
                        firstText.text = "运动模式"; secondText.text = "雪地模式"; thirdText.text = "经济模式";break
                    default:
                        firstText.text = ""; secondText.text = ""; thirdText.text = ""
                }
            }
            else{
                switch(DataSource.commonWarningInfoId){
                    case 0x16B:
                        firstText.text = "SNOWFIELD"; secondText.text = "ECO"; thirdText.text = "NORMAL";break
                    case 0x16C:
                        firstText.text = "ECO"; secondText.text = "NORMAL"; thirdText.text = "SPORT";break
                    case 0x16D:
                        firstText.text = "NORMAL"; secondText.text = "SPORT"; thirdText.text = "SNOWFIELD";break
                    case 0x1CC:
                        firstText.text = "SPORT"; secondText.text = "SNOWFIELD"; thirdText.text = "ECO";break
                    default:
                        firstText.text = ""; secondText.text = ""; thirdText.text = ""
                }
            }
        }
        else {
            switch(DataSource.commonWarningInfoId){
                case 0x16B:
                    firstText.text = "SPORT"; secondText.text = "ECO"; thirdText.text = "NORMAL";break
                case 0x16C:
                    firstText.text = "ECO"; secondText.text = "NORMAL"; thirdText.text = "SPORT";break
                case 0x16D:
                    firstText.text = "NORMAL"; secondText.text = "SPORT"; thirdText.text = "ECO";break
                default:
                    firstText.text = ""; secondText.text = ""; thirdText.text = ""
            }
        }
    }
    Connections{
        target: DataSource
        function onCommonWarningInfoIdChanged() {
            updateModeSwitchWarningInfo()
        }
        function onModeSwitchStatusChanged() {
            updateModeSwitchWarningInfo()
        }
        function onLanguageChanged(){
            updateModeSwitchWarningInfo()
        }
    }

}
