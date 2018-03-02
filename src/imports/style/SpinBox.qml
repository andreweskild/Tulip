import QtQuick 2.10
import QtQuick.Templates 2.3 as T
import Tulip.Style 1.0
import Tulip.Effects 1.0

T.SpinBox {
    id: control

    implicitWidth: 96
    implicitHeight: 20
    baselineOffset: contentItem.y + contentItem.baselineOffset
    font.pointSize: 10
    font.weight: Font.DemiBold
    font.family: "IBM Plex Sans"

    leftPadding: (control.mirrored ? (up.indicator ? up.indicator.width : 0) : (down.indicator ? down.indicator.width : 0))
    rightPadding: (control.mirrored ? (down.indicator ? down.indicator.width : 0) : (up.indicator ? up.indicator.width : 0))

    validator: IntValidator {
        locale: control.locale.name
        bottom: Math.min(control.from, control.to)
        top: Math.max(control.from, control.to)
    }


    contentItem: Item {
        anchors.horizontalCenter: parent.horizontalCenter
        clip: true

        transform: Translate {
            y: input.activeFocus ? 2 : 0


            Behavior on y {
                NumberAnimation {
                    duration: 100
                    easing {
                        type: Easing.InOutSine
                    }
                }
            }
        }

        Rectangle {
            id: inputBG
            height: parent.height
            width: parent.width + 4
            anchors.centerIn: parent

            color: ColorPalette.raised

            border.color: ColorPalette.raisedHighlight
            border.width: 1
            FocusGradient {
                id: gradientRect
                anchors.fill: parent
                radius: parent.radius
                opacity: 0
                primaryColor: ColorPalette.accent
                secondaryColor: ColorPalette.accentLight
            }
        }


        TextInput {
            id: input
            anchors.fill: parent
            text: control.textFromValue(control.value, control.locale)
            font: control.font

            color: ColorPalette.content
            selectionColor: ColorPalette.accent
            selectedTextColor: ColorPalette.contentSecondary
            horizontalAlignment: Qt.AlignHCenter
            verticalAlignment: Qt.AlignVCenter
            selectByMouse: true

//            cursorDelegate: CursorDelegate{}

            readOnly: !control.editable
            validator: control.validator
            inputMethodHints: control.inputMethodHints
        }
    }

    up.indicator: Item {
        x: control.mirrored ? 0 : parent.width - width
        implicitWidth: control.height
        implicitHeight: control.height
        clip: true

        transform: Translate {
            y: control.up.pressed ? 2 : 0


            Behavior on y {
                NumberAnimation {
                    duration: 100
                    easing {
                        type: Easing.InOutSine
                    }
                }
            }
        }


        GenericFocusControl {
            anchors.right: parent.right
            height: parent.height
            width: parent.width + 6
            hovered: control.up.hovered
            pressed: control.up.pressed
        }


        Rectangle {
            id: plusSymbolV
            x: (parent.width - width) / 2
            y: (parent.height - height) / 2
            width: parent.width / 3
            height: 2
            color: ColorPalette.content
        }
        Rectangle {
            id: plusSymbolH
            x: (parent.width - width) / 2
            y: (parent.height - height) / 2
            width: 2
            height: parent.width / 3
            color: ColorPalette.content
        }
    }

    down.indicator: Item {
        x: control.mirrored ? parent.width - width : 0
        implicitWidth: control.height
        implicitHeight: control.height
        clip: true

        transform: Translate {
            y: control.down.pressed ? 2 : 0


            Behavior on y {
                NumberAnimation {
                    duration: 100
                    easing {
                        type: Easing.InOutSine
                    }
                }
            }
        }

        GenericFocusControl {
            anchors.left: parent.left
            height: parent.height
            width: parent.width + 6
            hovered: control.down.hovered
            pressed: control.down.pressed
        }

        Rectangle {
            id: minusSymbol
            x: (parent.width - width) / 2
            y: (parent.height - height) / 2
            width: parent.width / 3
            height: 2
            color: ColorPalette.content
        }
    }

    background: Item {
        anchors.fill: parent
        BoxShadow {
            height: parent.height
            width: parent.width
            hovered: control.hovered && !control.up.pressed && !control.down.pressed
            hidden: !control.enabled
        }

    }

    states: [
        State {
            name: "disabled"; when: !control.enabled;
            PropertyChanges { target: input;  opacity: 0.5}
            PropertyChanges { target: minusSymbol;  opacity: 0.5}
            PropertyChanges { target: plusSymbolH;  opacity: 0.5}
            PropertyChanges { target: plusSymbolV;  opacity: 0.5}
            PropertyChanges { target: inputBG;  color: ColorPalette.sunken}
            PropertyChanges { target: inputBG;  border.color: ColorPalette.sunkenBorder}
        },
        State {
            name: "input-active"; when: input.activeFocus
            PropertyChanges { target: inputBG;  color: ColorPalette.raised}
            PropertyChanges { target: inputBG;  border.color: ColorPalette.accent}
        },
        State {
            name: "up-active"; when: control.up.hovered || control.up.pressed
            PropertyChanges { target: plusSymbolH;  color: ColorPalette.contentAccented}
            PropertyChanges { target: plusSymbolV;  color: ColorPalette.contentAccented}
        },
        State {
            name: "down-active"; when: control.down.hovered || control.down.pressed
            PropertyChanges { target: minusSymbol;  color: ColorPalette.contentAccented}
        },
        State {
            name: "input-hovered"; when: control.hovered && !input.activeFocus
            PropertyChanges { target: input;  color: ColorPalette.contentAccented}
            PropertyChanges { target: inputBG;  color: ColorPalette.accent}
            PropertyChanges { target: inputBG;  border.color: ColorPalette.accentHighlight}
            PropertyChanges { target: gradientRect;  opacity: 1}
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
