/*
 * This file is part of Tulip.
 *
 * Copyright (C) 2018 Pier Luigi Fiorini <pierluigi.fiorini@gmail.com>
 *
 * $BEGIN_LICENSE:MPL2$
 *
 * This Source Code Form is subject to the terms of the Mozilla Public
 * License, v. 2.0. If a copy of the MPL was not distributed with this
 * file, You can obtain one at http://mozilla.org/MPL/2.0/.
 *
 * $END_LICENSE$
 */

import QtQuick 2.10
import QtQuick.Controls.Material 2.3
import Tulip.Controls 1.0 as TulipControls

Item {
    Image {
        anchors.centerIn: parent
        source: Qt.resolvedUrl("qrc:/images/balloon.jpg")
        width: 400
        height: 250

        TulipControls.Ripple {
            anchors.fill: parent
            onClicked: overlayView.open()
        }
    }

    TulipControls.OverlayView {
        id: overlayView

        width: 800
        height: 500

        Image {
            anchors.fill: parent
            source: Qt.resolvedUrl("qrc:/images/balloon.jpg")

            TulipControls.Ripple {
                anchors.fill: parent
                onClicked: overlayView.close()
            }
        }

        Row {
            anchors { top: parent.top; right: parent.right; rightMargin: TulipControls.Units.largeSpacing }
            height: 48
            spacing: 24

            Repeater {
                model: ["content/add", "image/edit", "action/delete"]
                delegate: TulipControls.ToolButton {
                    anchors.verticalCenter: parent.verticalCenter

                    icon.source: TulipControls.Utils.iconUrl(modelData)
                    icon.color: Material.iconColor

                    Material.theme: Material.Dark
                }
            }
        }
    }
}
