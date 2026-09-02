import QtQuick 2.15
import QtQuick3D 1.15

Node {
    id: rootNode
    property alias material_color: defaultMaterial_material.diffuseColor//
    property alias collision_visible:collision_indicator.visible
    Model {
        id: ____001
        eulerRotation.x: -90
        source: "qrc:/qml10_25/adas3d/models/meshes/pedestrainDetail.mesh"
        scale.z: 0.9
        scale.y: 0.9
        scale.x: 0.9
        DefaultMaterial {
            id: defaultMaterial_material
            lighting: DefaultMaterial.NoLighting
            diffuseColor: "#ffffff"
            diffuseMap: texture1
            Texture {
                id: texture1
                source: "qrc:/images10_25/adas3d/maps/pedestrainDetail256.png"
            }
        }
        materials: [
            defaultMaterial_material
        ]
    }
    Model {
        id: collision_indicator
        x: ____001.x
        y: ____001.y+80
        opacity: 0.5
        source: "#Rectangle"
        z: ____001.z+30
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
