import QtQuick 2.15
import QtGraphicalEffects 1.12
import com.byd.DataSource 1.0
import QtQuick.Shapes 1.15
import "qrc:/common/singleton"

Item {
    id: powerDashRootId
    width: 814
    height: 619


    property real selfCheckPowerRealValue:0
    property bool hasSelfChecked: false
    property real angleValue:0
    readonly property int powerFillX:30
    readonly property int powerFillY:32
    readonly property int powerFillArcWidth: 132
    readonly property int arcCenterX: 282
    readonly property int arcCenterY: 277
    readonly property int arcRadius:282
    property real evMinPowerValue: 0
    property real evMaxPowerValue:0

    Component.onCompleted: {
        if(DataSource.playAnim  === true){
            hasSelfChecked = true
            realPowerUpdate()
            if(DataSource.changeDashBoard === true){
                classicPowerMaskId.opacity = 0
                needleMaskId.opacity=0
                classicPowerTextItemId.opacity=0
                classicPowerMaskId.opacity =0
            }
        }
    }

    Image {
        id: powerBgIdOne
        x:powerFillX+3
        y:powerFillY
        source: DataSource.dayNightMode === 0x02?"qrc:/images10_25/display_always/dash/classic/night/power_bg_one.astc":"qrc:/images10_25/display_always/dash/classic/day/power_bg_one.astc"
    }


    Image {
        id: powerFillId
        x:powerFillX
        y:powerFillY
        source: DataSource.dayNightMode === 0x02?"qrc:/images10_25/display_always/dash/classic/night/power_fill.astc":"qrc:/images10_25/display_always/dash/classic/day/power_fill.astc"
        visible: false
    }

    Shape {
        id:shapeId
        x:powerFillX
        y:powerFillY
        anchors.verticalCenter: parent.verticalCenter
        width:powerFillId.width
        height:powerFillId.height
        property real arcX: arcCenterX+arcRadius*Math.cos(Math.PI*0.798)
        property real arcY: arcCenterY+arcRadius*Math.sin(Math.PI*0.798)
        ShapePath {
            strokeWidth: 1
            strokeColor: "red"
            fillColor: "red"
            startX: arcCenterX
            startY: arcCenterY
            PathLine { x: arcCenterX + arcRadius*Math.cos(Math.PI*0.798); y: arcCenterY + arcRadius*Math.sin(Math.PI*0.798) }
            PathArc {
                id:pathArcId
                x: shapeId.arcX
                y: shapeId.arcY
                radiusX: arcRadius
                radiusY: arcRadius
            }
            PathLine { x: arcCenterX; y:arcCenterY }
        }
        visible: false
    }

    OpacityMask{
        id:classicPowerMaskId
        anchors.fill:powerFillId
        source:powerFillId
        maskSource: shapeId
        visible: (hasSelfChecked===true && ((-0.25<DataSource.realPower && DataSource.realPower<0.25)||DataSource.realPower===1001))?false:true
    }

    Image {
        id: powerBgId
        source: DataSource.dayNightMode === 0x02?"qrc:/images10_25/display_always/dash/classic/night/power_bg.astc":"qrc:/images10_25/display_always/dash/classic/day/power_bg.astc"
    }

    Image {
        id: powerFillMaskId
        x:powerFillX
        y:powerFillY
        source: DataSource.dayNightMode === 0x02?"qrc:/images10_25/display_always/dash/classic/night/power_fill_mask.astc":"qrc:/images10_25/display_always/dash/classic/day/power_fill_mask.astc"
        visible: false
    }


    /*
    Canvas{
        id:canvasId
        x:powerFillX
        y:powerFillY
        anchors.verticalCenter: parent.verticalCenter
        property real progressValue:DataSource.power
        width:powerFillId.width
        height:powerFillId.height
        onPaint: {
            var ctx = getContext("2d");
            ctx.fillStyle="red"
            ctx.strokeStyle = "red"
            ctx.lineWidth =powerFillArcWidth
            //ctx.fillRect(0,0,h,200)

            ctx.beginPath();
            ctx.fillStyle="transparent"
            ctx.clearRect(0,0,powerFillId.width,powerFillId.height);
            ctx.fillStyle="red"

            if(!hasSelfChecked){
                //自检动画
                if(DataSource.powerUnit === 2){
                    ctx.arc(arcCenterX,arcCenterY,arcRadius-powerFillArcWidth/2,0.789*Math.PI,Math.PI*0.789+((progressValue)/150)*Math.PI*1.033,false)
                }else{
                    ctx.arc(arcCenterX,arcCenterY,arcRadius-powerFillArcWidth/2,0.789*Math.PI,Math.PI*0.789+((progressValue)/240)*Math.PI*1.033,false)
                }
            }else{
                if(DataSource.powerUnit === 0x02){
                    if(progressValue === -134){
                        ctx.arc(arcCenterX,arcCenterY,arcRadius-powerFillArcWidth/2,Math.PI*0.798,(0.798-0.298)*Math.PI,true)
                    }else if(progressValue < -53){
                        ctx.arc(arcCenterX,arcCenterY,arcRadius-powerFillArcWidth/2,Math.PI*0.798,(0.798-0.298*2/3-0.298/3/81*((-progressValue)-53))*Math.PI,true)
                    }else if(progressValue <= 0){
                        ctx.arc(arcCenterX,arcCenterY,arcRadius-powerFillArcWidth/2,Math.PI*0.798,(0.798-0.298*2/3+0.298*2/3*(53+progressValue)/53)*Math.PI,true)
                    }else if(progressValue <= 46){
                        ctx.arc(arcCenterX,arcCenterY,arcRadius-powerFillArcWidth/2,Math.PI*0.798,(0.798+0.367*progressValue/46)*Math.PI,false)
                    }else if(progressValue <= 134){
                        ctx.arc(arcCenterX,arcCenterY,arcRadius-powerFillArcWidth/2,Math.PI*0.798,(0.798+0.367+0.667*0.75*(progressValue-46)/88)*Math.PI,false)
                    }else if(progressValue < 670){
                        ctx.arc(arcCenterX,arcCenterY,arcRadius-powerFillArcWidth/2,Math.PI*0.798,(0.798+0.367+0.667*0.75+0.667*0.25*(progressValue-134)/536)*Math.PI,false)
                    }else if(progressValue === 670){
                        ctx.arc(arcCenterX,arcCenterY,arcRadius-powerFillArcWidth/2,Math.PI*0.798,(0.798+0.367+0.667)*Math.PI,false)
                    }
                }else{
                    if(progressValue === -100){
                        ctx.arc(arcCenterX,arcCenterY,arcRadius-powerFillArcWidth/2,Math.PI*0.798,(0.798-0.298)*Math.PI,true)
                    }else if(progressValue < -40){
                        ctx.arc(arcCenterX,arcCenterY,arcRadius-powerFillArcWidth/2,Math.PI*0.798,(0.798-0.298*2/3-0.298/3/60*((-progressValue)-40))*Math.PI,true)
                    }else if(progressValue <= 0){
                        ctx.arc(arcCenterX,arcCenterY,arcRadius-powerFillArcWidth/2,Math.PI*0.798,(0.798-0.298*2/3+0.298*2/3*(40+progressValue)/40)*Math.PI,true)
                    }
                    else if(progressValue <= 35){
                        ctx.arc(arcCenterX,arcCenterY,arcRadius-powerFillArcWidth/2,Math.PI*0.798,(0.798+0.367*progressValue/35)*Math.PI,false)
                    }else if(progressValue <= 100){
                        ctx.arc(arcCenterX,arcCenterY,arcRadius-powerFillArcWidth/2,Math.PI*0.798,(0.798+0.367+0.667*0.75*(progressValue-35)/65)*Math.PI,false)
                    }else if(progressValue < 500){
                        ctx.arc(arcCenterX,arcCenterY,arcRadius-powerFillArcWidth/2,Math.PI*0.798,(0.798+0.367+0.667*0.75+0.667*0.25*(progressValue-100)/400)*Math.PI,false)
                    }else if(progressValue === 500){
                        ctx.arc(arcCenterX,arcCenterY,arcRadius-powerFillArcWidth/2,Math.PI*0.798,(0.798+0.367+0.667)*Math.PI,false)
                    }
                }
            }

            ctx.stroke()

        }
        onProgressValueChanged: {
            updateNeedleRotation()
            requestPaint()
        }
        function updateNeedleRotation(){
            if(!hasSelfChecked){
                //自检动画
                if(DataSource.powerUnit === 2){
                    needleImgId.rotation = 142 + progressValue/150*186
                }else{
                    needleImgId.rotation = 142 + progressValue/240*186
                }
            }else{
                if(DataSource.powerUnit === 2){
                    if(progressValue <= 1){
                        if(progressValue < -53){
                            needleImgId.rotation = (0.798-0.298*2/3-0.298/3/81*((-progressValue)-53))*180
                        }else{
                            needleImgId.rotation = (0.798+(progressValue*0.674/180))*180 //(0.798-0.298*2/3+0.298*2/3*(53+progressValue)/53)*180
                        }
                    }else{
                        if(progressValue <= 46){
                            needleImgId.rotation = (0.798+0.367*progressValue/46)*180-0.761
                        }else if(progressValue <= 134){
                            needleImgId.rotation = (0.798+0.367+0.667*0.75*(progressValue-46)/88)*180-0.761
                        }else if(progressValue < 670){
                            needleImgId.rotation = (0.798+0.367+0.667*0.75+0.667*0.25*(progressValue-134)/536)*180-0.761
                        }else if(progressValue == 670){
                            needleImgId.rotation = (0.798+0.367+0.667)*180-0.761
                        }
                    }
                }else{
                    if(progressValue <= 1){
                        if(progressValue < -40){
                            needleImgId.rotation =(0.798-0.298*2/3-0.298/3/60*((-progressValue)-40))*180
                        }else{
                            needleImgId.rotation = (0.798+(progressValue*0.894/180))*180//(0.798-0.298*2/3+0.298*2/3*(40+progressValue)/40)*180
                        }
                    }
                    else{
                        if(progressValue <= 35){
                            needleImgId.rotation = (0.798+0.367*progressValue/35)*180-1.013
                        }else if(progressValue <= 100){
                            needleImgId.rotation = (0.798+0.367+0.667*0.75*(progressValue-35)/65)*180-1.013
                        }else if(progressValue < 500){
                            needleImgId.rotation = (0.798+0.367+0.667*0.75+0.667*0.25*(progressValue-100)/400)*180-1.013
                        }else if(progressValue == 500){
                            needleImgId.rotation = (0.798+0.367+0.667)*180-1.013
                        }
                    }
                }
            }
        }

        visible: false
    }
    */
    function realPowerUpdateRange1(){//44e 0x1
        if(DataSource.powerUnit === 0x02){
            if(DataSource.realPower <= 1){
                if(DataSource.realPower <= -134){
                    needleImgId.rotation = (0.798-0.298*2/3-0.298/3/81*((134)-53))*180
                }else if(DataSource.realPower < -53){
                    needleImgId.rotation = (0.798-0.298*2/3-0.298/3/81*((-DataSource.realPower)-53))*180-1
                }else{
                    needleImgId.rotation = (0.798+(DataSource.realPower*0.674/180))*180-1
                }
            }else{
                if(DataSource.realPower <= 40){
                    needleImgId.rotation = (0.798+0.367*DataSource.realPower/40)*180-1.793
                }else if(DataSource.realPower <= 120){
                    needleImgId.rotation = (0.798+0.367+0.667*0.75*(DataSource.realPower-40)/80)*180-1.793
                }else if(DataSource.realPower < 402){
                    needleImgId.rotation = (0.798+0.367+0.667*0.75+0.667*0.25*(DataSource.realPower-120)/282)*180-1.793
                }else if(DataSource.realPower >= 402){
                    needleImgId.rotation = (0.798+0.367+0.667)*180-1.603
                }
            }

            if(DataSource.realPower <= -134){
                angleValue = (0.798-0.298)
            }else if(DataSource.realPower < -53){
                angleValue =(0.798-0.298*2/3-0.298/3/81*((-DataSource.realPower)-53))
            }else if(DataSource.realPower <= 0){
                angleValue =(0.798-0.298*2/3+0.298*2/3*(53+DataSource.realPower)/53)
            }else if(DataSource.realPower <= 40){
                angleValue =(0.798+0.367*DataSource.realPower/40)
            }else if(DataSource.realPower <= 120){
                angleValue =(0.798+0.367+0.667*0.75*(DataSource.realPower-40)/80)
            }else if(DataSource.realPower < 402){
                angleValue =(0.798+0.367+0.667*0.75+0.667*0.25*(DataSource.realPower-120)/282)
            }else if(DataSource.realPower >= 402){
                angleValue =(0.798+0.367+0.667)
            }
        }else{
            if(DataSource.realPower <= 1){
                if(DataSource.realPower <= -100){
                    needleImgId.rotation =(0.798-0.298*2/3-0.298/3/60*((100)-40))*180
                }else if(DataSource.realPower < -40){
                    needleImgId.rotation =(0.798-0.298*2/3-0.298/3/60*((-DataSource.realPower)-40))*180-1
                }else{
                    needleImgId.rotation = (0.798+(DataSource.realPower*0.894/180))*180-1
                }
            }
            else{
                if(DataSource.realPower <= 30){
                    needleImgId.rotation = (0.798+0.367*DataSource.realPower/30)*180-1.793
                }else if(DataSource.realPower <= 90){
                    needleImgId.rotation = (0.798+0.367+0.667*0.75*(DataSource.realPower-30)/60)*180-1.793
                }else if(DataSource.realPower < 300){
                    needleImgId.rotation = (0.798+0.367+0.667*0.75+0.667*0.25*(DataSource.realPower-90)/210)*180-1.793
                }else if(DataSource.realPower >= 300){
                    needleImgId.rotation = (0.798+0.367+0.667)*180-1.603
                }
            }
            if(DataSource.realPower <= -100){
                angleValue = (0.798-0.298)
            }else if(DataSource.realPower < -40){
                angleValue = (0.798-0.298*2/3-0.298/3/60*((-DataSource.realPower)-40))
            }else if(DataSource.realPower <= 0){
                angleValue = (0.798-0.298*2/3+0.298*2/3*(40+DataSource.realPower)/40)
            }else if(DataSource.realPower <= 30){
                angleValue = (0.798+0.367*DataSource.realPower/30)
            }else if(DataSource.realPower <= 90){
                angleValue = (0.798+0.367+0.667*0.75*(DataSource.realPower-30)/60)
            }else if(DataSource.realPower < 300){
                angleValue = (0.798+0.367+0.667*0.75+0.667*0.25*(DataSource.realPower-90)/210)
            }else if(DataSource.realPower >= 300){
                angleValue =(0.798+0.367+0.667)
            }
        }
    }
    function realPowerUpdateRange2(){//44e 0x2
        if(DataSource.powerUnit === 0x02){
            if(DataSource.realPower <= 1){
                if(DataSource.realPower <= -134){
                    needleImgId.rotation = (0.798-0.298*2/3-0.298/3/81*((134)-53))*180
                }else if(DataSource.realPower < -53){
                    needleImgId.rotation = (0.798-0.298*2/3-0.298/3/81*((-DataSource.realPower)-53))*180-1
                }else{
                    needleImgId.rotation = (0.798+(DataSource.realPower*0.674/180))*180-1
                }
            }else{
                if(DataSource.realPower <= 46){
                    needleImgId.rotation = (0.798+0.367*DataSource.realPower/46)*180-1.793
                }else if(DataSource.realPower <= 134){
                    needleImgId.rotation = (0.798+0.367+0.667*0.75*(DataSource.realPower-46)/88)*180-1.793
                }else if(DataSource.realPower < 402){
                    needleImgId.rotation = (0.798+0.367+0.667*0.75+0.667*0.25*(DataSource.realPower-134)/268)*180-1.793
                }else if(DataSource.realPower >= 402){
                    needleImgId.rotation = (0.798+0.367+0.667)*180-1.603
                }
            }

            if(DataSource.realPower <= -134){
                angleValue = (0.798-0.298)
            }else if(DataSource.realPower < -53){
                angleValue =(0.798-0.298*2/3-0.298/3/81*((-DataSource.realPower)-53))
            }else if(DataSource.realPower <= 0){
                angleValue =(0.798-0.298*2/3+0.298*2/3*(53+DataSource.realPower)/53)
            }else if(DataSource.realPower <= 46){
                angleValue =(0.798+0.367*DataSource.realPower/46)
            }else if(DataSource.realPower <= 134){
                angleValue =(0.798+0.367+0.667*0.75*(DataSource.realPower-46)/88)
            }else if(DataSource.realPower < 402){
                angleValue =(0.798+0.367+0.667*0.75+0.667*0.25*(DataSource.realPower-134)/268)
            }else if(DataSource.realPower >= 402){
                angleValue =(0.798+0.367+0.667)
            }

        }else{
            if(DataSource.realPower <= 1){
                if(DataSource.realPower <= -100){
                    needleImgId.rotation =(0.798-0.298*2/3-0.298/3/60*((100)-40))*180
                }else if(DataSource.realPower < -40){
                    needleImgId.rotation =(0.798-0.298*2/3-0.298/3/60*((-DataSource.realPower)-40))*180-1
                }else{
                    needleImgId.rotation = (0.798+(DataSource.realPower*0.894/180))*180-1
                }
            }
            else{
                if(DataSource.realPower <= 35){
                    needleImgId.rotation = (0.798+0.367*DataSource.realPower/35)*180-1.793
                }else if(DataSource.realPower <= 100){
                    needleImgId.rotation = (0.798+0.367+0.667*0.75*(DataSource.realPower-35)/65)*180-1.793
                }else if(DataSource.realPower < 300){
                    needleImgId.rotation = (0.798+0.367+0.667*0.75+0.667*0.25*(DataSource.realPower-100)/200)*180-1.793
                }else if(DataSource.realPower >= 300){
                    needleImgId.rotation = (0.798+0.367+0.667)*180-1.603
                }
            }
            if(DataSource.realPower <= -100){
                angleValue = (0.798-0.298)
            }else if(DataSource.realPower < -40){
                angleValue = (0.798-0.298*2/3-0.298/3/60*((-DataSource.realPower)-40))
            }else if(DataSource.realPower <= 0){
                angleValue = (0.798-0.298*2/3+0.298*2/3*(40+DataSource.realPower)/40)
            }else if(DataSource.realPower <= 35){
                angleValue = (0.798+0.367*DataSource.realPower/35)
            }else if(DataSource.realPower <= 100){
                angleValue = (0.798+0.367+0.667*0.75*(DataSource.realPower-35)/65)
            }else if(DataSource.realPower < 300){
                angleValue = (0.798+0.367+0.667*0.75+0.667*0.25*(DataSource.realPower-100)/200)
            }else if(DataSource.realPower >= 300){
                angleValue =(0.798+0.367+0.667)
            }
        }
    }
    function realPowerUpdateRange3(){//44e 0x3
        if(DataSource.powerUnit === 0x02){
            if(DataSource.realPower <= 1){
                if(DataSource.realPower <= -134){
                    needleImgId.rotation = (0.798-0.298*2/3-0.298/3/81*((134)-53))*180
                }else if(DataSource.realPower < -53){
                    needleImgId.rotation = (0.798-0.298*2/3-0.298/3/81*((-DataSource.realPower)-53))*180-1
                }else{
                    needleImgId.rotation = (0.798+(DataSource.realPower*0.674/180))*180-1
                }
            }else{
                if(DataSource.realPower <= 46){
                    needleImgId.rotation = (0.798+0.367*DataSource.realPower/46)*180-1.793
                }else if(DataSource.realPower <= 134){
                    needleImgId.rotation = (0.798+0.367+0.667*0.75*(DataSource.realPower-46)/88)*180-1.793
                }else if(DataSource.realPower < 670){
                    needleImgId.rotation = (0.798+0.367+0.667*0.75+0.667*0.25*(DataSource.realPower-134)/536)*180-1.793
                }else if(DataSource.realPower >= 670){
                    needleImgId.rotation = (0.798+0.367+0.667)*180-1.603
                }
            }

            if(DataSource.realPower <= -134){
                angleValue = (0.798-0.298)
            }else if(DataSource.realPower < -53){
                angleValue =(0.798-0.298*2/3-0.298/3/81*((-DataSource.realPower)-53))
            }else if(DataSource.realPower <= 0){
                angleValue =(0.798-0.298*2/3+0.298*2/3*(53+DataSource.realPower)/53)
            }else if(DataSource.realPower <= 46){
                angleValue =(0.798+0.367*DataSource.realPower/46)
            }else if(DataSource.realPower <= 134){
                angleValue =(0.798+0.367+0.667*0.75*(DataSource.realPower-46)/88)
            }else if(DataSource.realPower < 670){
                angleValue =(0.798+0.367+0.667*0.75+0.667*0.25*(DataSource.realPower-134)/536)
            }else if(DataSource.realPower >= 670){
                angleValue =(0.798+0.367+0.667)
            }

        }else{
            if(DataSource.realPower <= 1){
                if(DataSource.realPower <= -100){
                    needleImgId.rotation =(0.798-0.298*2/3-0.298/3/60*((100)-40))*180
                }else if(DataSource.realPower < -40){
                    needleImgId.rotation =(0.798-0.298*2/3-0.298/3/60*((-DataSource.realPower)-40))*180-1
                }else{
                    needleImgId.rotation = (0.798+(DataSource.realPower*0.894/180))*180-1
                }
            }
            else{
                if(DataSource.realPower <= 35){
                    needleImgId.rotation = (0.798+0.367*DataSource.realPower/35)*180-1.793
                }else if(DataSource.realPower <= 100){
                    needleImgId.rotation = (0.798+0.367+0.667*0.75*(DataSource.realPower-35)/65)*180-1.793
                }else if(DataSource.realPower < 500){
                    needleImgId.rotation = (0.798+0.367+0.667*0.75+0.667*0.25*(DataSource.realPower-100)/400)*180-1.793
                }else if(DataSource.realPower >= 500){
                    needleImgId.rotation = (0.798+0.367+0.667)*180-1.603
                }

            }
            if(DataSource.realPower <= -100){
                angleValue = (0.798-0.298)
            }else if(DataSource.realPower < -40){
                angleValue = (0.798-0.298*2/3-0.298/3/60*((-DataSource.realPower)-40))
            }else if(DataSource.realPower <= 0){
                angleValue = (0.798-0.298*2/3+0.298*2/3*(40+DataSource.realPower)/40)
            }else if(DataSource.realPower <= 35){
                angleValue = (0.798+0.367*DataSource.realPower/35)
            }else if(DataSource.realPower <= 100){
                angleValue = (0.798+0.367+0.667*0.75*(DataSource.realPower-35)/65)
            }else if(DataSource.realPower < 500){
                angleValue = (0.798+0.367+0.667*0.75+0.667*0.25*(DataSource.realPower-100)/400)
            }else if(DataSource.realPower >= 500){
                angleValue =(0.798+0.367+0.667)
            }
        }
    }
    function updateEvMinMaxValue(){
        /*0x40D，2.0-2.7，值为0x8A/0xA5，同时0x341，7.0-7.2值为01时，功率范围为：-100~300；
          0x40D，2.0-2.7，值为0x8E，同时0x341，7.0-7.2值为01时，功率范围为：-100~200；
          0x40D，2.0-2.7，值为0x8A/0xA5/0x8E，同时0x341，7.0-7.2值为02时，功率范围为：-200~400；
          0x40D，2.0-2.7，值为0xB5，同时0x341，7.0-7.2值为01时，功率范围为：-120~200；
          0x40D，2.0-2.7，值为0x80，同时0x341，7.0-7.2值为01时，功率范围为：-150~200
          0x40D，2.0-2.7，值为0xC0，同时0x341，7.0-7.2值为03时，功率范围为：-150~200
          0x40D，2.0-2.7，值为0xBF，同时0x341，7.0-7.2值为02或03时，功率范围为：-150~200；
          0x40D，2.0-2.7，值为0xD5，同时0x341，7.0-7.2值为03时，功率范围为：-200~200
          收到0x40D和0x341的值不为以上两种组合或者未收到以上两个信号，默认按照-100~500做
        */
        if(DataSource.evPowerRangeSelf === 0x05){
            evMinPowerValue = -100
            evMaxPowerValue = 200
        }else if(DataSource.evPowerRangeSelf === 0x06){
            evMinPowerValue = -200
            evMaxPowerValue = 400
        }else if(DataSource.evPowerRangeSelf === 0x08){
            evMinPowerValue = -120
            evMaxPowerValue = 200
        }else if(DataSource.evPowerRangeSelf === 0x09){
            evMinPowerValue = -100
            evMaxPowerValue = 300
        }else if(DataSource.evPowerRangeSelf === 0x0A){
            evMinPowerValue = -150
            evMaxPowerValue = 200
        }else if(DataSource.evPowerRangeSelf === 0x0B){
            evMinPowerValue = -200
            evMaxPowerValue = 200
        }else{
            evMinPowerValue = -100
            evMaxPowerValue = 500
        }
    }
    function realPowerUpdateRangeEv(){//ev
        /*
          负值：0-最小值的2/3占负值段2/3,2/3最小值到最小值占负值段1/3 正值：0-20%最大值占eco，20%最大值-80%最大值占power段3/4,80%最大值-最大值占1/4
          模式五:min:-100 max：200 -100-(-60)-0-40-160-200
          模式六:min:-200 max：400 -200-(-120)-0-80-320-400
          模式八:min:--120 max：200 -120-(-80)-0-40-160-200
          模式九:min:--100 max：300 -100-(-60)-0-60-240-300
          模式七:min:-100 max：500 -100-(-60)-0-100-400-500
        */
        updateEvMinMaxValue()
        var powerIndexValue
        var minBate
        var maxBate
        if(DataSource.powerUnit === 0x02){
            minBate = evMinPowerValue*1.34/(-134)
            maxBate = evMaxPowerValue*1.34/(300*1.34)
            if(DataSource.realPower<0){
                powerIndexValue = Math.trunc(DataSource.realPower/minBate)
            }else{
                powerIndexValue = Math.trunc(DataSource.realPower/maxBate)
            }

            if(powerIndexValue <= 1){
                if(powerIndexValue <= -134){
                    needleImgId.rotation = (0.798-0.298*2/3-0.298/3/54*((134)-80))*180
                }else if(powerIndexValue < -80){
                    needleImgId.rotation = (0.798-0.298*2/3-0.298/3/54*((-powerIndexValue)-80))*180-1
                }else{
                    needleImgId.rotation = (0.798+(powerIndexValue*(53*0.674/80)/180))*180-1
                }
            }else{
                if(powerIndexValue <= 80){
                    needleImgId.rotation = (0.798+0.367*powerIndexValue/80)*180-1.793
                }else if(powerIndexValue <= 322){
                    needleImgId.rotation = (0.798+0.367+0.667*0.75*(powerIndexValue-80)/242)*180-1.793
                }else if(powerIndexValue < 402){
                    needleImgId.rotation = (0.798+0.367+0.667*0.75+0.667*0.25*(powerIndexValue-322)/80)*180-1.793
                }else if(powerIndexValue >= 402){
                    needleImgId.rotation = (0.798+0.367+0.667)*180-1.603
                }
            }

            if(powerIndexValue <= -134){
                angleValue = (0.798-0.298)
            }else if(powerIndexValue < -80){
                angleValue =(0.798-0.298*2/3-0.298/3/54*((-powerIndexValue)-80))
            }else if(powerIndexValue <= 0){
                angleValue =(0.798-0.298*2/3+0.298*2/3*(80+powerIndexValue)/80)
            }else if(powerIndexValue <= 80){
                angleValue = (0.798+0.367*powerIndexValue/80)
            }else if(powerIndexValue <= 322){
                angleValue = (0.798+0.367+0.667*0.75*(powerIndexValue-80)/242)
            }else if(powerIndexValue < 402){
                angleValue = (0.798+0.367+0.667*0.75+0.667*0.25*(powerIndexValue-322)/80)
            }else if(powerIndexValue >= 402){
                angleValue =(0.798+0.367+0.667)
            }
        }else{
            minBate = evMinPowerValue/(-100)
            maxBate = evMaxPowerValue/(300)
            if(DataSource.realPower<0){
                powerIndexValue = DataSource.realPower/minBate
            }else{
                powerIndexValue = DataSource.realPower/maxBate
            }
            if(powerIndexValue <= 1){
                if(powerIndexValue <= -100){
                    needleImgId.rotation =(0.798-0.298*2/3-0.298/3/40*((100)-60))*180
                }else if(powerIndexValue < -60){
                    needleImgId.rotation =(0.798-0.298*2/3-0.298/3/40*((-powerIndexValue)-60))*180-1
                }else{
                    needleImgId.rotation = (0.798+(powerIndexValue*(40*0.894/60)/180))*180-1
                }
            }else{
                if(powerIndexValue <= 60){
                    needleImgId.rotation = (0.798+0.367*powerIndexValue/60)*180-1.013
                }else if(powerIndexValue <= 240){
                    needleImgId.rotation = (0.798+0.367+0.667*0.75*(powerIndexValue-60)/180)*180-1.793
                }else if(powerIndexValue < 300){
                    needleImgId.rotation = (0.798+0.367+0.667*0.75+0.667*0.25*(powerIndexValue-240)/60)*180-1.793
                }else if(powerIndexValue >= 300){
                    needleImgId.rotation = (0.798+0.367+0.667)*180-1.603
                }
            }
            if(powerIndexValue <= -100){
                angleValue = (0.798-0.298)
            }else if(powerIndexValue < -60){
                angleValue = (0.798-0.298*2/3-0.298/3/40*((-powerIndexValue)-60))
            }else if(powerIndexValue <= 0){
                angleValue = (0.798-0.298*2/3+0.298*2/3*(60+powerIndexValue)/60)
            }else if(powerIndexValue <= 60){
                angleValue = (0.798+0.367*powerIndexValue/60)
            }else if(powerIndexValue <= 240){
                angleValue = (0.798+0.367+0.667*0.75*(powerIndexValue-60)/180)
            }else if(powerIndexValue < 300){
                angleValue = (0.798+0.367+0.667*0.75+0.667*0.25*(powerIndexValue-240)/60)
            }else if(powerIndexValue >= 300){
                angleValue =(0.798+0.367+0.667)
            }
        }
    }

    function realPowerUpdate(){
        if(!hasSelfChecked){
            //自检
            angleValue =(0.798+(0.367+0.667)*powerDashRootId.selfCheckPowerRealValue/100)
            needleImgId.rotation = angleValue*180
            pathArcId.direction = PathArc.Clockwise
            pathArcId.useLargeArc = angleValue - 0.798 > 1?true:false
        }else{
            if(DataSource.power === 1001){//无效值
                //powerValueTextId.text = 0
                angleValue =(0.798-0.298*2/3+0.298*2/3*(53+0)/53)
                needleImgId.rotation = (0.798+0.367*0/35)*180-1.013
            }else{
                //功率值直接绑定DataSource.power，和填充条刷新分开
                //powerValueTextId.text = Math.round(DataSource.realPower)
                if(DataSource.realPower < 0){
                    pathArcId.direction = PathArc.Counterclockwise
                }else{
                    pathArcId.direction = PathArc.Clockwise
                }
                if(DataSource.vehicleType === 2){//混动
                    if(DataSource.powerRangeSelf === 1){
                        realPowerUpdateRange1()
                    }else if(DataSource.powerRangeSelf === 2){
                        realPowerUpdateRange2()
                    }else{
                        realPowerUpdateRange3()
                    }
                }else{//纯电
                    realPowerUpdateRangeEv()
                }
            }
            if(angleValue - 0.798 > 1){
                pathArcId.useLargeArc = true
            }else{
                pathArcId.useLargeArc = false
            }
        }

        shapeId.arcX = arcCenterX+arcRadius*Math.cos(angleValue*Math.PI)
        shapeId.arcY = arcCenterY+arcRadius*Math.sin(angleValue*Math.PI)
    }

    Item{
        id:needleItemId
        x:powerFillX
        y:powerFillY
        width: powerFillId.width
        height: powerFillId.height
        Image{

            id:needleImgId
            x:arcCenterX
            y:arcCenterY
            source: DataSource.dayNightMode === 0x02?"qrc:/images10_25/display_always/dash/classic/night/power_needle.png":"qrc:/images10_25/display_always/dash/classic/day/power_needle.png"
            visible: true
            antialiasing: true
            transformOrigin:Item.TopLeft
        }

        visible: false
    }

    OpacityMask{
        id:needleMaskId
        anchors.fill:needleItemId
        source:needleItemId
        maskSource: powerFillMaskId
        visible: (hasSelfChecked===true && ((-0.25<DataSource.realPower && DataSource.realPower<0.25)||DataSource.realPower===1001))?false:true
    }

    Item{
        id:classicPowerTextItemId
        x:189
        y:280
        width: 264
        height: 115
        Text {
            font.bold:rootItemId.jiacu === 1
            id:powerValueTextId
            anchors.bottom: powerUnitTextId.top
            anchors.bottomMargin: -20
            anchors.horizontalCenter:parent.horizontalCenter
            text:DataSource.power
            font.pixelSize: 135
            font.family: rootItemId.ziti
            color: DataSource.dayNightMode === 0x02?"#fefefe":"#333333"
            visible: DataSource.power !== 1001 ? true : false
        }
        Text {
            font.bold:rootItemId.jiacu === 1
            font.family: rootItemId.ziti
            id:powerUnitTextId
            anchors.horizontalCenter:powerValueTextId.horizontalCenter
            y:83
            text: DataSource.powerUnit !== 2 ? "kW" : "HP"
            font.pixelSize: 45
            color: DataSource.dayNightMode === 0x02?"#fefefe":"#333333"
            visible: DataSource.power !== 1001 ? true : false
        }

    }

    /*
    Text {
        id:minTextId
        x:227
        y:520
        text: updatePowerText()
        font.pixelSize: 37
        color: DataSource.dayNightMode === 0x02?"#fefefe":"#000000"
    }
    Text {
        id:zeroTextId
        x:114
        y:435
        text: "0"
        font.pixelSize: 37
        color: DataSource.dayNightMode === 0x02?"#fefefe":"#000000"
    }
    Text {
        id:maxTextId
        x:449
        y:167
        text: updatePowerText()
        font.pixelSize: 37
        color: DataSource.dayNightMode === 0x02?"#fefefe":"#000000"
    }
    function updatePowerText(){
        if(DataSource.vehicleType === 2){
            if(DataSource.powerUnit !== 2){
                minTextId.text = "-100"
                maxTextId.text = DataSource.powerRangeSelf!==1&&DataSource.powerRangeSelf!==2?"500": "300"
            }else{
                minTextId.text = "-134"
                maxTextId.text = DataSource.powerRangeSelf!==1&&DataSource.powerRangeSelf!==2?"670": "402"
            }
        }else{
            updateEvMinMaxValue()
            if(DataSource.powerUnit !== 2){
                minTextId.text = evMinPowerValue
                maxTextId.text = evMaxPowerValue
            }else{
                minTextId.text = evMinPowerValue*1.34
                maxTextId.text = evMaxPowerValue*1.34
            }
        }
    }*/

    Connections {
        target:DataSource

        function onPluginMsgReceived(id,value){
            if(id === DataSource.SEND_MSG_ID_DASHBOARD_SELFCHECK){
                powerDashRootId.selfCheckPowerRealValue = 0
                //powerValueTextId.text = "0"
                selfCheckAnimId.start()
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
                DataSource.realPower = 0
                realPowerUpdate()
                hasSelfChecked = false
            }

            //没有自检，也不会播放动画，需要置自检通过
            if(DataSource.powerGear === 3 && !hasSelfChecked && DataSource.playAnim === true){
                console.log("onPowerGearChanged power")
                hasSelfChecked = true
                realPowerUpdate()
            }
        }
        function onPowerUnitChanged(){
            realPowerUpdate()
            //            updatePowerText()
        }

        function onRealPowerChanged(){
            if(hasSelfChecked){
                realPowerUpdate()
            }
        }
        function onPowerRangeSelfChanged(){
            realPowerUpdate()
            //            updatePowerText()
        }
        function onVehicleTypeChanged(){
            realPowerUpdate()
            //            updatePowerText()
        }
        function onEvPowerRangeSelfChanged(){
            realPowerUpdate()
            //            updatePowerText()
        }
    }

    onSelfCheckPowerRealValueChanged:{
        realPowerUpdate()
    }

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
            if(DataSource.realPower === 0.0){
                DataSource.realPower = DataSource.power
            }
            realPowerUpdate()
        }
    }

    //主题切换透明度动画
    PropertyAnimation{
        id:classicPowerDashOpacityHideAnimId
        targets:[classicPowerMaskId,needleMaskId,classicPowerTextItemId]//minTextId,zeroTextId,maxTextId
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
        targets:[classicPowerMaskId,needleMaskId,classicPowerTextItemId]//minTextId,zeroTextId,maxTextId
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

