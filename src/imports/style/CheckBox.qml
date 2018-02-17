import QtQuick 2.9
import QtQuick.Templates 2.2 as T
import QtGraphicalEffects 1.0
import Tulip.Effects 1.0
import Tulip.Style 1.0

T.CheckBox {
    id: control

    implicitWidth: 96
    implicitHeight: 22

    spacing: 5

    font.pointSize: 10
    font.weight: Font.DemiBold
    font.family: "IBM Plex Sans"



    indicator: Item {
            height: parent.height
            width: parent.height

            transform: Translate {
                y: control.pressed ? 2 : 0


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

            InteractiveGradientRectangle {
                id: background
                implicitWidth: control.height
                implicitHeight: control.height
                primaryColor: ColorPalette.raised
                secondaryColor: ColorPalette.raised
                borderColor: ColorPalette.raisedHighlight
                borderWidth: 1

                radius: 3


                CheckBoxIndicator {
                    id: checkIndicator
                    anchors.fill: parent
                    lineWidth: 3
                    color: ColorPalette.content
                    dashOffset: control.checked ? 0 : 14


                    Behavior on dashOffset {
                        NumberAnimation {
                            duration: 150
                            easing {
                                type: Easing.InOutCubic
                            }
                        }
                    }
                }
            }
    }

    contentItem: Text {
        leftPadding: control.indicator && !control.mirrored ? control.indicator.width + control.spacing : 0
        rightPadding: control.indicator && control.mirrored ? control.indicator.width + control.spacing : 0

        text: control.text
        font: control.font
        color: ColorPalette.content
        elide: Text.ElideRight
        visible: control.text
        horizontalAlignment: Text.AlignLeft
        verticalAlignment: Text.AlignVCenter
    }
    states: [
        State {
            name: "disabled"; when: !control.enabled
            PropertyChanges { target: background;  primaryColor: ColorPalette.sunken}
            PropertyChanges { target: background;  secondaryColor: ColorPalette.sunken}
            PropertyChanges { target: background;  borderColor: ColorPalette.sunkenBorder}
        },
        State {
            name: "pressed"; when: control.pressed
            PropertyChanges { target: background;  primaryColor: ColorPalette.accentDark}
            PropertyChanges { target: background;  secondaryColor: ColorPalette.accent}
            PropertyChanges { target: background;  borderColor: ColorPalette.accentBorder}
            PropertyChanges { target: checkIndicator;  color: ColorPalette.contentAccented}
        },
        State {
            name: "hovered"; when: control.hovered
            PropertyChanges { target: background;  primaryColor: ColorPalette.accent}
            PropertyChanges { target: background;  secondaryColor: ColorPalette.accentLight}
            PropertyChanges { target: background;  borderColor: ColorPalette.accentHighlight}
            PropertyChanges { target: checkIndicator;  color: ColorPalette.contentAccented}
        }
    ]

    transitions: [
        Transition {
            ColorAnimation { duration: 150; easing.type: Easing.InOutSine }
            NumberAnimation { properties: "opacity"; duration: 100; easing.type: Easing.InOutSine }
        }
    ]
}
