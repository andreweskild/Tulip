import QtQuick 2.10
import QtQuick.Templates 2.3 as T
import Tulip.Effects 1.0
import Tulip.Style 1.0

T.Switch {
    id: control

    implicitWidth: 44
    implicitHeight: 22

    padding: 8
    spacing: 8

    indicator: Item {
        x: control.checked ? control.width - width: 0
        width: control.height
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

        BoxShadow {
            anchors.fill: parent
            hidden: control.pressed || !control.enabled
            hovered: control.hovered
        }

        Rectangle {
            id: buttonBackground
            anchors.fill: parent


            color: ColorPalette.raised
            //secondaryColor: ColorPalette.raised
            border.color: ColorPalette.raisedHighlight

            border.width: 1

            radius: 3
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
            id: background
            anchors.fill: parent
            color: control.checked ? ColorPalette.sunkenDark : ColorPalette.sunken
            border.color: control.checked ? ColorPalette.sunkenDarkBorder : ColorPalette.sunkenBorder
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
            width: parent.width * .5
            anchors.left: parent.left

            Rectangle {
                width: 2
                height: 10
                anchors.centerIn: parent
                color: control.checked ? ColorPalette.contentSecondary : ColorPalette.content
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
            width: parent.width * .5
            anchors.right: parent.right

            Rectangle {
                width: 10
                height: 10
                anchors.centerIn: parent
                color: "transparent"
                radius: height * .5
                border.width: 2
                border.color: control.checked ? ColorPalette.contentSecondary : ColorPalette.content
                Behavior on border.color {
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
            PropertyChanges { target: buttonBackground;  color: ColorPalette.sunken}
//            PropertyChanges { target: buttonBackground;  secondaryColor: ColorPalette.sunken}
            PropertyChanges { target: buttonBackground;  border.color: ColorPalette.sunkenBorder}
        },
        State {
            name: "pressed"; when: control.pressed
            PropertyChanges { target: buttonBackground;  color: ColorPalette.accentDark}
//            PropertyChanges { target: buttonBackground;  secondaryColor: ColorPalette.accent}
            PropertyChanges { target: buttonBackground;  border.color: ColorPalette.accentBorder}
        },
        State {
            name: "hovered"; when: control.hovered
            PropertyChanges { target: buttonBackground;  color: ColorPalette.accent}
//            PropertyChanges { target: buttonBackground;  secondaryColor: ColorPalette.accentLight}
            PropertyChanges { target: buttonBackground;  border.color: ColorPalette.accentHighlight}
        }
    ]

    transitions: [
        Transition {
            ColorAnimation { duration: 150; easing.type: Easing.InOutSine }
            NumberAnimation { properties: "opacity"; duration: 100; easing.type: Easing.InOutSine }
        }
    ]
}
