import QtQuick 2.9
import QtQuick.Templates 2.2 as T
import QtQuick.Controls 2.2
import QtQuick.Controls.impl 2.2
import Tulip.Style 1.0
import Tulip.Effects 1.0

T.MenuItem {
    id: control

    implicitWidth: Math.max(background ? background.implicitWidth : 0,
                            contentItem.implicitWidth + leftPadding + rightPadding)
    implicitHeight: 20

    font.pointSize: 10
    font.weight: Font.DemiBold
    font.family: "IBM Plex Sans"


    contentItem: Text {
        id: label
        leftPadding: 8
        height: parent.height
        color: ColorPalette.content
        verticalAlignment: Text.AlignVCenter
        text: control.text
        font: control.font
    }

    background: Rectangle {
        id: root

        opacity: 0
        color: ColorPalette.accentDark

        border.color: ColorPalette.accentBorder
        border.width: 1
        FocusGradient {
            id: gradientRect
            anchors.fill: parent
            radius: parent.radius
            opacity: 1
            primaryColor: ColorPalette.accent
            secondaryColor: ColorPalette.accentLight
        }
        states: [
            State {
                name: "disabled"; when: !control.enabled
    //            PropertyChanges { target: root; opacity: .5 }
                PropertyChanges { target: root;  color: ColorPalette.sunken}
                PropertyChanges { target: root;  border.color: ColorPalette.sunkenBorder}
            },
            State {
                name: "pressed"; when: control.pressed || control.checked
                PropertyChanges { target: root;  color: ColorPalette.accentDark}
                PropertyChanges { target: root;  border.color: ColorPalette.accentBorder}
                PropertyChanges { target: root;  opacity: 1}
                PropertyChanges { target: gradientRect;  opacity: 0}
                PropertyChanges { target: label;  color: ColorPalette.contentAccented}

            },
            State {
                name: "hovered"; when: control.hovered
                PropertyChanges { target: root;  color: ColorPalette.accent}
                PropertyChanges { target: root;  border.color: ColorPalette.accentHighlight}
                PropertyChanges { target: root;  opacity: 1}
                PropertyChanges { target: gradientRect;  opacity: 1}
                PropertyChanges { target: label;  color: ColorPalette.contentAccented}
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
}
