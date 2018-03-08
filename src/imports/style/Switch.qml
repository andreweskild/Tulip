import QtQuick 2.10
import QtQuick.Templates 2.3 as T
import Tulip.Effects 1.0
import Tulip.Style 1.0

T.Switch {
    id: control

    implicitWidth: 52
    implicitHeight: 24

    padding: 8
    spacing: 8

    indicator: Item {
        x: control.position * (control.width - width)
        width: 32
        height: control.height
        transform: Translate {
            y: control.pressed || !control.enabled ? 2 : 0

            Behavior on y {
                NumberAnimation {
                    duration: 100
                    easing {
                        type: Easing.InOutSine
                    }
                }
            }
        }
        Behavior on width {
            NumberAnimation {
                duration: 100
                easing {
                    type: Easing.InOutSine
                }
            }
        }

        BoxShadow {
            anchors.fill: parent
            hidden: control.pressed || !control.enabled
            hovered: control.hovered
        }

        GenericFocusControl {
            anchors.fill: parent
            hovered: control.hovered
            pressed: control.pressed
        }


        Behavior on x {
            NumberAnimation {
                duration: 150
                easing {
                    type: Easing.InOutSine
                }
            }
        }
    }


    background: Item {
        width: parent.width
        height: parent.height
        y: 2

        Rectangle {
            width: parent.width + 2
            height: parent.height + 2
            anchors.centerIn: parent
            color: ColorPalette.windowHighlight
            radius: 4
        }

        Rectangle {
            id: switchBG
            anchors.fill: parent
            color: control.visualPosition > .5 ? ColorPalette.accent : ColorPalette.sunken
            border.color: control.visualPosition > .5 ? ColorPalette.accentBorder : ColorPalette.sunkenBorder
            border.width: 1
            radius: 4
            Behavior on color {
                ColorAnimation {
                    duration: 150
                    easing {
                        type: Easing.InOutSine
                    }
                }
            }
            Behavior on border.color {
                ColorAnimation {
                    duration: 150
                    easing {
                        type: Easing.InOutSine
                    }
                }
            }
        }

        Item {
            height: parent.height
            width: 22
            anchors.left: parent.left

            Rectangle {
                id: onIndicator
                width: 2
                height: 8
                anchors.centerIn: parent
                color: control.visualPosition > .5 ? ColorPalette.contentAccented : ColorPalette.content
                radius: 2
                Behavior on color {
                    ColorAnimation {
                        duration: 150
                        easing {
                            type: Easing.InOutSine
                        }
                    }
                }
            }
        }
        Item {
            height: parent.height
            width: 22
            anchors.right: parent.right

            Rectangle {
                width: 8
                height: 8
                anchors.centerIn: parent
                color: "transparent"
                radius: height * .5
                border.width: 2
                border.color: control.visualPosition > .5 ? ColorPalette.contentAccented : ColorPalette.content
                Behavior on color {
                    ColorAnimation {
                        duration: 150
                        easing {
                            type: Easing.InOutSine
                        }
                    }
                }
            }
        }
    }
    states: [
        State {
            name: "disabled"; when: !control.enabled
            PropertyChanges { target: background;  opacity: 0.5}
            PropertyChanges { target: switchBG;
                color: control.visualPosition > .5 ? ColorPalette.sunkenDark : ColorPalette.sunken
                border.color: control.visualPosition > .5 ? ColorPalette.sunkenDarkBorder : ColorPalette.sunkenBorder
            }
            PropertyChanges {
                target: onIndicator;
                color: control.visualPosition > .5 ? ColorPalette.contentSecondary : ColorPalette.content
            }
        }
    ]

    transitions: [
        Transition {
            ColorAnimation { duration: 150; easing.type: Easing.InOutSine }
            NumberAnimation { properties: "opacity"; duration: 100; easing.type: Easing.InOutSine }
        }
    ]
}
