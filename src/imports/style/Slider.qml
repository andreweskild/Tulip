import QtQuick 2.9
import QtQuick.Controls 2.2
import QtQuick.Templates 2.2 as T
import Tulip.Effects 1.0
import Tulip.Style 1.0

T.Slider {
    id: control

    implicitWidth: control.horizontal ? 120 : 20
    implicitHeight: control.horizontal ? 20 : 120


    handle: Item {
        id: handleBG
        x: orientation === Qt.Vertical ? 0 :
               control.visualPosition * (control.availableWidth - width)
        y: orientation === Qt.Vertical ? control.visualPosition * (control.availableHeight - height) :
                                         0
        height: orientation === Qt.Vertical ? control.width : control.height
        width: orientation === Qt.Vertical ? control.width : control.height
        transform: Translate {
            y: control.pressed || !control.enabled ? 0 : -2

            Behavior on y {
                NumberAnimation {
                    duration: 100
                    easing {
                        type: Easing.InOutSine
                    }
                }
            }
        }

        BoxShadow {
            anchors.fill: parent
            hidden: control.pressed || !control.enabled
            hovered: control.hovered
        }

        GenericFocusControl {
            anchors.fill: parent
            hovered: control.hovered
            pressed: control.pressed
        }

    }

    background: Rectangle {
        anchors.centerIn: parent
        width: orientation === Qt.Vertical ? 8 : control.width
        height: orientation === Qt.Vertical ? control.height : 8
        color: ColorPalette.sunken
        radius: 4
        border.color: ColorPalette.sunkenBorder
        border.width: 1

        Rectangle {
            width: orientation === Qt.Vertical ? parent.width : handleBG.x + handleBG.width
            height: orientation === Qt.Vertical ?  parent.height - handleBG.y : parent.height
            y: orientation === Qt.Vertical ? handleBG.y : 0
            radius: parent.radius
            border.color: ColorPalette.sunkenDarkBorder
            border.width: 1

            color: ColorPalette.sunkenDark
        }
    }
    states: [
        State {
            name: "disabled"; when: !control.enabled
            PropertyChanges { target: background;  opacity: 0.5}
        }
    ]

    transitions: [
        Transition {
            ColorAnimation { duration: 150; easing.type: Easing.InOutSine }
            NumberAnimation { properties: "opacity"; duration: 100; easing.type: Easing.InOutSine }
        }
    ]
}
