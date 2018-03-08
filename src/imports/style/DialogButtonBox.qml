import QtQuick 2.10
import QtQuick.Templates 2.3 as T
import QtQuick.Controls 2.3
import QtQuick.Controls.impl 2.3
import Tulip.Style 1.0

T.DialogButtonBox {
    id: control

    implicitWidth: Math.max(background ? background.implicitWidth : 0,
                            contentItem.implicitWidth + leftPadding + rightPadding)
    implicitHeight: Math.max(background ? background.implicitHeight : 0,
                             contentItem.implicitHeight + topPadding + bottomPadding)

    spacing: 8
    padding: 12
    topPadding: 8
    bottomPadding: 8
    alignment: Qt.AlignRight


    delegate: Button { flat: false }

    contentItem: ListView {
        implicitWidth: contentWidth
        implicitHeight: 24

        model: control.contentModel
        spacing: control.spacing
        orientation: ListView.Horizontal
        boundsBehavior: Flickable.StopAtBounds
        snapMode: ListView.SnapToItem
    }

    background: Item {
        anchors.fill: parent
        Rectangle {
            height: 1
            width: parent.width
            color: ColorPalette.sunkenBorder
            anchors.bottom: parent.top
        }

        PaddedRectangle {
            anchors.fill: parent
            color: ColorPalette.sunken
            // Rounded corners should be only at the top or at the bottom
            topPadding: control.position === T.DialogButtonBox.Footer ? -4 : 0
            bottomPadding: control.position === T.DialogButtonBox.Header ? -4 : 0
            clip: true
            radius: 4
        }
    }
}
