/****************************************************************************
**
** Copyright (C) 2017 The Qt Company Ltd.
** Contact: http://www.qt.io/licensing/
**
** This file is part of the Qt Quick Controls 2 module of the Qt Toolkit.
**
** $QT_BEGIN_LICENSE:LGPL3$
** Commercial License Usage
** Licensees holding valid commercial Qt licenses may use this file in
** accordance with the commercial license agreement provided with the
** Software or, alternatively, in accordance with the terms contained in
** a written agreement between you and The Qt Company. For licensing terms
** and conditions see http://www.qt.io/terms-conditions. For further
** information use the contact form at http://www.qt.io/contact-us.
**
** GNU Lesser General Public License Usage
** Alternatively, this file may be used under the terms of the GNU Lesser
** General Public License version 3 as published by the Free Software
** Foundation and appearing in the file LICENSE.LGPLv3 included in the
** packaging of this file. Please review the following information to
** ensure the GNU Lesser General Public License version 3 requirements
** will be met: https://www.gnu.org/licenses/lgpl.html.
**
** GNU General Public License Usage
** Alternatively, this file may be used under the terms of the GNU
** General Public License version 2.0 or later as published by the Free
** Software Foundation and appearing in the file LICENSE.GPL included in
** the packaging of this file. Please review the following information to
** ensure the GNU General Public License version 2.0 requirements will be
** met: http://www.gnu.org/licenses/gpl-2.0.html.
**
** $QT_END_LICENSE$
**
****************************************************************************/

import QtQuick 2.10
import QtQuick.Templates 2.3 as T
import QtQuick.Controls 2.3
import QtQuick.Controls.impl 2.3
import QtGraphicalEffects 1.0
import Tulip.Style 1.0
import Tulip.Effects 1.0

T.TabButton {
    id: control

    implicitWidth: Math.max(background ? background.implicitWidth : 0,
                            contentItem.implicitWidth + leftPadding + rightPadding)
    implicitHeight: 24

    padding: 16


    contentItem: Label {
        id: label
        anchors.fill: parent
        text: control.text
        verticalAlignment: Text.AlignVCenter
        horizontalAlignment: Text.AlignHCenter
        color: ColorPalette.content
    }

    background: Item {
        height: parent.height + 4
        width: parent.width
//        BoxShadow {
//            anchors.fill: parent
//            hidden: control.pressed
//        }

        TabFocusControl {
            anchors.fill: parent
            hovered: control.hovered
            pressed: control.pressed
            checked: control.checked
        }

//        LinearGradient {
//            anchors.bottom: parent.bottom
//            anchors.bottomMargin: 4
//            opacity: control.checked ? 0 : 1
//            width: parent.width
//            height: 4
//            start: Qt.point(0, 0)
//            end: Qt.point(0, 8)
//            cached: true
//            gradient: Gradient {
//                        GradientStop { position: 0.0; color: "transparent" }
//                        GradientStop { position: 1.0; color: ColorPalette.shadow }
//                    }
//            Behavior on opacity {
//                NumberAnimation {
//                    duration: 150
//                    easing {
//                        type: Easing.InOutSine
//                    }
//                }
//            }
//        }
        Rectangle {
            height: 1
            width: parent.width
            anchors.bottom: parent.bottom
            anchors.bottomMargin: 4
            color: ColorPalette.raisedBorder
            opacity: control.checked ? 0 : 1
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
        },
        State {
            name: "active"; when: (control.pressed || control.hovered ||
                                  control.highlighted) && !control.checked
            PropertyChanges { target: label;  color: ColorPalette.contentAccented}
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
