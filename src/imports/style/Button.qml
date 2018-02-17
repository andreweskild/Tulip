import QtQuick 2.9
import QtQuick.Templates 2.2 as T
import QtQuick.Controls 2.2
import QtQuick.Controls.impl 2.2
import QtGraphicalEffects 1.0
import Tulip.Style 1.0
import Tulip.Effects 1.0

T.Button {
    id: control

    width: Math.floor(label.contentWidth) + padding + padding
    height: 22
    padding: 16
    font.pointSize: 10
    font.weight: Font.DemiBold
    font.family: "IBM Plex Sans"

    transform: Translate {
        y: control.pressed || control.checked ? 2 : 0
        Behavior on y {
            NumberAnimation {
                duration: 100
                easing {
                    type: Easing.InOutSine
                }
            }
        }
    }

    contentItem: Label {
        id: label
        anchors.fill: parent
        horizontalAlignment: Text.AlignHCenter
        verticalAlignment: Text.AlignVCenter
        color: ColorPalette.content
        text: control.text
        font: control.font
    }

    background: Item {
        id: content
        height: parent.height
        width: parent.width

        BoxShadow {
            id: shadowEffect
            anchors.fill: parent
            hidden: control.pressed || !control.enabled || control.flat || control.checked
            hovered: control.hovered
        }

        InteractiveGradientRectangle {
            id: background
            anchors.fill: parent


            primaryColor: ColorPalette.raised
            secondaryColor: ColorPalette.raised
            borderColor: ColorPalette.raisedHighlight

            borderWidth: 1

            radius: 3
        }
    }

    states: [
        State {
            name: "flatPressed"; extend: "flatHovered"; when: control.flat && control.pressed
            PropertyChanges { target: background;  opacity: 1}
        },
        State {
            name: "flatHovered"; when: control.flat && control.hovered
            PropertyChanges { target: background;  opacity: 0}
            PropertyChanges { target: background;  primaryColor: ColorPalette.accentDark}
            PropertyChanges { target: background;  secondaryColor: ColorPalette.accent}
            PropertyChanges { target: background;  borderColor: ColorPalette.accentBorder}
            PropertyChanges { target: label; color: ColorPalette.contentAccented }
        },
        State {
            name: "flatHighlighted"; when: control.flat && control.highlighted
            PropertyChanges { target: background;  opacity: 0}
            PropertyChanges { target: label; color: ColorPalette.contentAccented }
        },
        State {
            name: "flat"; when: control.flat
            PropertyChanges { target: background;  opacity: 0}
            PropertyChanges { target: label; color: ColorPalette.sunkenDark }
        },
        State {
            name: "disabled"; when: !control.enabled
            PropertyChanges { target: background;  primaryColor: ColorPalette.sunken}
            PropertyChanges { target: background;  secondaryColor: ColorPalette.sunken}
            PropertyChanges { target: background;  borderColor: ColorPalette.sunkenBorder}
            PropertyChanges { target: label; color: ColorPalette.sunkenDark }
        },
        State {
            name: "pressed"; when: control.pressed || control.checked
            PropertyChanges { target: background;  primaryColor: ColorPalette.accentDark}
            PropertyChanges { target: background;  secondaryColor: ColorPalette.accent}
            PropertyChanges { target: background;  borderColor: ColorPalette.accentBorder}
            PropertyChanges { target: label; color: ColorPalette.contentAccented }
        },
        State {
            name: "hovered"; when: control.hovered || control.highlighted
            PropertyChanges { target: background;  primaryColor: ColorPalette.accent}
            PropertyChanges { target: background;  secondaryColor: ColorPalette.accentLight}
            PropertyChanges { target: background;  borderColor: ColorPalette.accentHighlight}
            PropertyChanges { target: label; color: ColorPalette.contentAccented }
        }
    ]

    transitions: [
        Transition {
            ColorAnimation { duration: 150; easing.type: Easing.InOutSine }
            NumberAnimation { properties: "opacity"; duration: 100; easing.type: Easing.InOutSine }
        }
    ]
}
