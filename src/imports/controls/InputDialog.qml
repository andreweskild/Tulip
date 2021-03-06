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
import QtQuick.Layouts 1.3
import QtQuick.Controls 2.3
import Tulip.Controls 1.0 as TulipControls

/*!
    \qmltype InputDialog
    \inqmlmodule Tulip.Controls
    \ingroup tulipcontrols

    \brief Input dialogs ask the user to input data with certain constraints.

    The dialog is automatically accepted when the Return or Enter key is pressed
    and the input in an acceptable state.

    For more information you can read the
    \l{https://material.io/guidelines/components/dialogs.html}{Material Design guidelines}.
*/
Dialog {
    id: dialog

    /*!
        \qmlproperty TextField textField

        Text field.
    */
    property alias textField: textField

    /*!
        \qmlproperty string text

        Dialog text.
    */
    property alias text: dialogLabel.text

    focus: true
    modal: true
    standardButtons: Dialog.Ok | Dialog.Cancel

    footer: DialogButtonBox {
        visible: count > 0
    }

    contentItem: Column {
        padding: 12
        width: parent.width
        spacing: 12

        TulipControls.DialogLabel {
            id: dialogLabel
            width: parent.width - parent.padding * 2
            wrapMode: Text.Wrap
            visible: text !== ""
        }

        TextField {
            id: textField
            focus: true
            onAccepted: dialog.accept()
            width: parent.width - parent.padding * 2
        }
    }
}
