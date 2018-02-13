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

/*!
    \qmltype DateTimePickerDialog
    \inqmlmodule Tulip.Controls
    \ingroup tulipcontrols

    \brief Dialog with a picker to select dates and time

    A dialog that lets you select dates and time.

    \code
    import QtQuick 2.10
    import Tulip.Controls 1.0 as TulipControls

    Item {
        width: 600
        height: 600

        TulipControls.DateTimePickerDialog {
            onAccepted: {
                console.log(selectedDate);
            }
            standardButtons: DialogButtonBox.Ok | DialogButtonBox.Cancel
        }
    }
    \endcode

    For more information you can read the
    \l{https://material.io/guidelines/components/pickers.html}{Material Design guidelines}.
*/
Dialog {
    id: dialog

    /*!
        \qmlproperty enumeration Tulip.Controls::DateTimePickerDialog::orientation

        This property holds the picker orientation.
        The default value is automatically selected based on the device orientation.

        Possible values:
        \value DatePicker.Landscape The picker is landscape.
        \value DatePicker.Portrait The picker is portrait.
    */
    property alias orientation: dateTimePicker.orientation

    /*!
        \qmlproperty bool Tulip.Controls::DateTimePickerDialog::dayOfWeekRowVisible

        This property determines the visibility of the day of week row.
    */
    property alias dayOfWeekRowVisible: dateTimePicker.dayOfWeekRowVisible

    /*!
        \qmlproperty bool Tulip.Controls::DateTimePickerDialog::weekNumberVisible

        This property determines the visibility of the week number column.
    */
    property alias weekNumberVisible: dateTimePicker.weekNumberVisible

    /*!
        \qmlproperty bool Tulip.Controls::DateTimePicker::prefer24Hour

        This property determines the visibility of the AM/PM switch.
    */
    property alias prefer24Hour: dateTimePicker.prefer24Hour

    /*!
        \qmlproperty date Tulip.Controls::DateTimePickerDialog::from

        This property holds the start date.
    */
    property alias from: dateTimePicker.from

    /*!
        \qmlproperty date Tulip.Controls::DateTimePickerDialog::to

        This property holds the end date.
    */
    property alias to: dateTimePicker.to

    /*!
        \qmlproperty date Tulip.Controls::DateTimePickerDialog::selectedDateTime

        This property holds the date and time that has been selected by the user.
        The default value is the current date and time.
    */
    property alias selectedDateTime: dateTimePicker.selectedDateTime

    /*!
        \qmlproperty list<Object> Tulip.Controls::DateTimePickerDialog::standardButtonsContainer

        This property allows you to place additional buttons alongside the standard buttons
        of the dialog, like in this example:

        \code
        TulipControls.DateTimePickerDialog {
            id: dateTimePickerDialog
            standardButtons: DialogButtonBox.Ok | DialogButtonBox.Cancel
            standardButtonsContainer: Button {
                anchors.verticalCenter: parent.verticalCenter
                text: qsTr("Now")
                flat: true
                onClicked: dateTimePickerDialog.selectedDate = new Date()
            }
        }
        \endcode
    */
    property alias standardButtonsContainer: buttonBox.data

    x: (parent.width - width) / 2
    y: (parent.height - height) / 2
    padding: 0
    margins: 0
    topMargin: 0
    topPadding: 0
    modal: true

    header.visible: false
    footer.visible: false

    TulipControls.DateTimePicker {
        id: dateTimePicker
        footer: DialogButtonBox {
            id: buttonBox
            padding: 0
            standardButtons: dialog.standardButtons
            onAccepted: dialog.accept()
            onRejected: dialog.reject()

            Material.background: "transparent"
        }
    }
}
