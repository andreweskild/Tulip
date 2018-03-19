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
import Tulip.Style 1.0
import "../.."

Item {
    TulipControls.Wave {
        id: wave
        anchors.fill: parent
        Rectangle {
            anchors.fill: parent
            color: ColorPalette.accent
        }
    }
    Button {
        anchors.centerIn: parent
        text: qsTr("Toggle")
        onClicked: {
            if (wave.open)
                wave.closeWave(parent.width - wave.size, parent.height - wave.size)
            else
                wave.openWave(0, 0)
        }
    }
}
