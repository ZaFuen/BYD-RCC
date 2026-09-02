import QtQuick 2.0
import QtGraphicalEffects 1.0


Rectangle {
        property int background_width
        property int background_height
        property int arcWidth
        property color arcColor
        property real  progress: 0
        property real startAngle
        property alias progressCanvas: canvas
        property int style
        property int unitType:1

        id: img
        anchors.centerIn: parent
        width: background_width
        height: background_width
        radius: width/2
        color: "transparent"

        Canvas{
            id: canvas
            anchors.centerIn: parent
            width: 2*background_width + arcWidth
            height: 2*background_height + arcWidth
            onPaint: {
                var ctx = getContext("2d")
                ctx.clearRect(0,0,canvas.width,canvas.height)

                var r;
                if  (unitType == 1){
                     r = 3/2 * progress*Math.PI/180
                }else if(unitType == 2){
                     r = 9/4 * progress*Math.PI/180
                }

                var grd = ctx.createLinearGradient(0,0,640,0);
                grd.addColorStop(0,"#89f7fe");
                grd.addColorStop(1.0,"#0586ff");


                ctx.beginPath()
                ctx.strokeStyle = grd
                ctx.fillStyle = grd

                ctx.lineWidth = arcWidth
                ctx.arc(canvas.width/2,canvas.height/2,background_width/2,90*Math.PI/180,r+90*Math.PI/180,false)
                ctx.stroke()

            }

        }

    }
