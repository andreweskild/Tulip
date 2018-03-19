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
import QtQuick.Controls 2.3
import QtQuick.Controls.Material 2.3
import QtQuick.Layouts 1.3
import Tulip.Controls 1.0 as TulipControls
import Tulip.Controls.Private 1.0 as TulipControlsPrivate
import Tulip.Templates 1.0 as TulipTemplates
import Tulip.Style 1.0
import Qt.labs.calendar 1.0

Item {
    id: picker

    property date from:new Date(2000, 1, 1)
    property date to: new Date(2500, 1, 1)
    property date selectedDate: new Date(2018, 1, 1)

    height: 400
    width: 400

    property bool dayOfWeekRowVisible: true
    property bool weekNumberVisible: true

    TulipControlsPrivate.DateSelector {
        id: dateSelector
        dayOfWeekRowVisible: picker.dayOfWeekRowVisible
        weekNumberVisible: picker.weekNumberVisible
        from: picker.from
        to: picker.to
//        locale: picker.locale
       // visible: picker.mode === TulipTemplates.DatePicker.Month
        onSelectedDateChanged: {
            if (picker.selectedDate !== selectedDate) {
                var date = new Date(picker.selectedDate.getTime());
                date.setDate(selectedDate.getDate());
                date.setMonth(selectedDate.getMonth());
                date.setFullYear(selectedDate.getFullYear());
                picker.selectedDate = new Date(date.getTime());
                yearSelector.selectedYear = selectedDate.getFullYear();
            }
        }

        Binding {
            target   : dateSelector
            property : "selectedDate"
            value    : picker.selectedDate
        }
    }

    TulipControlsPrivate.YearSelector {
        id: yearSelector
//            width: parent.width
//            height: parent.height
        from: picker.from
        to: picker.to
        //visible: picker.mode === TulipTemplates.DatePicker.Year
        onSelectedYearChanged: {
            if (picker.selectedDate.getFullYear() !== selectedYear) {
                var date = new Date(picker.selectedDate.getTime());
                date.setFullYear(selectedYear);
                picker.selectedDate = new Date(date.getTime());
                dateSelector.selectedDate = new Date(date.getTime());
            }
        }
    }
}

//TulipTemplates.DatePicker {
//    id: picker

//    /*!
//        \internal
//    */
//    readonly property bool __footerIsVisible: footer && footer.children.length > 0


//    implicitWidth: background.implicitWidth
//    implicitHeight: background.implicitHeight

//    background: Pane {
//        implicitWidth: 340
//        implicitHeight: 470

//        locale: picker.locale

//        radius: 4
//    }

////    header: Rectangle {
////        color: ColorPalette.sunkenDark

////        ColumnLayout {
////            anchors.fill: parent
////            anchors.margins: 16
////            spacing: 0

////            TulipControls.BodyLabel {
////                text: yearSelector.selectedYear
////                level: 2
////                color: "white"
////                opacity: yearSelector.visible ? 1 : 0.7
////                font.pixelSize: 16

////                MouseArea {
////                    anchors.fill: parent
////                    onClicked: picker.mode = TulipTemplates.DatePicker.Year
////                }
////            }

////            Label {
////                Layout.fillWidth: true
////                Layout.fillHeight: true
////                text: dateSelector.selectedDate.toLocaleString(picker.locale, "ddd, MMM dd")
////                font.pixelSize: 30
////                color: "white"
////                wrapMode: Text.Wrap
////                opacity: dateSelector.visible ? 1 : 0.7

////                MouseArea {
////                    anchors.fill: parent
////                    onClicked: picker.mode = TulipTemplates.DatePicker.Month
////                }
////            }
////        }
////    }

//    selector: Item {
//        TulipControlsPrivate.DateSelector {
//            id: dateSelector
//            dayOfWeekRowVisible: picker.dayOfWeekRowVisible
//            weekNumberVisible: picker.weekNumberVisible
//            from: picker.from
//            to: picker.to
//            locale: picker.locale
//            visible: picker.mode === TulipTemplates.DatePicker.Month
//            onSelectedDateChanged: {
//                if (picker.selectedDate !== selectedDate) {
//                    var date = new Date(picker.selectedDate.getTime());
//                    date.setDate(selectedDate.getDate());
//                    date.setMonth(selectedDate.getMonth());
//                    date.setFullYear(selectedDate.getFullYear());
//                    picker.selectedDate = new Date(date.getTime());
//                    yearSelector.selectedYear = selectedDate.getFullYear();
//                }
//            }

//            Binding {
//                target   : dateSelector
//                property : "selectedDate"
//                value    : picker.selectedDate
//            }
//        }

//        TulipControlsPrivate.YearSelector {
//            id: yearSelector
////            width: parent.width
////            height: parent.height
//            from: picker.from
//            to: picker.to
//            visible: picker.mode === TulipTemplates.DatePicker.Year
//            onSelectedYearChanged: {
//                if (picker.selectedDate.getFullYear() !== selectedYear) {
//                    var date = new Date(picker.selectedDate.getTime());
//                    date.setFullYear(selectedYear);
//                    picker.selectedDate = new Date(date.getTime());
//                    dateSelector.selectedDate = new Date(date.getTime());
//                }
//            }
//        }
//    }
//}
