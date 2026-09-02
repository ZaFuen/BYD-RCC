//import QtQuick 2.15
//import com.byd.DataSource 1.0
//import com.byd.CenterChild 1.0
//import "qrc:/common/singleton/"

//CenterChild{

//    anchors.fill:parent
//    visible: true

//    Item{
//        anchors.fill: parent
//        visible: DataSource.accErrorMesDisplay ===1?false :true
//        z:1
//        //车头靠左
//        Image {
//            id: leftCarImg
//            visible: DataSource.carPosition === 0x2?true :false
//            x:843
//            y:403
//            cache: false
//            source: "qrc:/images10_25/adas2d/ldw_car_body.png"
//        }

//        //车头靠右
//        Image {
//            id: rightCarImg
//            visible: DataSource.carPosition ===0x3?true :false
//            cache: false
//            x:923
//            y:403
//            source: "qrc:/images10_25/adas2d/ldw_car_body.png"
//        }
//        //车头居中
//        Image {
//            id: centerCarImg
//            visible: DataSource.carPosition ===0x1?true :false
//            cache: false
//            x:887
//            y:403
//            source: "qrc:/images10_25/adas2d/ldw_car_body.png"
//        }

//        //左侧线
//        Image {
//            id: leftLineImg
//            visible: DataSource.leftLineDisplay ===0x1?true :false
//            cache: false
//            x:805
//            y:273
//            source: {
//                if(DataSource.leftLineColor === 1){
//                    "qrc:/images10_25/adas2d/left_line_gray.png"
//                }else if(DataSource.leftLineColor === 2){
//                    "qrc:/images10_25/adas2d/left_line_green.png"
//                }else if(DataSource.leftLineColor === 4){
//                    "qrc:/images10_25/adas2d/left_line_red.png"
//                }else{
//                    "qrc:/images10_25/adas2d/left_line_gray.png"
//                }
//            }
//        }
//        //右侧线
//        Image {
//            id: rightLineImg
//            visible: DataSource.rightLineDisplay ===0x1?true :false
//            cache: false
//            x:1003
//            y:273
//            source: {
//                if(DataSource.rightLineColor === 1){
//                    "qrc:/images10_25/adas2d/right_line_gray.png"
//                }else if(DataSource.rightLineColor === 2){
//                    "qrc:/images10_25/adas2d/right_line_green.png"
//                }else if(DataSource.rightLineColor === 4){
//                    "qrc:/images10_25/adas2d/right_line_red.png"
//                }else{
//                    "qrc:/images10_25/adas2d/right_line_gray.png"
//                }
//            }
//        }
//        //一档间距前车
//        Image {
//            id: frontCarDistance1
//            visible: (DataSource.carDistanceLevel ===0x01||DataSource.carDistanceLevel === 0x03)?true:false
//            cache: false
//            x:928
//            y:314
//            source: "qrc:/images10_25/adas2d/front_distance_car_1.png"
//        }

//        //一档间距报警
//        Image {
//            id: frontCarDistanceAlert1
//            visible: DataSource.carDistanceLevel === 0x03?true:false
//            cache: false
//            x:856
//            y:367
//            source: "qrc:/images10_25/adas2d/frontCarDistanceAlert1.png"
//        }

