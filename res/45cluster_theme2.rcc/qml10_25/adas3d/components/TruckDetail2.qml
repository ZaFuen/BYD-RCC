import QtQuick 2.15
import QtQuick3D 1.15
import com.byd.DataSource 1.0

Node {
    id: rootNode
    property alias material_color: defaultMaterial_material.diffuseColor//
    property alias collision_visible:collision_indicator.visible
    property alias rotationY: huoche0818.eulerRotation.y
    property bool collision_type: false//false ->warning alert \ true ->collision blaze
    property int yOffSet: collision_type ? 25 :28
    Model {
        id: huoche0818
        eulerRotation.x: -90
        z:25
        scale.z: 0.02
        scale.y: 0.02
        scale.x: 0.02
        source: "qrc:/qml10_25/adas3d/models/meshes/truckDetail.mesh"
        eulerRotation.z: 0
        eulerRotation.y: 180
        DefaultMaterial {
            id: defaultMaterial_material
            diffuseColor: "#ffffff"
            diffuseMap: texture1
            lighting: DefaultMaterial.NoLighting
            Texture {
                id: texture1
                source: "qrc:/images10_25/adas3d/maps/TruckDetail2.png"
            }
        }

        materials: [
            defaultMaterial_material
        ]
    }

    Model {
        id: collision_indicator
        x: huoche0818.x
        y: huoche0818.y+yOffSet
        opacity: 0.5
        source: "#Rectangle"
        castsShadows: false
        z: 35
        receivesShadows: false
        scale.z: 1
        scale.y: collision_type?0.45:0.35
        scale.x: collision_type?0.65:0.45
        DefaultMaterial {
            id: indicatorMatarial
            diffuseMap: indicatorTexture
            vertexColorsEnabled: false
            diffuseColor: collision_type ?"#FF0000" :"#FFFFFF"
            lighting: DefaultMaterial.NoLighting
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
        x: 0
        y: 0
        opacity: 1
        source: "#Rectangle"
        z: -45
        eulerRotation.z: 0
        eulerRotation.y: 0
        eulerRotation.x: -90
        receivesShadows: false
        scale.z: 0
        scale.y: 1.7
        scale.x: 1.4
        DefaultMaterial {
            id: indicatorMatarial1
            diffuseMap: indicatorTexture1
            vertexColorsEnabled: false
            diffuseColor: "#1d1b1b"

            Texture {
                id: indicatorTexture1
                source: "qrc:/images10_25/adas3d/maps/yinying_truck.png"
                scaleU: 1
            }
        }
        materials: indicatorMatarial1
    }
}
