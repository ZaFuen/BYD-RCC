import QtQuick 2.15
import QtQuick3D 1.15

Node {
    id: rootNode
    property alias material_color: defaultMaterial_material.diffuseColor//
    property alias collision_visible:collision_indicator.visible
    Model {
        id: bike02
        eulerRotation.x: -90
        source: "qrc:/qml10_25/adas3d/models/meshes/bike.mesh"
        eulerRotation.y: 180
        scale.z: 1.20
        scale.y: 1.20
        scale.x: 1.20
        DefaultMaterial {
            id: defaultMaterial_material
            diffuseColor: "#ffffff"
            diffuseMap: texture1
            Texture {
                id: texture1
                source: "qrc:/images10_25/adas3d/maps/bike256.png"
            }
        }
        materials: [
            defaultMaterial_material
        ]
    }
    Model {
        id: collision_indicator
        x: bike02.x
        y: bike02.y+80
        opacity: 0.5
        source: "#Rectangle"
        z: bike02.z+100
        eulerRotation.z: 0
        eulerRotation.y: 0
        eulerRotation.x: 0
        receivesShadows: false
        //                eulerRotation.z: -179.999
//                eulerRotation.y: 179.999
//                eulerRotation.x: -90
        scale.z: 1
        scale.y: 2
        scale.x: 3.1
        DefaultMaterial {
            id: indicatorMatarial
            diffuseMap: indicatorTexture
            vertexColorsEnabled: false
            diffuseColor: "#FF0000"

            Texture {
                id: indicatorTexture
                source: "qrc:/images10_25/adas3d/maps/model_collision.png"
                scaleU: 1
            }
        }
        materials: indicatorMatarial
    }
}
