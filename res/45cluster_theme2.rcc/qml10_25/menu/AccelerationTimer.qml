import QtQuick 2.0
import com.byd.DataSource 1.0
import "qrc:/common/singleton"

Item {
    height: 322
    y: 125+16
    x: 14
    width: 710

    Image {
        id: img_background
        source: DataSource.dayNightMode === 0x02 ? "qrc:/images10_25/menu/night/acceleration_bg.png" : "qrc:/images10_25/menu/day/acceleration_bg.png"
        anchors.horizontalCenter: parent.horizontalCenter
        cache: false
    }

    Image {
        id: img_carbody
        source: {
            if(DataSource.carNameType === 0x06){// 0x5A  SA2HP  8.8
               "qrc:/images10_25/menu/night/acceleration_carbody_SA2HP.png"
            }else if(DataSource.carNameType === 0x07){//0x81  SK2H  10.25/8.8
                "qrc:/images10_25/menu/night/acceleration_carbody_sk2.png"
            }else if(DataSource.carNameType === 0x09){//0xA5  eksport
                if (DataSource.ekCarbodyColor === 2) {
                    "qrc:/images10_25/menu/night/acceleration_carbody_green_ekSport.png"
                } else {
                    "qrc:/images10_25/menu/night/acceleration_carbody_orange_ekSport.png"
                }
            }else if(DataSource.carNameType === 0x0A){//0x8A   eknormal
                "qrc:/images10_25/menu/night/acceleration_carbody_ekNormal.png"
            }else if(DataSource.carNameType === 0x0B || DataSource.carNameType === 0x0C){// 0xB5  HA2E ; 0x66 HA2H
                "qrc:/images10_25/menu/night/acceleration_carbody_ha2_h_e.png"
            }else if(DataSource.carNameType === DataSource.CARNAME_EK23_10_25){// 0xCD  eknormal23
                "qrc:/images10_25/menu/night/acceleration_carbody_ek_normal_23.png"
            }else if(DataSource.carNameType === DataSource.CARNAME_SC3E_8_8){// 0xA0  SC3E
                "qrc:/images10_25/menu/night/acceleration_carbody_SC3E.png"
            }else if(DataSource.carNameType === DataSource.CARNAME_SC2E_8_8){// 0x5B  SC2E
                "qrc:/images10_25/menu/night/acceleration_carbody_SC2E.png"
            }else if(DataSource.carNameType === DataSource.CARNAME_HA3_8_8){// 0xCC  HA3
                "qrc:/images10_25/menu/night/acceleration_carbody_HA3.png"
            }else if(DataSource.carNameType === DataSource.CARNAME_HKHA_8_8){// 0xBC  HKH
                "qrc:/images10_25/menu/night/acceleration_carbody_HKH.png"
            }else if(DataSource.carNameType === DataSource.CARNAME_SA5H_10_25){// 0xA1  SA5H
                "qrc:/images10_25/menu/night/acceleration_carbody_SA5H.png"
            }else if(DataSource.carNameType === DataSource.CARNAME_SA6H_8_8){// 0xEA    SA6H
                "qrc:/images10_25/menu/night/acceleration_carbody_SA6H.png"
            }else if(DataSource.carNameType === DataSource.CARNAME_HXHK_8_8){// 0xE9    HXHK
                "qrc:/images10_25/menu/night/acceleration_carbody_HXHK.png"
            }else if(DataSource.carNameType === DataSource.CARNAME_SL2H_8_8){// 0xE2    SL2H
                "qrc:/images10_25/menu/night/acceleration_carbody_SL2H.png"
            }else if(DataSource.carNameType === DataSource.CARNAME_EWE_8_8){// 0xBF    EWE
                "qrc:/images10_25/menu/night/acceleration_carbody_EWE.png"
            }else{
                "qrc:/images10_25/menu/night/acceleration_carbody_ekNormal.png"
            }
        }
        anchors.bottom:img_background.bottom
        anchors.bottomMargin: 25
        anchors.horizontalCenter: parent.horizontalCenter
        cache: false
    }

    Text {
        font.bold:rootItemId.jiacu === 1
        font.family: rootItemId.ziti
        id: name
        text: TranslateStr.menu_acceleratorStr
        anchors.bottom: parent.bottom
        anchors.bottomMargin: 86
        anchors.horizontalCenter: parent.horizontalCenter
        font.pixelSize: 27
        color: DataSource.dayNightMode === 0x02?"#ffffff":"#333333"
    }

}
