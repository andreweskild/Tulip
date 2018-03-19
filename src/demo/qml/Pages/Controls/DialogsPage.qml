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

Item {
    Column {
        anchors.centerIn: parent

        Button {
            text: qsTr("Alert")
            onClicked: alert.open()
        }

        Button {
            text: qsTr("Input")
            onClicked: input.open()
        }
    }

    TulipControls.AlertDialog {
        id: alert

        x: (parent.width - width) / 2
        y: (parent.height - height) / 2

        text: qsTr("Discard draft?")
        standardButtons: Dialog.Discard | Dialog.Cancel
    }

    TulipControls.InputDialog {
        id: input

        x: (parent.width - width) / 2
        y: (parent.height - height) / 2
        width: 280

        text: qsTr("We need to know in what year you were born in order to verify your age.")
        textField.inputMask: "9999"
        textField.placeholderText: qsTr("Type a 4 digits number")
    }
}
