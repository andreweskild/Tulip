import QtQuick 2.10
import QtQuick.Templates 2.3 as T
import Tulip.Style 1.0
import Tulip.Effects 1.0

T.Pane {
    id: control

    implicitWidth: Math.max(background ? background.implicitWidth : 0, contentWidth + leftPadding + rightPadding)
    implicitHeight: Math.max(background ? background.implicitHeight : 0, contentHeight + topPadding + bottomPadding)

    contentWidth: contentItem.implicitWidth || (contentChildren.length === 1 ? contentChildren[0].implicitWidth : 0)
    contentHeight: contentItem.implicitHeight || (contentChildren.length === 1 ? contentChildren[0].implicitHeight : 0)

    property int radius


    background: Item {
        BoxShadow {
            anchors.fill: parent
            hovered: control.hovered
        }
        Rectangle {
            height: parent.height + 2
            width: parent.width + 2
            anchors.centerIn: parent
            color: ColorPalette.raisedBorder
            radius: control.radius
            Rectangle {
                height: control.height
                width: control.width
                anchors.centerIn: parent
                color: ColorPalette.raised
                radius: control.radius
                border.width: 1
                border.color: ColorPalette.raisedHighlight
            }
        }
    }
}
