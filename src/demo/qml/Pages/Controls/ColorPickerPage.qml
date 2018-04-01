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
import QtQuick.Controls.Material 2.3
import Tulip.Controls 1.0 as TulipControls
import "../.." as Components

Components.StyledPage {
    id: page

    ScrollView {
        anchors.fill: parent
        clip: true

        Column {
            spacing: 16
            x: 10

            TulipControls.DisplayLabel {
                id: dateLabel
                level: 2
                color: colorPicker.colorSelection
                text: qsTr("Selected Color")
            }

            TulipControls.ColorPicker {
                id: colorPicker
                //orientation: TulipControls.DatePicker.Portrait
            }
        }
    }
}