//        //二档间距前车
//        Image {
//            id: frontCarDistance2
//            visible: DataSource.carDistanceLevel === 0x04?true:false
//            cache: false
//            x:934
//            y:294
//            source: "qrc:/images10_25/adas2d/front_distance_car_2.png"
//        }
//        //二档间距报警
//        Image {
//            id: frontCarDistanceAlert2
//            visible: DataSource.carDistanceLevel === 0x04?true:false
//            cache: false
//            x:858
//            y:335
//            source: "qrc:/images10_25/adas2d/frontCarDistanceAlert2.png"
//        }
//        //三档/四档间距前车
//        Image {
//            id: frontCarDistance3
//            visible: (DataSource.carDistanceLevel === 0x05)?true:false
//            cache: false
//            x:940
//            y:266
//            source: "qrc:/images10_25/adas2d/front_distance_car_3.png"
//        }
//        //三档间距报警
//        Image {
//            id: frontCarDistanceAlert5
//            visible: DataSource.carDistanceLevel === 0x05?true:false
//            cache: false
//            x:865
//            y:299
//            source: "qrc:/images10_25/adas2d/frontCarDistanceAlert3.png"
//        }
//        //四档间距前车
//        Image {
//            id: frontCarDistance4
//            visible: (DataSource.carDistanceLevel === 0x06)?true:false
//            cache: false
//            x:946
//            y:250
//            source: "qrc:/images10_25/adas2d/front_distance_car_4.png"
//        }
//        //车时间距底图
//        Image {
//            id: vehicleDistansceBasicImg
//            x:801
//            y:273
//            visible: DataSource.carTimeDistanceDisplay === DataSource.UI_DISPLAY ? true: false
//            source: "qrc:/images10_25/adas2d/vehicle_distance_basic.png"
//        }

//        //一档车时间距
//        Image {
//            id: vehicleDistansce1
//            x:822
//            y:273
//            visible: DataSource.carTimeDisLevel === 1 ? true: false
//            source: "qrc:/images10_25/adas2d/vehicle_distance1.png"
//        }

//        //二档车时间距
//        Image {
//            id: vehicleDistansce2
//            x:822
//            y:273
//            visible: DataSource.carTimeDisLevel === 2 ? true: false
//            source: "qrc:/images10_25/adas2d/vehicle_distance2.png"
//        }
//        //三档车时间距
//        Image {
//            id: vehicleDistansce3
//            x:822
//            y:273
//            visible: DataSource.carTimeDisLevel === 3 ? true: false
//            source: "qrc:/images10_25/adas2d/vehicle_distance3.png"
//        }
//        //四档车时间距
//        Image {
//            id: vehicleDistansce4
//            x:822
//            y:273
//            visible: DataSource.carTimeDisLevel === 4 ? true: false
//            source: "qrc:/images10_25/adas2d/vehicle_distance4.png"
//        }


//        Text {
//            id: adasTipText
//            font.pixelSize: 28
//            y:520
//            x:805
//            width:310
//            anchors.topMargin: 10
//            color:"#ffffff"
//            visible: DataSource.accTipTextDisplay === DataSource.UI_DISPLAY?true:false
//            horizontalAlignment: Text.AlignHCenter
//            text: {
//                if(DataSource.accTipText===0x01){
//                    TranslateStr.adasTip_0x1
//                }else if(DataSource.accTipText === 0x02){
//                    TranslateStr.adasTip_0x2
//                }else if(DataSource.accTipText === 0x03){
//                    TranslateStr.adasTip_0x3
//                }else if(DataSource.accTipText === 0x04){
//                    TranslateStr.adasTip_0x4
//                }else if(DataSource.accTipText === 0x05){
//                    TranslateStr.adasTip_0x5
//                }else if(DataSource.accTipText === 0x06){
//                    TranslateStr.adasTip_0x6
//                }else if(DataSource.accTipText === 0x07){
//                    TranslateStr.adasTip_0x7
//                }else if(DataSource.accTipText === 0x08){
//                    TranslateStr.adasTip_0x8
//                }else if(DataSource.accTipText === 0x09){
//                    TranslateStr.adasTip_0x9
//                }else{
//                    ""
//                }
//            }
//        }
//    }


//    //提示信息
//    Item{
//        id:textInfoItem
//        anchors.fill: parent
//        z:2
//        visible: DataSource.accErrorMesDisplay === 1 ? true:false
//        //left line
//        //左侧线
//        Image {
//            id: leftLineTextInfo
//            cache: false
//            x:805
//            y:273
//            source:"qrc:/images10_25/adas2d/left_line_gray.png"
//        }

//        //右侧线
//        Image {
//            id: rightLineTextInfo
//            cache: false
//            x:1003
//            y:273
//            source: "qrc:/images10_25/adas2d/right_line_gray.png"
//        }

