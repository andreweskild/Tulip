import QtQuick 2.10
import QtQuick.Templates 2.3 as T
import Tulip.Style 1.0
import Tulip.Effects 1.0

T.PageIndicator {
    id: control

    implicitWidth: Math.max(background ? background.implicitWidth : 0,
                            contentItem.implicitWidth + padding + padding)
    implicitHeight: 24 + padding + padding


    padding: 6
    spacing: 8
    font.weight: Font.DemiBold

    delegate: Item {
        id: indicatorMouse
        anchors.verticalCenter: parent.verticalCenter
        height: 24
        width: 24


        transform: Translate {
            y: index === currentIndex ? 2 : 0
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
            id: shadowEffect
            anchors.fill: parent
            hidden: index === currentIndex
            hovered: control.hovered
        }

        Rectangle {
            id: indicatorBG
            height: parent.height
            width: parent.width
            anchors.centerIn: parent
            color: ColorPalette.raised
            border.color: ColorPalette.raisedHighlight
            radius: 4

            Text {
                id: label
                anchors.fill: parent
                horizontalAlignment: Text.AlignHCenter
                verticalAlignment: Text.AlignVCenter
                color: ColorPalette.content
                text: index
                font: control.font
            }
        }
        states: [
            State {
                name: "active"; when: index === currentIndex
                PropertyChanges { target: label;  color: ColorPalette.sunken}
                PropertyChanges { target: indicatorBG;  color: ColorPalette.sunkenDark}
                PropertyChanges { target: indicatorBG;  border.color: ColorPalette.sunkenDarkBorder}
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

    contentItem: Row {
        spacing: control.spacing

        Repeater {
            model: control.count
            delegate: control.delegate
        }
    }
}
