import QtQuick 2.10
import QtQuick.Templates 2.3 as T
import QtQuick.Controls 2.3
import QtGraphicalEffects 1.0
import Tulip.Style 1.0

T.TabBar {
    id: control

    implicitWidth: Math.max(background ? background.implicitWidth : 0,
                            contentWidth + leftPadding + rightPadding + spacing)
    implicitHeight: Math.max(background ? background.implicitHeight : 0,
                             contentHeight + topPadding + bottomPadding)



    leftPadding: 8
    rightPadding: 8
    spacing: 4

    clip: true

    contentItem: ListView {
        model: control.contentModel
        currentIndex: control.currentIndex

        spacing: control.spacing
        orientation: ListView.Horizontal
        boundsBehavior: Flickable.StopAtBounds
        flickableDirection: Flickable.HorizontalFlick

        highlightMoveDuration: 250
        highlightResizeDuration: 0
        highlightFollowsCurrentItem: true
        highlightRangeMode: ListView.ApplyRange
        preferredHighlightBegin: 48
        preferredHighlightEnd: width - 48

        delegate: TabButton {
            id: button
            z: button.hovered ? 1000 : 0
        }

    }


}
