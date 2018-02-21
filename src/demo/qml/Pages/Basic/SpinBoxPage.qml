/*
 * This file is part of Tulip.
 *
 * Copyright (C) 2018 Pier Luigi Fiorini <pierluigi.fiorini@gmail.com>
 * Copyright (C) 2018 Michael Spencer <sonrisesoftware@gmail.com>
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
import QtQuick.Layouts 1.3
import Tulip.Controls 1.0
import "../.."

Flickable {
    clip: true
    contentHeight: Math.max(layout.implicitHeight, height)

    ScrollBar.vertical: ScrollBar {}

    ColumnLayout {
        id: layout
        anchors.fill: parent

        Item {
            Layout.fillWidth: true
            Layout.fillHeight: true
            Layout.minimumWidth: grid.width + 80
            Layout.minimumHeight: grid.height + 80

            GridLayout {
                id: grid
                anchors.centerIn: parent
                columns: 2
                rows: 2

                // Row 1


                TitleLabel {
                    text: qsTr("Enabled")

                    Layout.alignment: Qt.AlignHCenter
                }

                TitleLabel {
                    text: qsTr("Disabled")

                    Layout.alignment: Qt.AlignHCenter
                }

                // Row 2

                SpinBox {
                }

                SpinBox {
                    enabled: false
                }

            }
        }
    }
}
