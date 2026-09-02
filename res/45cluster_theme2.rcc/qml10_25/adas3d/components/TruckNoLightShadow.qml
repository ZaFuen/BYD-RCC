import QtQuick 2.15
import QtQuick3D 1.15

Node {
    id: rootNode

    property alias material_color: defaultMaterial_material.diffuseColor//
    property alias collision_visible:collision_indicator.visible
    property alias rotationY: huoche0818.eulerRotation.y

    Model {
        id: huoche0818
        eulerRotation.x: -90
        eulerRotation.y: 180
        source: "qrc:/qml10_25/adas3d/models/meshes/truck.mesh"
        scale.z: 0.80
        scale.y: 0.80
        scale.x: 0.80

        DefaultMaterial {
            id: defaultMaterial_material
            diffuseMap: truck_shadow
            lighting: DefaultMaterial.NoLighting
            diffuseColor: "#d8d1d1"

            Texture {
                id: truck_shadow
                source: "qrc:/images10_25/adas3d/maps/Truck_shadow2.png"
            }
        }
        materials: [
            defaultMaterial_material
        ]
    }

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
