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
import QtQuick.Layouts 1.3
import QtQuick.Controls 2.3
import Tulip.Controls 1.0 as TulipControls
import Tulip.Style 1.0

/*!
   \qmltype Subheader
   \inqmlmodule Tulip.Controls
   \ingroup tulipcontrols

   \brief Subheaders are special list tiles that delineate distinct sections of a list or grid list.

    For more information you can read the
    \l{https://material.io/guidelines/components/subheaders.html}{Material Design guidelines}.
 */
ItemDelegate {
    id: listItem

    /*!
        \qmlproperty color textColor

        Text color.
    */
    property alias textColor: label.color

    topPadding: TulipControls.Units.smallSpacing
    bottomPadding: TulipControls.Units.smallSpacing
    leftPadding: TulipControls.Units.mediumSpacing
    width: parent ? parent.width : undefined
    hoverEnabled: false
    opacity: enabled ? 1.0 : 0.6

    Layout.fillWidth: true

    background: Item {
        implicitHeight: label.contentHeight
    }

    contentItem: Label {
        id: label

        font.weight: Font.Bold
        font.pointSize: 14
        text: listItem.text

        verticalAlignment: Text.AlignVCenter

        color: ColorPalette.content
    }
}
