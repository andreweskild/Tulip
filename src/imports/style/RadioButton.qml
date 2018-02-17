import QtQuick 2.9
import QtQuick.Templates 2.2 as T
import Tulip.Style 1.0
import Tulip.Effects 1.0

T.RadioButton {
    id: control

    implicitWidth: Math.max(background ? background.implicitWidth : 0,
                            contentItem.implicitWidth + leftPadding + rightPadding)
    implicitHeight: 22

    spacing: 5

    font.pointSize: 10
    font.weight: Font.DemiBold
    font.family: "IBM Plex Sans"


    indicator:Item {
        width: control.height
        height: control.height
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
            radius: parent.height * .5
        }

        InteractiveGradientCircle {
            id: radioBackground
            anchors.fill: parent
            primaryColor: ColorPalette.raised
            secondaryColor: ColorPalette.raised
            borderColor: ColorPalette.raisedHighlight
            borderWidth: 1


            Rectangle {
                id: toggleIndicator
                anchors.centerIn: parent
                width: control.checked ? control.height * .5 : 0
                height: control.checked ? control.height * .5 : 0
                radius: height * .5
                color: ColorPalette.content
                opacity: control.checked ? 1 : 0

                Behavior on height {
                    NumberAnimation {
                        duration: 150
                        easing {
                            type: Easing.InOutSine
                        }
                    }
                }


                Behavior on width {
                    NumberAnimation {
                        duration: 150
                        easing {
                            type: Easing.InOutSine
                        }
                    }
                }

                Behavior on opacity {
                    NumberAnimation {
                        duration: 150
                        easing {
                            type: Easing.InOutSine
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
            PropertyChanges { target: radioBackground;  primaryColor: ColorPalette.sunken}
            PropertyChanges { target: radioBackground;  secondaryColor: ColorPalette.sunken}
            PropertyChanges { target: radioBackground;  borderColor: ColorPalette.sunkenBorder}
            PropertyChanges { target: toggleIndicator; color: ColorPalette.sunkenDark }
        },
        State {
            name: "pressed"; when: control.pressed
            PropertyChanges { target: radioBackground;  primaryColor: ColorPalette.accentDark}
            PropertyChanges { target: radioBackground;  secondaryColor: ColorPalette.accent}
            PropertyChanges { target: radioBackground;  borderColor: ColorPalette.accentBorder}
            PropertyChanges { target: toggleIndicator; color: ColorPalette.contentAccented }
        },
        State {
            name: "hovered"; when: control.hovered
            PropertyChanges { target: radioBackground;  primaryColor: ColorPalette.accent}
            PropertyChanges { target: radioBackground;  secondaryColor: ColorPalette.accentLight}
            PropertyChanges { target: radioBackground;  borderColor: ColorPalette.accentHighlight}
            PropertyChanges { target: toggleIndicator; color: ColorPalette.contentAccented }
        }
    ]

    transitions: [
        Transition {
            ColorAnimation { duration: 150; easing.type: Easing.InOutSine }
            NumberAnimation { properties: "opacity"; duration: 100; easing.type: Easing.InOutSine }
        }
    ]
}
