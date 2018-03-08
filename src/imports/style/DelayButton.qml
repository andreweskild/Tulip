import QtQuick 2.10
import QtQuick.Templates 2.3 as T
import QtQuick.Controls 2.3
import QtQuick.Controls.impl 2.3
import Tulip.Style 1.0
import Tulip.Effects 1.0
import QtGraphicalEffects 1.0

T.DelayButton {
    id: control

    implicitWidth: label.contentWidth + padding + padding
    implicitHeight: 24
    padding: 16
    font.weight: Font.DemiBold

    onActivated: {
        clickEffect.show();
    }

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

    transition: Transition {
        NumberAnimation {
            duration: control.delay * (control.pressed ? 1.0 - control.progress : 0.3 * control.progress)
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
        anchors.fill: parent

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
        }
        GenericFocusControl {
            id: background
            anchors.fill: parent
            hovered: control.hovered
            pressed: control.pressed

            Item {
                anchors.left: parent.left
                height: control.height
                width: control.width * control.progress
                clip: true

                Rectangle {
                    anchors.left: parent.left
                    height: control.height
                    width: control.width
                    radius: 4
                    color: ColorPalette.accentHighlight
                    border.width: 1
                    border.color: ColorPalette.accentBorder
                }
            }

        }




    }
    states: [
        State {
            name: "disabled"; when: !control.enabled;
            PropertyChanges { target: label;  opacity: 0.5}
        },
        State {
            name: "active"; when: control.pressed || control.hovered ||
                                  control.highlighted || control.checked
            PropertyChanges { target: label;  color: ColorPalette.contentAccented}
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
