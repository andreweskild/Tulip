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
import QtQuick.Controls 2.3
import QtQuick.Layouts 1.3
import Tulip.Controls 1.0 as TulipControls

TulipControls.ApplicationWindow {
    id: window

    visible: true

    width: 1024
    height: 800

    title: qsTr("Tulip Demo")

    appBar.maxActionCount: 3

    TulipControls.NavigationDrawer {
        id: navDrawer

        width: Math.min(window.width, window.height) / 3 * 2
        height: window.height

        topContent: [
            Rectangle {
                color: "red"
                height: 48

                Label {
                    anchors.centerIn: parent
                    text: qsTr("Top Content")
                }

                Layout.fillWidth: true
            }
        ]

        actions: [
            TulipControls.Action {
                text: qsTr("Action 1")
                icon.source: TulipControls.Utils.iconUrl("action/info")
                onTriggered: console.log("action1 triggered")
            },
            TulipControls.Action {
                text: qsTr("Action 2")
                icon.source: TulipControls.Utils.iconUrl("action/info")
                hasDividerAfter: true
                onTriggered: console.log("action2 triggered")
            },
            TulipControls.Action {
                text: qsTr("Action 3")
                icon.source: TulipControls.Utils.iconUrl("action/info")
                onTriggered: console.log("action3 triggered")
            },
            TulipControls.Action {
                text: qsTr("Action 4")
                icon.source: TulipControls.Utils.iconUrl("action/info")
                onTriggered: console.log("action4 triggered")
            },
            TulipControls.Action {
                text: qsTr("Action 5")
                icon.source: TulipControls.Utils.iconUrl("action/info")
                visible: false
                onTriggered: console.log("action5 triggered")
            }
        ]
    }

    initialPage: TulipControls.TabbedPage {
        title: window.title


        leftAction: TulipControls.Action {
            icon.source: TulipControls.Utils.iconUrl("navigation/menu")
            onTriggered: navDrawer.open()
        }

        actions: [
            TulipControls.Action {
                text: qsTr("Dummy error")
                icon.source: TulipControls.Utils.iconUrl("alert/warning")
                toolTip: qsTr("Show a dummy error")
                onTriggered: console.log("Dummy error")
            },
            TulipControls.Action {
                text: qsTr("Colors")
                icon.source: TulipControls.Utils.iconUrl("image/color_lens")
                toolTip: qsTr("Pick a color")
                onTriggered: console.log("Colors")
            },
            TulipControls.Action {
                text: qsTr("Settings")
                icon.source: TulipControls.Utils.iconUrl("action/settings")
                toolTip: qsTr("Settings")
                hoverAnimation: true
                onTriggered: console.log("Settings clicked")
            },
            TulipControls.Action {
                text: qsTr("This should not be visible")
                icon.source: TulipControls.Utils.iconUrl("alert/warning")
                visible: false
            },
            TulipControls.Action {
                text: qsTr("Language")
                icon.source: TulipControls.Utils.iconUrl("action/language")
                enabled: false
            },
            TulipControls.Action {
                text: qsTr("Accounts")
                icon.source: TulipControls.Utils.iconUrl("action/account_circle")
            }
        ]

        BasicComponents {}
        LayoutComponents {}
        Controls {}
        Style {}
    }
}
