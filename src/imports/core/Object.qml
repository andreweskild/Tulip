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

/*!
    \qmltype Object
    \inqmlmodule Tulip.Core
    \ingroup tulipcore

    \brief A \l QtObject with children.

    The \l Object type is a non-visual element that extends \l QtObject
    with the ability to hold children objects.

   \qml
   import QtQuick 2.10
   import Tulip.Core 1.0 as TulipCore

   TulipCore.Object {
       QtObject {}
       QtObject {}
   }
   \endqml
*/
QtObject {
    id: object

    /*!
        \internal
    */
    default property alias children: object.__children

    /*!
        \internal
    */
    property list<QtObject> __children: [QtObject {}]
}
