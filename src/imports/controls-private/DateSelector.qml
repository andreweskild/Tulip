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

import QtQml 2.2
import QtQuick 2.10
import QtQuick.Layouts 1.3
import QtQuick.Controls 2.3
import QtQuick.Controls.Material 2.3
import Qt.labs.calendar 1.0
import Tulip.Controls 1.0 as TulipControls
import Tulip.Templates 1.0 as TulipTemplates
import Tulip.Style 1.0

TulipTemplates.DateSelector {
    id: control

    height: listView.height
    width: listView.width

    property alias currentItem: listView.currentItem

    onSelectedDateChanged: listView.currentIndex = listView.model.indexOf(selectedDate)

    navigator: Item {
        height: 32
        TulipControls.ToolButton {
            id: prevMonthButton

            anchors.left: parent.left
            anchors.top: parent.top
            anchors.leftMargin: 16

            icon.source: TulipControls.Utils.iconUrl("navigation/chevron_left")


            onClicked: listView.currentIndex--;
        }

        TulipControls.SubheadingLabel {
            anchors.verticalCenter: parent.verticalCenter
            anchors.horizontalCenter: parent.horizontalCenter
            text: control.locale.standaloneMonthName(listView.currentItem.currentModel.month) + " " + listView.currentItem.currentModel.year
        }

        TulipControls.ToolButton {
            id: nextMonthButton

            anchors.top: parent.top
            anchors.right: parent.right
            anchors.rightMargin: 16

            icon.source: TulipControls.Utils.iconUrl("navigation/chevron_right")

            onClicked: listView.currentIndex++;
        }
    }

    calendar: Item {
        ListView {
            id: listView
            clip: true
            height: currentItem.height
            width: currentItem.width
            snapMode: ListView.SnapOneItem
            orientation: ListView.Horizontal
            highlightRangeMode: ListView.StrictlyEnforceRange
            highlightMoveDuration: 0
            Component.onCompleted: currentIndex = listView.model.indexOf(selectedDate)

            model: CalendarModel {
                id: calendarModel
                from: control.from
                to: control.to
            }

            delegate: Column {
                id: monthGridDelegate

                property var currentModel: model

                Row {
                    x: weekNumbers.width
                    DayOfWeekRow {
                        visible: dayOfWeekRowVisible
                        //locale: grid.locale
                        spacing: 0

                        delegate: Label {
                            width: 32
                            text: model.shortName
                            font.weight: Font.DemiBold
                            font.pixelSize: 13
                            horizontalAlignment: Text.AlignHCenter
                            verticalAlignment: Text.AlignVCenter
                            color: "red"
                        }
                    }
                }

                Row {
                    WeekNumberColumn {
                        id: weekNumbers
                        visible: weekNumberVisible
                        month: grid.month
                        year: grid.year
                        //locale: grid.locale

                        width: 32
                        height: grid.height

                        delegate: Label {
                            text: model.weekNumber
                            font.weight: Font.DemiBold
                            font.pixelSize: 13
                            horizontalAlignment: Text.AlignHCenter
                            verticalAlignment: Text.AlignVCenter
                            color: "blue"
                        }

                    }

                    MonthGrid {
                        id: grid
                        month: model.month
                        year: model.year
                        //locale: control.locale

                        spacing: 0

                        delegate: Item {
                            height: 32
                            width: 32

                            Rectangle {
                                height: parent.height
                                width: parent.width
                                anchors.centerIn: parent
                                color: ColorPalette.raised
                                border.color: ColorPalette.raisedBorder
                                border.width: 1

                                Label {
                                    id: dayLabel
                                    text: model.day
                                    font.weight: Font.DemiBold
                                    font.pixelSize: 13
                                    font.underline: model.today
                                    width: parent.width
                                    height: parent.height
                                    horizontalAlignment: Text.AlignHCenter
                                    verticalAlignment: Text.AlignVCenter
                                    color: "green"
                                    opacity: model.month === grid.month ? 1 : 0
                                }

                                MouseArea {
                                    anchors.fill: parent
                                    enabled: model.month === grid.month
                                    onClicked: control.selectedDate = model.date
                                }

                                function isEqual(date) {
                                    return model.day === date.getDate() &&
                                            model.month === date.getMonth() &&
                                            model.year === date.getFullYear();
                                }
                            }
                        }

    //                    delegate: Item {
    //                        id: dayDelegate

    //                        Rectangle {
    //                            height: 32
    //                            width: 32
    //                            color: "green"
    //                            border.color: "black"
    //                            visible: model.month === grid.month ? 1 : 0
    //                        }

    //                    }
                    }
                }
            }
        }
    }
}
