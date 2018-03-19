/*
 * This file is part of Tulip.
 *
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
import QtQuick.Controls.Material 2.3
import Tulip.Controls 1.0 as TulipControls

/*!
   \qmltype AppToolBar
   \inqmlmodule Tulip.Controls
   \ingroup tulipcontrols

   \brief Application tool bar.
 */
ToolBar {
    id: toolbar

    Material.elevation: page ? page.menuBar.elevation : 2
    Material.background: Material.primaryColor
    Material.theme: TulipControls.Color.isDarkColor(Material.background) ? Material.Dark : Material.Light

    /*!
        \internal
     */
    property Page page

    /*!
        \qmlproperty int maxActionCount

        Maximum actions to be available on this tool bar.
     */
    property int maxActionCount: 3

    /*!
        \qmlmethod void AppToolBar::pop(Page page)

        Pop the \l menuBar that belongs to \a page from the stack.
     */
    function pop(page) {
        stack.pop(page.menuBar, StackView.PopTransition);
        toolbar.page = page;
    }

    /*!
        \qmlmethod void AppToolBar::push(Page page)

        Push the \l menuBar that belongs to \a page to the stack.
     */
    function push(page) {
        stack.push(page.menuBar, {}, StackView.PushTransition);
        page.menuBar.toolbar = toolbar;
        toolbar.page = page;
    }

    /*!
        \qmlmethod void AppToolBar::replace(Page page)

        Replace current \l menuBar with the one that belongs to \a page.
     */
    function replace(page) {
        stack.replace(page.menuBar, {}, StackView.ReplaceTransition);
        page.menuBar.toolbar = toolbar;
        toolbar.page = page;
    }

    StackView {
        id: stack

        anchors.fill: parent

        popEnter: Transition {
            NumberAnimation { property: "y"; from: 0.5 *  -stack.height; to: 0; duration: 250; easing.type: Easing.OutCubic }
            NumberAnimation { property: "opacity"; from: 0.0; to: 1.0; duration: 250; easing.type: Easing.OutCubic }
        }
        popExit: Transition {
            NumberAnimation { property: "y"; from: 0; to: 0.5 * stack.height; duration: 250; easing.type: Easing.OutCubic }
            NumberAnimation { property: "opacity"; from: 1.0; to: 0.0; duration: 250; easing.type: Easing.OutCubic }
        }

        pushEnter: Transition {
            NumberAnimation { property: "y"; from: 0.5 * stack.height; to: 0; duration: 250; easing.type: Easing.OutCubic }
            NumberAnimation { property: "opacity"; from: 0.0; to: 1.0; duration: 250; easing.type: Easing.OutCubic }
        }
        pushExit: Transition {
            NumberAnimation { property: "y"; from: 0; to: 0.5 * -stack.height; duration: 250; easing.type: Easing.OutCubic }
            NumberAnimation { property: "opacity"; from: 1.0; to: 0.0; duration: 250; easing.type: Easing.OutCubic }
        }
    }
}
