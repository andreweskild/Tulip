import QtQuick 2.9
import QtQuick.Templates 2.2 as T
import Tulip.Style 1.0

T.ProgressBar {
    id: control

    implicitWidth: 120
    implicitHeight: 10


    background: Rectangle {
        anchors.fill: parent
        color: ColorPalette.sunken
        border.color: ColorPalette.sunkenBorder
        border.width: 1
        radius: 5
    }

    contentItem: Item {
        anchors.fill: parent

        Rectangle {
            visible: !control.indeterminate
            width: control.visualPosition * parent.width
            height: parent.height
            radius: 5
            color: ColorPalette.sunkenDark
            border.color: ColorPalette.sunkenDarkBorder
            border.width: 1
        }

        Rectangle {
            id: bar
            visible: control.indeterminate
            width: control.width * .2
            height: parent.height
            radius: 5
            color: ColorPalette.sunkenDark
            border.color: ColorPalette.sunkenDarkBorder
            border.width: 1
            SequentialAnimation {
                running: true
                loops: Animation.Infinite
                SequentialAnimation {
                    ParallelAnimation {
                        NumberAnimation { target: bar; property: "width"; to: control.width * .5; duration: 300; easing.type: Easing.InSine }
                        NumberAnimation { target: bar; property: "x"; to: control.width * .5 - (control.width * .25); duration: 300; easing.type: Easing.InSine  }
                    }
                    ParallelAnimation {
                        NumberAnimation { target: bar; property: "width"; to: control.width * .2; duration: 300; easing.type: Easing.OutSine  }
                        NumberAnimation { target: bar; property: "x"; to: control.width - (bar.width); duration: 300; easing.type: Easing.OutSine  }
                    }
                }
                SequentialAnimation {
                    ParallelAnimation {
                        NumberAnimation { target: bar; property: "width"; to: control.width * .5; duration: 300; easing.type: Easing.InSine  }
                        NumberAnimation { target: bar; property: "x"; to: control.width * .5 - (control.width * .25); duration: 300; easing.type: Easing.InSine  }
                    }
                    ParallelAnimation {
                        NumberAnimation { target: bar; property: "width"; to: control.width * .2; duration: 300; easing.type: Easing.OutSine  }
                        NumberAnimation { target: bar; property: "x"; to: 0; duration: 300; easing.type: Easing.OutSine  }
                    }
                }
            }
        }
    }
}
