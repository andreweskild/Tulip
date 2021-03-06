import QtQuick 2.10
import QtQuick.Templates 2.2 as T
import QtQuick.Controls 2.2
import QtQuick.Controls.impl 2.2
import QtGraphicalEffects 1.0
import Tulip.Style 1.0
import Tulip.Effects 1.0
import Tulip.Controls 1.0

T.Button {
    id: control

    implicitWidth: label.contentWidth + padding + padding
    implicitHeight: 24
    padding: 16
    font.weight: Font.DemiBold

    onClicked: {
        if(!control.flat)
        {
            clickEffect.show();
        }
    }


    transform: Translate {
        y: (control.pressed || control.checked) && !control.flat ? 2 : 0
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
            hovered: control.hovered || control.highlighted
        }

        ClickEffect {
            id: clickEffect
            initialWidth: content.width
            initialHeight: content.height
            anchors.centerIn: parent
        }

        GenericFocusControl {
            anchors.fill: parent
            hovered: control.hovered
            pressed: control.pressed
            checked: control.checked
            highlighted: control.highlighted
            flat: control.flat
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
