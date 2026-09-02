import QtQuick 2.15
import QtQuick3D 1.15

Model {
    id: huoche0818
    property alias material_color: jichu_material.diffuseColor//
    property alias collision_visible:collision_indicator.visible
    property alias rotationY: huoche0818.eulerRotation.y

        eulerRotation.x: -90
    source: "qrc:/qml10_25/adas3d/models/meshes/truckDetail.mesh"

    eulerRotation.y: 180
    scale.z: 0.80
    scale.y: 0.80
    scale.x: 0.80

    DefaultMaterial {
        id: jichu_material
        diffuseMap: texture1
        lighting: DefaultMaterial.NoLighting

        Texture {
            id: texture1
            source: "qrc:/images10_25/adas3d/maps/TruckDetail256L.png"
        }
    }
    materials: [
        jichu_material
    ]

    Model {
        id: collision_indicator
        x: huoche0818.x
        y: huoche0818.y+80
        opacity: 0.5
        source: "#Rectangle"
        z: huoche0818.z+365
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
