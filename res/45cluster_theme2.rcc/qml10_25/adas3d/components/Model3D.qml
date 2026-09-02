import QtQuick 2.15
import QtQuick3D 1.15
import com.byd.DataSource 1.0
//import "qrc:/qml10_25/adas/assets"
import QtQuick3D.Materials 1.14
import QtQuick3D.Materials 1.15
import QtQuick3D.Helpers 1.14
import QtQuick3D.Effects 1.15
import QtQuick.Layouts 1.11

Item
{
    id:root
    width: 960
    height: 391
    property bool debugMode:false
    onDebugModeChanged: {
        if(debugMode == true){
            color_00="blue"
            color_01="#FF8C00"
            color_02="#20B2AA"
            color_03="#008000"
            color_04="#696969"
            color_05="pink"
        }else{
            color_00="#ffffff"
            color_01="#ffffff"
            color_02="#ffffff"
            color_03="#ffffff"
            color_04="#ffffff"
            color_05="#ffffff"
        }
    }
    property alias radar_fl: radar_fl
    //roadLane
    property alias rightLaneDashlineOffset: rightLaneMaterial.dashlineOffset
    property alias leftLaneDashlineOffset: leftLaneMaterial.dashlineOffset
    property alias leftRoadLaneSolid: leftLaneMaterial.solid
    property alias leftRoadLaneColor: leftLaneMaterial.laneColor
    property alias leftRoadLaneVisible: middleLaneLeft.visible
    property alias leftRoadLaneOpacity: leftLaneMaterial.opacity    //左侧车道线透明度
    property alias leftRoadLanePositionX: middleLaneLeft.x
    property alias rightRoadLaneSolid: rightLaneMaterial.solid
    property alias rightRoadLaneColor: rightLaneMaterial.laneColor
    property alias rightRoadLaneVisible: middleLaneRight.visible
    property alias rightRoadLaneOpacity: rightLaneMaterial.opacity  //右侧车道线透明度
    property alias rightRoadLanePositionX: middleLaneRight.x

    property alias leftLeftLaneOpacity:leftLaneMaterial1.opacity
    property alias rightRightLaneOpacity:rightLaneMaterial1.opacity


    property alias distanceStart: roadFloorMaterial.fadeStart
    property alias distanceEnd: roadFloorMaterial.fadeEnd
    property alias distanceColor: roadFloorMaterial.laneColor
    property alias distanceVisible: roadFloor.visible
    property alias roadLaneCurvature: rightLaneMaterial.curvature

    property alias laneChangeScaleZ: laneChangePrompt.scale.z
    property alias laneChangeX: laneChangePrompt.x
    property alias laneChangeZ: laneChangePrompt.z
    property alias laneChangeK: laneChangeMaterial.k
    property alias laneChangeT: laneChangeMaterial.t
    property alias laneChangeColor: laneChangeMaterial.laneColor
    property alias laneChangeOpacity: laneChangePrompt.opacity
    property alias laneChangeVisible: laneChangePrompt.visible

    //selfcar
    property alias selfcar_x:self_car.x
    property alias selfcar_y:self_car.y
    property alias selfcar_z:self_car.z
    property alias selfcar_scale: self_car.scale
    //property alias selfcar_rot_y:self_car.eulerRotation.y
    property alias selfcar_op:self_car.opacity
    property alias blow_vent_visible:blow_vent.visible
    property alias selfCarSource: selfCarTexture.source

    //model_00
    property alias pos_x_00: model_00.x
    property alias pos_z_00: model_00.z
    property alias rot_y_00: model_00.eulerRotation.y
    property alias source_00:model_00.source
    property alias visible_00: model_00.visible
    property color color_00:"#ffcccccc"
    property bool collision_visible_00: false
    property bool collision_type_00: false
    //model_01
    property alias pos_x_01: model_01.x
    property alias pos_z_01: model_01.z
    property alias rot_y_01: model_01.eulerRotation.y
    property alias source_01:model_01.source
    property alias visible_01: model_01.visible
    property color color_01:"#ffcccccc"
    property bool collision_visible_01: false
    property bool collision_type_01: false
    //model_02
    property alias pos_x_02: model_02.x
    property alias pos_z_02: model_02.z
    property alias rot_y_02: model_02.eulerRotation.y
    property alias source_02:model_02.source
    property alias visible_02: model_02.visible
    property color color_02:"#ffcccccc"
    property bool collision_visible_02: false
    property bool collision_type_02: false
    //model_03
    property alias pos_x_03: model_03.x
    property alias pos_z_03: model_03.z
    property alias rot_y_03: model_03.eulerRotation.y
    property alias source_03:model_03.source
    property alias visible_03: model_03.visible
    property color color_03:"#ffcccccc"
    property bool collision_visible_03: false
    property bool collision_type_03: false
    //model_04
    property alias pos_x_04: model_04.x
    property alias pos_z_04: model_04.z
    property alias rot_y_04: model_04.eulerRotation.y
    property alias source_04:model_04.source
    property alias visible_04: model_04.visible
    property color color_04:"#ffcccccc"
    property bool collision_visible_04: false
    property bool collision_type_04: false
    //model_05
    property alias pos_x_05: model_05.x
    property alias pos_z_05: model_05.z
    property alias rot_y_05: model_05.eulerRotation.y
    property alias source_05:model_05.source
    property alias visible_05: model_05.visible
    property color color_05:"#ffcccccc"
    property bool collision_visible_05: false
    property bool collision_type_05: false

    //radar
    property alias radar_bl_visible:radar_bl.visible
    property alias radar_br_visible:radar_br.visible
    property alias radar_bm_visible:radar_bm.visible
    property alias radar_fl_visible:radar_fl.visible
    property alias radar_fr_visible:radar_fr.visible
    property string radar_name: "IMG_%1.png"
    property int radar_bl_count:0 //0-25
    property int radar_br_count:0 //0-25
    property int radar_bm_count:0 //0-25
    property int radar_fl_count:0 //0-25
    property int radar_fr_count:0 //0-25

    //变道动画
    //左一车道属性
    property alias leftLeftLaneRoadSolid: leftLaneMaterial1.solid
    property alias leftLeftLaneRoadColor: leftLaneMaterial1.laneColor
    property alias leftLeftLaneRoadVisible: leftLaneLeft.visible
    property alias leftLeftLaneRoadOpacity: leftLaneMaterial1.opacity
    property alias leftLeftLaneRoadPositionX: leftLaneLeft.x
    //右一车道属性
    property alias rightRightLaneRoadSolid: rightLaneMaterial1.solid
    property alias rightRightLaneRoadColor: rightLaneMaterial1.laneColor
    property alias rightRightRoadLaneVisible: rightLaneRight.visible
    property alias rightRightRoadLaneOpacity: rightLaneMaterial1.opacity
    property alias rightRightRoadLanePositionX: rightLaneRight.x
    //blow
    signal loadFinished()

    property alias roadBgSource:carpetTexture_bg0.source
    property alias roadBg2Source:carpetTexture_bg.source
    property alias roadBgVisible: roadFloor_bg0.visible
    property alias roadBg2Visible: roadFloor_bg.visible

    property bool lanePosChangeAnimEnable: false

    //    property string laneVertexShader: "vertexshader.vert"
    //    property string laneFragmentShader: "laneFragmentshader.frag"
    //    property string roadFragmentShader: "roadFragmentshader.frag"
    //property string roadFragmentShaderBg: "roadFragmentshaderBg.frag"
    //    property string laneChangeVertexShader: "laneChangeVertexshader.vert"
    //    property string laneChangeFragmentShader: "laneChangeFragmentshader.frag"

    //    property string laneVertexShader: "qrc:/asset_imports/Quick3DAssets/BydAdas/components/vertexshader.vert"
    //    property string laneFragmentShader: "qrc:/asset_imports/Quick3DAssets/BydAdas/components/laneFragmentshader.frag"
    //    property string roadFragmentShader: "qrc:/asset_imports/Quick3DAssets/BydAdas/components/roadFragmentshader.frag"
    property string roadFragmentShaderBg: "qrc:/qml10_25/adas3d/components/roadFragmentshaderBg.frag"
    //    property string laneChangeVertexShader: "qrc:/asset_imports/Quick3DAssets/BydAdas/components/laneChangeVertexshader.vert"
    //    property string laneChangeFragmentShader: "qrc:/asset_imports/Quick3DAssets/BydAdas/components/laneChangeFragmentshader.frag"

    //    property string laneVertexShader: "qrc:/qml10_25/adas/components/vertexshader.vert"
    //    property string laneFragmentShader: "qrc:/qml10_25/adas/components/laneFragmentshader.frag"
    //    property string roadFragmentShader: "qrc:/qml10_25/adas/components/roadFragmentshader.frag"
    //    property string roadFragmentShaderBg: "qrc:/qml10_25/adas/components/roadFragmentShaderBg.frag"
    //    property string laneChangeVertexShader: "qrc:/qml10_25/adas/components/laneChangeVertexshader.vert"
    //    property string laneChangeFragmentShader: "qrc:/qml10_25/adas/components/laneChangeFragmentshader.frag"

    property string laneVertexShader: "qrc:/qml10_25/adas3d/components/vertexshader.vert"
    property string laneFragmentShader: "qrc:/qml10_25/adas3d/components/laneFragmentshader.frag"
    property string roadFragmentShader: "qrc:/qml10_25/adas3d/components/roadFragmentshader.frag"
    //    property string roadFragmentShaderBg: "qrc:/qml10_25/adas3d/components/roadFragmentShaderBg.frag"
    property string laneChangeVertexShader: "qrc:/qml10_25/adas3d/components/laneChangeVertexshader.vert"
    property string laneChangeFragmentShader: "qrc:/qml10_25/adas3d/components/laneChangeFragmentshader.frag"

    //property alias selfCarMesh:self_car.source
    //property alias selfCarPng :texture1.resources

    property alias middleLaneLeftX: middleLaneLeft.x
    property alias middleLaneRightX: middleLaneRight.x


    /*
    Image {
        id: image
        x: -660
        y: -164
        width: 1920
        height: 720
        visible: false
        source: "../IMG_000.png"
        anchors.horizontalCenter: parent.horizontalCenter
        fillMode: Image.PreserveAspectFit
    }

    RowLayout {
        id: rowLayoutColor
        x: 206
        y: 0
        width: 352
        height: 55
        visible: false

        Rectangle {
            id: rectangle2
            width: 200
            height: 200
            color: "#ff0000"
            border.color: "#ff0000"
            Layout.fillHeight: true
        }

        Rectangle {
            id: rectangle3
            width: 200
            height: 200
            color: "#00ff00"
            Layout.fillHeight: true
        }

        Rectangle {
            id: rectangle4
            width: 200
            height: 200
            color: "#0000ff"
            Layout.fillHeight: true
        }

    }

    Rectangle {
        id: rectangle
        width: 650
        height: 391
        opacity: 0.2
        visible: false
        color: "#4feb52"
        anchors.horizontalCenter: parent.horizontalCenter
    }

    Rectangle {
        id: rectangle1
        x: 0
        y: 0
        width: 650
        height: 92
        opacity: 0.2
        visible: false
        color: "#f31919"
        anchors.horizontalCenter: parent.horizontalCenter
    }

    DebugView{
        width: 200
        height: 100
        source: view3D
    }
*/
    property int modelMoveDuration: 500

    View3D {
        id: view3D
        anchors.fill: parent
        //        width: 650
        //        height: 391
        //        anchors.horizontalCenter: parent.horizontalCenter
        //        anchors.bottom: parent.bottom
        environment: sceneEnvironment
        SceneEnvironment {
            id: sceneEnvironment
            depthTestEnabled: true
            temporalAAEnabled: false
            antialiasingQuality: SceneEnvironment.High
            antialiasingMode: SceneEnvironment.NoAA
        }

        Node
        {
            id: scene
            DirectionalLight {
                id: directionalLight
                x: -658.023
                y: 295.079
                brightness: 73
                eulerRotation.z: 97.73058
                eulerRotation.y: -130.32942
                eulerRotation.x: -25.3212
                z: -419.33051
                visible: false
            }

            DirectionalLight {
                id: directionalLight1
                x: 17.389
                y: 649.612
                eulerRotation.z: 1.79
                eulerRotation.y: -44.31
                eulerRotation.x: -109.81
                brightness: 185
                z: 198.28175
            }

            PerspectiveCamera {
                id: camera
                x: -0
                y: 157
                z: 1540
                fieldOfView: 38
                fieldOfViewOrientation: PerspectiveCamera.Horizontal
                clipNear: 1
                clipFar: 10000
                scale.z: 1
                scale.y: 1
                scale.x: 1
                eulerRotation.z: 0.00001
                eulerRotation.y: -0
                eulerRotation.x: -8.8
            }

            Model {
                id: roadBG
                x: 0
                y: -0
                visible: false
                source: "#Rectangle"
                scale.z: 10
                receivesShadows: false
                castsShadows: false
                pickable: false
                z: 120
                scale.y: 11
                scale.x: 2.5
                eulerRotation.x: -90
                //materials: selfCarMatarial

                DefaultMaterial {
                    id: roadBGMaterial
                    vertexColorsEnabled: false
                    blendMode: DefaultMaterial.SourceOver
                    diffuseMap: roadBGTexture
                    diffuseColor: "#cacaca"
                    lighting: DefaultMaterial.NoLighting

                    Texture {
                        id: roadBGTexture
                        source: "qrc:/images10_25/adas3d/RoadsBG_TR_Light_np.png"
                        tilingModeVertical: Texture.Repeat
                        tilingModeHorizontal: Texture.ClampToEdge
                        positionV: 1
                        positionU: 0
                        mappingMode: Texture.UV
                    }
                }

            }


            //SelfCar
            //blow_vent
            //radar
            Node {
                id: groupSelfCar
                x: -0
                y: 0
                visible: true
                z: 38.69281
//                SelfCar_20256
//                {
//                    id: self_car2
//                    x: 0
//                    y: 17.861
//                    opacity: 1
//                }

                /*
                Model {
                    id: self_car
                    //property alias material_color: defaultMaterial_material.diffuseColor//
                    //property alias rotationY: self_car.eulerRotation.y
                    x: 0
                    y: -0
                    z: 839.37469

                    scale.z: 0.17
                    scale.y: 0.17
                    scale.x: 0.17
                    eulerRotation.x: -90
                    eulerRotation.y: 180
                    source: "qrc:/qml10_25/adas3d/models/meshes/self_car.mesh"
                    tessellationMode: Model.NoTessellation

                    DefaultMaterial {
                        id: defaultMaterial_material
                        //lighting: DefaultMaterial.FragmentLighting
                        lighting: DefaultMaterial.NoLighting
                        diffuseColor: "#ffcccccc"
                        diffuseMap: texture1
                        Texture {
                            id: texture1
                            source: "qrc:/images10_25/adas3d/maps/self_car_model.png"
                        }
                    }
                    materials: [
                        defaultMaterial_material
                    ]

                    Behavior on x {
                        NumberAnimation{duration: root.modelMoveDuration}
                    }
                }
                */
Model {
    id: selfCarBottomImage
    x: self_car.x
    y: self_car.y - 20
    z: self_car.z - 1  // 确保在自车下方
    opacity: 1
    visible: DataSource.rightLineColor === 0x02 || DataSource.leftLineColor === 0x02
    source: "#Rectangle"
    scale.x: 1.5
    scale.y: 1.02
    scale.z: 1.5
    
    // 图片基础路径
    property string imageFolder: "qrc:/images10_25/adas3d/光晕/"
    property int currentIndex: 0        // 当前图片索引
    property int totalImages: 18        // 图片总数，根据实际情况调整
    
    // 获取当前图片路径
    function getImagePath() {
        return imageFolder + (currentIndex + 1).toString().padStart(3, '0') + ".png";
    }
    
    // 更新显示的图片
    function updateImage() {
        var newPath = getImagePath();
        selfCarBottomTexture.source = newPath;
        currentIndex = (currentIndex + 1) % totalImages;  // 循环播放
    }

    DefaultMaterial {
        id: selfCarBottomMatarial
        diffuseMap: selfCarBottomTexture
        vertexColorsEnabled: false
        lighting: DefaultMaterial.NoLighting
        Texture {
            id: selfCarBottomTexture
            source: getImagePath()  // 初始图片
            scaleU: 1
        }
    }
    materials: selfCarBottomMatarial
    
    // 图片切换定时器
    Timer {
        id: imageTimer
        interval: 100  // 100毫秒切换一张（可根据需要调整）
        running: selfCarBottomImage.visible
        repeat: true
        onTriggered: {
            selfCarBottomImage.updateImage();
        }
    }
    
    // 当visible属性改变时控制定时器
    onVisibleChanged: {
        if (visible) {
            imageTimer.start();
        } else {
            imageTimer.stop();
        }
    }
    
    // 初始化时启动定时器（如果visible为true）
    Component.onCompleted: {
        if (visible) {
            imageTimer.start();
        }
    }
}


                Model {
                    id: self_car
                    x: 0
                    y: 40
                    opacity: 1
                    visible: true
                    source: "#Rectangle"
                    z: 610
                    eulerRotation.z: 0
                    eulerRotation.y: 0
                    eulerRotation.x: 0
                    receivesShadows: false
    scale.x: 1.5
    scale.y: 1.02
    scale.z: 1.5
                    DefaultMaterial {
                        id: selfCarMatarial
                        diffuseMap: selfCarTexture
                        vertexColorsEnabled: false
                        lighting: DefaultMaterial.NoLighting
                        Texture {
                            id: selfCarTexture
                            source: "qrc:/images10_25/adas3d/self_car_SK2.png"
                            scaleU: 1
                        }
                    }
                    materials: selfCarMatarial
                }

                Model {
                    id: blow_vent
                    x: self_car.x
                    y: 4.2
                    opacity: 1
                    source: "#Rectangle"
                    z: self_car.z+35
                    eulerRotation.z: 0
                    eulerRotation.y: 0
                    eulerRotation.x: 0
                    receivesShadows: false
                    //                eulerRotation.z: -179.999
                    //                eulerRotation.y: 179.999
                    //                eulerRotation.x: -90
                    scale.x: 0.5
                    scale.y: 0.15
                    DefaultMaterial {
                        id: ventMatarial
                        diffuseMap: ventTexture
                        vertexColorsEnabled: false
                        lighting: DefaultMaterial.NoLighting
                        Texture {
                            id: ventTexture
                            source: "qrc:/images10_25/adas3d/blow_vent.png"
                            scaleU: 1
                        }
                    }
                    materials: ventMatarial

                }

                Model {
                    id: radar_bl
                    x: self_car.x-48
                    y: 1.6
                    opacity: 1
                    source: "#Rectangle"
                    z: self_car.z+20
                    eulerRotation.z: -179.99956
                    eulerRotation.y: 179.99954
                    eulerRotation.x: -90
                    receivesShadows: false
                    //                eulerRotation.z: -179.999
                    //                eulerRotation.y: 179.999
                    //                eulerRotation.x: -90
                    //scale.z: 0.85
                    //scale.y: 0.85
                    scale.x: 0.85
                    DefaultMaterial {
                        id: radarMatarial
                        diffuseMap: radarTexture
                        vertexColorsEnabled: false
                        lighting: DefaultMaterial.NoLighting
                        Texture {
                            id: radarTexture
                            source: "qrc:/images10_25/adas3d/radar/bl/"+radar_name.arg(radar_bl_count)
                            scaleU: 1
                        }
                    }
                    materials: radarMatarial
                }

                Model {
                    id: radar_br
                    x: self_car.x+48
                    y: 1.6
                    opacity: 1
                    source: "#Rectangle"
                    z: self_car.z+20
                    eulerRotation.z: -179.99956
                    eulerRotation.y: 179.99954
                    eulerRotation.x: -90
                    receivesShadows: false
                    //                eulerRotation.z: -179.999
                    //                eulerRotation.y: 179.999
                    //                eulerRotation.x: -90
                    //scale.z: 0.85
                    //scale.y: 0.85
                    scale.x: 0.85
                    DefaultMaterial {
                        id: radarMatarial01
                        diffuseMap: radarTexture01
                        vertexColorsEnabled: false
                        lighting: DefaultMaterial.NoLighting
                        Texture {
                            id: radarTexture01
                            source: "qrc:/images10_25/adas3d/radar/br/"+radar_name.arg(radar_br_count)
                            scaleU: 1
                        }
                    }
                    materials: radarMatarial01
                }

                Model {
                    id: radar_bm
                    x: self_car.x
                    y: -1.7
                    opacity: 1
                    source: "#Rectangle"
                    z: self_car.z+20
                    eulerRotation.z: -179.99956
                    eulerRotation.y: 179.99954
                    eulerRotation.x: -90
                    receivesShadows: false
                    //                eulerRotation.z: -179.999
                    //                eulerRotation.y: 179.999
                    //                eulerRotation.x: -90
                    //scale.z: 0.85
                    //scale.y: 0.85
                    //scale.x: 0.85
                    DefaultMaterial {
                        id: radarMatarial02
                        diffuseMap: radarTexture02
                        vertexColorsEnabled: false
                        lighting: DefaultMaterial.NoLighting
                        Texture {
                            id: radarTexture02
                            source: "qrc:/images10_25/adas3d/radar/bm/"+radar_name.arg(radar_bm_count)
                            scaleU: 1
                        }
                    }
                    materials: radarMatarial02
                }

                Model {
                    id: radar_fl
                    x: self_car.x-50
                    y: 1
                    opacity: 1
                    source: "#Rectangle"
                    z: self_car.z-188
                    eulerRotation.z: -179.99956
                    eulerRotation.y: 179.99954
                    eulerRotation.x: -90
                    receivesShadows: false
                    //                eulerRotation.z: -179.999
                    //                eulerRotation.y: 179.999
                    //                eulerRotation.x: -90
                    //scale.z: 0.85
                    //scale.y: 0.85
                    scale.x: 0.85
                    DefaultMaterial {
                        id: radarMatarial03
                        diffuseMap: radarTexture03
                        vertexColorsEnabled: false
                        lighting: DefaultMaterial.NoLighting
                        Texture {
                            id: radarTexture03
                            source: "qrc:/images10_25/adas3d/radar/fl/"+radar_name.arg(radar_fl_count)
                            scaleU: 1
                        }
                    }
                    materials: radarMatarial03
                }

                Model {
                    id: radar_fr
                    x: self_car.x+50
                    y: 1
                    opacity: 1
                    source: "#Rectangle"
                    z: self_car.z-188
                    eulerRotation.z: -179.99956
                    eulerRotation.y: 179.99954
                    eulerRotation.x: -90
                    receivesShadows: false
                    //                eulerRotation.z: -179.999
                    //                eulerRotation.y: 179.999
                    //                eulerRotation.x: -90
                    //scale.z: 0.85
                    //scale.y: 0.85
                    scale.x: 0.85
                    DefaultMaterial {
                        id: radarMatarial04
                        diffuseMap: radarTexture04
                        vertexColorsEnabled: false
                        lighting: DefaultMaterial.NoLighting
                        Texture {
                            id: radarTexture04
                            source: "qrc:/images10_25/adas3d/radar/fr/"+radar_name.arg(radar_fr_count)
                            scaleU: 1
                        }
                    }
                    materials: radarMatarial04
                }
            }

            //road

            Node {
                id: groupRoad
                x: 2
                y: 0
                scale.z: 1.8
                z: -227.92239

                Model {
                    id: roadFloor_bg0
                    y: -1
                    visible: true
                    opacity: 0.99
                    source: "qrc:/qml10_25/adas3d/models/meshes/Carpet.mesh"
                    scale.z: 0.18
                    scale.x: 0.51
                    z: 690
                    materials: roadFloorMaterial_bg0

                    CustomMaterial {
                        id: roadFloorMaterial_bg0
                        ShaderInfo {
                            id: shaderInformation_bg0
                            shaderKey: ShaderInfo.Transparent
                            type: "GLSL"
                            version: "330"
                        }

                        Pass {
                            id: renderPass_bg0
                            shaders: [vertShader_bg0, fragShader_bg0]
                        }

                        Shader {
                            id: vertShader_bg0
                            shader: laneVertexShader
                            stage: Shader.Vertex
                        }

                        Shader {
                            id: fragShader_bg0
                            shader: roadFragmentShaderBg
                            stage: Shader.Fragment
                        }

                        TextureInput {
                            id: roadMapTextureInput_bg0
                            texture: carpetTexture_bg0
                        }

                        Texture {
                            id: carpetTexture_bg0
                            source: "qrc:/images10_25/adas3d/maps/road_surface_light.png"
                        }
                        property real curvature: rightLaneMaterial.curvature/3
                        property real offset: 1
                        property real tilt: 1
                        property real fadeStart: 0
                        property real fadeEnd:1
                        property real shift: 1
                        shaderInfo: shaderInformation_bg0
                        property alias map: roadMapTextureInput_bg0
                        property color laneColor: "#ffffff"
                        passes: renderPass_bg0
                    }
                }
                Model {
                    id: roadFloor_bg
                    y: -1
                    opacity: 0.99
                    visible: false
                    source: "qrc:/qml10_25/adas3d/models/meshes/Carpet.mesh"
                    scale.z: 0.18
                    scale.x: 0.2
                    z: 690

                    materials: roadFloorMaterial_bg

                    CustomMaterial {
                        id: roadFloorMaterial_bg
                        ShaderInfo {
                            id: shaderInformation_bg
                            type: "GLSL"
                            version: "330"
                        }

                        Pass {
                            id: renderPass_bg
                            shaders: [vertShader_bg, fragShader_bg]
                        }

                        Shader {
                            id: vertShader_bg
                            shader: laneVertexShader
                            stage: Shader.Vertex
                        }

                        Shader {
                            id: fragShader_bg
                            shader: roadFragmentShaderBg
                            stage: Shader.Fragment
                        }

                        TextureInput {
                            id: roadMapTextureInput_bg
                            texture: carpetTexture_bg
                        }

                        Texture {
                            id: carpetTexture_bg
                            source: "qrc:/images10_25/adas3d/maps/road_middle_light.png"
                        }
                        property real curvature: rightLaneMaterial.curvature
                        property real offset: 1
                        property real tilt: 1
                        property real fadeStart: 0
                        property real fadeEnd: 1
                        property real shift: 1
                        shaderInfo: shaderInformation_bg
                        property alias map: roadMapTextureInput_bg
                        property color laneColor: "#ffffff"
                        passes: renderPass_bg
                    }
                }

                Model {
                    id: roadFloor
                    opacity: 0.99
                    source: "qrc:/qml10_25/adas3d/models/meshes/Carpet.mesh"
                    scale.z: 0.18
                    scale.x: 0.15
                    z: 690
                    x:middleLaneLeft.x + 48     //以左侧车道线X为基准，+48 为中心范围，如果车道线距离后面有调整，48也需要同步修改
                    materials: roadFloorMaterial

                    CustomMaterial {
                        id: roadFloorMaterial
                        ShaderInfo {
                            id: shaderInformation1
                            type: "GLSL"
                            version: "330"
                        }

                        Pass {
                            id: renderPass1
                            shaders: [vertShader1, fragShader1]
                        }

                        Shader {
                            id: vertShader1
                            shader: laneVertexShader
                            stage: Shader.Vertex
                        }

                        Shader {
                            id: fragShader1
                            shader: roadFragmentShader
                            stage: Shader.Fragment
                        }

                        TextureInput {
                            id: roadMapTextureInput
                            texture: carpetTexture
                        }

                        Texture {
                            id: carpetTexture
                            source: "qrc:/images10_25/adas3d/maps/distanceArea.png"
                        }
                        property real curvature: rightLaneMaterial.curvature * 1.33
                        property real offset: 1
                        property real tilt: 1
                        property real fadeEnd: 1
                        property real shift: 1
                        shaderInfo: shaderInformation1
                        property alias map: roadMapTextureInput
                        property color laneColor: "#ff0000"
                        property real fadeStart: 0.1 //起始绘制点
                        passes: renderPass1
                        //取消动画原因：目标没有动画，如果车间距离有动画会导致距离颜色绘制与目标位置有一段时间不匹配
//                        Behavior on fadeEnd{
//                            NumberAnimation{duration: root.modelMoveDuration}
//                            enabled: roadFloor.visible
//                        }
                    }
                }

                Model {
                    id: middleLaneLeft
                    x: -48
                    y: 1
                    opacity: 0.99
                    z: 690
                    scale.x: 0.2
                    scale.y: 1
                    scale.z: 0.18
                    receivesShadows: true
                    source: "qrc:/qml10_25/adas3d/models/meshes/Lane_lft.mesh"
                    pickable: false
                    castsShadows: true
                    materials: leftLaneMaterial

                    Behavior on x{
                        enabled: lanePosChangeAnimEnable
                        NumberAnimation{
                            duration: root.modelMoveDuration
                        }
                    }

                    CustomMaterial {
                        id: leftLaneMaterial
                        shaderInfo: shaderInformation3
                        property real curvature: rightLaneMaterial.curvature
                        property real offset: rightLaneMaterial.offset
                        property real fadeEnd: rightLaneMaterial.fadeEnd
                        property real tilt: rightLaneMaterial.tilt
                        property real dashLineSpace: rightLaneMaterial.dashLineSpace
                        property real shift: rightLaneMaterial.shift
                        property bool solid: true//false
                        property color laneColor: Qt.rgba(0.0, 0.0, 1.0, 1.0)
                        property alias map: laneMapTextureInputLeft
                        property real fadeStart: rightLaneMaterial.fadeStart
                        property real dashlineOffset: rightLaneMaterial.dashlineOffset
                        property real opacity: 1.0
    property real zhangGe: (DataSource.leftLineType === 0x0 && rootItemId.xuXian === 0) ? 0 : DataSource.speed
    property real u_time: 0.0
    
    NumberAnimation on u_time {
        from: 0
        to: 1.0
        duration: 50000
        loops: Animation.Infinite
        running: DataSource.leftLineType !== 0x0 || rootItemId.xuXian === 1
    } 						
                        ShaderInfo {
                            id: shaderInformation3
                            type: "GLSL"
                            version: "330"
                        }

                        Pass {
                            id: renderPass3
                            shaders: [vertShader3, fragShader3]
                        }

                        Shader {
                            id: vertShader3
                            stage: Shader.Vertex
                            shader: laneVertexShader
                        }

                        Shader {
                            id: fragShader3
                            stage: Shader.Fragment
                            shader: laneFragmentShader
                        }
                        TextureInput {
                            id: laneMapTextureInputLeft
                            texture: laneTextureWhiteLeft
                        }

                        Texture {
                            id: laneTextureWhiteLeft
                            source: "qrc:/images10_25/adas3d/maps/middleroad-whiteLeft.png"
                        }

                        passes: renderPass3

                    }
                }

                Model {
                    id: middleLaneRight
                    x: 48  //96:中间车道宽度
                    y: 1
                    z: 690
                    opacity: 0.99
                    pickable: false
                    scale.x: 0.2
                    scale.y: 1
                    scale.z: 0.18
                    source: "qrc:/qml10_25/adas3d/models/meshes/Lane_rgt.mesh"
                    materials: rightLaneMaterial

                    Behavior on x{
                        enabled: lanePosChangeAnimEnable
                        NumberAnimation{duration: root.modelMoveDuration}
                    }

                    CustomMaterial {
                        id: rightLaneMaterial
                        property real curvature: 0
                        property real tilt: 1
                        property real shift: 1
                        property real offset: 1
                        property real fadeEnd: 1
                        property color laneColor: Qt.rgba(1.0, 0, 0.0, 1.0)
                        property alias map: laneMapTextureInput
                        property bool solid: false
                        property real dashLineSpace: 0.06
                        property real fadeStart: 0
                        property real dashlineOffset: 0
                        property real opacity: 1.0
    property real zhangGe: (DataSource.rightLineType === 0x0 && rootItemId.xuXian === 0) ? 0 : DataSource.speed
    property real u_time: 0.0
    
    NumberAnimation on u_time {
        from: 0
        to: 1.0
        duration: 50000
        loops: Animation.Infinite
        running: DataSource.rightLineType !== 0x0 || rootItemId.xuXian === 1
    }    
                        Behavior on curvature{
                            NumberAnimation{duration: root.modelMoveDuration}
                        }

                        ShaderInfo {
                            id: shaderInformation
                            type: "GLSL"
                            version: "330"
                        }

                        Pass {
                            id: renderPass
                            shaders: [vertShader, fragShader]
                        }

                        Shader {
                            id: vertShader
                            shader: laneVertexShader
                            stage: Shader.Vertex
                        }

                        Shader {
                            id: fragShader
                            shader: laneFragmentShader
                            stage: Shader.Fragment
                        }

                        TextureInput {
                            id: laneMapTextureInput
                            texture: laneTextureWhite
                        }

                        Texture {
                            id: laneTextureWhite
                            source: "qrc:/images10_25/adas3d/maps/middleroad-whiteRight.png"
                        }

                        passes: renderPass
                        shaderInfo: shaderInformation
                    }
                }

                Model {
                    id: leftLaneLeft
                    x:-139
                    y: 0
                    opacity: 0.99
                    visible: true
                    source: "qrc:/qml10_25/adas3d/models/meshes/Lane_lft.mesh"
                    materials: leftLaneMaterial1
                    receivesShadows: false
                    scale.z: 0.18
                    z: 690
                    scale.x: 0.2
                    scale.y: 1
                    CustomMaterial {
                        id: leftLaneMaterial1
                        shaderInfo: shaderInformation4
                        passes: renderPass4
                        property real curvature: rightLaneMaterial.curvature
                        property real offset: rightLaneMaterial.offset
                        property real fadeEnd: rightLaneMaterial.fadeEnd
                        property real tilt: rightLaneMaterial.tilt
                        property real dashLineSpace: rightLaneMaterial.dashLineSpace
                        property real shift: rightLaneMaterial.shift
                        property bool solid: false
                        property color laneColor: Qt.rgba(0.0, 1.0, 0.0, 1.0)
                        property alias map: laneMapTextureInput
                        property real fadeStart: rightLaneMaterial.fadeStart
                        property real dashlineOffset: rightLaneMaterial.dashlineOffset
                        property real opacity:0
                        ShaderInfo {
                            id: shaderInformation4
                            version: "330"
                            type: "GLSL"
                        }

                        Pass {
                            id: renderPass4
                            shaders: [vertShader4, fragShader4]
                        }

                        Shader {
                            id: vertShader4
                            stage: Shader.Vertex
                            shader: laneVertexShader
                        }

                        Shader {
                            id: fragShader4
                            stage: Shader.Fragment
                            shader: laneFragmentShader
                        }
                    }
                }

                Model {
                    id: rightLaneRight
                    x: 139
                    y: 0
                    opacity:0.99
                    visible: true
                    source: "qrc:/qml10_25/adas3d/models/meshes/Lane_rgt.mesh"
                    materials: rightLaneMaterial1
                    pickable: false
                    scale.z: 0.18
                    z: 690
                    scale.x: 0.2
                    scale.y: 1
                    CustomMaterial {
                        id: rightLaneMaterial1
                        shaderInfo: shaderInformation5
                        passes: renderPass5
                        property real curvature: rightLaneMaterial.curvature
                        property real offset: rightLaneMaterial.offset
                        property real fadeEnd: rightLaneMaterial.fadeEnd
                        property real tilt: rightLaneMaterial.tilt
                        property real dashLineSpace: rightLaneMaterial.dashLineSpace
                        property real shift: rightLaneMaterial.shift
                        property bool solid: false
                        property color laneColor: Qt.rgba(0.0, 1.0, 0.0, 1.0)
                        property alias map: laneMapTextureInput
                        property real fadeStart: rightLaneMaterial.fadeStart
                        property real dashlineOffset: rightLaneMaterial.dashlineOffset
                        property real opacity:0
                        ShaderInfo {
                            id: shaderInformation5
                            version: "330"
                            type: "GLSL"
                        }

                        Pass {
                            id: renderPass5
                            shaders: [vertShader5, fragShader5]
                        }

                        Shader {
                            id: vertShader5
                            stage: Shader.Vertex
                            shader: laneVertexShader
                        }

                        Shader {
                            id: fragShader5
                            stage: Shader.Fragment
                            shader: laneFragmentShader
                        }
                    }
                }
            }

            //变道辅助线底层
            Model {
                id: laneChangePrompt
                x: self_car.x
                y: 2
                opacity: 0.99
                source: "qrc:/qml10_25/adas3d/models/meshes/Carpet.mesh"
                scale.z: 0.2
                visible: false
                materials: laneChangeMaterial
                CustomMaterial {
                    id: laneChangeMaterial
                    passes: renderPass2

                    property alias map: laneChangeMapTextureInput
                    property real fadeEnd: 0.1
                    property color laneColor: Qt.rgba(1.0, 0.0, 0.0, 1.0)
                    property real fadeStart: 0
                    property real fadeStart1: 0
                    property real fadeEnd1: 0.1
                    property real k: -500
                    property real t: 5
                    property real curvature: rightLaneMaterial.curvature/3
                    property real offset: 1
                    property real tilt: 1
                    property real shift: 1

                    ShaderInfo {
                        id: shaderInformation2
                        version: "330"
                        type: "GLSL"
                    }

                    Pass {
                        id: renderPass2
                        shaders: [vertShader2, fragShader2]
                    }

                    Shader {
                        id: vertShader2
                        stage: Shader.Vertex
                        shader: laneChangeVertexShader
                    }

                    Shader {
                        id: fragShader2
                        stage: Shader.Fragment
                        shader: laneChangeFragmentShader
                    }

                    TextureInput {
                        id: laneChangeMapTextureInput
                        texture: laneChangeTexture
                    }

                    Texture {
                        id: laneChangeTexture
                        source: "qrc:/images10_25/adas3d/maps/non_perpective_base.png"
                    }
                    shaderInfo: shaderInformation2
                }
                z: 1200
                scale.x: 0.15
            }

            Model {
                id: laneChangePrompt2
                x: laneChangePrompt.x+3
                y: 2
                visible: laneChangePrompt.visible
                opacity: laneChangePrompt.opacity
                source: "qrc:/qml10_25/adas3d/models/meshes/Carpet.mesh"
                scale.z: 0.2
                materials: laneChangeMaterial2
                CustomMaterial {
                    id: laneChangeMaterial2
                    passes: renderPass6

                    property alias map: laneChangeMapTextureInput2
                    property real fadeEnd: 0.1
                    property color laneColor: laneChangeMaterial.laneColor
                    property real fadeStart: 0
                    property real fadeStart1: 0
                    property real fadeEnd1: 0.15
                    property real k: laneChangeMaterial.k
                    property real t: laneChangeMaterial.t
                    property real curvature: laneChangeMaterial.curvature
                    property real offset: 1
                    property real tilt: 1
                    property real shift: 1

                    ShaderInfo {
                        id: shaderInformation6
                        version: "330"
                        type: "GLSL"
                    }

                    Pass {
                        id: renderPass6
                        shaders: [vertShader6, fragShader6]
                    }

                    Shader {
                        id: vertShader6
                        stage: Shader.Vertex
                        shader: laneChangeVertexShader
                    }

                    Shader {
                        id: fragShader6
                        stage: Shader.Fragment
                        shader: laneChangeFragmentShader
                    }

                    TextureInput {
                        id: laneChangeMapTextureInput2
                        texture: laneChangeTexture2
                    }

                    Texture {
                        id: laneChangeTexture2
                        source: "qrc:/images10_25/adas3d/maps/non_perpective_top.png"
                    }
                    shaderInfo: shaderInformation6
                }
                z: laneChangePrompt.z
                scale.x: laneChangePrompt.scale.x
            }

            Loader3D
            {
                id:model_00
                x: pos_x_00
                source: "qrc:/qml10_25/adas3d/components/TruckDetail.qml"
                z: pos_z_01
                asynchronous: true //异步加载
                visible: status==Loader3D.Ready
                onLoaded:
                {
                    item.material_color = Qt.binding(function() { return root.color_00; })//利用绑定把load进来的item属性z，绑定到pos_z上
                    item.collision_visible = Qt.binding(function() { return root.collision_visible_00; })
                    item.collision_type = Qt.binding(function(){return root.collision_type_00})
                }
//                Behavior on x{
//                    NumberAnimation{duration: root.modelMoveDuration}
//                    enabled: model_00.visible
//                }
//                Behavior on z{
//                    NumberAnimation{duration: root.modelMoveDuration}
//                    enabled: model_00.visible
//                }
            }
            Loader3D
            {
                id:model_01
                x: pos_x_01
                source: "qrc:/qml10_25/adas3d/components/PedestrianDetail.qml"
                z: pos_z_01
                asynchronous: true //异步加载
                visible: status==Loader3D.Ready
                onLoaded:
                {
                    item.material_color = Qt.binding(function() { return root.color_01; })//利用绑定把load进来的item属性z，绑定到pos_z上
                    item.collision_visible = Qt.binding(function() { return root.collision_visible_01; })
                    item.collision_type = Qt.binding(function(){return root.collision_type_01})
                }
//                Behavior on x{
//                    NumberAnimation{duration: root.modelMoveDuration}
//                    enabled: model_01.visible
//                }
//                Behavior on z{
//                    NumberAnimation{duration: root.modelMoveDuration}
//                    enabled: model_01.visible
//                }
            }

            Loader3D
            {
                id:model_02
                x: pos_x_02
                source: "qrc:/qml10_25/adas3d/components/TruckDetail.qml"
                z: pos_z_02
                asynchronous: true //异步加载
                visible: status==Loader3D.Ready
                onLoaded:
                {
                    item.material_color = Qt.binding(function() { return root.color_02; })//利用绑定把load进来的item属性z，绑定到pos_z上
                    item.collision_visible = Qt.binding(function() { return root.collision_visible_02; })
                    item.collision_type = Qt.binding(function(){return root.collision_type_02})
                }
//                Behavior on x{
//                    NumberAnimation{duration: root.modelMoveDuration}
//                    enabled: model_02.visible
//                }
//                Behavior on z{
//                    NumberAnimation{duration: root.modelMoveDuration}
//                    enabled: model_02.visible
//                }
            }

            Loader3D
            {
                id:model_03
                x: pos_x_03
                source: "qrc:/qml10_25/adas3d/components/BikeDetail.qml"
                z: pos_z_03
                asynchronous: true //异步加载
                visible: status==Loader3D.Ready
                onLoaded:
                {
                    item.material_color = Qt.binding(function() { return root.color_03; })//利用绑定把load进来的item属性z，绑定到pos_z上
                    item.collision_visible = Qt.binding(function() { return root.collision_visible_03; })
                    item.collision_type = Qt.binding(function(){return root.collision_type_03})
                }
//                Behavior on x{
//                    NumberAnimation{duration: root.modelMoveDuration}
//                    enabled: model_03.visible
//                }
//                Behavior on z{
//                    NumberAnimation{duration: root.modelMoveDuration}
//                    enabled: model_03.visible
//                }
            }

            Loader3D
            {
                id:model_04
                x: pos_x_04
                source: "qrc:/qml10_25/adas3d/components/TruckDetail.qml"
                z: pos_z_04
                asynchronous: true //异步加载
                visible: status==Loader3D.Ready
                onLoaded:
                {
                    item.material_color = Qt.binding(function() { return root.color_04; })//利用绑定把load进来的item属性z，绑定到pos_z上
                    item.collision_visible = Qt.binding(function() { return root.collision_visible_04; })
                    item.collision_type = Qt.binding(function(){return root.collision_type_04})
                }
//                Behavior on x{
//                    NumberAnimation{duration: root.modelMoveDuration}
//                    enabled: model_04.visible
//                }
//                Behavior on z{
//                    NumberAnimation{duration: root.modelMoveDuration}
//                    enabled: model_04.visible
//                }
            }

            Loader3D
            {
                id:model_05
                x: pos_x_05
                source: "qrc:/qml10_25/adas3d/components/CarDetail.qml"
                z: pos_z_05
                asynchronous: true //异步加载
                visible: status==Loader3D.Ready
                onLoaded:
                {
                    item.material_color = Qt.binding(function() { return root.color_05; })//利用绑定把load进来的item属性z，绑定到pos_z上
                    item.collision_visible = Qt.binding(function() { return root.collision_visible_05; })
                    item.collision_type = Qt.binding(function(){return root.collision_type_05})
                }
//                Behavior on x{
//                    NumberAnimation{duration: root.modelMoveDuration}
//                    enabled: model_05.visible
//                }
//                Behavior on z{
//                    NumberAnimation{duration: root.modelMoveDuration}
//                    enabled: model_05.visible
//                }
            }

            Model {
                id: lane8
                x: -65
                y: 0
                z: 80
                scale.z: 1
                scale.y: 10
                scale.x: 60
                eulerRotation.z: 0
                eulerRotation.y: 90
                eulerRotation.x: 90
                geometry: GridGeometry {
                    horizontalLines: 2
                    verticalLines: 200
                }
                materials: rightLaneMaterial8
                CustomMaterial {
                    id: rightLaneMaterial8
                    property real curvature: 0
                    property real tilt: 1
                    property real shift: 1
                    property real offset: 1
                    property real fadeEnd: 1
                    property color laneColor: Qt.rgba(1.0, 0, 0.0, 1.0)
                    property alias map: laneMapTextureInput8
                    property bool solid: false
                    property real dashLineSpace: 0.06
                    property real fadeStart: 0
                    property real dashlineOffset: 0
                    ShaderInfo {
                        id: shaderInformation8
                        type: "GLSL"
                        version: "330"
                    }

                    Pass {
                        id: renderPass8
                        shaders: [vertShader, fragShader]
                    }

                    Shader {
                        id: vertShader8
                        shader: laneVertexShader
                        stage: Shader.Vertex
                    }

                    Shader {
                        id: fragShader8
                        shader: laneFragmentShader
                        stage: Shader.Fragment
                    }

                    TextureInput {
                        id: laneMapTextureInput8
                        texture: laneTextureWhite
                    }

                    Texture {
                        id: laneTextureWhite8
                        source: "qrc:/images10_25/adas3d/maps/middleroad-whiteLeft.png"
                    }

                    passes: renderPass8
                    shaderInfo: shaderInformation8
                }

            }


            Model {
                scale: Qt.vector3d(100, 100, 100)
                geometry: GridGeometry {
                    horizontalLines: 20
                    verticalLines: 20
                }
                materials: [ defaultMaterial ]

                DefaultMaterial {
                    id: defaultMaterial
                    lighting: DefaultMaterial.NoLighting
                    cullMode: DefaultMaterial.NoCulling
                    diffuseColor: "yellow"
                    //                   pointSize: 4
                }
            }

        }


        Fxaa {
            id: fxaa
        }

    }
    //可以设置函数
    //        PropertyAnimation
    //        {
    //            id: animation
    //            target: model
    //            property: "z"
    //            from: 620
    //            to:-200
    //            duration: 10000
    //            loops:Animation.Infinite
    //        }
}





/*##^##
Designer {
    D{i:0;height:400;width:600}
}
##^##*/
