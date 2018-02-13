import QtQuick 2.9
import QtQuick.Templates 2.2 as T
import QtQuick.Controls 2.2
import QtQuick.Controls.impl 2.2
import QtGraphicalEffects 1.0

T.Button {
    id: control

    width: buttonText.contentWidth + padding + padding
    height: 20
    padding: 10

    transform: Translate {
        y: control.pressed ? 2 : 0


        Behavior on y {
            NumberAnimation {
                duration: 100
                easing {
                    type: Easing.InOutSine
                }
            }
        }
    }

    contentItem:Text {
        id: buttonText
        horizontalAlignment: Text.AlignHCenter
        verticalAlignment: Text.AlignVCenter
        color: "yellow"
        text: control.text
        font: control.font

        Behavior on color {
            ColorAnimation {
                duration: 150
                easing {
                    type: Easing.InOutSine
                }
            }
        }
    }

    background: Item {
        id: content
        height: parent.height
        width: parent.width

        InteractiveRounded {
            anchors.fill: parent
        }
}
}
