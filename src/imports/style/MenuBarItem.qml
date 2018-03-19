import QtQuick 2.10
import QtQuick.Templates 2.3 as T
import QtQuick.Controls 2.3
import QtQuick.Controls.impl 2.3
import Tulip.Style 1.0
import Tulip.Effects 1.0

T.MenuBarItem {
    id: control

    implicitWidth: buttonText.contentWidth + leftPadding + rightPadding
    implicitHeight: 24
    font.weight: Font.DemiBold

    z: hovered ? 1000 : 0

    leftPadding: 16
    rightPadding: 16

    contentItem: Text {
        id: buttonText
        height: parent.height
        width: parent.width
        horizontalAlignment: Text.AlignHCenter
        verticalAlignment: Text.AlignVCenter
        text: control.text
        font: control.font
        color: ColorPalette.content

    }

    background: GenericFocusControl {
            id: background
            anchors.fill: parent
            pressed: control.pressed && !menu.isOpen
            hovered: control.hovered && !menu.isOpen
            radius: 0
        }

    states: [
        State {
            name: "disabled"; when: !control.enabled;
            PropertyChanges { target: buttonText;  opacity: 0.5}
        },
        State {
            name: "active"; when: control.pressed || control.hovered ||
                                  control.highlighted || control.checked
            PropertyChanges { target: buttonText;  color: ColorPalette.contentAccented}
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
