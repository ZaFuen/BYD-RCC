import QtQuick 2.15
import com.byd.DataSource 1.0
import com.byd.CenterChild 1.0
import "qrc:/common/singleton/"

CenterChild{
    id:adasRoot
    width: 608
    height: 290
    visible: true

    Component.onCompleted: {
        updateLeftLaneImage()
        updateRightLaneImage()
        updateSelfCarPosition()
    }
    Item{
        id:adasCommonInfoItemId
        anchors.fill: parent
        visible: true
        Image {
            id: roadBg
            x:845
            y:255
            source: DataSource.dayNightMode === 0x1 ? "qrc:/images10_25/adas2d/singleroadlight.png": "qrc:/images10_25/adas2d/singleroad-dark.png"
        }

        //左侧线
        Image {
            id: leftLineImg
            cache: false
            x:839
            y:258
        }

        //右侧线
        Image {
            id: rightLineImg
            cache: false
            x:985
            y:258
        }

        //车头居中
        Image {
            id: self_car
            cache: false
            y:388
            z:2
            x:{updateSelfCarPosition()}
            source: {
               "qrc:/images10_25/adas2d/self_car_HA2H.png"
            }
            visible: DataSource.carPosition >= 0x1 && DataSource.carPosition <= 0x3 ? true : false
        }

        //一档间距前车
        Image {
            id: frontCarDistance1
            visible: DataSource.aheadDistance === 0x03?true:false
            cache: false
            x:885
            y:309
            source: "qrc:/images10_25/adas2d/front_distance_car_1.png"
        }
        //一档间距报警
        Image {
            id: frontCarDistanceAlert1
            visible: DataSource.aheadDistance === 0x03?true:false
            cache: false
            x:886
            y:382
            source: "qrc:/images10_25/adas2d/frontCarDistanceAlert1.png"
        }

        //二档间距前车
        Image {
            id: frontCarDistance2
            visible: DataSource.aheadDistance === 0x04?true:false
            cache: false
            x:896
            y:294
            source: "qrc:/images10_25/adas2d/front_distance_car_2.png"
        }
        //二档间距报警
        Image {
            id: frontCarDistanceAlert2
            visible: DataSource.aheadDistance === 0x04?true:false
            cache: false
            x:886
            y:358
            source: "qrc:/images10_25/adas2d/frontCarDistanceAlert2.png"
        }
        //三档/四档间距前车
        Image {
            id: frontCarDistance3
            visible: (DataSource.aheadDistance === 0x01 || DataSource.aheadDistance === 0x05 || DataSource.aheadDistance === 0x06) ? true:false
            cache: false
            x:916
            y:257
            source: "qrc:/images10_25/adas2d/front_distance_car_3.png"
        }
        //三档间距报警
        Image {
            id: frontCarDistanceAlert3
            visible: (DataSource.aheadDistance === 0x05 || DataSource.aheadDistance === 0x06) ? true:false
            cache: false
            x:886
            y:300
            source: "qrc:/images10_25/adas2d/frontCarDistanceAlert3.png"
        }
    }

    Connections{
        target:DataSource

        function onLeftLaneLineChanged(){
            updateLeftLaneImage()
        }

        function onRightLaneLineChanged(){
            updateRightLaneImage()
        }

        function onCarPositionChanged(){
            updateSelfCarPosition()
        }

        function onDayNightModeChanged(){
            updateLeftLaneImage()
            updateRightLaneImage()
        }
    }

    function updateSelfCarPosition(){
        if(DataSource.carPosition === 2){
            self_car.x = 837-25
        }else if(DataSource.carPosition === 3){
            self_car.x = 837+25
        }else{
            self_car.x = 837
        }
    }

    function updateLeftLaneImage(){
        if(DataSource.leftLaneLine === 1){
            leftLineImg.source=DataSource.dayNightMode === 0x02?"qrc:/images10_25/adas2d/line_left_grey_night.png":"qrc:/images10_25/adas2d/line_left_grey.png"
        }else if(DataSource.leftLaneLine === 2){
            leftLineImg.source=DataSource.dayNightMode === 0x02?"qrc:/images10_25/adas2d/dottedline-green-l_night":"qrc:/images10_25/adas2d/dottedline-green-l"
        }else if(DataSource.leftLaneLine === 3){
            leftLineImg.source=DataSource.dayNightMode === 0x02?"qrc:/images10_25/adas2d/line_left_yellow_night.png":"qrc:/images10_25/adas2d/line_left_yellow.png"
        }else if(DataSource.leftLaneLine === 4){
            leftLineImg.source=DataSource.dayNightMode === 0x02?"qrc:/images10_25/adas2d/red-l_night.png":"qrc:/images10_25/adas2d/red-l.png"
        }else{
            leftLineImg.source=""
        }
    }

    function updateRightLaneImage(){
        if(DataSource.rightLaneLine === 1){
            rightLineImg.source = DataSource.dayNightMode === 0x02?"qrc:/images10_25/adas2d/line_right_grey_night.png":"qrc:/images10_25/adas2d/line_right_grey.png"
        }else if(DataSource.rightLaneLine === 2){
            rightLineImg.source = DataSource.dayNightMode === 0x02?"qrc:/images10_25/adas2d/dottedline-green-r_night.png":"qrc:/images10_25/adas2d/dottedline-green-r.png"
        }else if(DataSource.rightLaneLine === 3){
            rightLineImg.source = DataSource.dayNightMode === 0x02?"qrc:/images10_25/adas2d/line_right_yellow_night.png":"qrc:/images10_25/adas2d/line_right_yellow.png"
        }else if(DataSource.rightLaneLine === 4){
            rightLineImg.source = DataSource.dayNightMode === 0x02?"qrc:/images10_25/adas2d/red-r_night.png":"qrc:/images10_25/adas2d/red-r.png"
        }else{
            rightLineImg.source = ""
        }
    }

}
