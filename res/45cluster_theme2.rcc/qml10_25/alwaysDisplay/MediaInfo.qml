import QtQuick 2.15
import com.byd.DataSource 1.0
Rectangle {
    id:rootId
    x: DataSource.themeIndex === 0x02 ? 670 : 788
    y: DataSource.themeIndex === 0x02 ? 665:80
    width: 580
    visible: rootItemId.meiTi === 0 || (DataSource.naviState === 0x0 && DataSource.naviType !== 4)
    property int musicDelayCnt:0
	property int currentIndex:1
	property string haoge:""
	property real laotie: rootId.width-80
	onLaotieChanged: {
	procssMusicChang()
	}
      
    //电话Icon
    Image {
        id: mediaInfoIconPhoneId
        x:0
        clip:true
        visible: phoneTextid.visible
        source: DataSource.dayNightMode === 0x02?"qrc:/images10_25/MediaInfo/answer_icon.png":"qrc:/images10_25/MediaInfo/answerDayIcon.png"
    }
    
     Timer {
        interval: 60
        running: DataSource.naviState === 0x0
        repeat: true
        onTriggered: {
        if (currentIndex < 84) {  
            currentIndex++;
            haoge = "qrc:/images10_25/display_always/小百度/"+currentIndex.toString().padStart(3, '0')+".png"
        } else {
            currentIndex = 1; 
        }
        }
    }       
    //music源图标
    Image {
        id: mediaInfoIconMusicId
        anchors.right: scrollRect.left
		anchors.rightMargin:3
		width: 56
		height: 56
        clip:true
            source: DataSource.naviState === 0x0 ?
			        haoge :
					rootItemId.yinYuan === 31 ? 
                    "qrc:/images10_25/MediaInfo/mediaIcon31.png" :
			        rootItemId.yinYuan === 21 ? 
                    "qrc:/images10_25/MediaInfo/mediaIcon21.png" : 
                    rootItemId.yinYuan === 20 ? 
                    "qrc:/images10_25/MediaInfo/mediaIcon20.png" :
	                    rootItemId.yinYuan === 30 ? 
                    "qrc:/images10_25/MediaInfo/mediaIcon30.png" :						
					rootItemId.yinYuan === 99 ? 
                    "qrc:/images10_25/MediaInfo/mediaIcon99.png" :
                    "qrc:/images10_25/MediaInfo/mediaIcon" + DataSource.mediaInfoIconId + ".png"
    }
    
    
    Rectangle {
        id:scrollRect
        x: m_Text.width<laotie ? (rootId.width-mediaInfoIconMusicId.width-3-m_Text.width)/2+mediaInfoIconMusicId.width-10 : mediaInfoIconMusicId.width+3
        height:60
        width: {
            if( (10 ===DataSource.mediaInfoIconId )&&(radioTextid.text !=="") ){
                (mediaInfoIconMusicId.width +scrollRect.anchors.leftMargin +radioTextid.contentWidth <=rootId.width)? radioTextid.contentWidth:( rootId.width -mediaInfoIconMusicId.width -scrollRect.anchors.leftMargin)
            }
            else if( (1 ===DataSource.mediaInfoIconId)&&(phoneTextid.text !=="") )
            {
                (mediaInfoIconPhoneId.width +scrollRect.anchors.leftMargin +phoneTextid.contentWidth <=rootId.width)? phoneTextid.contentWidth:( rootId.width -mediaInfoIconPhoneId.width -scrollRect.anchors.leftMargin)
            }
            else {
                if( m_Text.text !=="" )
                {
                    (mediaInfoIconMusicId.width +scrollRect.anchors.leftMargin +m_Text.contentWidth <=rootId.width)? m_Text.contentWidth:( rootId.width -mediaInfoIconMusicId.width -scrollRect.anchors.leftMargin)
                }
            }
        }
        color: "transparent"
        clip:true
        
        Text
        {
            font.bold:rootItemId.jiacu === 1
            id:m_Text
            width : scrollRect.width;
            y:(mediaInfoIconMusicId.height -m_Text.height)/2
            text: DataSource.naviType !== 4 && DataSource.naviState === 0x0 ? DataSource.routeRemainDisAuto + " | " + DataSource.routeRemainTimeAuto + " | " + DataSource.etaArrivalTime.slice(2, DataSource.etaArrivalTime.length - 1) : rootItemId.songName
            color: DataSource.dayNightMode === 0x02?"#ffffff":"#333333"
            maximumLineCount:1
            font.family: rootItemId.ziti
            font.pixelSize: 26
verticalAlignment: Text.AlignVCenter
            
            PropertyAnimation {
                id:mAnimationOne
                loops: 1
                target:m_Text
                property: "x";
                alwaysRunToEnd:false
                running: false
                
                from: 0;
                to: updateMoveEnd()
                duration: updateDuration(1)
                onStopped:{
                    mAnimation.duration =updateDuration(0);
                    mAnimation.start();
                }
            }
            
            PropertyAnimation {
                id:mAnimation
                loops: Animation.Infinite
                target:m_Text
                property: "x";
                alwaysRunToEnd:false
                running: false
                
                from: scrollRect.width  //从width最右开始滚动
                to: updateMoveEnd()
                duration: updateDuration(0)
            }
        }
        
        
        
        Text{
            font.bold:rootItemId.jiacu === 1
            id:radioTextid
            y:(mediaInfoIconMusicId.height -radioTextid.height)/2
            text: DataSource.fmType === 0x01?DataSource.radioInfoString:"FM "+ DataSource.radioInfoString + " MHz"
			font.family: rootItemId.ziti
            color: DataSource.dayNightMode === 0x02?"#ffffff":"#333333"
            maximumLineCount:1
            font.pixelSize: DataSource.fmType === 0x01?26:35
            horizontalAlignment: Text.AlignLeft
            verticalAlignment: Text.AlignVCenter
            visible: (10 ===DataSource.mediaInfoIconId)?true:false
        }
        
        Text{
            id:phoneTextid
            y:(mediaInfoIconPhoneId.height -phoneTextid.height)/2
            text:DataSource.phoneInfoString
			font.family: "HarmonyOS Sans Bold"
            color:DataSource.dayNightMode === 0x02?"#ffffff":"#333333"
            maximumLineCount:1
            font.pixelSize: 35
            horizontalAlignment: Text.AlignLeft
            verticalAlignment: Text.AlignVCenter
            visible: (1 ===DataSource.mediaInfoIconId)? ((phoneTextid.text !=="")? 1:0) :0
            elide:Text.ElideRight
        }
    }
    
    function updateDuration(animationType){
        if(animationType){
            return ((0 - updateMoveEnd())*300/m_Text.font.pixelSize)
        }
        else{
            return ((scrollRect.width - updateMoveEnd())*300/m_Text.font.pixelSize)
        }
    }
    
    function updateMoveEnd(){
        return (-(52 + m_Text.contentWidth))
    }
Connections {
    target: rootItemId
    function onSongNameChanged() {
        procssMusicChang()
    }
}    
function procssMusicChang()
{
    if(10 !== DataSource.mediaInfoIconId)
    {
        m_Text.x = 0;
        mAnimation.complete();
        mAnimationOne.stop();
        mAnimation.stop();
  
        var textWidth = m_Text.width;
        var shouldScroll = textWidth >= laotie;
 
        if (!shouldScroll) {
            m_Text.x = 0;
            m_Text.visible = (1 !== DataSource.mediaInfoIconId) && (10 !== DataSource.mediaInfoIconId) ? true : false;
            mediaInfoIconMusicId.visible = (10 === DataSource.mediaInfoIconId) ? radioTextid.visible : m_Text.visible;
            return; // 直接返回，不执行后续动画逻辑
        }
        
        // 判断是否为导航模式
        var isNaviMode = (DataSource.naviState === 0x0);
        
        // 导航模式：直接启动动画，不受播放状态影响
        if(isNaviMode) {
            mAnimationOne.start();
            if(musicDelayCnt > 0)
            {
                if(musicDelayCnt < 5)
                {
                    musicDelayCnt++;
                    if(mAnimationOne.running === true){
                        mAnimationOne.pause();
                    }
                    timerId.start();
                    return;
                }
                musicDelayCnt = 0;
            }
            if(mAnimationOne.running === false && mAnimation.running === false) {
                mAnimationOne.running = true;
            }
        }
        // 非导航模式：受播放状态影响
        else {
            mAnimationOne.start();
            
            //如果是切歌和切源时，都要延时一下再滚动
            if(musicDelayCnt > 0)
            {
                if(musicDelayCnt < 5)
                {
                    musicDelayCnt++;
                    if(mAnimationOne.running === true){
                        mAnimationOne.pause();
                    }
                    timerId.start();
                    return;
                }
                musicDelayCnt = 0;
            }
            
            if(1 === rootItemId.multimediaPlayStatus)
            {
                if( (mAnimationOne.running === true) && (mAnimationOne.paused === true)){
                    mAnimationOne.resume();
                }
                else if((mAnimation.running === true) && (mAnimation.paused === true) ){
                    mAnimation.resume();
                }
                else if((mAnimationOne.running === false) && (mAnimation.running === false) ){
                    mAnimationOne.running = true
                }
            }
            else if(mAnimationOne.running === true){
                mAnimationOne.pause();
            }
            else if(mAnimation.running === true){
                mAnimation.pause();
            }
        }
    }
    
    // 再次检查，如果动画运行过程中宽度变小了，停止动画
    if (m_Text.width < laotie) {
        mAnimationOne.stop();
        mAnimation.stop();
        m_Text.x = 0;
    }
    
    m_Text.visible = (1 !== DataSource.mediaInfoIconId) && (10 !== DataSource.mediaInfoIconId) ? true : false;
    mediaInfoIconMusicId.visible = (10 === DataSource.mediaInfoIconId) ? radioTextid.visible : m_Text.visible;
}
    Timer {
        id:timerId
        interval: 200
        running: false
        repeat: false
        onTriggered:
        {
            procssMusicChang();
        }
    }
    
    Connections{
        target: DataSource
		function onNaviStateChanged(){
		procssMusicChang()
		}		
        function onMediaInfoStringChanged(){
            //非(蓝牙电话和收音机)切歌都要延迟一下以便播放状态曲目滚动时能看清曲目第一个字
            if(( 1 !==DataSource.mediaInfoIconId)&&(10 !==DataSource.mediaInfoIconId)){
                musicDelayCnt =1;
            }
            else {
                musicDelayCnt =0;
            }
            timerId.stop();
            timerId.start();
        }
        
        function onMediaInfoIconIdChanged()
        {   //切到非(蓝牙电话和收音机)源时都要延迟一下以便播放状态曲目滚动时能看清曲目第一个字
            if(( 1 !==DataSource.mediaInfoIconId)&&(10 !==DataSource.mediaInfoIconId)){
                musicDelayCnt =1;
            }
            else {
                mediaInfoIconMusicId.visible = ((10 ===DataSource.mediaInfoIconId)? radioTextid.visible:false)
                m_Text.visible =false
                musicDelayCnt =0;
            }
            timerId.stop();
            timerId.start();
        }
        
        function onMultimediaPlayStatusChanged()
        {
            timerId.stop();
            timerId.start();
        }

    }
    
    Component.onCompleted: {
        //每次启动MediaInfo.qml时都要延迟一下以便是播放状态时滚动能看清曲目第一个字
        musicDelayCnt =1;
        procssMusicChang();
    }
    
}