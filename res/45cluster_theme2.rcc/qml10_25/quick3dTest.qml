import QtQuick 2.0
import QtQuick3D 1.15

Item{
    width: 608
    height: 290
    anchors.centerIn: parent

    View3D {
        id: view
        anchors.fill: parent

        //! [environment]
        environment: SceneEnvironment {
            clearColor: "skyblue"
            backgroundMode: SceneEnvironment.Color
        }
        //! [environment]

        //! [camera]
        PerspectiveCamera {
            position: Qt.vector3d(0, 200, 300)
            eulerRotation.x: -30
        }
        //! [camera]

        //! [light]
        DirectionalLight {
            eulerRotation.x: -30
            eulerRotation.y: -70
        }
        //! [light]

        //! [objects]
        Model {
            position: Qt.vector3d(0, -200, 0)
            source: "#Cylinder"
            scale: Qt.vector3d(2, 0.2, 1)
            materials: [ DefaultMaterial {
                    diffuseColor: "red"
                }
            ]
        }

        Model {
            position: Qt.vector3d(0, 150, 0)
            source: "#Sphere"

            materials: [ DefaultMaterial {
                    diffuseColor: "blue"
                }
            ]

            SequentialAnimation on y {
                loops: Animation.Infinite
                NumberAnimation {
                    duration: 20
                    to: -150
                    from: 150
                    easing.type:Easing.InQuad
                }
                NumberAnimation {
                    duration: 20
                    to: 150
                    from: -150
                    easing.type:Easing.OutQuad
                }
            }
        }
        Model {
            position: Qt.vector3d(100, 150, 0)
            source: "#Sphere"

            materials: [ DefaultMaterial {
                    diffuseColor: "blue"
                }
            ]

            SequentialAnimation on y {
                loops: Animation.Infinite
                NumberAnimation {
                    duration: 20
                    to: -150
                    from: 150
                    easing.type:Easing.InQuad
                }
                NumberAnimation {
                    duration: 20
                    to: 150
                    from: -150
                    easing.type:Easing.OutQuad
                }
            }
        }
        Model {
            position: Qt.vector3d(200, 150, 0)
            source: "#Sphere"

            materials: [ DefaultMaterial {
                    diffuseColor: "blue"
                }
            ]

            SequentialAnimation on y {
                loops: Animation.Infinite
                NumberAnimation {
                    duration: 20
                    to: -150
                    from: 150
                    easing.type:Easing.InQuad
                }
                NumberAnimation {
                    duration: 20
                    to: 150
                    from: -150
                    easing.type:Easing.OutQuad
                }
            }
        }
        Model {
            position: Qt.vector3d(-100, 150, 0)
            source: "#Sphere"

            materials: [ DefaultMaterial {
                    diffuseColor: "blue"
                }
            ]

            SequentialAnimation on y {
                loops: Animation.Infinite
                NumberAnimation {
                    duration: 20
                    to: -150
                    from: 150
                    easing.type:Easing.InQuad
                }
                NumberAnimation {
                    duration: 20
                    to: 150
                    from: -150
                    easing.type:Easing.OutQuad
                }
            }
        }
        Model {
            position: Qt.vector3d(-200, 150, 0)
            source: "#Sphere"

            materials: [ DefaultMaterial {
                    diffuseColor: "blue"
                }
            ]

            SequentialAnimation on y {
                loops: Animation.Infinite
                NumberAnimation {
                    duration: 20
                    to: -150
                    from: 150
                    easing.type:Easing.InQuad
                }
                NumberAnimation {
                    duration: 20
                    to: 150
                    from: -150
                    easing.type:Easing.OutQuad
                }
            }
        }
        Model {
            position: Qt.vector3d(-300, 150, 0)
            source: "#Sphere"

            materials: [ DefaultMaterial {
                    diffuseColor: "blue"
                }
            ]

            SequentialAnimation on y {
                loops: Animation.Infinite
                NumberAnimation {
                    duration: 20
                    to: -150
                    from: 150
                    easing.type:Easing.InQuad
                }
                NumberAnimation {
                    duration: 20
                    to: 150
                    from: -150
                    easing.type:Easing.OutQuad
                }
            }
        }
        Model {
            position: Qt.vector3d(300, 150, 0)
            source: "#Sphere"

            materials: [ DefaultMaterial {
                    diffuseColor: "blue"
                }
            ]

            SequentialAnimation on y {
                loops: Animation.Infinite
                NumberAnimation {
                    duration: 20
                    to: -150
                    from: 150
                    easing.type:Easing.InQuad
                }
                NumberAnimation {
                    duration: 20
                    to: 150
                    from: -150
                    easing.type:Easing.OutQuad
                }
            }
        }
        //! [objects]
    }

    Text{
        font.bold:rootItemId.jiacu === 1
        font.family: rootItemId.ziti
        text: "test"
        font.pixelSize: 30
        color: "red"

    }
}


