import QtQuick 2.10
import QtQuick.Templates 2.3 as T
import QtQuick.Controls 2.3
import QtQuick.Controls.impl 2.3
import Tulip.Style 1.0
import Tulip.Effects 1.0

T.ToolButton {
    id: control


    implicitWidth: Math.max(background ? background.implicitWidth : 0,
                            contentItem.implicitWidth + leftPadding + rightPadding)
    implicitHeight: Math.max(background ? background.implicitHeight : 0,
                             contentItem.implicitHeight + topPadding + bottomPadding)
    font.weight: Font.DemiBold

    property bool topLeftRounded: false
    property bool topRightRounded: false
    property bool bottomLeftRounded: false
    property bool bottomRightRounded: false

    property bool isRounded: topLeftRounded || topRightRounded || bottomLeftRounded || bottomRightRounded

    leftPadding: 16
    rightPadding: 16

    icon.width: 24
    icon.height: 24
    icon.color: ColorPalette.content

    onClicked: {
        if(!control.flat)
        {
            clickEffect.show();
        }
    }

    contentItem: IconLabel {
        id: buttonText
        spacing: control.spacing
        mirrored: control.mirrored
        display: control.display

        icon: control.icon
        text: control.text
        font: control.font
        color: control.hovered || control.highlighted ? ColorPalette.contentAccented : ColorPalette.content
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
        anchors.fill: parent

        ClickEffect {
            id: clickEffect
            initialWidth: parent.width
            initialHeight: parent.height
            anchors.centerIn: parent
            radius: isRounded ? 4 : 0
        }

        Item {
            anchors.fill: parent
            clip: isRounded

            GenericFocusControl {
                anchors {
                    fill: parent
                    topMargin: bottomLeftRounded || bottomRightRounded ? -6 : 0
                    bottomMargin: topLeftRounded || topRightRounded ? -6 : 0
                    leftMargin: topLeftRounded || bottomLeftRounded ? -6 : 0
                    rightMargin: topRightRounded || bottomRightRounded ? -6 : 0
                }
                hovered: control.hovered
                pressed: control.pressed
                highlighted: control.highlighted
                radius: isRounded ? 4 : 0
            }

            Rectangle {
                anchors {
                    left: topLeftRounded || bottomLeftRounded ? parent.left : undefined
                    right: topRightRounded || bottomRightRounded ? parent.right : undefined
                }

                visible: isRounded
                width: 1
                height: parent.height
                color: ColorPalette.raisedBorder
            }

            Rectangle {
                anchors {
                    top: bottomRightRounded || bottomLeftRounded ? parent.top : undefined
                    bottom: topRightRounded || topLeftRounded ? parent.bottom : undefined
                }

                visible: isRounded
                height: 1
                width: parent.width
                color: ColorPalette.raisedBorder
            }
        }

    }


    states: [
        State {
            name: "disabled"; when: !control.enabled;
            PropertyChanges { target: buttonText;  opacity: 0.5}
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
