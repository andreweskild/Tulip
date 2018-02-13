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
import QtQuick.Controls.Universal 2.3
import Tulip.Controls 1.0
import "Pages/Layouts"

Tab {
    title: qsTr("Layout")

    Pane {
        id: listPane
        anchors {
            left: parent.left
            top: parent.top
            bottom: parent.bottom
        }
        width: 200
        padding: 0
        z: 2

        Material.background: "white"
        Material.elevation: 1

        Universal.background: Universal.accent

        ListView {
            id: listView
            anchors.fill: parent
            currentIndex: 0
            model: ListModel {
                ListElement { title: qsTr("AutomaticGrid"); source: "qrc:/qml/Pages/Layouts/AutomaticGridPage.qml" }
                ListElement { title: qsTr("ColumnFlow"); source: "qrc:/qml/Pages/Layouts/ColumnFlowPage.qml" }
            }
            header: Subheader {
                text: qsTr("Demos")
            }
            delegate: ListItem {
                text: model.title
                highlighted: ListView.isCurrentItem
                onClicked: {
                    listView.currentIndex = index
                    stackView.push(model.source)
                }
            }

            ScrollBar.vertical: ScrollBar {}
        }
    }

    StackView {
        id: stackView
        anchors {
            left: listPane.right
            top: parent.top
            right: parent.right
            bottom: parent.bottom
        }
        initialItem: AutomaticGridPage {}
    }
}