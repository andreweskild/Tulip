import QtQuick 2.9
import QtQuick.Templates 2.2 as T
import Tulip.Style 1.0

T.Frame {
    id: control

    implicitWidth: Math.max(background ? background.implicitWidth : 0, contentWidth + leftPadding + rightPadding)
    implicitHeight: Math.max(background ? background.implicitHeight : 0, contentHeight + topPadding + bottomPadding)

    contentWidth: contentItem.implicitWidth || (contentChildren.length === 1 ? contentChildren[0].implicitWidth : 0)
    contentHeight: contentItem.implicitHeight || (contentChildren.length === 1 ? contentChildren[0].implicitHeight : 0)

    padding: 12

    background: Rectangle {
        radius: 4
        color: ColorPalette.windowHighlight
        Rectangle {
            anchors.centerIn: parent
            height: parent.height - 2
            width: parent.width - 2
            color: ColorPalette.sunken
            border.color: ColorPalette.sunkenBorder
            border.width: 1
            radius: parent.radius
        }
    }
}
