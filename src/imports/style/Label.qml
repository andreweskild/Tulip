import QtQuick 2.10
import QtQuick.Templates 2.3 as T
import Tulip.Style 1.0

T.Label {
    id: control

    font.weight: Font.DemiBold
    color: enabled ? ColorPalette.content : ColorPalette.sunken
    linkColor: ColorPalette.accent

}
