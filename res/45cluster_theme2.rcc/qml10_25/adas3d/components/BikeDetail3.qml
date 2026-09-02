import QtQuick 2.15
import QtQuick3D 1.15

Node {
    id: rootNode
    property alias material_color: defaultMaterial_material.diffuseColor//
    property alias collision_visible:collision_indicator.visible
    property bool collision_type: false//false ->warning alert \ true ->collision blaze
    property int yOffSet: collision_type ? 11 :25
    Model {
        id: bike02
        eulerRotation.x: -90
        source: "qrc:/qml10_25/adas3d/models/meshes/bikeDetail.mesh"
        eulerRotation.y: 180
        scale.z: 0.02
        scale.y: 0.02
        scale.x: 0.02		
        DefaultMaterial {
            id: defaultMaterial_material
            diffuseColor: "#ffffff"
            diffuseMap: texture1
            lighting: DefaultMaterial.NoLighting
            Texture {
                id: texture1
                source: "qrc:/images10_25/adas3d/maps/bikeDetail3.png"
            }
        }
        materials: [
            defaultMaterial_material
        ]
    }
	
    Model {
        id: collision_indicator
        x: bike02.x
        y: bike02.y+yOffSet
        opacity: 0.5
        source: "#Rectangle"
        eulerRotation.z: 0
        eulerRotation.y: 0
        eulerRotation.x: 0
        receivesShadows: false
        castsShadows: false
        scale.z: 1
        scale.y: collision_type?0.3:0.2
        scale.x: collision_type?0.4:0.25
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
        opacity: 1
        source: "#Rectangle"
        eulerRotation.z: 0
        eulerRotation.y: 0
        eulerRotation.x: -90
        receivesShadows: false
        scale.z: 0
        scale.y: 0.5
        scale.x: 0.2
        DefaultMaterial {
            id: indicatorMatarial1
            diffuseMap: indicatorTexture1
            vertexColorsEnabled: false
            diffuseColor: "#ef262222"
            Texture {
                id: indicatorTexture1
                source: "qrc:/images10_25/adas3d/maps/yinying_zixingche.png"
                scaleU: 1
            }
        }
        materials: indicatorMatarial1
    }
}
