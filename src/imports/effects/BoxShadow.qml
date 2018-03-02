import QtQuick 2.10
import QtGraphicalEffects 1.0
import Tulip.Style 1.0

Item {
    id: root

    property bool hidden: false;
    property bool hovered: false;
    property real radius: 4;

    implicitWidth: 20
    implicitHeight: 20



    RectangularGlow {
        id: shadow
        anchors.horizontalCenter: parent.horizontalCenter
        anchors.verticalCenter: parent.verticalCenter
        anchors.verticalCenterOffset: root.hovered ? 6 : 4
        height: root.height
        width: root.width - 2
        glowRadius: 5
        spread: .1
        color: ColorPalette.shadow
        cornerRadius: radius + glowRadius
        Behavior on anchors.verticalCenterOffset {
            NumberAnimation {
                duration: 400
                easing {
                    type: Easing.OutSine
                }
            }
        }
    }
    states: [
        State {
            name: "hidden"; when: root.hidden;
            PropertyChanges { target: shadow;  opacity: 0}
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
