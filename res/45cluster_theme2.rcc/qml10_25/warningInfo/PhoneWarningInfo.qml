import QtQuick 2.0
import com.byd.DataSource 1.0
import com.byd.CenterChild 1.0
import "qrc:/common/singleton"

//蓝牙电话提示
CenterChild{
    id:rootId
    anchors.horizontalCenter: parent.horizontalCenter
    y:197
    width: bgImg.width
    height:bgImg.hegiht
    Image{
        id:bgImg
        opacity: 0.8
        source: DataSource.dayNightMode === 0x02?"qrc:/images10_25/warningInfo/night_bg.png":"qrc:/images10_25/warningInfo/day_bg.png"
        anchors.horizontalCenter: parent.horizontalCenter
    }
    
    Image{ //头像
        id:portraitImg
        anchors.top: bgImg.top
        anchors.topMargin: 43
        anchors.horizontalCenter: parent.horizontalCenter
		// visible: false
        source: DataSource.dayNightMode === 0x02?"qrc:/images10_25/MediaInfo/portrait_night.png":"qrc:/images10_25/MediaInfo/portrait_dark.png"
    }
    
    Text{
        font.bold:rootItemId.jiacu === 1
        font.family: rootItemId.ziti //电话号码或者联系人信息
        id:phoneInfo
        anchors.top: portraitImg.bottom
        anchors.topMargin: 20
        anchors.horizontalCenter: portraitImg.horizontalCenter
        font.pixelSize: 38
        color: DataSource.dayNightMode === 0x02?"#ffffff":"#333333"
        text: DataSource.phoneInfoString
        width: 363
        elide:Text.ElideRight
        horizontalAlignment: Text.AlignHCenter
    }
    
    //通话时间
    Image{
        id:pointImg
        anchors.left: phoneStatusText.right
        anchors.leftMargin:5
        anchors.top: phoneStatusText.top
        anchors.topMargin: DataSource.language === 0x01 ? 11+4 : 11
        //anchors.horizontalCenter: phoneStatusText.horizontalCenter
        source: DataSource.dayNightMode === 0x02?"qrc:/images10_25/MediaInfo/point_night.png":"qrc:/images10_25/MediaInfo/point_day.png"
        visible: phoneStatusText.visible
    }
    Text {
        font.bold:rootItemId.jiacu === 1
        font.family: rootItemId.ziti //来电 通话中 呼叫
        id: phoneStatusText
        anchors.top: phoneInfo.bottom
        anchors.topMargin: -1
        anchors.left: bgImg.left
        anchors.leftMargin: (bgImg.width-pointImg.width-pointImg.anchors.leftMargin-phoneStatusText.contentWidth)/2
        font.pixelSize: 28
        visible: ((DataSource.commonWarningInfoId === 0x128)||((DataSource.commonWarningInfoId === 0x127)&&(DataSource.callTimeDisplay !== 1))||(DataSource.commonWarningInfoId === 0x12A))?1:0
        text: DataSource.commonWarningInfoId === 0x128? TranslateStr.warningInfoStr_Ringing:(((DataSource.commonWarningInfoId === 0x127)&&(DataSource.callTimeDisplay !== 1))?TranslateStr.warningInfoStr_0x127:TranslateStr.warningInfoStr_Calling)
        color: DataSource.dayNightMode === 0x02? "#B5B5B5":"#696969"
    }
    
    Text {
        font.bold:rootItemId.jiacu === 1
        font.family: rootItemId.ziti
        id: phoneTimeText
        anchors.top: phoneInfo.bottom
        anchors.topMargin: -1
        anchors.horizontalCenter: portraitImg.horizontalCenter
        font.pixelSize: 36
        visible: DataSource.callTimeDisplay === 1?1:0
        text: updateCallTimeText()
        color: DataSource.dayNightMode === 0x02? "#B5B5B5":"#696969"
    }
    //正中显示
    Rectangle{
        id:rect_Mid
        anchors.top: phoneTimeText.bottom
        anchors.horizontalCenter: bgImg.horizontalCenter
        width: 173
        height: 51
        color: {
            if(DataSource.commonWarningInfoId === 0x127 || DataSource.commonWarningInfoId === 0x12A){
                "#e71f19"
            }else if(DataSource.commonWarningInfoId === 0x129){
                "#22ab6c"
            }else{
                ""
            }
        }
        radius: 24
        anchors.topMargin: 20
        visible: (DataSource.commonWarningInfoId === 0x127 ||DataSource.commonWarningInfoId === 0x12a)?1:0
        Image{
            id:answerMidIcon
            anchors.bottom: parent.bottom
            anchors.bottomMargin:11
            anchors.left: rect_Mid.left
            anchors.leftMargin:(rect_Mid.width-answerMidIcon.width-answerMidText.contentWidth-answerMidText.anchors.leftMargin)/2
            source:  "qrc:/images10_25/MediaInfo/hangUp_icon.png"
        }
        Text{
            font.bold:rootItemId.jiacu === 1
            font.family: rootItemId.ziti
            id:answerMidText
            anchors.verticalCenter: parent.verticalCenter
            anchors.left: answerMidIcon.right
            anchors.leftMargin: 10
            color: "white"
            font.pixelSize: DataSource.language===0x02?26:29
            text: TranslateStr.mediaInfoStr_hangUpStr
        }
    }
    
    //左下
    Rectangle{
        id:rect_left
        anchors.top: phoneTimeText.bottom
        anchors.left: bgImg.left
        anchors.leftMargin: 77
        width: 173
        height: 51
        color: DataSource.commonWarningInfoId === 0x128? "#e71f19" : "transparent"
        radius: 24
        anchors.topMargin: 20 //29
        visible: (DataSource.commonWarningInfoId === 0x128||DataSource.commonWarningInfoId === 0x129)?1:0
        Image{
            id:answerMidIcon1
            anchors.bottom: parent.bottom
            anchors.bottomMargin: 11
            anchors.left: rect_left.left
            anchors.leftMargin: (rect_left.width-answerMidIcon1.width-answerMidText1.contentWidth-answerMidText1.anchors.leftMargin)/2
            source: DataSource.commonWarningInfoId === 0x128?"qrc:/images10_25/MediaInfo/hangUp_icon.png":""
        }
        Text{
            font.bold:rootItemId.jiacu === 1
            font.family: rootItemId.ziti
            id:answerMidText1
            anchors.verticalCenter: parent.verticalCenter
            anchors.left: DataSource.commonWarningInfoId ===0x128? answerMidIcon1.right : rect_left.left
            anchors.leftMargin: DataSource.commonWarningInfoId ===0x128? 10:((bgImg.width -answerMidText1.contentWidth)/2 -rect_left.anchors.leftMargin) //20240717 调整为通话结束时“通话结束”居中，不再显示“回拨”http://dlc.coding.byd.com/p/dilink-3.0-1for2/requirements/issues/5938/detail
            color: DataSource.commonWarningInfoId === 0x128? "white":(DataSource.dayNightMode === 0x02? "#B5B5B5":"#696969")
            font.pixelSize: DataSource.language===0x02?26:29
            text: DataSource.commonWarningInfoId === 0x128? TranslateStr.mediaInfoStr_hangUpStr:TranslateStr.warningInfoStr_0x129
        }
    }
    //右下
    Rectangle{
        id:rect_right
        anchors.top: phoneTimeText.bottom
        anchors.right: bgImg.right
        anchors.rightMargin: 77
        width: 173
        height: 51
        color: DataSource.commonWarningInfoId === 0x128? "#22ab6c" : "transparent"
        radius: 24
        anchors.topMargin: 20 //29
        visible:(DataSource.commonWarningInfoId === 0x128)?1:0  //20240717 调整为通话结束时“通话结束”居中，不再显示“回拨”http://dlc.coding.byd.com/p/dilink-3.0-1for2/requirements/issues/5938/detail
        Image{
            id:answerMidIcon2
            anchors.bottom: parent.bottom
            anchors.bottomMargin: 9
            anchors.left: rect_right.left
            anchors.leftMargin: (rect_right.width-answerMidIcon2.width-answerMidText2.contentWidth-answerMidText2.anchors.leftMargin)/2
            source: DataSource.dayNightMode === 0x02? "qrc:/images10_25/MediaInfo/answer_icon.png" :"qrc:/images10_25/MediaInfo/answerDayIcon.png"
        }
        Text{
            font.bold:rootItemId.jiacu === 1
            font.family: rootItemId.ziti
            id:answerMidText2
            anchors.verticalCenter: parent.verticalCenter
            anchors.left: answerMidIcon2.right
            anchors.leftMargin: 10
            color: DataSource.commonWarningInfoId === 0x128? "white":(DataSource.dayNightMode === 0x02? "#B5B5B5":"#696969")
            font.pixelSize: DataSource.language===0x02?26:29
            text: DataSource.commonWarningInfoId === 0x128? TranslateStr.mediaInfoStr_answerStr: TranslateStr.warningInfoStr_Dial
        }
    }
    Connections{
        target: DataSource
        function onCallTimeHourChanged(){
            updateCallTimeText()
        }
        function onCallTimeMinuteChanged(){
            updateCallTimeText()
        }
        function onCallTimeSecondChanged(){
            updateCallTimeText()
        }
    }
    function updateCallTimeText(){
        var hour=0
        var min=0
        var sec=0
        if(DataSource.callTimeHour<10){
            hour = "0"+DataSource.callTimeHour
        }else{
            hour = DataSource.callTimeHour
        }
        if(DataSource.callTimeMinute<10){
            min = "0"+DataSource.callTimeMinute
        }else{
            min = DataSource.callTimeMinute
        }
        if(DataSource.callTimeSecond<10){
            sec = "0"+DataSource.callTimeSecond
        }else{
            sec = DataSource.callTimeSecond
        }
        phoneTimeText.text = hour+":"+min+":"+sec
    }
}
