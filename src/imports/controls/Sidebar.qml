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
import Tulip.Controls 1.0
import Tulip.Style 1.0

/*!
   \qmltype Sidebar
   \inqmlmodule Tulip.Controls
   \ingroup tulipcontrols

   \brief A sidebar component for use in adaptive layouts

   To use, simply add an instance to your code, and anchor other components to it.

   To show or hide, set the expanded property.

   By default, the sidebar has a flickable built in, and whatever contents are added
   will be placed in the flickable. When you want this disabled, or want to fill the
   entire sidebar, set the autoFill property to false.

   Examples:
   \code
   Item {
       property bool wideAspect: width > Units.gu(80)

       Sidebar {
           expanded: wideAspect

           // Anchoring is automatic
       }
   }
   \endcode

 */
Pane {
    id: sidebar

    /*!
        \internal
    */
    default property alias model: list.model

    /*!
        \internal
    */
    property alias delegate: list.delegate

    /*!
       The text displayed for the action.
     */
    property int edge: Qt.LeftEdge

    /*!
       Show or hide the sidebar.
     */
    property bool expanded: true

    /*!
       Flick automatically.
     */
    property bool autoFlick: true

    /*!
        Index of currently selected Item
      */
    property int currentIndex: list.currentIndex


    Behavior on anchors.leftMargin {
        NumberAnimation { duration: 200 }
    }

    Behavior on anchors.rightMargin {
        NumberAnimation { duration: 200 }
    }

    anchors {
        left: edge === Qt.LeftEdge ? parent.left : undefined
        top: parent.top
        right: edge === Qt.RightEdge ? parent.right : undefined
        bottom: parent.bottom
        leftMargin: expanded ? 0 : -width
        rightMargin: expanded ? 0 : -width
    }

    width: resizeHandle.x


    padding: 0



    ListView {
        id: list
        ScrollBar.vertical: ScrollBar {}


        anchors {
            fill: parent
            // XXX - hack to align top of sidebar
            topMargin: 8
        }
    }

    Item {
        id: resizeHandle

        height: parent.height
        width: 4
        x: 200



        MouseArea {
            id: resizeArea

            anchors {
                fill: parent
                leftMargin: -4
            }


            cursorShape: Qt.SizeHorCursor

            drag.target: parent
            drag.axis: Drag.XAxis
            drag.minimumX: 140
            drag.maximumX: 200

        }
    }
}
