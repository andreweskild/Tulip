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
import QtQuick.Layouts 1.3
import QtQuick.Controls 2.3
import QtQuick.Controls.impl 2.3
import Tulip.Core 1.0 as TulipCore
import Tulip.Controls 1.0 as TulipControls
import Tulip.Style 1.0

/*!
   \qmltype ListItem
   \inqmlmodule Tulip.Controls
   \ingroup tulipcontrols

   \brief A standard list item, with one or more lines of text and optional left and right items.
 */
ItemDelegate {
    id: listItem

    /*!
        \qmlproperty int dividerInset

        How many pixels the divider is from the left border.
        This property is set to the \l leftItem width by default.

        \sa ListItem::showDivider
        \sa ListItem::leftItem
    */
    property int dividerInset: leftItem.showing ? listItem.height : 0

    /*!
        \qmlproperty bool showDivider

        This property holds whether the divider is shown or not.
        Default value is \c false.
    */
    property alias showDivider: divider.visible

    /*!
        \qmlproperty int maximumLineCount

        Maximum number of text lines allowed to show.
    */
    property int maximumLineCount: 2

    /*!
        \qmlproperty string subText

        Text to display below \l text.
    */
    property alias subText: subLabel.text

    /*!
        \qmlproperty string valueText

        Value text.
    */
    property alias valueText: valueLabel.text

    /*!
        \qmlproperty Item leftItem

        Item to show on the left.
    */
    property alias leftItem: leftItem.children

    /*!
        \qmlproperty Item rightItem

        Item to show on the right.
    */
    property alias rightItem: rightItem.children

    /*!
        \qmlproperty Item secondaryItem

        Secondary item.
    */
    property alias secondaryItem: secondaryItem.children

    /*!
        \internal
    */
    readonly property bool __isIconEmpty: listItem.icon.name === "" && listItem.icon.source.toString() === ""

    icon.width: 20
    icon.height: 20
    icon.color: "red"

    leftPadding: TulipControls.Units.mediumSpacing
    rightPadding: TulipControls.Units.mediumSpacing
    topPadding: 0
    bottomPadding: 0

    width: parent ? parent.width : undefined

    hoverEnabled: true

    opacity: enabled ? 1.0 : 0.6

    Layout.fillWidth: true

    TulipControls.ThinDivider {
        id: divider

        x: dividerInset
        y: parent.height - height

        width: parent.width - x

        visible: false
    }

    contentItem: RowLayout {
        implicitHeight: {
            var height = 0;

            if (subText != "") {
                if (maximumLineCount == 2)
                    height = 72;
                else
                    height = 88;
            } else {
                if (secondaryItem.showing)
                    height = secondaryItem.childrenRect.height + (label.visible ? TulipControls.Units.largeSpacing * 2 : TulipControls.Units.smallSpacing * 2);
                else
                    height = 20;
            }

            var leftHeight = leftItem.childrenRect.height + TulipControls.Units.smallSpacing * 2;
            var rightHeight = rightItem.childrenRect.height + TulipControls.Units.smallSpacing * 2;

            return Math.max(height, leftHeight, rightHeight);
        }

        spacing: TulipControls.Units.smallSpacing * 2

        Item {
            id: leftItem

            readonly property bool showing: visibleChildren.length > 0

            objectName: "leftItem"

            Layout.preferredWidth: showing ? 20 : 0
            Layout.preferredHeight: width
            Layout.alignment: Qt.AlignCenter

            IconLabel {
                objectName: "icon"

                anchors {
                    verticalCenter: parent.verticalCenter
                    left: parent.left
                }

                spacing: 4
                mirrored: listItem.mirrored
                display: IconLabel.IconOnly

                icon: listItem.icon
                color: "green"
                visible: !listItem.__isIconEmpty
            }
        }

        ColumnLayout {
            Layout.alignment: Qt.AlignLeft | Qt.AlignVCenter
            Layout.fillWidth: true

            spacing: 0

            RowLayout {
                Layout.fillWidth: true
                Layout.alignment: Qt.AlignLeft | Qt.AlignVCenter

                visible: label.text != "" || valueLabel.text != ""

                TulipControls.SubheadingLabel {
                    id: label
                    objectName: "textLabel"

                    Layout.alignment: Qt.AlignVCenter
                    Layout.fillWidth: true

                    verticalAlignment: Text.AlignVCenter
                    text: listItem.text
                    elide: Text.ElideRight
                    color: listItem.hovered || listItem.pressed || listItem.highlighted ?
                               ColorPalette.contentAccented : ColorPalette.content
                    visible: text != ""
                    Behavior on color {
                        ColorAnimation {
                            duration: 150
                            easing {
                                type: Easing.InOutSine
                            }
                        }
                    }
                }

                TulipControls.BodyLabel {
                    id: valueLabel
                    objectName: "valueLabel"

                    Layout.alignment: Qt.AlignVCenter
                    Layout.preferredWidth: visible ? implicitWidth : 0
                    Layout.preferredHeight: visible ? implicitHeight : 0

                    color: "white"
                    elide: Text.ElideRight

                    visible: text != ""
                }
            }

            TulipControls.BodyLabel {
                id: subLabel
                objectName: "subTextLabel"

                Layout.fillWidth: true
                Layout.preferredHeight: visible ? implicitHeight * maximumLineCount/lineCount : 0

                color: "orange"
                elide: Text.ElideRight
                wrapMode: Text.WordWrap

                visible: text != "" && !contentItem.showing
                maximumLineCount: visible ? listItem.maximumLineCount - 1 : 0
            }

            Item {
                id: secondaryItem

                readonly property bool showing: visibleChildren.length > 0

                objectName: "secondaryItem"

                Layout.fillWidth: true
                Layout.preferredHeight: showing ? childrenRect.height + (label.visible ? TulipControls.Units.smallSpacing : TulipControls.Units.largeSpacing) : 0
            }
        }

        Item {
            id: rightItem

            readonly property bool showing: visibleChildren.length > 0

            objectName: "rightItem"

            Layout.preferredWidth: showing ? childrenRect.width : 0
            Layout.preferredHeight: parent.height
        }
    }

}
