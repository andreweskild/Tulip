import QtQuick 2.9
import QtQuick.Templates 2.2 as T
import QtQuick.Controls 2.2
import QtQuick.Controls.impl 2.2
import QtGraphicalEffects 1.0
import Tulip.Style 1.0

T.TextField {
    id: control
    hoverEnabled: true
    font.weight: Font.DemiBold


    implicitWidth: 120
    implicitHeight: 24

    selectByMouse: true

    leftPadding: 8
    rightPadding: 8

    color: ColorPalette.content

    selectionColor: ColorPalette.accentBorder
    selectedTextColor: ColorPalette.contentSecondary
    verticalAlignment: TextInput.AlignVCenter

    cursorDelegate: CursorDelegate {}




    background: Item {
        id: background

        Rectangle {
            id: highlight
            anchors.fill: parent
            color: ColorPalette.windowHighlight
            radius: 4
        }

        Rectangle {
            id: focusEffect
            height: parent.height
            width: parent.width
            anchors.centerIn: parent
            color: ColorPalette.accent
            radius: 6
            opacity: 0
        }

        Rectangle {
            id: inputBG
            height: parent.height - 2
            width: parent.width - 2
            anchors.centerIn: parent
            color: ColorPalette.raised
            border.color: ColorPalette.raisedBorder
            border.width: 1
            radius: 4


            PlaceholderText {
                id: placeholder
                x: control.leftPadding
                y: control.topPadding
                width: control.width - (control.leftPadding + control.rightPadding)
                height: control.height - (control.topPadding + control.bottomPadding)
                text: control.placeholderText
                font: control.font
                opacity: control.hovered || control.activeFocus ? .4 : .2
                color: ColorPalette.content
                verticalAlignment: control.verticalAlignment
                visible: !control.length && !control.preeditText
                Behavior on opacity {
                    NumberAnimation {
                        duration: 150
                        easing {
                            type: Easing.InOutSine
                        }
                    }
                }

            }
        }

    }
    states: [
        State {
            name: "disabled"; when: !control.enabled;
            PropertyChanges { target: inputBG;  color: ColorPalette.sunken}
            PropertyChanges { target: inputBG;  border.color: ColorPalette.sunkenBorder}
        },
        State {
            name: "active"; when: control.activeFocus
            PropertyChanges { target: inputBG;  border.color: ColorPalette.accentBorder}
            PropertyChanges { target: focusEffect;  height: background.height + 4}
            PropertyChanges { target: focusEffect;  width: background.width + 4}
            PropertyChanges { target: focusEffect;  opacity: 1}
        },
        State {
            name: "hovered"; when: control.hovered
            PropertyChanges { target: inputBG;  border.color: ColorPalette.accentBorder}
        }
    ]

    transitions: [
        Transition {
            reversible: true
            ColorAnimation { duration: 150; easing.type: Easing.InOutSine }
            NumberAnimation { properties: "opacity"; duration: 200; easing.type: Easing.OutSine }
            NumberAnimation { properties: "height"; duration: 200; easing.type: Easing.OutSine }
            NumberAnimation { properties: "width"; duration: 200; easing.type: Easing.OutSine }
        }
    ]
}
