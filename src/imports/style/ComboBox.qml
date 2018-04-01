import QtQuick 2.9
import QtQuick.Window 2.3
import QtQuick.Controls 2.2
import QtQuick.Controls.impl 2.2
import QtQuick.Templates 2.2 as T
import Tulip.Style 1.0
import Tulip.Effects 1.0

T.ComboBox {
    id: control

    implicitWidth: 120
    implicitHeight: 24

    leftPadding: 8
    rightPadding: 8
    font.weight: Font.DemiBold



    delegate: MenuItem {
        width: parent.width
        height: 24
        text: control.textRole ? (Array.isArray(control.model) ? modelData[control.textRole] : model[control.textRole]) : modelData
        highlighted: control.currentIndex === index
    }

    indicator: LineArrowIndicator {
        id: arrowIndicator
        color: control.hovered || popup.opened ? ColorPalette.contentAccented : ColorPalette.content
        height: 6
        width: 10
        anchors.right: parent.right
        anchors.rightMargin: parent.rightPadding
        anchors.verticalCenter: parent.verticalCenter
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
        Behavior on color {
            ColorAnimation {
                duration: 150
                easing {
                    type: Easing.InOutSine
                }
            }
        }
    }

    contentItem: T.TextField {
        id: label

        text: control.editable ? control.editText : control.displayText

        enabled: control.editable
        autoScroll: control.editable
        readOnly: control.popup.visible
        inputMethodHints: control.inputMethodHints
        validator: control.validator

        font: control.font
        color: control.hovered || popup.visible ? ColorPalette.contentAccented : ColorPalette.content
        selectionColor: ColorPalette.accent
        selectedTextColor: ColorPalette.contentSecondary
        horizontalAlignment: Text.AlignLeft
        verticalAlignment: Text.AlignVCenter

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
        id: background
        width: control.width
        height: control.height
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

        BoxShadow {
            anchors.fill: parent
            hidden: control.pressed || !control.enabled
            hovered: control.hovered
        }


        GenericFocusControl {
            anchors.fill: parent
            hovered: control.hovered && !popup.opened
            pressed: control.pressed
        }


    }

    popup: T.Popup {
        id: popup
        width: control.width
        height: contentItem.implicitHeight + topPadding + bottomPadding
        transformOrigin: Item.Top
        topPadding: 4
        bottomPadding: 4
        topMargin: 8
        bottomMargin: 8
        y: -topPadding


        enter: Transition {
            NumberAnimation {
                duration: 150
                easing {
                    type: Easing.InOutSine
                }

                target: background
                property: "height"
                to: popup.height
            }
            NumberAnimation {
                duration: 100
                easing {
                    type: Easing.InOutSine
                }

                targets: [background]
                property: "y"
                to: -popup.topPadding
            }
            NumberAnimation {
                targets: [arrowIndicator, label]
                duration: 100
                easing {
                    type: Easing.InOutSine
                }
                property: "opacity"
                to: 0
            }
        }

        exit: Transition {
            NumberAnimation {
                duration: 150
                easing {
                    type: Easing.InOutSine
                }

                target: background
                property: "height"
                to: 24
            }
            NumberAnimation {
                targets: [arrowIndicator, label]
                duration: 100
                easing {
                    type: Easing.InOutSine
                }
                property: "opacity"
                to: 1

            }

            NumberAnimation {
                duration: 100
                easing {
                    type: Easing.InOutSine
                }

                targets: background
                property: "y"
                to: 0
            }
        }

        contentItem: ListView {
            clip: true
            implicitHeight: contentHeight
            model: control.popup.visible ? control.delegateModel : null
            currentIndex: control.highlightedIndex
            highlightMoveDuration: 0

            T.ScrollIndicator.vertical: ScrollIndicator { }

            opacity: popup.opened ? 1 : 0

            Behavior on opacity {
                NumberAnimation {
                    duration: 150
                    easing {
                        type: Easing.InOutSine
                    }
                }
            }
        }

    }

    states: [
        State {
            name: "disabled"; when: !control.enabled;
            PropertyChanges { target: label;  opacity: 0.5}
            PropertyChanges { target: arrowIndicator;  opacity: 0.5}
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
