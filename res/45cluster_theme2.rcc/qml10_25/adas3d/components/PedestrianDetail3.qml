import QtQuick 2.15
import QtQuick3D 1.15

Node {
    id: rootNode
    property alias material_color: defaultMaterial_material.diffuseColor//
    property alias collision_visible:collision_indicator.visible
    property bool collision_type: false//false ->warning alert \ true ->collision blaze
    property int yOffSet: collision_type ? 10 :20

    Model {
        id: ____001
        eulerRotation.x: -90
        source: "qrc:/qml10_25/adas3d/models/meshes/pedestrainDetail.mesh"
        eulerRotation.z: 180
        scale.z: 0.02
        scale.y: 0.02
        scale.x: 0.02		
        DefaultMaterial {
            id: defaultMaterial_material
            diffuseMap: texture1
            //diffuseColor: "#ffffff"
            lighting: DefaultMaterial.NoLighting
            Texture {
                id: texture1
                source: "qrc:/images10_25/adas3d/maps/pedestrainDetail3.png"
            }
        }
        materials: [
            defaultMaterial_material
        ]
    }
	
    Model {
        id: collision_indicator
        x: ____001.x
        y: ____001.y+yOffSet
        opacity: 0.5
        source: "#Rectangle"
        z: 10
        eulerRotation.z: 0
        eulerRotation.y: 0
        eulerRotation.x: 0
        receivesShadows: false
        castsShadows: false
        scale.z: 1
        scale.y: collision_type?0.25:0.25
        scale.x: collision_type?0.35:0.25
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
        id: shadow_indicator
        x: ____001.x
        y: ____001.y
        z:____001.z

        opacity:0.8
        source: "#Rectangle"
        eulerRotation.z: 0
        eulerRotation.y: 0
        eulerRotation.x: -90
        receivesShadows: false
        scale.z: 0
        scale.y: 0.6
        scale.x: 0.25
        DefaultMaterial {
            id: shadowMatarial
            opacity: 1
            lighting:DefaultMaterial.FragmentLighting
            diffuseMap: shadowTexture
            vertexColorsEnabled: false
            diffuseColor: "#696969"
            Texture {
                id: shadowTexture
                source: "qrc:/images10_25/adas3d/maps/yinying_human.png"
                scaleU: 1
            }
        }
        materials: shadowMatarial
    }
}
