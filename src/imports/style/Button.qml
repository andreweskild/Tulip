import QtQuick 2.10
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

//    ShaderEffectSource {
//        id: source
//        sourceItem: backgroundRect
//        hideSource: true
//    }

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

//        InteractiveGradientRectangle {
//            id: background
//            anchors.fill: parent


//            primaryColor: ColorPalette.raised
//            secondaryColor: ColorPalette.raised
//            borderColor: ColorPalette.raisedHighlight

//            borderWidth: 1

//            radius: 3
//        }


        Rectangle {
            id: backgroundBG
            anchors.fill: parent
            radius: 3

            color: ColorPalette.raised

            border.color: ColorPalette.raisedHighlight
            border.width: 1
        }

        Rectangle {
            id: gradientRect
            anchors.fill: parent
            opacity: 0

            radius: 3
            layer.enabled: true
            layer.effect: RadialGradient {
                anchors.fill: parent
                anchors.margins: backgroundBG.border.width
                horizontalRadius: width * 2
                verticalRadius: width * 2
                cached: true
                horizontalOffset: hoverMouse.mouseX - width * .5
                verticalOffset: hoverMouse.mouseY - height * .5
                gradient: Gradient {
                    GradientStop { position: 0.0; color: ColorPalette.accent }
                    GradientStop { position: 1.0; color: ColorPalette.accentLight }
                }
                MouseArea {
                    id: hoverMouse
                    anchors.fill: parent
                    hoverEnabled: true
                    acceptedButtons: Qt.NoButton
                }
            }

        }
    }

    states: [
        State {
            name: "flatDisabled"; extend: "disabled"; when: control.flat && !control.enabled
            PropertyChanges { target: background;  opacity: 0}
        },
        State {
            name: "flatPressed"; extend: "pressed"; when: control.flat && control.pressed
            PropertyChanges { target: background;  opacity: 1}
        },
        State {
            name: "flatHovered"; when: control.flat && control.hovered
            PropertyChanges { target: background;  opacity: 0}
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
            PropertyChanges { target: control; opacity: .5 }
            PropertyChanges { target: backgroundBG;  color: ColorPalette.sunken}
            PropertyChanges { target: backgroundBG;  border.color: ColorPalette.sunkenBorder}
            PropertyChanges { target: label; color: ColorPalette.sunkenDark }
        },
        State {
            name: "pressed"; when: control.pressed || control.checked
            PropertyChanges { target: backgroundBG;  color: ColorPalette.accentDark}
            PropertyChanges { target: backgroundBG;  border.color: ColorPalette.accentBorder}
            PropertyChanges { target: label; color: ColorPalette.contentAccented }
        },
        State {
            name: "hovered"; when: control.hovered || control.highlighted
            PropertyChanges { target: backgroundBG;  color: ColorPalette.accent}
            PropertyChanges { target: backgroundBG;  border.color: ColorPalette.accentHighlight}
            PropertyChanges { target: gradientRect;  opacity: 1}
            PropertyChanges { target: label; color: ColorPalette.contentAccented }
        }
    ]

    transitions: [
        Transition {
            reversible: true
            ColorAnimation { duration: 150; easing.type: Easing.InOutSine }
            NumberAnimation { properties: "opacity"; duration: 100; easing.type: Easing.InOutSine }
        }
    ]
}
