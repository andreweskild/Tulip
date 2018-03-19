import QtQuick 2.10
import QtQuick.Templates 2.3 as T
import QtQuick.Controls 2.3
import QtQuick.Controls.impl 2.3
import Tulip.Style 1.0
import Tulip.Effects 1.0

T.ItemDelegate {
    id: control

    implicitWidth: Math.max(background ? background.implicitWidth : 0,
                            contentItem.implicitWidth + leftPadding + rightPadding)
    implicitHeight: Math.max(background ? background.implicitHeight : 0,
                             Math.max(contentItem.implicitHeight,
                                      indicator ? indicator.implicitHeight : 0) + topPadding + bottomPadding)

    font.weight: Font.DemiBold

    onClicked: {
        clickEffect.show();
    }

    background: Item {
        implicitHeight: 24

        Rectangle {
            id: highlightRect
            anchors.fill: parent
            color: ColorPalette.accentHighlight
            border.color: ColorPalette.accent
            opacity: 0
            Rectangle {
                anchors.right: parent.right
                anchors.rightMargin: -1
                height: parent.height
                width: 4
                color: ColorPalette.accent
            }
        }

        ClickEffect {
            id: clickEffect
            initialWidth: parent.width
            initialHeight: parent.height
            anchors.centerIn: parent
            radius: 0
        }

        GenericFocusControl {
            id: gradientRect
            x: -1
            width: parent.width + 2
            height: parent.height
            radius: 0
            hovered: control.hovered
            pressed: control.pressed
            opacity: 0
        }
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
        },
        State {
            name: "active"; when: control.highlighted
            PropertyChanges { target: highlightRect;  opacity: 1}
        }
    ]

    transitions: [
        Transition {
            reversible: true
            ColorAnimation { duration: 150; easing.type: Easing.InOutSine }
            NumberAnimation { properties: "opacity"; duration: 200; easing.type: Easing.InOutSine }
        }
    ]
}
