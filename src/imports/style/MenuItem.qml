import QtQuick 2.9
import QtQuick.Templates 2.2 as T
import QtQuick.Controls 2.2
import QtQuick.Controls.impl 2.2
import Tulip.Style 1.0
import Tulip.Effects 1.0

T.MenuItem {
    id: control

    implicitWidth: Math.max(background ? background.implicitWidth : 0,
                            contentItem.implicitWidth + leftPadding + rightPadding)
    implicitHeight: 24

    font.weight: Font.DemiBold


    contentItem: Text {
        id: label
        leftPadding: 8
        height: parent.height
        color: ColorPalette.content
        verticalAlignment: Text.AlignVCenter
        text: control.text
        font: control.font
    }

    background: GenericFocusControl {
        id: gradientRect
        width: parent.width
        height: parent.height
        radius: 0
        hovered: control.hovered
        pressed: control.pressed
        highlighted: control.highlighted
        opacity: 0
    }

    states: [
        State {
            name: "disabled"; when: !control.enabled
        },
        State {
            name: "pressed"; when: control.pressed || control.checked
            PropertyChanges { target: gradientRect;  opacity: 1}
            PropertyChanges { target: label;  color: ColorPalette.contentAccented}

        },
        State {
            name: "hovered"; when: control.hovered || control.highlighted
            PropertyChanges { target: gradientRect;  opacity: 1}
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
