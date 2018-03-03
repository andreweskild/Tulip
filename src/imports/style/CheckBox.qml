import QtQuick 2.9
import QtQuick.Templates 2.2 as T
import QtGraphicalEffects 1.0
import Tulip.Effects 1.0
import Tulip.Style 1.0

T.CheckBox {
    id: control

    implicitWidth: 96
    implicitHeight: 20

    spacing: 5

    font.pointSize: 10
    font.weight: Font.DemiBold
    font.family: "IBM Plex Sans"

    onClicked: {
        clickEffect.show();
    }


    background: Item {
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

        ClickEffect {
            id: clickEffect
            initialHeight: background.height
            initialWidth: background.width
            anchors.centerIn: parent
        }

        GenericFocusControl {
            anchors.fill: parent
            hovered: control.hovered
            pressed: control.pressed
        }
    }


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
            PropertyChanges { target: checkIndicator;  opacity: 0.5}
            PropertyChanges { target: contentItem;  opacity: 0.5}
        },
        State {
            name: "active"; when: control.hovered || control.pressed
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