//        //自车
//        Image {
//            id:selfCarIconId
//            cache: false
//            visible: DataSource.accRemoteText === 0x117?false:true
//            x:887
//            y:403
//            source: "qrc:/images10_25/adas2d/ldw_car_body.png"
//        }

//        Image {
//            id: inchargeCar
//            x:923
//            y:328
//            cache: false
//            visible: (DataSource.accRemoteText === 0x117 || DataSource.accRemoteText === 0x187)?false:true
//            source: "qrc:/images10_25/adas2d/inchrage_car.png"
//        }
//        Image {
//            id: inchargeMaster
//            x:925
//            y:328
//            cache:false
//            visible:(DataSource.accRemoteText === 0x117 || DataSource.accRemoteText === 0x187)?false:true
//            source: "qrc:/images10_25/adas2d/warninglight_master.png"
//        }
//        Image {
//            id: trackIcon
//            x:917
//            y:338
//            cache:false
//            visible: (DataSource.accRemoteText=== 0x188 || DataSource.accRemoteText === 0x189)?true:false
//            source: "qrc:/images10_25/adas2d/warninginfo_track.png"
//        }

//        Image {
//            id: speedUpRed
//            x:852
//            y:424
//            visible: DataSource.accRemoteText === 0x117?true:false
//            source: "qrc:/images10_25/adas2d/speed_up_red.png"
//        }
//        //超越加速中自车
//        Image {
//            id: speedUpSelfCar
//            x:885
//            y:352
//            visible: DataSource.accRemoteText === 0x117?true:false
//            source: "qrc:/images10_25/adas2d/speed_up_self_car.png"
//        }

//        Text {
//            id: textInfoTitle
//            font.pixelSize: 28
//            width: 400
//            x:760
//            y:520
//            color:DataSource.accRemoteText === 0x117 ?"#ffffff":"#ff0000"
//            horizontalAlignment: Text.AlignHCenter
//        }
//    }

//    function textInfoUpdate(){
//        if(DataSource.accRemoteText===0x3A){
//            textInfoTitle.text=TranslateStr.warningInfoStr_0x3A
//        }else if(DataSource.accRemoteText === 0x3B){
//            textInfoTitle.text=TranslateStr.warningInfoStr_0x3B
//        }else if(DataSource.accRemoteText === 0x3C){
//            textInfoTitle.text=TranslateStr.warningInfoStr_0x3C
//        }else if(DataSource.accRemoteText === 0x117){
//            textInfoTitle.text=TranslateStr.warningInfoStr_0x117
//        }else if (DataSource.accRemoteText === 0x187){
//            textInfoTitle.text =TranslateStr.warningInfoStr_0x187
//        }else if (DataSource.accRemoteText === 0x188){
//            textInfoTitle.text = TranslateStr.warningInfoStr_0x188
//        }else if (DataSource.accRemoteText === 0x189){
//            textInfoTitle.text = TranslateStr.warningInfoStr_0x189
//        }
//    }

//    function updateIcon(){
//        if(DataSource.accRemoteText === 0x3A
//                ||DataSource.accRemoteText === 0x3B
//                ||DataSource.accRemoteText === 0x3C){
//            inchargeMaster.visible = true
//        }else{
//            inchargeMaster.visible = false
//        }
//        if(DataSource.accRemoteText === 0x117||DataSource.accRemoteText === 0x187){
//            inchargeCar.visible = false
//        }else{
//            inchargeCar.visible = true
//        }
//        if(DataSource.accRemoteText === 0x188 ||DataSource.accRemoteText === 0x189){
//            trackIcon.visible = true
//        }else{
//            trackIcon.visible = false
//        }
//    }
//    Component.onCompleted: {
//        textInfoUpdate()
//        updateIcon()
//    }

//    Connections {
//        target:DataSource

//        function onAccRemoteTextChanged(){
//            textInfoUpdate()
//            updateIcon()
//        }
//        function onTranslateLoadCompleteChanged(){
//            textInfoUpdate()
//        }
//    }
//}
