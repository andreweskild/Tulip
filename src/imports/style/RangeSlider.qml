import QtQuick 2.10
import QtQuick.Templates 2.3 as T
import Tulip.Effects 1.0
import Tulip.Style 1.0

T.RangeSlider {
    id: control

    implicitWidth: control.horizontal ? 120 : 24
    implicitHeight: control.horizontal ? 24 : 120

    first.handle: Item {
        id: firstHandle
        x: orientation === Qt.Vertical ? 0 :
                                         control.first.visualPosition * (control.availableWidth - width)
        y: orientation === Qt.Vertical ? control.first.visualPosition * (control.availableHeight - height) :
                                         0
        height: control.horizontal ? control.height : 32
        width: control.horizontal ? 32 : control.width

        transform: Translate {
            y: control.first.pressed || !control.enabled ? 2 : 0


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
            hidden: control.first.pressed || !control.enabled
            hovered: control.first.hovered
        }

        GenericFocusControl {
            anchors.fill: parent
            pressed: control.first.pressed
            hovered: control.first.hovered
        }


    }

    second.handle: Item {
        id: secondHandle
        x: orientation === Qt.Vertical ? 0 :
                                         control.second.visualPosition * (control.availableWidth - width)
        y: orientation === Qt.Vertical ? control.second.visualPosition * (control.availableHeight - height) :
                                         0
        height: control.horizontal ? control.height : 32
        width: control.horizontal ? 32 : control.width

        transform: Translate {
            y: control.second.pressed || !control.enabled ? 2 : 0


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
            hidden: control.second.pressed || !control.enabled
            hovered: control.second.hovered
        }

        GenericFocusControl {
            anchors.fill: parent
            pressed: control.second.pressed
            hovered: control.second.hovered
        }


    }

    background: Rectangle {
        anchors.verticalCenterOffset: 2
        anchors.centerIn: parent
        width: orientation === Qt.Vertical ? 8 : control.width
        height: orientation === Qt.Vertical ? control.height : 8
        color: ColorPalette.sunken
        border.color: ColorPalette.sunkenBorder
        border.width: 1
        radius: 4

        Rectangle {
            id: sliderColor
            x: orientation === Qt.Vertical ? 0 :
                                             firstHandle.x
            y: orientation === Qt.Vertical ? secondHandle.y :
                                             0
            width: orientation === Qt.Vertical ? parent.width :
                                                 secondHandle.x + secondHandle.width - firstHandle.x
            height: orientation === Qt.Vertical ? firstHandle.y + firstHandle.height - secondHandle.y :
                                                  parent.height
            radius: parent.radius
            color: ColorPalette.accent
            border.color: ColorPalette.accentBorder
            border.width: 1
        }
    }
    states: [
        State {
            name: "disabled"; when: !control.enabled
            PropertyChanges { target: background;  opacity: 0.5}
            PropertyChanges { target: sliderColor;  color: ColorPalette.sunkenDark;
                border.color: ColorPalette.sunkenDarkBorder}
        }
    ]

    transitions: [
        Transition {
            ColorAnimation { duration: 150; easing.type: Easing.InOutSine }
            NumberAnimation { properties: "opacity"; duration: 100; easing.type: Easing.InOutSine }
        }
    ]
}
