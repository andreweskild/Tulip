import QtQuick 2.10
import QtQuick.Controls 2.3
import QtQuick.Layouts 1.3
import Tulip.Controls.Private 1.0 as TulipControlsPrivate

Item {
    implicitHeight: 200 + hueSlider.height + column.spacing
    implicitWidth: 200

    property color colorSelection: Qt.hsva(colorSelector.hue, colorSelector.saturation,
                                           colorSelector.value, 1.0)

    Column {
        id: column
        anchors.fill: parent
        spacing: 8

        TulipControlsPrivate.ColorSelectionRect {
            id: colorSelector
            height: width
            width: parent.width
            hue: hueSlider.hue
        }

        TulipControlsPrivate.HueSelectionSlider {
            id: hueSlider
            width: parent.width
        }
    }

}
