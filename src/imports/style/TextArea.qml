import QtQuick 2.10
import QtQuick.Templates 2.3 as T
import QtQuick.Controls 2.3
import QtQuick.Controls.impl 2.3
import Tulip.Style 1.0

T.TextArea {
    id: control

    implicitWidth: Math.max(contentWidth + leftPadding + rightPadding,
                            background ? background.implicitWidth : 0,
                            placeholder.implicitWidth + leftPadding + rightPadding)
    implicitHeight: Math.max(contentHeight + 1 + topPadding + bottomPadding,
                             background ? background.implicitHeight : 0,
                             placeholder.implicitHeight + 1 + topPadding + bottomPadding)

    font.pointSize: 10
    font.weight: Font.DemiBold
    font.family: "IBM Plex Sans"
    topPadding: 8
    bottomPadding: 15
    leftPadding: 8
    rightPadding: 8

    selectByMouse: true

    cursorDelegate: CursorDelegate {}

    color: ColorPalette.content
    selectionColor: ColorPalette.accentBorder
    selectedTextColor: ColorPalette.contentSecondary


    PlaceholderText {
        id: placeholder
        x: control.leftPadding
        y: control.topPadding
        width: control.width - (control.leftPadding + control.rightPadding)
        height: control.height - (control.topPadding + control.bottomPadding)
        text: control.placeholderText
        font: control.font
        color: ColorPalette.sunken
        verticalAlignment: control.verticalAlignment
        elide: Text.ElideRight
        visible: !control.length && !control.preeditText && (!control.activeFocus || control.horizontalAlignment !== Qt.AlignHCenter)
    }

    states: [
        State {
            name: "disabled"; when: !control.enabled;
            PropertyChanges { target: control;  opacity: 0.5}
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
