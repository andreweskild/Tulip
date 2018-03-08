import QtQuick 2.10
import QtQuick.Controls 2.3
import QtQuick.Controls.impl 2.3
import QtQuick.Templates 2.3 as T
import Tulip.Style 1.0
import Tulip.Effects 1.0

T.Tumbler {
    id: control
    implicitWidth: 24
    implicitHeight: 72 + topPadding + bottomPadding
    visibleItemCount: 3
    font.weight: Font.DemiBold

    topPadding: 6
    bottomPadding: 6

    transform: Translate {
        y: control.hovered ? -2 : 0


        Behavior on y {
            NumberAnimation {
                duration: 100
                easing {
                    type: Easing.InOutSine
                }
            }
        }
    }
    background: Item {
        BoxShadow {
            anchors.fill: parent
            hovered: control.hovered
            hidden: !control.hovered
        }

        GenericFocusControl {
            anchors.fill: parent
            hovered: control.hovered
            opacity: control.hovered ? 1 : 0
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

    delegate: Text {
        id: label
        text: modelData
        font: control.font
        color: control.hovered ? ColorPalette.contentAccented : ColorPalette.content
        opacity: (1.0 - Math.abs(Tumbler.displacement) / (control.visibleItemCount / 2)) * (control.enabled ? 1 : 0.6)
        horizontalAlignment: Text.AlignHCenter
        verticalAlignment: Text.AlignVCenter
        Behavior on color {
            ColorAnimation {
                duration: 150
                easing {
                    type: Easing.InOutSine
                }
            }
        }
    }

    contentItem: TumblerView {
        id: tumblerView
        model: control.model
        delegate: control.delegate
        path: Path {
            startX: tumblerView.width / 2
            startY: -tumblerView.delegateHeight / 2
            PathLine {
                x: tumblerView.width / 2
                y: (control.visibleItemCount + 1) * tumblerView.delegateHeight - tumblerView.delegateHeight / 2
            }
        }

        property real delegateHeight: control.availableHeight / control.visibleItemCount
    }
}
