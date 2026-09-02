import QtQuick 2.15
import QtGraphicalEffects 1.12
import com.byd.DataSource 1.0
import QtQuick.Shapes 1.15
import "qrc:/common/singleton"

Item {
    id:speedDashRootId
    width: 1920
    height: 720

    property real selfCheckSpeedRealValue:0
    property bool hasSelfChecked: false

    Component.onCompleted: {
        if(DataSource.playAnim  === true){
            hasSelfChecked = true
            //            realSpeedUpdate()
        }
    }

    function realSpeedUpdate(){
        if(hasSelfChecked){
            if(DataSource.speed === -1){
                speedValueTextId.text = 0
            }else{
                speedValueTextId.text = Math.round(DataSource.realSpeed)
            }
        }
    }

    Item{
        id:classicSpeedTextItemId
        x:(1920-340)/2
        y:32
		visible: false		
        width: 340
        height: 72
        Text {
            font.bold:rootItemId.jiacu === 1
            id:speedValueTextId
            anchors.left: parent.left
            anchors.leftMargin: (parent.width-speedValueId.width)/2
            anchors.bottom: parent.bottom
            anchors.bottomMargin: -24
            text: DataSource.speed
                font.pixelSize: 123
                font.family: rootItemId.ziti
            color: (rootItemId.valueThree > 0 && rootItemId.valueThree < DataSource.speed && rootItemId.daoLu === 0) ? "#FF0000" : DataSource.dayNightMode === 0x02?"#ffffff":"#333333"
            visible: DataSource.speed === -1 ? false : true
        }
        Text {
            font.bold:rootItemId.jiacu === 1
            id:speedUnitTextId
            // anchors.horizontalCenter:classicSpeedTextItemId.horizontalCenter
            // y:416-269
            anchors.left: speedValueTextId.left
            anchors.leftMargin: (speedValueTextId.width-speedUnitTextId.width)/2
            anchors.bottom: parent.bottom
            anchors.bottomMargin: -35
            text: DataSource.speedUnit !== 2 ? "km/h" : "mph"
            font.family: rootItemId.ziti
            font.pixelSize: 30
            color: DataSource.dayNightMode === 0x02?"#fefefe":"#333333"
            visible: false
        }

    }

    Connections {
        target:DataSource

        function onPluginMsgReceived(id,value){
            if(id === DataSource.SEND_MSG_ID_DASHBOARD_SELFCHECK){
                speedDashRootId.selfCheckSpeedRealValue = 0
                //                speedValueTextId.text = "0"
                //                selfCheckAnimId.start()
            }else if(id === DataSource.SEND_MSG_ID_THEME_SWITCH_REQUEST){
                if(value === DataSource.THEME_SWITCH_REQUEST_TO_PLAY_HIDE_ANIM){
                    classicSpeedDashOpacityHideAnimId.start()
                }else if(value === DataSource.THEME_SWITCH_REQUEST_TO_PLAY_DISP_ANIM){
                    classicSpeedDashOpacityShowAnimId.start()
                }else if(value === DataSource.THEME_SWITCH_POWER_OFF_STATE){
                    classicSpeedDashOpacityShowAnimId.stop()
                }
            }
        }
        function onPowerGearChanged(){
            if( DataSource.powerGear !== 3){
                hasSelfChecked = false
                //DataSource.realSpeed = 0
                //                realSpeedUpdate()
            }
        }
        /*
        function onSpeedUnitChanged(){
            realSpeedUpdate()
        }

        function onRealSpeedChanged(){
            if(hasSelfChecked){
                realSpeedUpdate()
            }
        }*/
    }

    /*
    onSelfCheckSpeedRealValueChanged: {
        realSpeedUpdate()
    }*/

    SequentialAnimation {
        id:selfCheckAnimId
        PropertyAnimation {
            target: speedDashRootId
            properties: "selfCheckSpeedRealValue"
            to: 100
            duration: CustomStyle.selfCheckAnimationTimer
            easing.type: Easing.InQuad
        }
        PropertyAnimation{
            target: speedDashRootId
            duration: CustomStyle.selfCheckAnimationWaitTimer
        }
        PropertyAnimation {
            target: speedDashRootId
            properties: "selfCheckSpeedRealValue"
            to: 0
            duration: CustomStyle.selfCheckAnimationTimer
            easing.type: Easing.OutQuad
        }
        onFinished:{
            hasSelfChecked = true
            //            realSpeedUpdate()
        }
    }

    //主题切换透明度动画
    PropertyAnimation{
        id:classicSpeedDashOpacityHideAnimId
        targets: [classicSpeedTextItemId]
        property:"opacity"
        from: 1
        to:0
        duration:CustomStyle.themeOpacityChangeTimer
        //easing.type: Easing.InOutQuad
        onFinished: {
            console.log("classic speed opacity animation finish")
        }
    }

    //主题切换透明度动画
    PropertyAnimation{
        id:classicSpeedDashOpacityShowAnimId
        targets: [classicSpeedTextItemId]
        property:"opacity"
        from: 0
        to:1
        duration:CustomStyle.themeOpacityChangeTimer
        //easing.type: Easing.InOutQuad
        onFinished: {
            DataSource.changeDashBoard = false
        }
    }

}
