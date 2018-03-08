import QtQuick 2.10
import QtQuick.Templates 2.3 as T
import Tulip.Style 1.0
import Tulip.Effects 1.0

T.SpinBox {
    id: control

    implicitWidth: 96
    implicitHeight: 24
    baselineOffset: contentItem.y + contentItem.baselineOffset
    font.weight: Font.DemiBold

    leftPadding: (control.mirrored ? (up.indicator ? up.indicator.width : 0) : (down.indicator ? down.indicator.width : 0))
    rightPadding: (control.mirrored ? (down.indicator ? down.indicator.width : 0) : (up.indicator ? up.indicator.width : 0))

    validator: IntValidator {
        locale: control.locale.name
        bottom: Math.min(control.from, control.to)
        top: Math.max(control.from, control.to)
    }


    contentItem: Item {
        anchors.horizontalCenter: parent.horizontalCenter

        Rectangle {
            id: focusEffect
            height: parent.height
            width: parent.width
            anchors.centerIn: parent
            color: ColorPalette.accent
            opacity: 0
            radius: 2
        }

        Rectangle {
            id: inputBorder
            anchors.fill: parent
            color: ColorPalette.raisedBorder
        }

        Rectangle {
            id: inputBG
            height: parent.height - 2
            width: parent.width - 2
            anchors.centerIn: parent

            color: ColorPalette.raised

            border.color: ColorPalette.raisedHighlight
            border.width: 1
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

            cursorDelegate: CursorDelegate{}

            readOnly: !control.editable
            validator: control.validator
            inputMethodHints: control.inputMethodHints
        }
    }

    up.indicator: Item {
        x: control.mirrored ? 0 : parent.width - width
        implicitWidth: control.height
        implicitHeight: control.height
        z: -1
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
            color: control.up.hovered || control.up.pressed ? ColorPalette.contentAccented : ColorPalette.content
            Behavior on color {
                ColorAnimation {
                    duration: 150
                    easing {
                        type: Easing.InOutSine
                    }
                }
            }
        }
        Rectangle {
            id: plusSymbolH
            x: (parent.width - width) / 2
            y: (parent.height - height) / 2
            width: 2
            height: parent.width / 3
            color: control.up.hovered || control.up.pressed ? ColorPalette.contentAccented : ColorPalette.content
            Behavior on color {
                ColorAnimation {
                    duration: 150
                    easing {
                        type: Easing.InOutSine
                    }
                }
            }
        }
    }

    down.indicator: Item {
        x: control.mirrored ? parent.width - width : 0
        implicitWidth: control.height
        implicitHeight: control.height
        z: -1
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
            color: control.down.hovered || control.down.pressed ? ColorPalette.contentAccented : ColorPalette.content
            Behavior on color {
                ColorAnimation {
                    duration: 150
                    easing {
                        type: Easing.InOutSine
                    }
                }
            }
        }
    }

    background: Item {
        anchors.fill: parent
        z: -2
        BoxShadow {
            anchors.left: parent.left
            height: down.indicator.height
            width: down.indicator.width
            hovered: control.hovered
            hidden: !control.enabled || control.down.pressed
        }
        BoxShadow {
            anchors.centerIn: parent
            height: inputBG.height
            width: inputBG.width
            hovered: control.hovered
            hidden: !control.enabled || input.activeFocus
        }
        BoxShadow {
            anchors.right: parent.right
            height: up.indicator.height
            width: up.indicator.width
            hovered: control.hovered
            hidden: !control.enabled || control.up.pressed
        }
        ClickEffect {
            id: upClickEffect
            initialWidth: up.indicator.width
            initialHeight: up.indicator.height
            anchors.centerIn: parent
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
            PropertyChanges { target: inputBG;  border.color: ColorPalette.sunken}
        },
        State {
            name: "input-active"; when: input.activeFocus
            PropertyChanges { target: inputBG;  color: ColorPalette.raised}
            PropertyChanges { target: inputBG;  border.color: ColorPalette.raised}
            PropertyChanges { target: inputBorder;  color: ColorPalette.accentBorder}
            PropertyChanges { target: focusEffect;  height: contentItem.height + 6}
            PropertyChanges { target: focusEffect;  width: contentItem.width + 6}
            PropertyChanges { target: focusEffect;  opacity: 1}
        },
        State {
            name: "input-hovered"; when: control.hovered && !input.activeFocus
            PropertyChanges { target: input;  color: ColorPalette.contentAccented}
            //PropertyChanges { target: gradientRect;  opacity: 1}
            PropertyChanges { target: inputBorder;  color: ColorPalette.accentBorder}
        }

    ]

    transitions: [
        Transition {
            reversible: true
            ColorAnimation { duration: 150; easing.type: Easing.InOutSine }
            NumberAnimation { properties: "opacity"; duration: 200; easing.type: Easing.OutSine }
            NumberAnimation { properties: "height"; duration: 200; easing.type: Easing.OutSine }
            NumberAnimation { properties: "width"; duration: 200; easing.type: Easing.OutSine }
        }
    ]
}
