import QtQuick 2.10
import QtQuick.Controls 2.3
import QtQuick.Layouts 1.3
import QtGraphicalEffects 1.0
import Tulip.Style 1.0
import Tulip.Effects 1.0

Item {
    id: root
    height: 64
    width: 64
    property real hue
    property real saturation: mouseArea.x / mouseArea.drag.maximumX
    property real value: 1.0 - mouseArea.y / mouseArea.drag.maximumY

    Rectangle {
        anchors.fill: parent
        radius: 4
        layer.enabled: true
    // Main Value and Saturation selection control
        layer.effect: ShaderEffect {
            property color hue: Qt.hsva(root.hue, 1.0, 1.0, 1.0)
            fragmentShader: "
                uniform lowp sampler2D source;
                varying highp vec2 qt_TexCoord0;
                uniform highp vec4 hue;
                uniform lowp float qt_Opacity;
                void main() {
                    lowp vec4 p = texture2D(source, qt_TexCoord0);
                    highp float value = qt_TexCoord0.y;
                    highp float saturation = qt_TexCoord0.x;
                    highp vec4 greyColor = mix(vec4(1.0, 1.0, 1.0, 1.0), vec4(0.0, 0.0 ,0.0 ,1.0), value);
                    highp vec4 hueColor = mix(vec4(1.0, 1.0, 1.0, 1.0), hue, saturation);
                    gl_FragColor = greyColor * hueColor * p * qt_Opacity;
                }"
        }
    }

    Rectangle {
        anchors.fill: parent
        color: "transparent"
        radius: 4
        border.width: 1
        border.color: "black"
        opacity: .2
    }


    MouseArea {
        id: draggableArea
        height: root.height + 10
        width: root.width + 10
        anchors.centerIn: root
        preventStealing: true
        onMouseXChanged: {
            mouseArea.x = Math.max(Math.min(mouseArea.drag.maximumX, mouse.x - mouseArea.width * .5),
                                   mouseArea.drag.minimumX);
        }
        onMouseYChanged: {
            mouseArea.y = Math.max(Math.min(mouseArea.drag.maximumY, mouse.y - mouseArea.height * .5),
                                   mouseArea.drag.minimumY);
        }

        MouseArea {
            id: mouseArea
            height: 24
            width: 24
            hoverEnabled: true

            drag.target: this
            drag.threshold: 0
            drag.minimumX: 0
            drag.maximumX: draggableArea.width - width

            drag.minimumY: 0
            drag.maximumY: draggableArea.height - height


            Item {
                anchors.fill: parent

                ToolTip.visible: mouseArea.pressed
                ToolTip.text: qsTr("this is a test")

                transform: [
                    Translate {
                        y: mouseArea.pressed ? 2 : 0


                        Behavior on y {
                            NumberAnimation {
                                duration: 100
                                easing {
                                    type: Easing.InOutSine
                                }
                            }
                        }
                    }

                ]

                BoxShadow {
                    anchors.fill: parent
                    hovered: mouseArea.containsMouse
                    hidden: mouseArea.pressed
                    radius: height / 2
                }

                Rectangle {
                    anchors.centerIn: parent
                    height: parent.height + 2
                    width: parent.width + 2
                    radius: height * .5
                    color: Qt.hsva(hue, saturation, value, 1.0)
                }

                Rectangle {
                    anchors.centerIn: parent
                    height: parent.height + 2
                    width: parent.width + 2
                    radius: height * .5
                    color: "transparent"
                    border.width: 1
                    border.color: "black"
                    opacity: mouseArea.pressed || draggableArea.pressed ? .25 :
                        mouseArea.containsMouse ? .25 : .1
                    Behavior on opacity {
                        NumberAnimation {
                            duration: 100
                            easing {
                                type: Easing.InOutSine
                            }
                        }
                    }
                }

                Rectangle {
                    anchors.fill: parent
                    color: "transparent"
                    radius: height * .5
                    border.width: 1
                    border.color: "white"
                    opacity: mouseArea.pressed || draggableArea.pressed ? .6 :
                        mouseArea.containsMouse ? .6 : .4
                    Behavior on opacity {
                        NumberAnimation {
                            duration: 100
                            easing {
                                type: Easing.InOutSine
                            }
                        }
                    }
                }
            }


        }
    }
}

