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

#include "utils.h"

/*!
    \qmltype Utils
    \inqmlmodule Tulip.Controls
    \ingroup tulipcontrols

    \brief A collection of helpful utility methods.
*/
Utils::Utils(QObject *parent)
    : QObject(parent)
{
}

/*!
    \qmlmethod url Tulip.Controls::Utils::iconUrl(string name)

    Returns an URL for the Material Design icon \a name.
    Use this URL with Image or icon grouped property with controls.

    \code
    import QtQuick 2.10

    Image {
        source: TulipControls.Utils.iconUrl("action/alarm")
        width: 64
        height: 64
    }
    \endcode

    \code
    import QtQuick 2.10
    import QtQuick.Controls 2.3

    Button {
        icon.source: TulipControls.Utils.iconUrl("action/alarm")
        text: qsTr("Alarm")
    }
    \endcode
*/
QUrl Utils::iconUrl(const QString &name)
{
    return QUrl(QStringLiteral("qrc:/tulip.io/imports/Tulip/Controls/icons/%1.svg").arg(name));
}
