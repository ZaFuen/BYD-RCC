import QtQuick 2.15
import com.byd.DataSource 1.0
import com.byd.CenterChild 1.0
import "qrc:/common/singleton"

CenterChild{
    id:rootId
    anchors.horizontalCenter: parent.horizontalCenter
    y:197
    width: bgImg.width
    height: bgImg.height
    Image {
        id: bgImg
        source: DataSource.dayNightMode === 0x2?"qrc:/images10_25/warningInfo/night_bg.png":"qrc:/images10_25/warningInfo/day_bg.png"
        anchors.horizontalCenter: parent.horizontalCenter
        visible: false//DataSource.powerGear === 0x03?true:false //DataSource.naviType === 4 ? true : false
        cache: false
        opacity: 0.8
    }
    Item{
        anchors.fill: parent
        anchors.horizontalCenter: bgImg.horizontalAlignment
        anchors.top: bgImg.top
        anchors.topMargin: (bgImg.height-imageId.height-15-textId.height)/2
        Image {
            id: imageId
            anchors.horizontalCenter: parent.horizontalCenter
            source: "qrc:/images10_25/warningInfo/AE.png"
            cache: false
        }

        Text{
            id:textId
            anchors.horizontalCenter:  parent.horizontalCenter
            anchors.top: imageId.bottom
            anchors.topMargin: 15
            anchors.leftMargin: 30
            anchors.rightMargin: 30
            font.pixelSize: 30
            horizontalAlignment: Text.AlignHCenter
            color:"#717171"
            text: {
                if(DataSource.powerGeneratorValue === 0x00){
                    ""
                }else{
                    if(DataSource.powerUnit === 0x01){
                        DataSource.language === 0x02 ?"Idle power generating<br>"+DataSource.powerGeneratorValue+" kW":"车辆原地发电中<br>"+DataSource.powerGeneratorValue+" kW"
                    }else{
                        DataSource.language === 0x02 ?"Idle power generating<br>"+DataSource.powerGeneratorValue+" HP":"车辆原地发电中<br>"+DataSource.powerGeneratorValue+" HP"

                    }

                }
            }
        }
    }
}
