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
import Tulip.Core 1.0 as TulipCore

/*!
    \qmltype DialogLabel
    \inqmlmodule Tulip.Controls
    \ingroup tulipcontrols

    \brief Text label with standard font and styling suitable to message box text.

    Text label for the Material Design dialog text style.

    \snippet tulipcontrols-dialoglabel.qml file

    For more information you can read the
    \l{https://material.io/guidelines/style/typography.html}{Material Design guidelines}.
*/
Label {
    font.pixelSize: TulipCore.Device.isMobile ? 18 : 17
    color: Material.secondaryTextColor
}
