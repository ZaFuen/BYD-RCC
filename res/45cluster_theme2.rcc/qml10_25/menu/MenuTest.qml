import QtQuick 2.15
import com.byd.DataSource 1.0
import com.byd.CenterChild 1.0

CenterChild{
    anchors.centerIn: parent
    Text{
        font.bold:rootItemId.jiacu === 1
        font.family: rootItemId.ziti
        id:textId
        anchors.centerIn: parent
        text: "Menu"
        color: "blue"
        font.pixelSize: 40
    }
    onKeyMsgSignal: {
        textId.text = key
    }
}



