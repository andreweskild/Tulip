/*
 * This file is part of Tulip.
 *
 * Copyright (C) 2018 Pier Luigi Fiorini <pierluigi.fiorini@gmail.com>
 * Copyright (C) 2014-2016 Michael Spencer <sonrisesoftware@gmail.com>
 * Copyright (C) 2014 Bogdan Cuza <bogdan.cuza@hotmail.com>
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
import QtQuick.Controls.Material 2.3
import Tulip.Core 1.0
import Tulip.Style 1.0

/*!
   \qmltype InfoBar
   \inqmlmodule Tulip.Controls
   \ingroup tulipcontrols

   \brief InfoBar provides a lightweight feedback about an operation.

   \code
   Page {
       title: qsTr("Send a message")

       Button {
           anchors.centerIn: parent
           text: qsTr("Send Message")
           onClicked: infoBar.open(qsTr("Message sent"))
       }

       InfoBar {
           id: infoBar
       }
   }
   \endcode

    For more information you can read the
    \l{https://material.io/guidelines/components/snackbars-toasts.html}{Material Design guidelines}.
*/
Rectangle {
    id: infoBar

    /*!
        \qmlproperty string buttonText

        Button text. Empty by default.
        The button will not be visible if the text is empty.
    */
    property string buttonText

    /*!
        \qmlproperty color buttonColor

        Button color.
    */
    property color buttonColor: ColorPalette.contentAccented

    /*!
        \qmlproperty string text

        Text to display.
    */
    property string text

    /*!
        \qmlproperty bool opened

        Whether the bar is open or not.
    */
    property bool opened

    /*!
        \qmlproperty int duration

        Amount of time (in ms) to keep the notification visible.
        The default is 2s.
    */
    property int duration: 2000

    /*!
        \qmlproperty bool fullWidth

        Whether the bar should take full screen width.
        The default depends on the device: full width only on phones and tablets.
    */
    property bool fullWidth: Device.type === Device.phone || Device.type === Device.phablet

    /*!
        \qmlsignal clicked()

        This signal is emitted when the button is clicked.
        The handler is \c onClicked.
    */
    signal clicked()

    /*!
        \qmlmethod void InfoBar::open(string text)

        Open the bar with the specified \a text.
    */
    function open(text) {
        infoBar.text = text
        opened = true
        timer.restart()
    }

    anchors {
        left: fullWidth ? parent.left : undefined
        right: fullWidth ? parent.right : undefined
        bottom: parent.bottom
        bottomMargin: opened ? 0 :  -infoBar.height
        horizontalCenter: fullWidth ? undefined : parent.horizontalCenter

        Behavior on bottomMargin {
            NumberAnimation { duration: 300 }
        }
    }
    radius: fullWidth ? 0 : 2
    color: ColorPalette.sunkenDark
    border.color: ColorPalette.sunkenDarkBorder
    border.width: 1
    height: snackLayout.height
    width: fullWidth ? undefined : snackLayout.width
    opacity: opened ? 1 : 0

    Timer {
        id: timer

        interval: infoBar.duration

        onTriggered: {
            if (!running)
                infoBar.opened = false
        }
    }

    RowLayout {
        id: snackLayout

        anchors {
            verticalCenter: parent.verticalCenter
            left: infoBar.fullWidth ? parent.left : undefined
            right: infoBar.fullWidth ? parent.right : undefined
        }

        spacing: 0

        Item {
            width: 16
        }

        Label {
            id: snackText
            Layout.fillWidth: true
            Layout.minimumWidth: infoBar.fullWidth ? -1 : 216 - snackButton.width
            Layout.maximumWidth: infoBar.fullWidth ? -1 :
                Math.min(496 - snackButton.width - middleSpacer.width - 48,
                         infoBar.parent.width - snackButton.width - middleSpacer.width - 48)

            Layout.preferredHeight: lineCount == 2 ? 48 : 32
            verticalAlignment: Text.AlignVCenter
            maximumLineCount: 2
            wrapMode: Text.Wrap
            elide: Text.ElideRight
            text: infoBar.text
            color: ColorPalette.contentSecondary
        }

        Item {
            id: middleSpacer
            width: infoBar.buttonText == "" ? 0 : infoBar.fullWidth ? 24 : 48
        }

        ToolButton {
            id: snackButton
            visible: infoBar.buttonText != ""
            text: infoBar.buttonText
            Layout.fillHeight: true
            width: visible ? implicitWidth : 0
            font.bold: true
            onClicked: infoBar.clicked()
        }

    }

    Behavior on opacity {
        NumberAnimation { duration: 300 }
    }
}
