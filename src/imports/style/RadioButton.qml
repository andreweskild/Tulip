import QtQuick 2.9
import QtQuick.Templates 2.2 as T
import Tulip.Style 1.0
import Tulip.Effects 1.0

T.RadioButton {
    id: control

    implicitWidth: Math.max(background ? background.implicitWidth : 0,
                            contentItem.implicitWidth + leftPadding + rightPadding)
    implicitHeight: 24

    spacing: 5

    font.weight: Font.DemiBold

    onClicked: {
        clickEffect.show();
    }
    background: Item {
        id: content
        height: control.height
        width: control.height
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

        ClickEffect {
            id: clickEffect
            initialWidth: content.width
            initialHeight: content.height
            anchors.centerIn: parent
            radius: height * .5
        }

        GenericFocusControl {
            anchors.fill: parent
            hovered: control.hovered
            pressed: control.pressed
            radius: height * .5
        }
    }

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

        Rectangle {
            id: toggleIndicator
            anchors.centerIn: parent
            width: control.checked ? 8 : 0
            height: control.checked ? 8 : 0
            radius: height * .5
            color: ColorPalette.sunkenDark
            border.color: ColorPalette.sunkenDarkBorder
            border.width: 1
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
            PropertyChanges { target: contentItem;  opacity: 0.5}
            PropertyChanges { target: toggleIndicator;  opacity: 0.5}
        },
        State {
            name: "active"; when: control.hovered || control.pressed
            PropertyChanges { target: toggleIndicator; color: ColorPalette.contentAccented;
                   border.color: ColorPalette.contentAccented}
        }
    ]

    transitions: [
        Transition {
            ColorAnimation { duration: 150; easing.type: Easing.InOutSine }
            NumberAnimation { properties: "opacity"; duration: 100; easing.type: Easing.InOutSine }
        }
    ]
}
