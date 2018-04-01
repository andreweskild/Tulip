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


    x: 20
    y: 20

    width: 1024
    height: 800

    title: qsTr("Tulip Demo")

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


        appActions:[
            TulipControls.Action {
                text: "About App"
                icon.source: TulipControls.Utils.iconUrl("navigation/menu")
                onTriggered: navDrawer.open()
            },
            TulipControls.Action {
                text: "Help"
                icon.source: TulipControls.Utils.iconUrl("navigation/menu")
                onTriggered: navDrawer.open()
            },
            TulipControls.Action {
                text: "Quit"
                icon.source: TulipControls.Utils.iconUrl("navigation/menu")
                onTriggered: Qt.quit()
            }
        ]

        fileActions:[
            TulipControls.Action {
                text: "New.."
                icon.source: TulipControls.Utils.iconUrl("navigation/menu")
                onTriggered: navDrawer.open()
            },
            TulipControls.Action {
                text: "Open.."
                icon.source: TulipControls.Utils.iconUrl("navigation/menu")
                onTriggered: navDrawer.open()
            },
            TulipControls.Action {
                text: "Save.."
                icon.source: TulipControls.Utils.iconUrl("navigation/menu")
                onTriggered: navDrawer.open()
            }
        ]

        editActions:[
            TulipControls.Action {
                text: "Cut"
                icon.source: TulipControls.Utils.iconUrl("navigation/menu")
                onTriggered: navDrawer.open()
            },
            TulipControls.Action {
                text: "Copy"
                icon.source: TulipControls.Utils.iconUrl("navigation/menu")
                onTriggered: navDrawer.open()
            },
            TulipControls.Action {
                text: "Paste"
                icon.source: TulipControls.Utils.iconUrl("navigation/menu")
                onTriggered: navDrawer.open()
            }
        ]

        BasicComponents {}
        LayoutComponents {}
        Controls {}
        Style {}
    }
}
