import QtQuick 2.15
import com.byd.AndroidNativeWindowItem 1.0
import "qrc:/common/singleton"
import com.byd.DataSource 1.0

AndroidNativeWindowItem {
    id: iviWindow
    z: CustomStyle.presentationZ
    width: DataSource.screenSize === 0x01 ? 1280:1920
    height: DataSource.screenSize === 0x01 ? 480:720
    disp_name: "xdjaVirtualSurface"
    disp_width: DataSource.screenSize === 0x01 ? 1280:1920
    disp_height: DataSource.screenSize === 0x01 ? 480:720
    disp_mode: 1
    disp_visible: true
    multi_view: true
    // visible: true
    visible: DataSource.naviType !== DataSource.NAVI_TYPE_SMALL_SCREEN && DataSource.naviType!==DataSource.NAVI_TYPE_FULL_SCREEN?false:true
}
