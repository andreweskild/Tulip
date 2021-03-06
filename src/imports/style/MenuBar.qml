import QtQuick 2.10
import QtQuick.Templates 2.3 as T
import QtQuick.Controls 2.3
import QtQuick.Controls.impl 2.3
import Tulip.Style 1.0

T.MenuBar {
    id: control

    implicitWidth: Math.max(background ? background.implicitWidth : 0,
                            contentWidth + leftPadding + rightPadding)
    implicitHeight: 24
    spacing: 4
    leftPadding: 8
    rightPadding: 8

    hoverEnabled: true


    delegate: MenuBarItem {}

    contentItem: Row {
            id: menuItems
            spacing: control.spacing
            Repeater {
                model: control.contentModel
            }
        }


}
