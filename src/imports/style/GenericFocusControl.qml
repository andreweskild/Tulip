import QtQuick 2.10
import QtGraphicalEffects 1.0
import Tulip.Style 1.0
import Tulip.Effects 1.0

Rectangle {
    id: root
    radius: 4

    property bool hovered: false
    property bool pressed: false
    property bool checked: false
    property bool highlighted: false
    property bool flat: false

    color: ColorPalette.raisedBorder


    Rectangle {
        id: control
        width: parent.width - 2
        height: parent.height - 2
        anchors.centerIn: parent
        color: ColorPalette.raised
        radius: parent.radius

        border.color: ColorPalette.raisedHighlight
        border.width: 1

        FocusGradient {
            id: gradientRect
            anchors.fill: parent
            radius: parent.radius
            opacity: 0
            primaryColor: ColorPalette.accent
            secondaryColor: ColorPalette.accentLight
        }
    }
    states: [
        State {
            name: "flatDisabled"; extend: "disabled"; when: root.flat && !root.enabled
            PropertyChanges { target: root;  opacity: 0}
        },
        State {
            name: "flatPressed"; extend: "pressed"; when: root.flat && root.pressed
            PropertyChanges { target: root;  opacity: 1}
        },
        State {
            name: "flatHovered"; when: root.flat && root.hovered
            PropertyChanges { target: root;  opacity: 0}
        },
        State {
            name: "flatHighlighted"; when: root.flat && root.highlighted
            PropertyChanges { target: root;  opacity: 0}
        },
        State {
            name: "flat"; when: root.flat
            PropertyChanges { target: root;  opacity: 0}
        },
        State {
            name: "disabled"; when: !root.enabled
            PropertyChanges { target: control;  color: ColorPalette.sunken}
            PropertyChanges { target: control;  border.color: ColorPalette.sunken}
            PropertyChanges { target: root;  color: ColorPalette.sunkenBorder}
        },
        State {
            name: "pressed"; when: root.pressed || root.checked
            PropertyChanges { target: control;  color: ColorPalette.accentDark}
            PropertyChanges { target: control;  border.color: ColorPalette.accentDark}
            PropertyChanges { target: root;  color: ColorPalette.accentBorder}
        },
        State {
            name: "hovered"; when: root.hovered || root.highlighted
            PropertyChanges { target: control;  color: ColorPalette.accent}
            PropertyChanges { target: control;  border.color: ColorPalette.accentHighlight}
            PropertyChanges { target: root;  color: ColorPalette.accentBorder}
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
