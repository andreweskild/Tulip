import QtQuick 2.10
import QtQuick.Templates 2.3 as T
import QtQuick.Controls 2.3
import QtQuick.Controls.impl 2.3
import Tulip.Style 1.0

PaddedRectangle {
    id: root
    property string title

    implicitWidth: label.implicitWidth + leftPadding + rightPadding
    implicitHeight: label.height + topPadding + bottomPadding

    color: "transparent"
    padding: 12
    topPadding: 8
    bottomPadding: 8

    PaddedRectangle {
        id: background
        width: parent.width + 2
        height: parent.height + 2
        anchors.centerIn: parent
        color: ColorPalette.sunkenDark
        // Rounded corners should be only at the top or at the bottom
        bottomPadding: -4
        clip: true
        radius: 4
    }

    Rectangle {
        height: 1
        width: parent.width
        color: ColorPalette.sunkenDarkBorder
        anchors.top: parent.bottom
    }


    Label {
        id: label
        anchors.centerIn: parent
        height: 24
        verticalAlignment: Text.AlignVCenter
        horizontalAlignment: Text.AlignHCenter
        padding: 8
        font.weight: Font.Bold
        font.pointSize: 10
        text: root.title
        visible: root.title != ""
        color: ColorPalette.contentSecondary
    }
}
