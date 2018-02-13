/*
 * This file is part of Tulip.
 *
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

import QtQuick.Controls 2.3
import Tulip.Controls 1.0 as TulipControls

TulipControls.Page {
    title: "Sub page demo"

    actions: [
        TulipControls.Action {
            icon.source: TulipControls.Utils.iconUrl("action/settings")
            toolTip: qsTr("Settings")
            hoverAnimation: true
        }
    ]

    Label {
        anchors.centerIn: parent
        text: "Testing"
    }
}
