import QtQuick 2.10
import QtQuick.Templates 2.3 as T
import QtQuick.Controls 2.3
import QtQuick.Controls.impl 2.3
import Tulip.Style 1.0
import Tulip.Effects 1.0

T.ItemDelegate {
    id: control

    implicitWidth: 72
    implicitHeight: contentItem.implicitHeight

    padding: 16
    font.pointSize: 10
    font.weight: Font.DemiBold
    font.family: "IBM Plex Sans"


    background: GenericFocusControl {
        id: gradientRect
        x: -1
        width: parent.width + 2
        height: parent.height
        radius: 0
        hovered: control.hovered
        pressed: control.pressed
        opacity: 0
    }

    states: [
        State {
            name: "disabled"; when: !control.enabled
        },
        State {
            name: "pressed"; when: control.pressed || control.checked
            PropertyChanges { target: gradientRect;  opacity: 1}

        },
        State {
            name: "hovered"; when: control.hovered
            PropertyChanges { target: gradientRect;  opacity: 1}
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
