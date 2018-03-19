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
import QtQuick.Layouts 1.3
import Tulip.Controls 1.0 as TulipControls

/*!
    \qmltype AlertDialog
    \inqmlmodule Tulip.Controls
    \ingroup tulipcontrols

    \brief Alert dialogs are urgent interruptions to inform the user about a situation.

    An alert dialog is used to interrupt the user's workflow to inform them about
    a situation that requires their acknowledgement.

    Most alert don't need a title and they summarize a decision in a sentence or two
    by either asking a question or making a statement related to the action buttons.

    \snippet tulipcontrols-alertdialog.qml file

    For more information you can read the
    \l{https://material.io/guidelines/components/dialogs.html}{Material Design guidelines}.
*/
Dialog {
    /*!
        \internal
    */
    default property alias content: dialogContent.data

    /*!
        \qmlproperty string text

        Informative text to display.
    */
    property alias text: dialogLabel.text

    x: (parent.width - width) / 2
    y: (parent.height - height) / 2

    focus: true
    modal: true


    contentItem: Column {
        id: dialogContent
        spacing: TulipControls.Units.smallSpacing
        width: parent.width
        padding: 24

        Item {
            height: dialogLabel.contentHeight
            width: dialogLabel.contentWidth
            anchors.horizontalCenter: parent.horizontalCenter
            TulipControls.DialogLabel {
                id: dialogLabel
                wrapMode: Text.Wrap
                anchors.fill: parent
            }
        }

    }
}
