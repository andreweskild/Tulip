import QtQuick 2.9
import QtQuick.Templates 2.2 as T
import Tulip.Style 1.0

T.BusyIndicator {
    id: control

    implicitWidth: 40
    implicitHeight: 40

    contentItem: Item {
        BusyIndicatorArc {
            id: indicator
            height: parent.height - 2
            width: parent.width - 2
            anchors.centerIn: parent
            color: ColorPalette.accent
            borderColor: ColorPalette.accentBorder
            arcWidth: 8

            SequentialAnimation {
                running: control.running
                loops: Animation.Infinite
                NumberAnimation {
                    target: indicator
                    duration: 400;
                    property: "arcLength";
                    to: 270
                    easing {
                        type: Easing.InCubic
                    }
                }
                NumberAnimation {
                    target: indicator
                    duration: 400;
                    property: "arcLength";
                    to: 120
                    easing {
                        type: Easing.OutCubic
                    }
                }
            }

            states: State {
                name: "running"; when: control.running;
                PropertyChanges { target: indicator; rotation: 360 }
            }

            transitions: Transition {
                animations: [
                    RotationAnimation {
                        duration: 800;
                        loops: Animation.Infinite
                        easing {
                            type: Easing.InOutCubic
                        }
                    }
                ]
            }
        }
    }


    background: Item {
        anchors.fill: parent
        Rectangle {
            height: parent.height
            width: parent.width
            anchors.centerIn: parent
            color: "transparent"
            border.color: ColorPalette.windowHighlight
            border.width: indicator.arcWidth + 2
            radius: width * .5
        }
        Rectangle {
            height: parent.height - 2
            width: parent.width - 2
            anchors.centerIn: parent
            color: "transparent"
            border.color: ColorPalette.sunkenBorder
            border.width: indicator.arcWidth
            radius: width * .5
        }
        Rectangle {
            height: parent.height - 4
            width: parent.width - 4
            anchors.centerIn: parent
            color: "transparent"
            border.color: ColorPalette.sunken
            border.width: indicator.arcWidth - 2
            radius: width * .5
        }
    }
}
