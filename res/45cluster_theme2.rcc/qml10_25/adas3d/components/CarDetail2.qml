import QtQuick 2.15
import QtQuick3D 1.15

Node {
    id: rootNode
    property alias material_color: defaultMaterial_material.diffuseColor//
    property alias collision_visible:collision_indicator.visible
    property bool collision_type: false//false ->warning alert \ true ->collision blaze
    property int yOffSet: collision_type ? 15 :25

    Model {
        id: node2408
        z:34
        eulerRotation.x: -90
        eulerRotation.z: 0
        eulerRotation.y: 180
        scale.z: 0.02
        scale.y: 0.02
        scale.x: 0.02
        source: "qrc:/qml10_25/adas3d/models/meshes/carDetail.mesh"
        DefaultMaterial {
            id: defaultMaterial_material
            diffuseColor: "#ffffff"
            lighting: DefaultMaterial.NoLighting
            diffuseMap: texture1
            Texture {
                id: texture1
                source: "qrc:/images10_25/adas3d/maps/carDetail2.png"
            }
        }
        materials: [
            defaultMaterial_material
        ]
    }

    Model {
        id: collision_indicator
        x: node2408.x
        y: node2408.y+yOffSet
        opacity: 0.5
        source: "#Rectangle"
        z:35
        eulerRotation.z: 0
        eulerRotation.y: 0
        eulerRotation.x: 0
        receivesShadows: false
        castsShadows: false
        scale.z: 1
        scale.y: collision_type?0.4:0.3
        scale.x: collision_type?0.6:0.35
        DefaultMaterial {
            id: indicatorMatarial
            diffuseMap: indicatorTexture
            vertexColorsEnabled: false
            lighting: DefaultMaterial.NoLighting
            diffuseColor: collision_type ?"#FF0000" :"#FFFFFF"
            Texture {
                id: indicatorTexture
                source: collision_type ?"qrc:/images10_25/adas3d/maps/model_collision.png":"qrc:/common/images10_25/warninglight/adas_alert.png"
                scaleU: 1
            }
        }
        materials: indicatorMatarial
    }

    Model {
        id: yingying
        z:-15
        opacity: 1
        source: "#Rectangle"
        eulerRotation.z: 0
        eulerRotation.y: 0
        eulerRotation.x: -90
        receivesShadows: false
        scale.x: 1.45
        scale.y: 1.5
        scale.z: 0
        DefaultMaterial {
            id: indicatorMatarial1
            diffuseMap: indicatorTexture1
            vertexColorsEnabled: false
            diffuseColor: "#ef262222"

            Texture {
                id: indicatorTexture1
                source: "qrc:/images10_25/adas3d/maps/yinying_car.png"
                scaleU: 1
            }
        }
        materials: indicatorMatarial1
    }
}