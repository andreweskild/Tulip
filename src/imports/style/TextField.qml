import QtQuick 2.9
import QtQuick.Templates 2.2 as T
import QtQuick.Controls 2.2
import QtQuick.Controls.impl 2.2
import QtGraphicalEffects 1.0
import Tulip.Style 1.0

T.TextField {
    id: control
    hoverEnabled: true
    font.pointSize: 10
    font.weight: Font.DemiBold
    font.family: "IBM Plex Sans"


    implicitWidth: 120
    implicitHeight: 20

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
            id: clickEffect
            radius: 4
            height: inputBG.height
            width: inputBG.width
            anchors.centerIn: parent
            opacity: 0
        }

        Rectangle {
            id: inputBG
            height: parent.height - 2
            width: parent.width - 2
            anchors.centerIn: parent
            color: ColorPalette.raised
            border.color: ColorPalette.sunkenBorder
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
            name: "hovered"; when: control.hovered
            PropertyChanges { target: inputBG;  color: ColorPalette.raisedHighlight}
        },
        State {
            name: "active"; when: control.activeFocus
            PropertyChanges { target: inputBG;  border.color: ColorPalette.accentBorder}
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
