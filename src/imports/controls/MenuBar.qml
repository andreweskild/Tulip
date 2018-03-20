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

import QtQml 2.2
import QtQuick 2.10
import QtQuick.Controls 2.3 as QQC2
import QtQuick.Layouts 1.3
import Tulip.Core 1.0 as TulipCore
import Tulip.Controls 1.0 as TulipControls
import Tulip.Style 1.0

/*!
   \qmltype MenuBar
   \inqmlmodule Tulip.Controls
   \ingroup tulipcontrols

   \brief Application menu bar.

 */
QQC2.ToolBar {
    id: menuBar

    height: 32

    property string title


    property list<TulipControls.Action> appActions

    property list<TulipControls.Action> fileActions

    property list<TulipControls.Action> editActions

    property alias centerContents: centerContentsContainer.children

    /*!
       \internal
       The size of the left icon and the action icons.
    */
    property int __iconSize: 24



    /*!
        \qmlproperty int maxActionCount

        The maximum number of actions that can be displayed before they spill over
        into a drop-down menu. When using an action bar with a page, this inherits
        from the global \l AppToolBar::maxActionCount. If you are using an action bar
        for custom purposes outside of a toolbar, this defaults to \c 3.

        Set to \c 0 if you don't want to overflow actions.
    */
    property int maxActionCount: toolbar ? toolbar.maxActionCount : 3


    /*!
        \qmlproperty AppToolBar toolbar

        Tool bar.
    */
    property TulipControls.AppToolBar toolbar

    QQC2.MenuBar {
        id: menuButtons
        width: 200
        height: menuBar.height
        anchors {
            left: parent.left
        }

        QQC2.Menu {
            id: appMenu
            title: menuBar.title != "" ? menuBar.title : "App Menu"


            contentData: appActions
        }

        QQC2.Menu {
            id: fileMenu
            title: "File"

            contentData: fileActions
        }

        QQC2.Menu {
            id: editMenu
            title: "Edit"

            contentData: editActions
        }

    }

    Item {
        id: centerContentsContainer

        x: menuButtons.width

        height: menuBar.height
        width: menuBar.width - menuButtons.width - windowControls.width

    }

    Row {
        id: windowControls

        height: menuBar.height

        spacing: -1

        anchors {
            right: parent.right
        }

        TulipControls.ToolButton {
            text: "_"
            height: parent.height
        }
        TulipControls.ToolButton {
            text: "[ ]"
            height: parent.height
        }
        TulipControls.ToolButton {
            text: "x"
            height: parent.height
            onClicked: Qt.quit()
        }
    }
}
