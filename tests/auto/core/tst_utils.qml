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
import QtTest 1.0
import Tulip.Core 1.0 as TulipCore

TestCase {
    name: "UtilsTests"

    function test_scale() {
        compare(TulipCore.Utils.scale(50, 0, 1), 0.5);
        compare(TulipCore.Utils.scale(50, 0, 100), 50);
        compare(TulipCore.Utils.scale(50, 50, 100), 75);
        compare(TulipCore.Utils.scale(50, 1, 100), 50.5);
    }
}
