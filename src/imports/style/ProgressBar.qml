import QtQuick 2.9
import QtQuick.Templates 2.2 as T
import Tulip.Style 1.0
import Tulip.Effects 1.0

T.ProgressBar {
    id: control

    implicitWidth: 120
    implicitHeight: 8

    onValueChanged: {
        if(value === 1.0)
        {
            if(!control.indeterminate)
            {
                clickEffect.show();
            }
        }
    }

    background: Item {
        anchors.fill: parent



        Rectangle {
            anchors.centerIn: parent
            height: control.height + 2
            width: control.width + 2
            color: ColorPalette.windowHighlight
            radius: 4
        }

        ClickEffect {
            id: clickEffect
            initialWidth: parent.width
            initialHeight: parent.height
            anchors.centerIn: parent
//            color: ColorPalette.sunkenDark
        }

        Rectangle {
            anchors.centerIn: parent
            height: parent.height
            width: parent.width
            color: ColorPalette.sunken
            border.color: ColorPalette.sunkenBorder
            border.width: 1
            radius: 4
        }
    }

    contentItem: Item {
        anchors.fill: parent

        Rectangle {
            visible: !control.indeterminate
            width: control.visualPosition * parent.width
            height: parent.height
            radius: 4
            color: ColorPalette.accent
            border.color: ColorPalette.accentBorder
            border.width: 1
        }

        Rectangle {
            id: bar
            visible: control.indeterminate
            width: control.width * .2
            height: parent.height
            radius: 4
            color: ColorPalette.accent
            border.color: ColorPalette.accentBorder
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
