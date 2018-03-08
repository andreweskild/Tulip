import QtQuick 2.10
import Tulip.Style 1.0

Rectangle {
    id: clickEffect
    height: initialHeight
    width: initialHeight
    color: ColorPalette.accentBorder
    radius: 6
    opacity: 0
    enabled: false

    property int initialHeight
    property int initialWidth

    function show() {
        clickEffect.enabled = true;
    }

    ParallelAnimation {
        id: clickAnimation
        running: clickEffect.enabled
        alwaysRunToEnd: true

        NumberAnimation {
            target: clickEffect
            property: "height"
            duration: 200
            from: initialHeight
            to: initialHeight + 6
            easing.type: Easing.InOutSine
        }
        NumberAnimation {
            target: clickEffect
            property: "width"
            duration: 200
            from: initialWidth
            to: initialWidth + 6
            easing.type: Easing.InOutSine
        }
        NumberAnimation {
            target: clickEffect
            property: "opacity"
            duration: 400
            from: 1
            to: 0
            easing.type: Easing.InOutSine
        }

        onStopped: {
            clickEffect.enabled = false;
        }
    }

}
