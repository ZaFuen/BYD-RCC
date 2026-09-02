import QtQuick 2.15
import com.byd.DataSource 1.0
import com.byd.CenterChild 1.0
//0x5A:SLH
//0x81:SK2H
//0xA5:ek_sport
//0xCD:ek_normal_23
//0x8A:ek_normal
//0x65:HA2E,0x66:HA2H
//0xA0:SC3E
//0x5B:SC2E
//0xCC:HA3
//0xBC:HKH
//0xA1:SA5H
//0xEA:SA6H
//0xE9:HXHK
//0xE2:SL2H
//0xBF:EWE

CenterChild {
    Item {
visible: DataSource.rearLeftBelt === 0x01 && DataSource.rearMiddleBelt === 0x01 && DataSource.rearRightBelt === 0x01	
    Component.onCompleted: {
        updateCarBody()
    }

    Image {
        id: bgImg
        //涉及换肤，修改需同步换肤
        source: DataSource.dayNightMode === 0x2 ? "qrc:/images10_25/warningInfo/night_bg.png" : "qrc:/images10_25/warningInfo/day_bg.png"
        y: 197
        x: 630
        visible: false//DataSource.powerGear === 0x03 && DataSource.naviType === 4
        cache: false
        opacity: 0.8
    }

    //车体俯视图，安全带都系上显示车顶，有未系上显示内饰
    Image {
        id: imageId
        cache: false
    }

    //安全带
    Item {
        id: seatBeltPage
        visible: DataSource.powerGear === 3

        //主驾
        Image {
            id: mainBelt
            cache: false
            source: "qrc:/images10_25/warningInfo/carBody_seatbelt/beltLight.png"
            visible: DataSource.mainBelt === 0x01 ? false : true
        }

        //副驾
        Image {
            id: subBelt
            cache: false
            source: "qrc:/images10_25/warningInfo/carBody_seatbelt/beltLight.png"
            visible: DataSource.subBelt === 0x01 ? false : true
        }

        //后左
        Image {
            id: rearLeftBelt
            cache: false
            source: "qrc:/images10_25/warningInfo/carBody_seatbelt/beltLight.png"
            visible: DataSource.rearLeftBelt === 0x01 ? false : true
        }

        //后中
        Image {
            id: rearMidBelt
            cache: false
            source: "qrc:/images10_25/warningInfo/carBody_seatbelt/beltLight.png"
            visible: DataSource.rearMiddleBelt === 0x01 ? false : true
        }

        //后右
        Image {
            id: rearRightBelt
            cache: false
            source: "qrc:/images10_25/warningInfo/carBody_seatbelt/beltLight.png"
            visible: DataSource.rearRightBelt === 0x01 ? false : true
        }		
    }

    //车门
    Item {
        id: carDoorPage

        //左前门
        Image {
            id: leftFrontDoor
            cache: false
            visible: DataSource.leftFrontDoor === 0x01 ? true : false
        }

        //右前门
        Image {
            id: rightFrontDoor
            cache: false
            visible: DataSource.rightFrontDoor === 0x01 ? true : false
        }

        //左后门
        Image {
            id: leftBackDoor
            cache: false
            visible: DataSource.leftBackDoor === 0x01 ? true : false
        }

        //右后门
        Image {
            id: rightBackDoor
            cache: false
            visible: DataSource.rightBackDoor === 0x01 ? true : false
        }

        //行李箱
        Image {
            id: luggageDoor
            cache: false
            visible: DataSource.luggageDoor === 0x01 ? true : false
        }

        //前舱盖
        Image {
            id: frontHatchDoor
            cache: false
            visible: DataSource.frontHatchDoor === 0x01 ? true : false
        }

        //左前门关闭
        Image {
            id: lfoff
            cache: false
            visible: (! leftFrontDoor.visible) && lfoff.source != ""
        }

        //右前门关闭
        Image {
            id: rfoff
            cache: false
            visible: (! rightFrontDoor.visible) && rfoff.source != ""
        }

        //左后门关闭
        Image {
            id: lboff
            cache: false
            visible: (! leftBackDoor.visible) && lboff.source != ""
        }

        //右后门关闭
        Image {
            id: rboff
            cache: false
            visible: (! rightBackDoor.visible) && rboff.source != ""
        }
    }

    function updateCarBody() {
        //T331338:整体y坐标相对之前标注增加30
        switch (DataSource.carNameType) {
        case 0x06: //0x5A:SLH
            if (DataSource.powerGear !== 3 || (DataSource.mainBelt === 0x01
                                               && DataSource.subBelt === 0x01
                                               && DataSource.rearLeftBelt === 0x01
                                               && DataSource.rearMiddleBelt === 0x01
                                               && DataSource.rearRightBelt === 0x01)) {
                imageId.source = "qrc:/images10_25/warningInfo/carBody_door/SLH/top.png"
            } else {
                imageId.source = "qrc:/images10_25/warningInfo/carBody_seatbelt/car_SLH.png"
            }
            imageId.y = 148 + 30
            imageId.x = 839

            //mainBelt.source = "qrc:/images10_25/warningInfo/carBody_seatbelt/beltLight.png"
            mainBelt.y = 329 + 30
            mainBelt.x = 927

            //subBelt.source = "qrc:/images10_25/warningInfo/carBody_seatbelt/beltLight.png"
            subBelt.y = 329 + 30
            subBelt.x = 973

            //rearLeftBelt.source = "qrc:/images10_25/warningInfo/carBody_seatbelt/beltLight.png"
            rearLeftBelt.y = 381 + 30
            rearLeftBelt.x = 927

            //rearMidBelt.source = "qrc:/images10_25/warningInfo/carBody_seatbelt/beltLight.png"
            rearMidBelt.y = 381 + 30
            rearMidBelt.x = 950

            //rearRightBelt.source = "qrc:/images10_25/warningInfo/carBody_seatbelt/beltLight.png"
            rearRightBelt.y = 381 + 30
            rearRightBelt.x = 973

            leftFrontDoor.source = "qrc:/images10_25/warningInfo/carBody_door/SLH/leftFrontDoor.png"
            leftFrontDoor.y = imageId.y
            leftFrontDoor.x = imageId.x

            rightFrontDoor.source = "qrc:/images10_25/warningInfo/carBody_door/SLH/rightFrontDoor.png"
            rightFrontDoor.y = imageId.y
            rightFrontDoor.x = imageId.x

            leftBackDoor.source = "qrc:/images10_25/warningInfo/carBody_door/SLH/leftBackDoor.png"
            leftBackDoor.y = imageId.y
            leftBackDoor.x = imageId.x

            rightBackDoor.source = "qrc:/images10_25/warningInfo/carBody_door/SLH/rightBackDoor.png"
            rightBackDoor.y = imageId.y
            rightBackDoor.x = imageId.x

            luggageDoor.source = "qrc:/images10_25/warningInfo/carBody_door/SLH/luggageDoor.png"
            luggageDoor.y = imageId.y
            luggageDoor.x = imageId.x

            frontHatchDoor.source = "qrc:/images10_25/warningInfo/carBody_door/SLH/frontHatchDoor.png"
            frontHatchDoor.y = imageId.y
            frontHatchDoor.x = imageId.x

            lfoff.source = "qrc:/images10_25/warningInfo/carBody_door/SLH/off_fl.png"
            lfoff.y = imageId.y
            lfoff.x = imageId.x

            rfoff.source = "qrc:/images10_25/warningInfo/carBody_door/SLH/off_fr.png"
            rfoff.y = imageId.y
            rfoff.x = imageId.x

            lboff.source = "qrc:/images10_25/warningInfo/carBody_door/SLH/off_bl.png"
            lboff.y = imageId.y
            lboff.x = imageId.x

            rboff.source = "qrc:/images10_25/warningInfo/carBody_door/SLH/off_br.png"
            rboff.y = imageId.y
            rboff.x = imageId.x
            break
        case 0x07: //0x81:SK2H
            if (DataSource.powerGear !== 3 || (DataSource.mainBelt === 0x01
                                               && DataSource.subBelt === 0x01
                                               && DataSource.rearLeftBelt === 0x01
                                               && DataSource.rearMiddleBelt === 0x01
                                               && DataSource.rearRightBelt === 0x01)) {
                imageId.source = "qrc:/images10_25/warningInfo/carBody_door/SK2H/top.png"
                imageId.y = 224
                imageId.x = 848
            } else {
                imageId.source = "qrc:/images10_25/warningInfo/carBody_seatbelt/car_SK2H.png"
                imageId.y = 226
                imageId.x = 866
            }

            //mainBelt.source = "qrc:/images10_25/warningInfo/carBody_seatbelt/beltLight.png"
            mainBelt.y = 365
            mainBelt.x = 929

            //subBelt.source = "qrc:/images10_25/warningInfo/carBody_seatbelt/beltLight.png"
            subBelt.y = 365
            subBelt.x = 972

            //rearLeftBelt.source = "qrc:/images10_25/warningInfo/carBody_seatbelt/beltLight.png"
            rearLeftBelt.y = 419
            rearLeftBelt.x = 929

            //rearMidBelt.source = "qrc:/images10_25/warningInfo/carBody_seatbelt/beltLight.png"
            rearMidBelt.y = 419
            rearMidBelt.x = 950

            //rearRightBelt.source = "qrc:/images10_25/warningInfo/carBody_seatbelt/beltLight.png"
            rearRightBelt.y = 419
            rearRightBelt.x = 972

            leftFrontDoor.source = "qrc:/images10_25/warningInfo/carBody_door/SK2H/leftFrontDoor.png"
            leftFrontDoor.x = 858
            leftFrontDoor.y = 326

            rightFrontDoor.source = "qrc:/images10_25/warningInfo/carBody_door/SK2H/rightFrontDoor.png"
            rightFrontDoor.x = 1000
            rightFrontDoor.y = 326

            leftBackDoor.source = "qrc:/images10_25/warningInfo/carBody_door/SK2H/leftBackDoor.png"
            leftBackDoor.x = 858
            leftBackDoor.y = 395

            rightBackDoor.source = "qrc:/images10_25/warningInfo/carBody_door/SK2H/rightBackDoor.png"
            rightBackDoor.x = 1001
            rightBackDoor.y = 395

            luggageDoor.source = "qrc:/images10_25/warningInfo/carBody_door/SK2H/luggageDoor.png"
            luggageDoor.x = 910
            luggageDoor.y = 486

            frontHatchDoor.source = "qrc:/images10_25/warningInfo/carBody_door/SK2H/frontHatchDoor.png"
            frontHatchDoor.x = 910
            frontHatchDoor.y = 245

            lfoff.source = ""
            rfoff.source = ""
            lboff.source = ""
            rboff.source = ""

            break
        case 0x09: //0xA5:ek_sport
            var path = ""
            if (DataSource.ekCarbodyColor === 0x02){
                path = "ek_sport_green"
            }else{
                path = "ek_sport_orange"
            }

            if (DataSource.powerGear !== 3 || (DataSource.mainBelt === 0x01
                                               && DataSource.subBelt === 0x01
                                               && DataSource.rearLeftBelt === 0x01
                                               && DataSource.rearMiddleBelt === 0x01
                                               && DataSource.rearRightBelt === 0x01)) {
                imageId.source = "qrc:/images10_25/warningInfo/carBody_door/" + path + "/top.png"
                imageId.y = 241
                imageId.x = 854
            } else {
                if (DataSource.ekCarbodyColor === 0x02){
                    imageId.source = "qrc:/images10_25/warningInfo/carBody_seatbelt/car_ek_sport_green.png"
                }else{
                    imageId.source = "qrc:/images10_25/warningInfo/carBody_seatbelt/car_ek_sport_orange.png"
                }
                imageId.y = 241
                imageId.x = 854
            }

            //mainBelt.source = "qrc:/images10_25/warningInfo/carBody_seatbelt/beltLight.png"
            mainBelt.y = 365
            mainBelt.x = 929

            //subBelt.source = "qrc:/images10_25/warningInfo/carBody_seatbelt/beltLight.png"
            subBelt.y = 365
            subBelt.x = 972

            //rearLeftBelt.source = "qrc:/images10_25/warningInfo/carBody_seatbelt/beltLight.png"
            rearLeftBelt.y = 419
            rearLeftBelt.x = 929

            //rearMidBelt.source = "qrc:/images10_25/warningInfo/carBody_seatbelt/beltLight.png"
            rearMidBelt.y = 419
            rearMidBelt.x = 950

            //rearRightBelt.source = "qrc:/images10_25/warningInfo/carBody_seatbelt/beltLight.png"
            rearRightBelt.y = 419
            rearRightBelt.x = 972

            leftFrontDoor.source = "qrc:/images10_25/warningInfo/carBody_door/" + path + "/leftFrontDoor.png"
            leftFrontDoor.x = 854
            leftFrontDoor.y = 241

            rightFrontDoor.source = "qrc:/images10_25/warningInfo/carBody_door/" + path + "/rightFrontDoor.png"
            rightFrontDoor.x = 854
            rightFrontDoor.y = 241

            leftBackDoor.source = "qrc:/images10_25/warningInfo/carBody_door/" + path + "/leftBackDoor.png"
            leftBackDoor.x = 854
            leftBackDoor.y = 241

            rightBackDoor.source = "qrc:/images10_25/warningInfo/carBody_door/" + path + "/rightBackDoor.png"
            rightBackDoor.x = 854
            rightBackDoor.y = 241

            luggageDoor.source = "qrc:/images10_25/warningInfo/carBody_door/" + path + "/luggageDoor.png"
            luggageDoor.x = 854
            luggageDoor.y = 241

            frontHatchDoor.source = "qrc:/images10_25/warningInfo/carBody_door/" + path + "/frontHatchDoor.png"
            frontHatchDoor.x = 854
            frontHatchDoor.y = 241

            lfoff.source = "qrc:/images10_25/warningInfo/carBody_door/" + path + "/off_fl.png"
            lfoff.x = 854
            lfoff.y = 241

            rfoff.source = "qrc:/images10_25/warningInfo/carBody_door/" + path + "/off_fr.png"
            rfoff.x = 854
            rfoff.y = 241

            lboff.source = "qrc:/images10_25/warningInfo/carBody_door/" + path + "/off_bl.png"
            lboff.x = 854
            lboff.y = 241

            rboff.source = "qrc:/images10_25/warningInfo/carBody_door/" + path + "/off_br.png"
            rboff.x = 854
            rboff.y = 241
            break
        case DataSource.CARNAME_EK23_10_25: //0xCD:ek_normal_23
            if (DataSource.powerGear !== 3 || (DataSource.mainBelt === 0x01
                                               && DataSource.subBelt === 0x01
                                               && DataSource.rearLeftBelt === 0x01
                                               && DataSource.rearMiddleBelt === 0x01
                                               && DataSource.rearRightBelt === 0x01)) {
                imageId.source = "qrc:/images10_25/warningInfo/carBody_door/ek_normal_23/top.png"
                imageId.y = 241
                imageId.x = 854
            } else {
                imageId.source = "qrc:/images10_25/warningInfo/carBody_seatbelt/car_ek_normal_23.png"
                imageId.y = 241
                imageId.x = 854
            }

            //mainBelt.source = "qrc:/images10_25/warningInfo/carBody_seatbelt/beltLight.png"
            mainBelt.y = 365
            mainBelt.x = 929

            //subBelt.source = "qrc:/images10_25/warningInfo/carBody_seatbelt/beltLight.png"
            subBelt.y = 365
            subBelt.x = 972

            //rearLeftBelt.source = "qrc:/images10_25/warningInfo/carBody_seatbelt/beltLight.png"
            rearLeftBelt.y = 419
            rearLeftBelt.x = 929

            //rearMidBelt.source = "qrc:/images10_25/warningInfo/carBody_seatbelt/beltLight.png"
            rearMidBelt.y = 419
            rearMidBelt.x = 950

            //rearRightBelt.source = "qrc:/images10_25/warningInfo/carBody_seatbelt/beltLight.png"
            rearRightBelt.y = 419
            rearRightBelt.x = 972

            leftFrontDoor.source = "qrc:/images10_25/warningInfo/carBody_door/ek_normal_23/leftFrontDoor.png"
            leftFrontDoor.x = 854
            leftFrontDoor.y = 241

            rightFrontDoor.source = "qrc:/images10_25/warningInfo/carBody_door/ek_normal_23/rightFrontDoor.png"
            rightFrontDoor.x = 854
            rightFrontDoor.y = 241

            leftBackDoor.source = "qrc:/images10_25/warningInfo/carBody_door/ek_normal_23/leftBackDoor.png"
            leftBackDoor.x = 854
            leftBackDoor.y = 241

            rightBackDoor.source = "qrc:/images10_25/warningInfo/carBody_door/ek_normal_23/rightBackDoor.png"
            rightBackDoor.x = 854
            rightBackDoor.y = 241

            luggageDoor.source = "qrc:/images10_25/warningInfo/carBody_door/ek_normal_23/luggageDoor.png"
            luggageDoor.x = 854
            luggageDoor.y = 241

            frontHatchDoor.source = "qrc:/images10_25/warningInfo/carBody_door/ek_normal_23/frontHatchDoor.png"
            frontHatchDoor.x = 854
            frontHatchDoor.y = 241

            lfoff.source = "qrc:/images10_25/warningInfo/carBody_door/ek_normal_23/off_fl.png"
            lfoff.x = 854
            lfoff.y = 241

            rfoff.source = "qrc:/images10_25/warningInfo/carBody_door/ek_normal_23/off_fr.png"
            rfoff.x = 854
            rfoff.y = 241

            lboff.source = "qrc:/images10_25/warningInfo/carBody_door/ek_normal_23/off_bl.png"
            lboff.x = 854
            lboff.y = 241

            rboff.source = "qrc:/images10_25/warningInfo/carBody_door/ek_normal_23/off_br.png"
            rboff.x = 854
            rboff.y = 241
            break
        case 0x0A: //0x8A:ek_normal
            if (DataSource.powerGear !== 3 || (DataSource.mainBelt === 0x01
                                               && DataSource.subBelt === 0x01
                                               && DataSource.rearLeftBelt === 0x01
                                               && DataSource.rearMiddleBelt === 0x01
                                               && DataSource.rearRightBelt === 0x01)) {
                imageId.source = "qrc:/images10_25/warningInfo/carBody_door/ek_normal/top.png"
                imageId.y = 241
                imageId.x = 854
            } else {
                imageId.source = "qrc:/images10_25/warningInfo/carBody_seatbelt/car_ek_normal.png"
                imageId.y = 241
                imageId.x = 854
            }

            //mainBelt.source = "qrc:/images10_25/warningInfo/carBody_seatbelt/beltLight.png"
            mainBelt.y = 365
            mainBelt.x = 929

            //subBelt.source = "qrc:/images10_25/warningInfo/carBody_seatbelt/beltLight.png"
            subBelt.y = 365
            subBelt.x = 972

            //rearLeftBelt.source = "qrc:/images10_25/warningInfo/carBody_seatbelt/beltLight.png"
            rearLeftBelt.y = 419
            rearLeftBelt.x = 929

            //rearMidBelt.source = "qrc:/images10_25/warningInfo/carBody_seatbelt/beltLight.png"
            rearMidBelt.y = 419
            rearMidBelt.x = 950

            //rearRightBelt.source = "qrc:/images10_25/warningInfo/carBody_seatbelt/beltLight.png"
            rearRightBelt.y = 419
            rearRightBelt.x = 972

            leftFrontDoor.source = "qrc:/images10_25/warningInfo/carBody_door/ek_normal/leftFrontDoor.png"
            leftFrontDoor.x = 854
            leftFrontDoor.y = 241

            rightFrontDoor.source = "qrc:/images10_25/warningInfo/carBody_door/ek_normal/rightFrontDoor.png"
            rightFrontDoor.x = 854
            rightFrontDoor.y = 241

            leftBackDoor.source = "qrc:/images10_25/warningInfo/carBody_door/ek_normal/leftBackDoor.png"
            leftBackDoor.x = 854
            leftBackDoor.y = 241

            rightBackDoor.source = "qrc:/images10_25/warningInfo/carBody_door/ek_normal/rightBackDoor.png"
            rightBackDoor.x = 854
            rightBackDoor.y = 241

            luggageDoor.source = "qrc:/images10_25/warningInfo/carBody_door/ek_normal/luggageDoor.png"
            luggageDoor.x = 854
            luggageDoor.y = 241

            frontHatchDoor.source = "qrc:/images10_25/warningInfo/carBody_door/ek_normal/frontHatchDoor.png"
            frontHatchDoor.x = 854
            frontHatchDoor.y = 241

            lfoff.source = "qrc:/images10_25/warningInfo/carBody_door/ek_normal/off_fl.png"
            lfoff.x = 854
            lfoff.y = 241

            rfoff.source = "qrc:/images10_25/warningInfo/carBody_door/ek_normal/off_fr.png"
            rfoff.x = 854
            rfoff.y = 241

            lboff.source = "qrc:/images10_25/warningInfo/carBody_door/ek_normal/off_bl.png"
            lboff.x = 854
            lboff.y = 241

            rboff.source = "qrc:/images10_25/warningInfo/carBody_door/ek_normal/off_br.png"
            rboff.x = 854
            rboff.y = 241
            break
        case 0x0B:
        case 0x0C: //0x65:HA2E,0x66:HA2H
            if (DataSource.powerGear !== 3 || (DataSource.mainBelt === 0x01
                                               && DataSource.subBelt === 0x01
                                               && DataSource.rearLeftBelt === 0x01
                                               && DataSource.rearMiddleBelt === 0x01
                                               && DataSource.rearRightBelt === 0x01)) {
                imageId.source = "qrc:/images10_25/warningInfo/carBody_door/HA2E/top.png"
                imageId.y = 241
                imageId.x = 854
            } else {
                imageId.source = "qrc:/images10_25/warningInfo/carBody_seatbelt/car_HA2E.png"
                imageId.y = 241
                imageId.x = 854
            }

            //mainBelt.source = "qrc:/images10_25/warningInfo/carBody_seatbelt/beltLight.png"
            mainBelt.y = 365
            mainBelt.x = 929

            //subBelt.source = "qrc:/images10_25/warningInfo/carBody_seatbelt/beltLight.png"
            subBelt.y = 365
            subBelt.x = 972

            //rearLeftBelt.source = "qrc:/images10_25/warningInfo/carBody_seatbelt/beltLight.png"
            rearLeftBelt.y = 419
            rearLeftBelt.x = 929

            //rearMidBelt.source = "qrc:/images10_25/warningInfo/carBody_seatbelt/beltLight.png"
            rearMidBelt.y = 419
            rearMidBelt.x = 950

            //rearRightBelt.source = "qrc:/images10_25/warningInfo/carBody_seatbelt/beltLight.png"
            rearRightBelt.y = 419
            rearRightBelt.x = 972

            leftFrontDoor.source = "qrc:/images10_25/warningInfo/carBody_door/HA2E/leftFrontDoor.png"
            leftFrontDoor.x = 854
            leftFrontDoor.y = 241

            rightFrontDoor.source = "qrc:/images10_25/warningInfo/carBody_door/HA2E/rightFrontDoor.png"
            rightFrontDoor.x = 854
            rightFrontDoor.y = 241

            leftBackDoor.source = "qrc:/images10_25/warningInfo/carBody_door/HA2E/leftBackDoor.png"
            leftBackDoor.x = 854
            leftBackDoor.y = 241

            rightBackDoor.source = "qrc:/images10_25/warningInfo/carBody_door/HA2E/rightBackDoor.png"
            rightBackDoor.x = 854
            rightBackDoor.y = 241

            luggageDoor.source = "qrc:/images10_25/warningInfo/carBody_door/HA2E/luggageDoor.png"
            luggageDoor.x = 854
            luggageDoor.y = 241

            frontHatchDoor.source = "qrc:/images10_25/warningInfo/carBody_door/HA2E/frontHatchDoor.png"
            frontHatchDoor.x = 854
            frontHatchDoor.y = 241

            lfoff.source = "qrc:/images10_25/warningInfo/carBody_door/HA2E/off_fl.png"
            lfoff.x = 854
            lfoff.y = 241

            rfoff.source = "qrc:/images10_25/warningInfo/carBody_door/HA2E/off_fr.png"
            rfoff.x = 854
            rfoff.y = 241

            lboff.source = "qrc:/images10_25/warningInfo/carBody_door/HA2E/off_bl.png"
            lboff.x = 854
            lboff.y = 241

            rboff.source = "qrc:/images10_25/warningInfo/carBody_door/HA2E/off_br.png"
            rboff.x = 854
            rboff.y = 241
            break
        default:
            if (DataSource.powerGear !== 3 || (DataSource.mainBelt === 0x01
                                               && DataSource.subBelt === 0x01
                                               && DataSource.rearLeftBelt === 0x01
                                               && DataSource.rearMiddleBelt === 0x01
                                               && DataSource.rearRightBelt === 0x01)) {
                imageId.source = "qrc:/images10_25/warningInfo/carBody_door/newcar.png"
                imageId.y = 237
                imageId.x = 890
            } else {
                imageId.source = "qrc:/images10_25/warningInfo/carBody_seatbelt/car.png"
                imageId.y = 238
                imageId.x = 892
            }

            mainBelt.source = "qrc:/images10_25/warningInfo/carBody_seatbelt/beltLight.png"
            mainBelt.y = imageId.y + 128
            mainBelt.x = imageId.x + 35

            subBelt.source = "qrc:/images10_25/warningInfo/carBody_seatbelt/beltLight.png"
            subBelt.y = imageId.y + 128
            subBelt.x = imageId.x + 84

            rearLeftBelt.source = "qrc:/images10_25/warningInfo/carBody_seatbelt/beltLight.png"
            rearLeftBelt.y = imageId.y + 184
            rearLeftBelt.x = imageId.x + 35

            rearMidBelt.source = "qrc:/images10_25/warningInfo/carBody_seatbelt/beltLight.png"
            rearMidBelt.y = imageId.y + 184
            rearMidBelt.x = imageId.x + 59

            rearRightBelt.source = "qrc:/images10_25/warningInfo/carBody_seatbelt/beltLight.png"
            rearRightBelt.y = imageId.y + 184
            rearRightBelt.x = imageId.x + 83

            leftFrontDoor.source = "qrc:/images10_25/warningInfo/carBody_door/leftFrontDoor.png"
            leftFrontDoor.x = imageId.x - 33
            leftFrontDoor.y = imageId.y + 90

            rightFrontDoor.source = "qrc:/images10_25/warningInfo/carBody_door/rightFrontDoor.png"
            rightFrontDoor.x = imageId.x + 109
            rightFrontDoor.y = imageId.y + 90

            leftBackDoor.source = "qrc:/images10_25/warningInfo/carBody_door/leftBackDoor.png"
            leftBackDoor.x = imageId.x - 30
            leftBackDoor.y = imageId.y + 155

            rightBackDoor.source = "qrc:/images10_25/warningInfo/carBody_door/rightBackDoor.png"
            rightBackDoor.x = imageId.x + 110
            rightBackDoor.y = imageId.y + 156

            luggageDoor.source = "qrc:/images10_25/warningInfo/carBody_door/luggageDoor.png"
            luggageDoor.x = imageId.x + 22
            luggageDoor.y = imageId.y + 264

            frontHatchDoor.source = "qrc:/images10_25/warningInfo/carBody_door/frontHatchDoor.png"
            frontHatchDoor.x = imageId.x + 16
            frontHatchDoor.y = imageId.y + 3

            lfoff.source = ""
            rfoff.source = ""
            lboff.source = ""
            rboff.source = ""
            break
        //适配全屏导航，车体图往下偏移37像素
        case DataSource.CARNAME_SC3E_8_8:
            updateCarSeat5("SC3E", 204 + 37, 854);
            break
        case DataSource.CARNAME_HA3_8_8:
            updateCarSeat5("HA3", 204 + 37, 854);
            break
        case DataSource.CARNAME_HKHA_8_8:
            updateCarSeat5("HKH", 204 + 37, 854);
            break
        case DataSource.CARNAME_SA5H_10_25:
            updateCarSeat5("SA5H", 204 + 37, 854);
            break
        case DataSource.CARNAME_SA6H_8_8:
            if (DataSource.powerGear !== 3 || (DataSource.mainBelt === 0x01
                                                   && DataSource.subBelt === 0x01
                                                   && DataSource.rearLeftBelt === 0x01
                                                   && DataSource.rearMiddleBelt === 0x01
                                                   && DataSource.rearRightBelt === 0x01)) {
                //外饰
                imageId.source = "qrc:/images10_25/warningInfo/car/SA6H/carExterior/body.png"
                lfoff.source = "qrc:/images10_25/warningInfo/car/SA6H/carExterior/FL_Closed.png"
                rfoff.source = "qrc:/images10_25/warningInfo/car/SA6H/carExterior/FR_Closed.png"
                lboff.source = "qrc:/images10_25/warningInfo/car/SA6H/carExterior/BL_Closed.png"
                rboff.source = "qrc:/images10_25/warningInfo/car/SA6H/carExterior/BR_Closed.png"
                leftFrontDoor.source = "qrc:/images10_25/warningInfo/car/SA6H/carExterior/FL.png"
                rightFrontDoor.source = "qrc:/images10_25/warningInfo/car/SA6H/carExterior/FR.png"
                leftBackDoor.source = "qrc:/images10_25/warningInfo/car/SA6H/carExterior/BL.png"
                rightBackDoor.source = "qrc:/images10_25/warningInfo/car/SA6H/carExterior/BR.png"
            } else {
                //内饰
                imageId.source = "qrc:/images10_25/warningInfo/car/SA6H/carInterior/body.png"
                lfoff.source = "qrc:/images10_25/warningInfo/car/SA6H/carInterior/FL_Closed.png"
                rfoff.source = "qrc:/images10_25/warningInfo/car/SA6H/carInterior/FR_Closed.png"
                lboff.source = "qrc:/images10_25/warningInfo/car/SA6H/carInterior/BL_Closed.png"
                rboff.source = "qrc:/images10_25/warningInfo/car/SA6H/carInterior/BR_Closed.png"
                leftFrontDoor.source = "qrc:/images10_25/warningInfo/car/SA6H/carInterior/FL.png"
                rightFrontDoor.source = "qrc:/images10_25/warningInfo/car/SA6H/carInterior/FR.png"
                leftBackDoor.source = "qrc:/images10_25/warningInfo/car/SA6H/carInterior/BL.png"
                rightBackDoor.source = "qrc:/images10_25/warningInfo/car/SA6H/carInterior/BR.png"
            }

            imageId.y = 204
            imageId.x = 854

            mainBelt.source = "qrc:/images10_25/warningInfo/car/SA6H/beltLight.png"
            mainBelt.x = 930
            mainBelt.y = 336

            subBelt.source = "qrc:/images10_25/warningInfo/car/SA6H/beltLight.png"
            subBelt.x = 971
            subBelt.y = 336

            rearLeftBelt.source = "qrc:/images10_25/warningInfo/car/SA6H/beltLight.png"
            rearLeftBelt.x = 930
            rearLeftBelt.y = 384

            rearMidBelt.source = "qrc:/images10_25/warningInfo/car/SA6H/beltLight.png"
            rearMidBelt.x = 951
            rearMidBelt.y = 384

            rearRightBelt.source = "qrc:/images10_25/warningInfo/car/SA6H/beltLight.png"
            rearRightBelt.x = 971
            rearRightBelt.y = 384


            leftFrontDoor.x =imageId.x
            leftFrontDoor.y =imageId.y


            rightFrontDoor.x =imageId.x
            rightFrontDoor.y =imageId.y


            leftBackDoor.x = imageId.x
            leftBackDoor.y = imageId.y


            rightBackDoor.x = imageId.x
            rightBackDoor.y = imageId.y

            luggageDoor.source = "qrc:/images10_25/warningInfo/car/SA6H/Real.png"
            luggageDoor.x = imageId.x
            luggageDoor.y = imageId.y

            frontHatchDoor.source = "qrc:/images10_25/warningInfo/car/SA6H/Front.png"
            frontHatchDoor.x = imageId.x
            frontHatchDoor.y = imageId.y


            lfoff.x = imageId.x
            lfoff.y = imageId.y

            rfoff.x = imageId.x
            rfoff.y = imageId.y


            lboff.x = imageId.x
            lboff.y = imageId.y


            rboff.x = imageId.x
            rboff.y = imageId.y
            break
        case DataSource.CARNAME_HXHK_8_8:
            if (DataSource.powerGear !== 3 || (DataSource.mainBelt === 0x01
                                                   && DataSource.subBelt === 0x01
                                                   && DataSource.rearLeftBelt === 0x01
                                                   && DataSource.rearMiddleBelt === 0x01
                                                   && DataSource.rearRightBelt === 0x01)) {
                //外饰
                imageId.source = "qrc:/images10_25/warningInfo/car/HXHK/carExterior/body.png"
                lfoff.source = "qrc:/images10_25/warningInfo/car/HXHK/carExterior/FL_Closed.png"
                rfoff.source = "qrc:/images10_25/warningInfo/car/HXHK/carExterior/FR_Closed.png"
                lboff.source = "qrc:/images10_25/warningInfo/car/HXHK/carExterior/BL_Closed.png"
                rboff.source = "qrc:/images10_25/warningInfo/car/HXHK/carExterior/BR_Closed.png"
                leftFrontDoor.source = "qrc:/images10_25/warningInfo/car/HXHK/carExterior/FL.png"
                rightFrontDoor.source = "qrc:/images10_25/warningInfo/car/HXHK/carExterior/FR.png"
                leftBackDoor.source = "qrc:/images10_25/warningInfo/car/HXHK/carExterior/BL.png"
                rightBackDoor.source = "qrc:/images10_25/warningInfo/car/HXHK/carExterior/BR.png"
            } else {
                //内饰
                imageId.source = "qrc:/images10_25/warningInfo/car/HXHK/carInterior/body.png"
                lfoff.source = "qrc:/images10_25/warningInfo/car/HXHK/carInterior/FL_Closed.png"
                rfoff.source = "qrc:/images10_25/warningInfo/car/HXHK/carInterior/FR_Closed.png"
                lboff.source = "qrc:/images10_25/warningInfo/car/HXHK/carInterior/BL_Closed.png"
                rboff.source = "qrc:/images10_25/warningInfo/car/HXHK/carInterior/BR_Closed.png"
                leftFrontDoor.source = "qrc:/images10_25/warningInfo/car/HXHK/carInterior/FL.png"
                rightFrontDoor.source = "qrc:/images10_25/warningInfo/car/HXHK/carInterior/FR.png"
                leftBackDoor.source = "qrc:/images10_25/warningInfo/car/HXHK/carInterior/BL.png"
                rightBackDoor.source = "qrc:/images10_25/warningInfo/car/HXHK/carInterior/BR.png"
            }

            imageId.y = 204
            imageId.x = 854

            leftFrontDoor.x =imageId.x
            leftFrontDoor.y =imageId.y

            rightFrontDoor.x =imageId.x
            rightFrontDoor.y =imageId.y

            leftBackDoor.x = imageId.x
            leftBackDoor.y = imageId.y

            rightBackDoor.x = imageId.x
            rightBackDoor.y = imageId.y

            lfoff.x = imageId.x
            lfoff.y = imageId.y

            rfoff.x = imageId.x
            rfoff.y = imageId.y

            lboff.x = imageId.x
            lboff.y = imageId.y

            rboff.x = imageId.x
            rboff.y = imageId.y

            mainBelt.source = "qrc:/images10_25/warningInfo/carBody_seatbelt/beltLight.png"
            mainBelt.x = 932
            mainBelt.y = 329

            subBelt.source = "qrc:/images10_25/warningInfo/carBody_seatbelt/beltLight.png"
            subBelt.x = 971
            subBelt.y = 329

            rearLeftBelt.source = "qrc:/images10_25/warningInfo/carBody_seatbelt/beltLight.png"
            rearLeftBelt.x = 932
            rearLeftBelt.y = 381

            rearMidBelt.source = "qrc:/images10_25/warningInfo/carBody_seatbelt/beltLight.png"
            rearMidBelt.x =(971+932)*0.5
            rearMidBelt.y = 381

            rearRightBelt.source = "qrc:/images10_25/warningInfo/carBody_seatbelt/beltLight.png"
            rearRightBelt.x = 971
            rearRightBelt.y = 381

            luggageDoor.source = "qrc:/images10_25/warningInfo/car/HXHK/Real.png"
            luggageDoor.x = imageId.x
            luggageDoor.y = imageId.y

            frontHatchDoor.source = "qrc:/images10_25/warningInfo/car/HXHK/Front.png"
            frontHatchDoor.x = imageId.x
            frontHatchDoor.y = imageId.y
            break
        case DataSource.CARNAME_SL2H_8_8:
            if (DataSource.powerGear !== 3 || (DataSource.mainBelt === 0x01
                                                   && DataSource.subBelt === 0x01
                                                   && DataSource.rearLeftBelt === 0x01
                                                   && DataSource.rearMiddleBelt === 0x01
                                                   && DataSource.rearRightBelt === 0x01)) {
                //外饰
                imageId.source = "qrc:/images10_25/warningInfo/car/SL2H/carExterior/body.png"
                lfoff.source = "qrc:/images10_25/warningInfo/car/SL2H/carExterior/FL_Closed.png"
                rfoff.source = "qrc:/images10_25/warningInfo/car/SL2H/carExterior/FR_Closed.png"
                lboff.source = "qrc:/images10_25/warningInfo/car/SL2H/carExterior/BL_Closed.png"
                rboff.source = "qrc:/images10_25/warningInfo/car/SL2H/carExterior/BR_Closed.png"
                leftFrontDoor.source = "qrc:/images10_25/warningInfo/car/SL2H/carExterior/FL.png"
                rightFrontDoor.source = "qrc:/images10_25/warningInfo/car/SL2H/carExterior/FR.png"
                leftBackDoor.source = "qrc:/images10_25/warningInfo/car/SL2H/carExterior/BL.png"
                rightBackDoor.source = "qrc:/images10_25/warningInfo/car/SL2H/carExterior/BR.png"
            } else {
                //内饰
                imageId.source = "qrc:/images10_25/warningInfo/car/SL2H/carInterior/body.png"
                lfoff.source = "qrc:/images10_25/warningInfo/car/SL2H/carInterior/FL_Closed.png"
                rfoff.source = "qrc:/images10_25/warningInfo/car/SL2H/carInterior/FR_Closed.png"
                lboff.source = "qrc:/images10_25/warningInfo/car/SL2H/carInterior/BL_Closed.png"
                rboff.source = "qrc:/images10_25/warningInfo/car/SL2H/carInterior/BR_Closed.png"
                leftFrontDoor.source = "qrc:/images10_25/warningInfo/car/SL2H/carInterior/FL.png"
                rightFrontDoor.source = "qrc:/images10_25/warningInfo/car/SL2H/carInterior/FR.png"
                leftBackDoor.source = "qrc:/images10_25/warningInfo/car/SL2H/carInterior/BL.png"
                rightBackDoor.source = "qrc:/images10_25/warningInfo/car/SL2H/carInterior/BR.png"
            }

            imageId.y = 204
            imageId.x = 854

            leftFrontDoor.x =imageId.x
            leftFrontDoor.y =imageId.y

            rightFrontDoor.x =imageId.x
            rightFrontDoor.y =imageId.y

            leftBackDoor.x = imageId.x
            leftBackDoor.y = imageId.y

            rightBackDoor.x = imageId.x
            rightBackDoor.y = imageId.y

            lfoff.x = imageId.x
            lfoff.y = imageId.y

            rfoff.x = imageId.x
            rfoff.y = imageId.y

            lboff.x = imageId.x
            lboff.y = imageId.y

            rboff.x = imageId.x
            rboff.y = imageId.y

            mainBelt.source = "qrc:/images10_25/warningInfo/carBody_seatbelt/beltLight.png"
            mainBelt.x = 931
            mainBelt.y = 324

            subBelt.source = "qrc:/images10_25/warningInfo/carBody_seatbelt/beltLight.png"
            subBelt.x = 971
            subBelt.y = 324

            rearLeftBelt.source = "qrc:/images10_25/warningInfo/carBody_seatbelt/beltLight.png"
            rearLeftBelt.x = 931
            rearLeftBelt.y = 376

            rearMidBelt.source = "qrc:/images10_25/warningInfo/carBody_seatbelt/beltLight.png"
            rearMidBelt.x =951
            rearMidBelt.y = 376

            rearRightBelt.source = "qrc:/images10_25/warningInfo/carBody_seatbelt/beltLight.png"
            rearRightBelt.x = 971
            rearRightBelt.y = 376

            luggageDoor.source = "qrc:/images10_25/warningInfo/car/SL2H/Real.png"
            luggageDoor.x = imageId.x
            luggageDoor.y = imageId.y

            frontHatchDoor.source = "qrc:/images10_25/warningInfo/car/SL2H/Front.png"
            frontHatchDoor.x = imageId.x
            frontHatchDoor.y = imageId.y
            break
        case DataSource.CARNAME_EWE_8_8:
            if (DataSource.powerGear !== 3 || (DataSource.mainBelt === 0x01
                                                   && DataSource.subBelt === 0x01
                                                   && DataSource.rearLeftBelt === 0x01
                                                   && DataSource.rearMiddleBelt === 0x01
                                                   && DataSource.rearRightBelt === 0x01)) {
                //外饰
                imageId.source = "qrc:/images10_25/warningInfo/car/EWE/carExterior/body.png"
                lfoff.source = "qrc:/images10_25/warningInfo/car/EWE/carExterior/FL_Closed.png"
                rfoff.source = "qrc:/images10_25/warningInfo/car/EWE/carExterior/FR_Closed.png"
                lboff.source = "qrc:/images10_25/warningInfo/car/EWE/carExterior/BL_Closed.png"
                rboff.source = "qrc:/images10_25/warningInfo/car/EWE/carExterior/BR_Closed.png"
                leftFrontDoor.source = "qrc:/images10_25/warningInfo/car/EWE/carExterior/FL.png"
                rightFrontDoor.source = "qrc:/images10_25/warningInfo/car/EWE/carExterior/FR.png"
                leftBackDoor.source = "qrc:/images10_25/warningInfo/car/EWE/carExterior/BL.png"
                rightBackDoor.source = "qrc:/images10_25/warningInfo/car/EWE/carExterior/BR.png"
            } else {
                //内饰
                imageId.source = "qrc:/images10_25/warningInfo/car/EWE/carInterior/body.png"
                lfoff.source = "qrc:/images10_25/warningInfo/car/EWE/carInterior/FL_Closed.png"
                rfoff.source = "qrc:/images10_25/warningInfo/car/EWE/carInterior/FR_Closed.png"
                lboff.source = "qrc:/images10_25/warningInfo/car/EWE/carInterior/BL_Closed.png"
                rboff.source = "qrc:/images10_25/warningInfo/car/EWE/carInterior/BR_Closed.png"
                leftFrontDoor.source = "qrc:/images10_25/warningInfo/car/EWE/carInterior/FL.png"
                rightFrontDoor.source = "qrc:/images10_25/warningInfo/car/EWE/carInterior/FR.png"
                leftBackDoor.source = "qrc:/images10_25/warningInfo/car/EWE/carInterior/BL.png"
                rightBackDoor.source = "qrc:/images10_25/warningInfo/car/EWE/carInterior/BR.png"
            }

            imageId.y = 204
            imageId.x = 854

            leftFrontDoor.x =imageId.x
            leftFrontDoor.y =imageId.y

            rightFrontDoor.x =imageId.x
            rightFrontDoor.y =imageId.y

            leftBackDoor.x = imageId.x
            leftBackDoor.y = imageId.y

            rightBackDoor.x = imageId.x
            rightBackDoor.y = imageId.y

            lfoff.x = imageId.x
            lfoff.y = imageId.y

            rfoff.x = imageId.x
            rfoff.y = imageId.y

            lboff.x = imageId.x
            lboff.y = imageId.y

            rboff.x = imageId.x
            rboff.y = imageId.y

            mainBelt.source = "qrc:/images10_25/warningInfo/carBody_seatbelt/beltLight.png"
            mainBelt.x = 932
            mainBelt.y = 330

            subBelt.source = "qrc:/images10_25/warningInfo/carBody_seatbelt/beltLight.png"
            subBelt.x = 972
            subBelt.y = 330

            rearLeftBelt.source = "qrc:/images10_25/warningInfo/carBody_seatbelt/beltLight.png"
            rearLeftBelt.x = 932
            rearLeftBelt.y = 380

            rearMidBelt.source = "qrc:/images10_25/warningInfo/carBody_seatbelt/beltLight.png"
            rearMidBelt.x =952
            rearMidBelt.y = 380

            rearRightBelt.source = "qrc:/images10_25/warningInfo/carBody_seatbelt/beltLight.png"
            rearRightBelt.x = 972
            rearRightBelt.y = 380

            luggageDoor.source = "qrc:/images10_25/warningInfo/car/EWE/Real.png"
            luggageDoor.x = imageId.x
            luggageDoor.y = imageId.y

            frontHatchDoor.source = "qrc:/images10_25/warningInfo/car/EWE/Front.png"
            frontHatchDoor.x = imageId.x
            frontHatchDoor.y = imageId.y
            break
        case DataSource.CARNAME_SC2E_8_8:
            if (DataSource.powerGear !== 3 || (DataSource.mainBelt === 0x01
                                                   && DataSource.subBelt === 0x01
                                                   && DataSource.rearLeftBelt === 0x01
                                                   && DataSource.rearMiddleBelt === 0x01
                                                   && DataSource.rearRightBelt === 0x01)) {
                //外饰
                imageId.source = "qrc:/images10_25/warningInfo/car/SC2E/carExterior/body.png"
                lfoff.source = "qrc:/images10_25/warningInfo/car/SC2E/carExterior/FL_Closed.png"
                rfoff.source = "qrc:/images10_25/warningInfo/car/SC2E/carExterior/FR_Closed.png"
                lboff.source = "qrc:/images10_25/warningInfo/car/SC2E/carExterior/BL_Closed.png"
                rboff.source = "qrc:/images10_25/warningInfo/car/SC2E/carExterior/BR_Closed.png"
                leftFrontDoor.source = "qrc:/images10_25/warningInfo/car/SC2E/carExterior/FL.png"
                rightFrontDoor.source = "qrc:/images10_25/warningInfo/car/SC2E/carExterior/FR.png"
                leftBackDoor.source = "qrc:/images10_25/warningInfo/car/SC2E/carExterior/BL.png"
                rightBackDoor.source = "qrc:/images10_25/warningInfo/car/SC2E/carExterior/BR.png"
            } else {
                //内饰
                imageId.source = "qrc:/images10_25/warningInfo/car/SC2E/carInterior/body.png"
                lfoff.source = "qrc:/images10_25/warningInfo/car/SC2E/carInterior/FL_Closed.png"
                rfoff.source = "qrc:/images10_25/warningInfo/car/SC2E/carInterior/FR_Closed.png"
                lboff.source = "qrc:/images10_25/warningInfo/car/SC2E/carInterior/BL_Closed.png"
                rboff.source = "qrc:/images10_25/warningInfo/car/SC2E/carInterior/BR_Closed.png"
                leftFrontDoor.source = "qrc:/images10_25/warningInfo/car/SC2E/carInterior/FL.png"
                rightFrontDoor.source = "qrc:/images10_25/warningInfo/car/SC2E/carInterior/FR.png"
                leftBackDoor.source = "qrc:/images10_25/warningInfo/car/SC2E/carInterior/BL.png"
                rightBackDoor.source = "qrc:/images10_25/warningInfo/car/SC2E/carInterior/BR.png"
            }

            imageId.y = 204
            imageId.x = 854

            leftFrontDoor.x =imageId.x
            leftFrontDoor.y =imageId.y

            rightFrontDoor.x =imageId.x
            rightFrontDoor.y =imageId.y

            leftBackDoor.x = imageId.x
            leftBackDoor.y = imageId.y

            rightBackDoor.x = imageId.x
            rightBackDoor.y = imageId.y

            lfoff.x = imageId.x
            lfoff.y = imageId.y

            rfoff.x = imageId.x
            rfoff.y = imageId.y

            lboff.x = imageId.x
            lboff.y = imageId.y

            rboff.x = imageId.x
            rboff.y = imageId.y

            mainBelt.source = "qrc:/images10_25/warningInfo/carBody_seatbelt/beltLight.png"
            mainBelt.x = 932
            mainBelt.y = 330

            subBelt.source = "qrc:/images10_25/warningInfo/carBody_seatbelt/beltLight.png"
            subBelt.x = 972
            subBelt.y = 330

            rearLeftBelt.source = "qrc:/images10_25/warningInfo/carBody_seatbelt/beltLight.png"
            rearLeftBelt.x = 932
            rearLeftBelt.y = 380

            rearMidBelt.source = "qrc:/images10_25/warningInfo/carBody_seatbelt/beltLight.png"
            rearMidBelt.x =952
            rearMidBelt.y = 380

            rearRightBelt.source = "qrc:/images10_25/warningInfo/carBody_seatbelt/beltLight.png"
            rearRightBelt.x = 972
            rearRightBelt.y = 380

            luggageDoor.source = "qrc:/images10_25/warningInfo/car/SC2E/Real.png"
            luggageDoor.x = imageId.x
            luggageDoor.y = imageId.y

            frontHatchDoor.source = "qrc:/images10_25/warningInfo/car/SC2E/Front.png"
            frontHatchDoor.x = imageId.x
            frontHatchDoor.y = imageId.y
            break
        }
    }
    function updateCarSeat5(carName, imageY, imageX){
        let mainBeltX = imageX + 76; let mainBeltY = imageY + 125
        let subBeltX = imageX + 117; let rearLeftBeltY = imageY + 177
        var carBodySource = ""
        if (DataSource.powerGear !== 3 || (DataSource.mainBelt === 0x01 && DataSource.subBelt === 0x01
           && DataSource.rearLeftBelt === 0x01 && DataSource.rearMiddleBelt === 0x01 && DataSource.rearRightBelt === 0x01))
        {
            carBodySource = "carExterior"
        }
        else
        {
            carBodySource = "carInterior"
        }
        imageId.source = "qrc:/images10_25/warningInfo/car/" + carName + "/" + carBodySource + "/body.png"
        lfoff.source = "qrc:/images10_25/warningInfo/car/" + carName + "/" + carBodySource + "/FL_Closed.png"
        rfoff.source = "qrc:/images10_25/warningInfo/car/" + carName + "/" + carBodySource + "/FR_Closed.png"
        lboff.source = "qrc:/images10_25/warningInfo/car/" + carName + "/" + carBodySource + "/BL_Closed.png"
        rboff.source = "qrc:/images10_25/warningInfo/car/" + carName + "/" + carBodySource + "/BR_Closed.png"
        leftFrontDoor.source = "qrc:/images10_25/warningInfo/car/" + carName + "/FL.png"
        rightFrontDoor.source = "qrc:/images10_25/warningInfo/car/" + carName + "/FR.png"
        leftBackDoor.source = "qrc:/images10_25/warningInfo/car/" + carName + "/BL.png"
        rightBackDoor.source = "qrc:/images10_25/warningInfo/car/" + carName + "/BR.png"
        luggageDoor.source = "qrc:/images10_25/warningInfo/car/" + carName + "/Real.png"
        frontHatchDoor.source = "qrc:/images10_25/warningInfo/car/" + carName + "/Front.png"
        imageId.y = imageY; imageId.x = imageX
        lfoff.y = imageY; lfoff.x = imageX; rfoff.y = imageY; rfoff.x = imageX
        lboff.y = imageY; lboff.x = imageX; rboff.y = imageY; rboff.x = imageX
        leftFrontDoor.y = imageY; leftFrontDoor.x = imageX; rightFrontDoor.y = imageY; rightFrontDoor.x = imageX
        leftBackDoor.y = imageY; leftBackDoor.x = imageX; rightBackDoor.y = imageY; rightBackDoor.x = imageX
        luggageDoor.y = imageY; luggageDoor.x = imageX; frontHatchDoor.y = imageY; frontHatchDoor.x = imageX
        mainBelt.y = mainBeltY; mainBelt.x = mainBeltX
        subBelt.y = mainBelt.y; subBelt.x = subBeltX
        rearLeftBelt.y = rearLeftBeltY; rearLeftBelt.x = mainBelt.x
        rearRightBelt.y = rearLeftBelt.y; rearRightBelt.x = subBelt.x
        rearMidBelt.y = rearLeftBelt.y; rearMidBelt.x = (mainBelt.x+subBelt.x)*0.5
    }

    Connections{
        target: DataSource
        function onMainBeltChanged() {
            updateCarBody()
            console.log("DataSource.mainBelt:",DataSource.mainBelt)
        }
        function onSubBeltChanged() {
            updateCarBody()
            console.log("DataSource.subBelt:",DataSource.subBelt)
        }
        function onRearLeftBeltChanged() {
            updateCarBody()
            console.log("DataSource.rearLeftBelt:",DataSource.rearLeftBelt)
        }
        function onRearMiddleBeltChanged() {
            updateCarBody()
            console.log("DataSource.rearMiddleBelt:",DataSource.rearMiddleBelt)
        }
        function onRearRightBeltChanged() {
            updateCarBody()
            console.log("DataSource.rearRightBelt:",DataSource.rearRightBelt)
        }
        function onLeftFrontDoorChanged() {
            updateCarBody()
            console.log("DataSource.leftFrontDoor = ", DataSource.leftFrontDoor)
        }
        function onRightFrontDoorChanged() {
            updateCarBody()
            console.log("DataSource.rightFrontDoor = ", DataSource.rightFrontDoor)
        }
        function onLeftBackDoorChanged() {
            updateCarBody()
            console.log("DataSource.leftBackDoor = ", DataSource.leftBackDoor)
        }
        function onRightBackDoorChanged() {
            updateCarBody()
            console.log("DataSource.rightBackDoor = ", DataSource.rightBackDoor)
        }
        function onLuggageDoorChanged() {
            updateCarBody()
            console.log("DataSource.luggageDoor = ", DataSource.luggageDoor)
        }
        function onFrontHatchDoorChanged() {
            updateCarBody()
            console.log("DataSource.frontHatchDoor = ", DataSource.frontHatchDoor)
        }
        function onCarNameTypeChanged() {
            updateCarBody()
        }
        function onPowerGearChanged() {
            updateCarBody()
        }
        function onCarBodyNeedDisplayChanged() {
            updateCarBody()
        }
        function onEkCarbodyColorChanged() {
            updateCarBody()
        }
    }
}
}