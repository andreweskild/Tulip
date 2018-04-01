import QtQuick 2.10
import QtQuick.Controls 2.2
import Tulip.Style 1.0
import Tulip.Effects 1.0


Item {
    id: root
    implicitWidth: 72
    implicitHeight: 24
    readonly property real hue: slider.value

    property alias orientation: slider.orientation

    Slider {
        id: slider
        height: orientation === Qt.Vertical ? parent.height + 10 : parent.height
        width: orientation === Qt.Vertical ? parent.width : parent.width + 10
        y: orientation === Qt.Vertical ? -5 : 0
        x: orientation === Qt.Vertical ? 0 : -5
        from: 0.0
        to: 1.0
        orientation: Qt.Horizontal
        handle: Item {
            id: handleBG
            x: slider.orientation === Qt.Vertical ? 0 :
                   parent.visualPosition * (parent.availableWidth - width)
            y: slider.orientation === Qt.Vertical ? parent.visualPosition * (parent.availableHeight - height) :
                                             0
            height: slider.orientation === Qt.Vertical ? parent.width : parent.height
            width: slider.orientation === Qt.Vertical ? parent.width : parent.height
            transform: Translate {
                y: slider.pressed ? 2 : 0


                Behavior on y {
                    NumberAnimation {
                        duration: 100
                        easing {
                            type: Easing.InOutSine
                        }
                    }
                }
            }

            BoxShadow {
                anchors.fill: parent
                hidden: slider.pressed
                hovered: slider.hovered
            }

            Rectangle {
                id: background
                anchors.centerIn: parent
                height: parent.height + 2
                width: parent.width + 2
                radius: 4
                color: Qt.hsva(root.hue, 1.0, 1.0, 1.0)
            }

            Rectangle {
                anchors.centerIn: parent
                height: parent.height + 2
                width: parent.width + 2
                radius: 3
                color: "transparent"
                border.width: 1
                border.color: "black"
                opacity: slider.pressed ? .25 :
                    slider.hovered ? .25 : .1
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
                radius: 3
                color: "transparent"
                border.width: 1
                border.color: "white"
                opacity: slider.pressed ? .6 :
                    slider.hovered ? .6 : .4
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

        background:Item {
            height: slider.orientation === Qt.Vertical ? parent.height - 10 : 8
            width: slider.orientation === Qt.Vertical ? 8 : parent.width - 10
            anchors.horizontalCenter: parent.horizontalCenter
            anchors.verticalCenter: parent.verticalCenter
            y: slider.orientation === Qt.Vertical ? 5 : 0
            x: slider.orientation === Qt.Vertical ? 0 : 5
            Rectangle {
                height: slider.orientation === Qt.Vertical ? parent.height : parent.width
                width: slider.orientation === Qt.Vertical ? parent.width : parent.height
                transform: Rotation {
                    origin.x: 4; origin.y: 4;
                    angle: slider.orientation === Qt.Vertical ? 0 : -90;
                }
                radius: 4
                gradient: Gradient {
                    GradientStop {
                       position: 0.000
                       color: Qt.rgba(1, 0, 0, 1)
                    }
                    GradientStop {
                       position: 0.167
                       color: Qt.rgba(1, 1, 0, 1)
                    }
                    GradientStop {
                       position: 0.333
                       color: Qt.rgba(0, 1, 0, 1)
                    }
                    GradientStop {
                       position: 0.500
                       color: Qt.rgba(0, 1, 1, 1)
                    }
                    GradientStop {
                       position: 0.667
                       color: Qt.rgba(0, 0, 1, 1)
                    }
                    GradientStop {
                       position: 0.833
                       color: Qt.rgba(1, 0, 1, 1)
                    }
                    GradientStop {
                       position: 1.000
                       color: Qt.rgba(1, 0, 0, 1)
                    }
                  }
            }

            Rectangle {
                anchors.fill: parent
                radius: 4
                color: "transparent"
                border.width: 1
                border.color: "black"
                opacity: .2
            }
        }
    }
}
