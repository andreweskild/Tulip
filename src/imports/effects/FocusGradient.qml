import QtQuick 2.10
import QtGraphicalEffects 1.0


Rectangle {
    id: root
    property color primaryColor
    property color secondaryColor
    layer.enabled: true
    layer.effect: RadialGradient {
        anchors.fill: parent
        anchors.margins: root.border.width
        horizontalRadius: width * 2
        verticalRadius: width * 2
        cached: true
        horizontalOffset: hoverMouse.mouseX - width * .5
        verticalOffset: hoverMouse.mouseY - height * .5
        gradient: Gradient {
            GradientStop { position: 0.0; color: root.primaryColor }
            GradientStop { position: 1.0; color: root.secondaryColor }
        }
        MouseArea {
            id: hoverMouse
            anchors.fill: parent
            hoverEnabled: true
            acceptedButtons: Qt.NoButton
        }
    }
}
