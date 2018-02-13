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
import QtQuick.Controls 2.3
import Tulip.Controls 1.0 as TulipControls
import "../.."

Flickable {
    clip: true
    contentHeight: Math.max(layout.implicitHeight, height)

    ScrollBar.vertical: ScrollBar {}

    Column {
        id: layout
        anchors.fill: parent

        Repeater {
            model: 2

            StyledRectangle {
                //y: height * index
                width: parent.width
                height: parent.height / 2

                Row {
                    anchors.centerIn: parent
                    spacing: 64

                    Column {
                        TulipControls.TitleLabel {
                            text: qsTr("Enabled")
                        }

                        TulipControls.FloatingActionButton {
                            icon.source: TulipControls.Utils.iconUrl("device/airplanemode_active")
                            mini: false
                        }

                        TulipControls.FloatingActionButton {
                            icon.source: TulipControls.Utils.iconUrl("navigation/check")
                            highlighted: true
                            mini: false
                        }

                        TulipControls.FloatingActionButton {
                            icon.source: TulipControls.Utils.iconUrl("device/airplanemode_active")
                            mini: true
                        }

                        TulipControls.FloatingActionButton {
                            icon.source: TulipControls.Utils.iconUrl("navigation/check")
                            highlighted: true
                            mini: true
                        }
                    }

                    Column {
                        TulipControls.TitleLabel {
                            text: qsTr("Disabled")
                        }

                        TulipControls.FloatingActionButton {
                            icon.source: TulipControls.Utils.iconUrl("device/airplanemode_active")
                            mini: false
                            enabled: false
                        }

                        TulipControls.FloatingActionButton {
                            icon.source: TulipControls.Utils.iconUrl("navigation/check")
                            highlighted: true
                            mini: false
                            enabled: false
                        }

                        TulipControls.FloatingActionButton {
                            icon.source: TulipControls.Utils.iconUrl("device/airplanemode_active")
                            mini: true
                            enabled: false
                        }

                        TulipControls.FloatingActionButton {
                            icon.source: TulipControls.Utils.iconUrl("navigation/check")
                            highlighted: true
                            mini: true
                            enabled: false
                        }
                    }
                }
            }
        }
    }
}
