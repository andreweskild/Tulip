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
   \qmltype AppBar
   \inqmlmodule Tulip.Controls
   \ingroup tulipcontrols

   \brief Application tool bar.

    For more information you can read the
    \l{https://material.io/guidelines/layout/structure.html#structure-app-bar}{Material Design guidelines}.
 */
QQC2.ToolBar {
    id: appBar


    /*!
        \qmlproperty Action leftAction

        The back action to display to the left of the title in the action bar.
        When used with a page, this will pick up the page's back action, which
        by default is a back arrow when there is a page behind the current page
        on the page stack. However, you can customize this, for example, to show
        a navigation drawer at the root of your app.

        When using an action bar in a page, set the \l Page::leftAction instead of
        directly setting this property.
    */
    property TulipControls.Action leftAction

    /*!
        \qmlproperty list<Action> actions

        A list of actions to show in the action bar. These actions will be shown
        anchored to the right, and will overflow if there are more than the
        maximum number of actions as defined in \l maxActionCount.

        When used with a page, the actions will be set to the page's \l Page::actions
        property, so set that instead of changing this directly.
    */
    property list<TulipControls.Action> actions

    /*!
        \qmlproperty int elevation

        The elevation of the action bar. Set to 0 if you want have a header or some
        other view below the action bar that you want to appear as part of the action bar.
    */

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

    implicitHeight: TulipCore.Device.gridUnit

    TulipControls.ToolButton {
        id: leftButton

        property bool showing: leftAction && leftAction.visible
        //property int margin: (width - 24)/2

        QQC2.ToolTip.visible: QQC2.ToolTip.text != "" && (TulipCore.Device.isMobile ? pressed : hovered)
        QQC2.ToolTip.delay: Qt.styleHints.mousePressAndHoldInterval
        QQC2.ToolTip.text: leftAction ? leftAction.toolTip : ""

        anchors {
            verticalCenter: actionsRow.verticalCenter
            left: parent.left
            leftMargin: leftButton.showing ? 16 : -leftButton.width
        }

        icon.width: appBar.__iconSize
        icon.height: appBar.__iconSize
        icon.name: leftAction ? leftAction.icon.name : ""
        icon.source: leftAction ? leftAction.icon.source : ""

        Binding {
            target: leftButton
            property: "icon.color"
            value: leftAction.icon.color
            when: leftAction && leftAction.icon.color.a > 0
        }

        visible: leftAction && leftAction.visible
        enabled: leftAction && leftAction.enabled
        hoverAnimation: leftAction && leftAction.hoverAnimation
        focusPolicy: Qt.TabFocus
        onClicked: {
            if (leftAction)
                leftAction.triggered(leftButton)
        }
    }


    Row {
        id: actionsRow

        anchors {
            right: parent.right
            rightMargin: 16
        }

        height: appBar.height

        spacing: 24

        Repeater {
            model: appBar.actions.length > appBar.maxActionCount && appBar.maxActionCount > 0
                   ? appBar.maxActionCount : appBar.actions.length
            delegate: TulipControls.ToolButton {
                id: actionButton

                QQC2.ToolTip.visible: QQC2.ToolTip.text !== "" && !overflowMenu.visible && (TulipCore.Device.isMobile ? pressed : hovered)
                QQC2.ToolTip.delay: Qt.styleHints.mousePressAndHoldInterval
                QQC2.ToolTip.text: appBar.actions[index].toolTip

                anchors.verticalCenter: parent.verticalCenter

                icon.width: appBar.__iconSize
                icon.height: appBar.__iconSize
                icon.name: appBar.actions[index].icon.name
                icon.source: appBar.actions[index].icon.source

                Binding {
                    target: actionButton
                    property: "icon.color"
                    value: appBar.actions[index].icon.color
                    when: appBar.actions[index].icon.color.a > 0
                }

                visible: appBar.actions[index].visible
                enabled: appBar.actions[index].enabled
                hoverAnimation: appBar.actions[index].hoverAnimation
                focusPolicy: Qt.TabFocus

                onClicked: appBar.actions[index].triggered(actionButton)
            }
        }

        TulipControls.ToolButton {
            id: overflowButton

            anchors.verticalCenter: parent.verticalCenter

            icon.width: appBar.__iconSize
            icon.height: appBar.__iconSize
            icon.source: TulipControls.Utils.iconUrl("navigation/more_vert")

            onClicked: overflowMenu.open()

            visible: appBar.actions.length > appBar.maxActionCount && appBar.maxActionCount > 0
            focusPolicy: Qt.TabFocus

            QQC2.Menu {
                id: overflowMenu

                x: -width + overflowButton.width - overflowButton.rightPadding
                y: overflowButton.topPadding
                transformOrigin: QQC2.Menu.TopRight

                Instantiator {
                    model: appBar.actions.length > appBar.maxActionCount && appBar.maxActionCount > 0
                           ? appBar.actions.length - appBar.maxActionCount : 0
                    delegate: QQC2.MenuItem {
                        id: overflowMenuItem

//                        icon.width: appBar.__iconSize
//                        icon.height: appBar.__iconSize
//                        icon.name: appBar.actions[index + appBar.maxActionCount].icon.name
//                        icon.source: appBar.actions[index + appBar.maxActionCount].icon.source

                        Binding {
                            target: overflowMenuItem
                            property: "icon.color"
                            value: appBar.actions[index + appBar.maxActionCount].icon.color
                            when: appBar.actions[index + appBar.maxActionCount].icon.color.a > 0
                        }

                        text: appBar.actions[index + appBar.maxActionCount].text

                        enabled: appBar.actions[index + appBar.maxActionCount].enabled
                        visible: appBar.actions[index + appBar.maxActionCount].visible

                        onTriggered: appBar.actions[index + appBar.maxActionCount].triggered(overflowMenuItem)
                    }
                    onObjectAdded: overflowMenu.addItem(object)
                    onObjectRemoved: overflowMenu.removeItem(index)
                }
            }
        }
    }
}
