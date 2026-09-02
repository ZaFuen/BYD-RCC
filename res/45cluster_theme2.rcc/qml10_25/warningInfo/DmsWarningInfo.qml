import QtQuick 2.0
import com.byd.DataSource 1.0
import com.byd.CenterChild 1.0
import QtQml.Models 2.15
import "qrc:/common/singleton"

CenterChild {
    id:rootId
    anchors.horizontalCenter: parent.horizontalCenter
    y:197
    width: bgImg.width
    height: bgImg.height

    onVisibleChanged: {
        updateDmsAnim()
    }

    onOpacityChanged: {
        updateDmsAnim()
    }

    Image {
        id: bgImg
        source: DataSource.dayNightMode === 0x2?"qrc:/images10_25/warningInfo/night_bg.png":"qrc:/images10_25/warningInfo/day_bg.png"
        anchors.horizontalCenter: parent.horizontalCenter
        visible: DataSource.powerGear === 0x03?true:false //DataSource.naviType === 4 ? true : false
        cache: false
    }

    Loader{
        id:loader
        anchors.horizontalCenter: parent.horizontalCenter
        asynchronous: true
    }

    Component.onCompleted: {
        updateDmsAnim()
    }
    Connections{
        target: DataSource
        function onCommonWarningInfoIdChanged(){
            updateDmsAnim()
        }
        function onLanguageChanged(){
            updateDmsAnim()
        }
    }
    function updateDmsAnim(){
        //不可见的时候不加载，避免此时播放开机动画不流畅，透明度不为1的时候不加载，避免26F 5.0-5.3切换的时候不流畅
        if(rootId.visible === true && rootId.opacity >= 1.0){
            switch(DataSource.commonWarningInfoId){
            case 0x195:
            case 0x19C:
                loader.source="qrc:/qml10_25/warningInfo/DmsCollectWarningInfo.qml"
                break
            case 0x156:
            case 0x157:
            case 0x160:
            case 0x19E:
                loader.source="qrc:/qml10_25/warningInfo/DmsFatigueDriving.qml"
                break

            default:
                loader.source=""
                break
            }
        }else{
            loader.source=""
        }
    }
}
