import QtQuick 2.0
import com.byd.DataSource 1.0
import com.byd.CenterChild 1.0
import "qrc:/common/singleton"

Item{
    id: root
        x: (DataSource.menuNeedDisplay !== DataSource.UI_DISPLAY && DataSource.themeIndex === 0x02)? -640 : 0
    width: 560
    height: 300
    visible: DataSource.menuNeedDisplay !== DataSource.UI_DISPLAY && (DataSource.terrainMode >= 4 && DataSource.terrainMode <= 15)
    BydBlur{
        y: - 61
        offsetX: 680
        offsetY: 268 - 40
        width: 560
        height: 360
        anchors.horizontalCenter: parent.horizontalCenter
        bgPngSource: {
            if(DataSource.dayNightMode === 0x02){
                if(DataSource.terrainMode === 0x04 || DataSource.terrainMode === 0x07){
                    "qrc:/images10_25/driveInfo/night/drivInfo_Bg_snow.png"
                }else if((DataSource.terrainMode > 0x04 && DataSource.terrainMode < 0x07) || (DataSource.terrainMode > 0x07 && DataSource.terrainMode <= 15)){
                    "qrc:/images10_25/driveInfo/night/drivInfo_Bg_easy.png"
                }else if(themeIndex === 2){
                    "qrc:/images10_25/driveInfo/night/drivInfo_Bg_technology.png"
                }else{
                    "qrc:/images10_25/driveInfo/night/drivInfo_Bg_easy.png"
                }
            }else{
                "qrc:/images10_25/driveInfo/day/drivInfo_Bg.png"
            }
        }
        borderImgX: - 86
        borderImgY: - 24
        needAnimation: true
    }
}
