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

            Button {
                text: qsTr("Dialog")
                onClicked: datePickerDialogPortrait.open()
            }

            TulipControls.DisplayLabel {
                id: dateLabel
                level: 2
                text: qsTr("n.a.")
            }

            TulipControls.DatePicker {
                //orientation: TulipControls.DatePicker.Portrait
                selectedDate: new Date(2012, 11, 21)
            }
        }

        TulipControls.DatePickerDialog {
            id: datePickerDialogPortrait
            //orientation: TulipControls.DatePicker.Portrait
            selectedDate: new Date(2012, 11, 21)
            standardButtons: DialogButtonBox.Ok | DialogButtonBox.Cancel
//            standardButtonsContainer: Button {
//                height: parent.height - 5
//                anchors.verticalCenter: parent.verticalCenter
//                text: qsTr("Today")
//                flat: true
//                onClicked: datePickerDialogPortrait.selectedDate = new Date()
//            }
            onAccepted: dateLabel.text = selectedDate.toLocaleString(Qt.locale(), "yyyy-MM-dd")

            Material.theme: page.Material.theme
        }
    }
}
