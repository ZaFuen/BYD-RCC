import QtQuick 2.15
import com.byd.DataSource 1.0

Item {
    z:6
    width: 600
    height:  400

    Column{
        z:6
        visible: DataSource.selfStudyResultShow === 1
        width: 600
        height:  400
        Text {
            font.bold:rootItemId.jiacu === 1
            font.family: rootItemId.ziti
            text: DataSource.adasType === 0 ?"单车道":"三车道"
            font.pixelSize: 18
            color: "red"
            visible: true
        }

        Text {
            font.bold:rootItemId.jiacu === 1
            font.family: rootItemId.ziti
            text:"ACC功能配置："+(DataSource.accEquip === 0 ?"未自学习" :(DataSource.accEquip === 1 ? "未配置":"已配置"))
            font.pixelSize: 18
            color: "red"
            visible: true
        }

        Text {
            font.bold:rootItemId.jiacu === 1
            font.family: rootItemId.ziti
            text:"AEB功能配置："+(DataSource.aebEquip === 0 ?"未自学习" :(DataSource.aebEquip === 1 ? "未配置":"已配置"))
            font.pixelSize: 18
            color: "red"
            visible: true
        }
        Text {
            font.bold:rootItemId.jiacu === 1
            font.family: rootItemId.ziti
            text:"LKA功能配置："+(DataSource.lkaEquip === 0 ?"未自学习" :(DataSource.lkaEquip === 1 ? "未配置":"已配置"))
            font.pixelSize: 18
            color: "red"
            visible: true
        }

        Text {
            font.bold:rootItemId.jiacu === 1
            font.family: rootItemId.ziti
            text:"后角雷达功能配置："+(DataSource.rearRadarEquip === 0 ?"未自学习" :(DataSource.rearRadarEquip === 1 ? "未配置":"已配置"))
            font.pixelSize: 18
            color: "red"
            visible: true
        }
        Text {
            font.bold:rootItemId.jiacu === 1
            font.family: rootItemId.ziti
            text:"前角雷达功能配置："+(DataSource.frontRadarEquip === 0 ?"未自学习" :(DataSource.frontRadarEquip === 1 ? "未配置":"已配置"))
            font.pixelSize: 18
            color: "red"
            visible: true
        }
        Text {
            font.bold:rootItemId.jiacu === 1
            font.family: rootItemId.ziti
            text:"SLA功能配置："+(DataSource.slaEquip === 0 ?"未自学习" :(DataSource.slaEquip === 1 ? "未配置":"已配置"))
            font.pixelSize: 18
            color: "red"
            visible: true
        }
        Text {
            font.bold:rootItemId.jiacu === 1
            font.family: rootItemId.ziti
            text:"HMA功能配置："+(DataSource.hmaEquip === 0 ?"未自学习" :(DataSource.hmaEquip === 1 ? "未配置":"已配置"))
            font.pixelSize: 18
            color: "red"
            visible: true
        }
        Text {
            font.bold:rootItemId.jiacu === 1
            font.family: rootItemId.ziti
            text:"TLA功能配置："+(DataSource.tlaEquip === 0 ?"未自学习" :(DataSource.tlaEquip === 1 ? "未配置":"已配置"))
            font.pixelSize: 18
            color: "red"
            visible: true
        }
        Text {
            font.bold:rootItemId.jiacu === 1
            font.family: rootItemId.ziti
            text:"ALC功能配置："+(DataSource.alcEquip === 0 ?"未自学习" :(DataSource.alcEquip === 1 ? "未配置":"已配置"))
            font.pixelSize: 18
            color: "red"
            visible: true
        }
        Text {
            font.bold:rootItemId.jiacu === 1
            font.family: rootItemId.ziti
            text:"ICC功能配置："+(DataSource.iccEquip === 0 ?"未自学习" :(DataSource.iccEquip === 1 ? "未配置":"已配置"))
            font.pixelSize: 18
            color: "red"
            visible: true
        }
    }

    Column{
        visible: DataSource.adasDebugMode === 1 ? true : false
        Text{
            font.bold:rootItemId.jiacu === 1
            font.family: rootItemId.ziti
            text:"显示百分比："+DataSource.carToLeftLaneDistance  +"%变道触发："+DataSource.laneChangeAnimationDirection
            font.pixelSize: 28
            color: "red"
            visible: true
        }

        Text {
            font.bold:rootItemId.jiacu === 1
            font.family: rootItemId.ziti
            text:"左前方目标X："+DataSource.leftFrontTargetPosX +" Y："+DataSource.leftFrontTargetPosY +"目标类型"+DataSource.leftFrontTargetState
            font.pixelSize: 28
            color: "blue"
            visible: true
        }
        Text {
            font.bold:rootItemId.jiacu === 1
            font.family: rootItemId.ziti
            text:"右前方目标X："+DataSource.rightFrontTargetPosX +" Y："+DataSource.rightFrontTargetPosY+"目标类型"+DataSource.rightFrontTargetState
            font.pixelSize: 28
            color: "#FF8C00"
            visible: true
        }
        Text {
            font.bold:rootItemId.jiacu === 1
            font.family: rootItemId.ziti
            text:"左后方目标X："+DataSource.leftRearTargetPosX +" Y："+DataSource.leftRearTargetPosY+"目标类型"+DataSource.leftRearTargetState
            font.pixelSize: 28
            color: "#20B2AA"
            visible: true
        }
    }

    Column{
        y:220
        visible: DataSource.adasDebugMode === 1 ? true : false
        Text {
            font.bold:rootItemId.jiacu === 1
            font.family: rootItemId.ziti
            text:"右后方目标X："+DataSource.rightRearTargetPosX +" Y："+DataSource.rightRearTargetPosY+"目标类型"+DataSource.rightRearTargetState
            font.pixelSize: 28
            color: "#008000"
            visible: true
        }
        Text {
            font.bold:rootItemId.jiacu === 1
            font.family: rootItemId.ziti
            text:"正前方一目标X："+DataSource.frontTargetOnePosX +" Y："+DataSource.frontTargetOnePosY+"目标类型"+DataSource.frontTargetOneState
            font.pixelSize: 28
            color: "#696969"
            visible: true
        }
        Text {
            font.bold:rootItemId.jiacu === 1
            font.family: rootItemId.ziti
            text:"正前方二目标X："+DataSource.frontTargetTwoPosX +" Y："+DataSource.frontTargetTwoPosY+"目标类型"+DataSource.frontTargetTwoState
            font.pixelSize: 28
            color: "pink"
            visible: true
        }
        Text {
            font.bold:rootItemId.jiacu === 1
            font.family: rootItemId.ziti
            text:"车道宽度："+DataSource.roadWidth
            font.pixelSize: 28
            color: "black"
            visible: true
        }
    }
}
