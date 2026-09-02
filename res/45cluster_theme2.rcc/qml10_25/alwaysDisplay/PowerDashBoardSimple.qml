import QtQuick 2.15
import QtGraphicalEffects 1.12
import com.byd.DataSource 1.0
import QtQuick.Shapes 1.15
import "qrc:/common/singleton"

Item {
    id: powerDashRootId
    width: 1920
    height: 720


    property real selfCheckPowerRealValue:0
    property bool hasSelfChecked: false

    readonly property int powerFillX:38
    readonly property int powerFillY:36
    readonly property int powerFillArcWidth: 100
    readonly property int arcCenterX: 270
    readonly property int arcCenterY: 280
    readonly property int arcRadius:283

    Component.onCompleted: {
        if(DataSource.playAnim  === true){
            hasSelfChecked = true
            //            realPowerUpdate()
        }
    }

    Item{
        id:classicPowerTextItemId
        x:1260
        y:650
		visible: false
        width: 316
        height: 60
        Item {
            anchors.centerIn: parent
            width: powerValueTextId.contentWidth + powerUnitTextId.contentWidth + 9
            height: parent.height

            Text {
                font.bold:rootItemId.jiacu === 1
                id:powerValueTextId
                anchors.bottom: parent.bottom
                // anchors.centerIn: parent
                anchors.bottomMargin: -6
                // anchors.horizontalCenter:classicPowerTextItemId.horizontalCenter
                text: DataSource.power
                font.pixelSize: 51
                font.family: rootItemId.ziti
                color: DataSource.dayNightMode === 0x02?"#fefefe":"#333333"
                visible: DataSource.power !== 1001 ? true : false
            }
            Text {
                font.bold:rootItemId.jiacu === 1
                id:powerUnitTextId
                // anchors.horizontalCenter:classicPowerTextItemId.horizontalCenter
                // y:412-280
                anchors.left: powerValueTextId.right
                anchors.leftMargin: 4
                anchors.bottom: parent.bottom
                // anchors.bottomMargin: 5
                text: DataSource.powerUnit !== 2 ? "kW" : "HP"
                font.pixelSize: 28
                font.family: rootItemId.ziti
                color: DataSource.dayNightMode === 0x02?"#fefefe":"#333333"
                visible: DataSource.power !== 1001 ? true : false
            }
        }
    }

    function realPowerUpdate(){
        var angle
        if(!hasSelfChecked){
            //自检
            angle =(0.798+(0.367+0.667)*powerDashRootId.selfCheckPowerRealValue/100)
        }else{

            if(DataSource.power === 1001){
                //powerValueTextId.text = 0
                angle =(0.798-0.298*2/3+0.298*2/3*(53+0)/53)
            }else{
                //功率值直接绑定DataSource.power，和填充条刷新分开
                //powerValueTextId.text = Math.round(DataSource.realPower)
                if(DataSource.powerUnit === 0x02){
                    if(DataSource.realPower <= -134){
                        angle = (0.798-0.298)
                    }else if(DataSource.realPower < -53){
                        angle =(0.798-0.298*2/3-0.298/3/81*((-DataSource.realPower)-53))
                    }else if(DataSource.realPower <= 0){
                        angle =(0.798-0.298*2/3+0.298*2/3*(53+DataSource.realPower)/53)
                    }else if(DataSource.realPower <= 46){
                        angle =(0.798+0.367*DataSource.realPower/46)
                    }else if(DataSource.realPower <= 134){
                        angle =(0.798+0.367+0.667*0.75*(DataSource.realPower-46)/88)
                    }else if(DataSource.realPower < 670){
                        angle =(0.798+0.367+0.667*0.75+0.667*0.25*(DataSource.realPower-134)/536)
                    }else if(DataSource.realPower >= 670){
                        angle =(0.798+0.367+0.667)
                    }

                }else{
                    if(DataSource.realPower <= -100){
                        angle = (0.798-0.298)
                    }else if(DataSource.realPower < -40){
                        angle = (0.798-0.298*2/3-0.298/3/60*((-DataSource.realPower)-40))
                    }else if(DataSource.realPower <= 0){
                        angle = (0.798-0.298*2/3+0.298*2/3*(40+DataSource.realPower)/40)
                    }else if(DataSource.realPower <= 35){
                        angle = (0.798+0.367*DataSource.realPower/35)
                    }else if(DataSource.realPower <= 100){
                        angle = (0.798+0.367+0.667*0.75*(DataSource.realPower-35)/65)
                    }else if(DataSource.realPower < 500){
                        angle = (0.798+0.367+0.667*0.75+0.667*0.25*(DataSource.realPower-100)/400)
                    }else if(DataSource.realPower >= 500){
                        angle =(0.798+0.367+0.667)
                    }
                }
            }
        }

    }

    Connections {
        target:DataSource

        function onPluginMsgReceived(id,value){
            if(id === DataSource.SEND_MSG_ID_DASHBOARD_SELFCHECK){
                powerDashRootId.selfCheckPowerRealValue = 0
                //                powerValueTextId.text = "0"
                //                selfCheckAnimId.start()
            }else if(id === DataSource.SEND_MSG_ID_THEME_SWITCH_REQUEST){
                if(value === DataSource.THEME_SWITCH_REQUEST_TO_PLAY_HIDE_ANIM){
                    classicPowerDashOpacityHideAnimId.start()
                }else if(value === DataSource.THEME_SWITCH_REQUEST_TO_PLAY_DISP_ANIM){
                    classicPowerDashOpacityShowAnimId.start()
                }else if(value === DataSource.THEME_SWITCH_POWER_OFF_STATE){
                    classicPowerDashOpacityShowAnimId.stop()
                }
            }
        }
        function onPowerGearChanged(){
            if( DataSource.powerGear !== 3){
                hasSelfChecked = false
                //                DataSource.realPower = 0
                //                realPowerUpdate()
            }
        }
        /*
        function onPowerUnitChanged(){
            realPowerUpdate()
        }

        function onRealPowerChanged(){
            if(hasSelfChecked){
                realPowerUpdate()
            }
        }*/
    }

    /*
    onSelfCheckPowerRealValueChanged:{
        realPowerUpdate()
    }*/

    SequentialAnimation {
        id:selfCheckAnimId
        PropertyAnimation {
            target: powerDashRootId
            properties: "selfCheckPowerRealValue"
            to: 100
            duration: CustomStyle.selfCheckAnimationTimer
            easing.type: Easing.InQuad
        }
        PropertyAnimation{
            target: powerDashRootId
            duration: CustomStyle.selfCheckAnimationWaitTimer
        }
        PropertyAnimation {
            target: powerDashRootId
            properties: "selfCheckPowerRealValue"
            to: 0
            duration: CustomStyle.selfCheckAnimationTimer
            easing.type: Easing.OutQuad
        }
        onFinished:{
            hasSelfChecked = true
            //            realPowerUpdate()
        }
    }

    //主题切换透明度动画
    PropertyAnimation{
        id:classicPowerDashOpacityHideAnimId
        targets:[classicPowerTextItemId]
        property:"opacity"
        from: 1
        to:0
        duration:CustomStyle.themeOpacityChangeTimer
        easing.type: Easing.InOutQuad
        onFinished: {
            console.log("classic power opacity animation show finish")
        }
    }

    //主题切换透明度动画
    PropertyAnimation{
        id:classicPowerDashOpacityShowAnimId
        targets:[classicPowerTextItemId]
        property:"opacity"
        from: 0
        to:1
        duration:CustomStyle.themeOpacityChangeTimer
        easing.type: Easing.InOutQuad
        alwaysRunToEnd:true
        onFinished: {
            console.log("classic power opacity animation finish")
            DataSource.changeDashBoard = false
        }
    }

}

