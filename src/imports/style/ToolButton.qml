import QtQuick 2.10
import QtQuick.Templates 2.3 as T
import QtQuick.Controls 2.3
import QtQuick.Controls.impl 2.3
import Tulip.Style 1.0
import Tulip.Effects 1.0

T.ToolButton {
    id: control

    implicitWidth: Math.max(background ? background.implicitWidth : 0,
                            contentItem.implicitWidth + leftPadding + rightPadding)
    implicitHeight: Math.max(background ? background.implicitHeight : 0,
                             contentItem.implicitHeight + topPadding + bottomPadding)
    font.weight: Font.DemiBold

    leftPadding: 16
    rightPadding: 16

    icon.width: 24
    icon.height: 24
    icon.color: "black"

    contentItem: IconLabel {
        id: buttonText
        spacing: control.spacing
        mirrored: control.mirrored
        display: control.display

        icon: control.icon
        text: control.text
        font: control.font
        color: control.hovered ? ColorPalette.contentAccented : ColorPalette.content
    }

    background: Item {
        anchors.fill: parent

        GenericFocusControl {
            anchors.fill: parent
            hovered: control.hovered
            pressed: control.pressed
            radius: 0
        }
    }
}
