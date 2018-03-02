import QtQuick 2.10
import Tulip.Style 1.0

Rectangle {
    id: cursor

    color: ColorPalette.accentBorder
    width: 2
    implicitHeight: 12
    visible: parent.activeFocus && !parent.readOnly && parent.selectionStart === parent.selectionEnd


    Connections {
        target: cursor.parent
        onCursorPositionChanged: {
            // keep a moving cursor visible
            cursor.opacity = 1
            timer.restart()
        }
    }

    Timer {
        id: timer
        running: cursor.parent.activeFocus && !cursor.parent.readOnly
        repeat: true
        interval: Qt.styleHints.cursorFlashTime / 2
        onTriggered: cursor.opacity = !cursor.opacity ? 1 : 0
        // force the cursor visible when gaining focus
        onRunningChanged: cursor.opacity = 1
    }
}
