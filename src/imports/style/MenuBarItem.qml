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


    leftPadding: 16
    rightPadding: 16

    transform: Translate {
        y: (control.pressed || control.checked) || menu.opened ? 2 : 0
        Behavior on y {
            NumberAnimation {
                duration: 100
                easing {
                    type: Easing.InOutSine
                }
            }
        }
    }

    Connections {
        target: menu
        onOpened: clickEffect.show();
    }

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

    background: Item {
        anchors.fill: parent

        BoxShadow {
            id: shadowEffect
            anchors.fill: parent
            hidden: control.pressed || !control.enabled || control.flat || control.checked
            hovered: control.hovered || control.highlighted
        }

        ClickEffect {
            id: clickEffect
            initialWidth: parent.width
            initialHeight: parent.height
            anchors.centerIn: parent
        }

        GenericFocusControl {
            id: background
            anchors.fill: parent
            pressed: control.pressed && !menu.opened
            hovered: control.hovered
            highlighted: menu.opened
        }
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
