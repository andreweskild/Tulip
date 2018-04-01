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

    height: listView.height + navigator.height
    width: listView.width

    property alias currentItem: listView.currentItem

    onSelectedDateChanged: listView.currentIndex = listView.model.indexOf(selectedDate)

    navigator: ToolBar {
        height: 32
        y: 1
        TulipControls.ToolButton {
            id: prevMonthButton
            height: parent.height
            width: height
            leftPadding: 0
            rightPadding: 0

            topRightRounded: true

            anchors.left: parent.left
            anchors.top: parent.top


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
            height: parent.height
            width: height
            leftPadding: 0
            rightPadding: 0

            topLeftRounded: true

            anchors.top: parent.top
            anchors.right: parent.right

            icon.source: TulipControls.Utils.iconUrl("navigation/chevron_right")

            onClicked: listView.currentIndex++;
        }
    }


    calendar: Item {
        ListView {
            id: listView
            clip: true
            height: 24 * 7
            width: 24 * 7 + 1
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

                Item {
                    height: weekNamesRow.height
                    width: weekNamesRow.width
                    Rectangle {
                        height: parent.height
                        width: parent.width + 1
                        color: ColorPalette.sunken
                        border.width: 1
                        border.color: ColorPalette.raisedBorder
                        DayOfWeekRow {
                            id: weekNamesRow
                            visible: dayOfWeekRowVisible
                            //locale: grid.locale
                            spacing: 0
                            topPadding: 0
                            bottomPadding: 0

                            delegate: Label {
                                width: 24
                                height: 24
                                text: model.shortName
                                font.weight: Font.DemiBold
                                horizontalAlignment: Text.AlignHCenter
                                verticalAlignment: Text.AlignVCenter
                                color: ColorPalette.content
                            }
                        }
                    }
                }

                Item {
                    width: grid.width
                    height: grid.height
                    x: 1
//                    Rectangle {
//                        width: weekNumbers.width
//                        height: weekNumbers.height + 1
//                        y: -1
//                        color: ColorPalette.sunken
//                        border.width: 1
//                        border.color: ColorPalette.sunkenBorder
//                        WeekNumberColumn {
//                            id: weekNumbers
//                            visible: weekNumberVisible
//                            month: grid.month
//                            year: grid.year
//                            //locale: grid.locale

//                            width: 24
//                            spacing: 0

//                            delegate: Label {
//                                height: 24
//                                width: 24
//                                leftPadding: 0
//                                rightPadding: 0
//                                text: model.weekNumber
//                                font.weight: Font.DemiBold
//                                horizontalAlignment: Text.AlignHCenter
//                                verticalAlignment: Text.AlignVCenter
//                                color: ColorPalette.content
//                            }

//                        }
//                    }

                    MonthGrid {
                        id: grid
                        month: model.month
                        year: model.year
                        //locale: control.locale

                        spacing: 0

                        delegate: Item {
                            height: 24
                            width: 24
                            z: button.hovered || button.highlighted ? 1000 : 0

                            ToolButton {
                                id: button
                                height: parent.height + 1
                                width: parent.width + 1
                                anchors.centerIn: parent
                                text: model.day
                                font.underline: model.today
                                enabled: model.month === grid.month
                                flat: !(model.month === grid.month)
                                highlighted: isEqual(selectedDate)

                                leftPadding: 0
                                rightPadding: 0

                                onClicked: control.selectedDate = model.date

//                                Label {
//                                    id: dayLabel
//                                    text: model.day
//                                    font.weight: Font.DemiBold
//                                    font.underline: model.today
//                                    width: parent.width
//                                    height: parent.height
//                                    horizontalAlignment: Text.AlignHCenter
//                                    verticalAlignment: Text.AlignVCenter
//                                    color: "green"
//                                    opacity: model.month === grid.month ? 1 : 0
//                                }

//                                MouseArea {
//                                    anchors.fill: parent
//                                    enabled: model.month === grid.month
//                                    onClicked: control.selectedDate = model.date
//                                }

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
