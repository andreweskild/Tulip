import QtQuick 2.10
import QtQuick.Templates 2.3 as T
import Tulip.Style 1.0

T.ToolBar {
    id: control

    implicitWidth: Math.max(background ? background.implicitWidth : 0, contentWidth + leftPadding + rightPadding)
    implicitHeight: Math.max(background ? background.implicitHeight : 0, contentHeight + topPadding + bottomPadding)

    contentWidth: contentItem.implicitWidth || (contentChildren.length === 1 ? contentChildren[0].implicitWidth : 0)
    contentHeight: contentItem.implicitHeight || (contentChildren.length === 1 ? contentChildren[0].implicitHeight : 0)

    spacing: 4


    background: Rectangle {
        implicitHeight: 24
        color: ColorPalette.sunken
        border.width: 1
        border.color: ColorPalette.sunkenBorder
        radius: 4
    }
}
