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

TulipTemplates.TimePicker {
    id: picker

    /*!
        \internal
    */
    readonly property bool __isLandscape : picker.orientation === TulipTemplates.TimePicker.Landscape

    /*!
        \internal
    */
    readonly property bool __footerIsVisible: footer && footer.children.length > 0

    onSelectedTimeChanged: {
        timeSelector.selectedTime = selectedTime;
    }

    Component.onCompleted: {
        timeSelector.selectedTime = picker.selectedTime;
    }

    implicitWidth: background.implicitWidth
    implicitHeight: background.implicitHeight

    background: Pane {
        implicitWidth: __isLandscape ? 500 : 340
        implicitHeight: __isLandscape ? 350 : 470

        locale: picker.locale

        Material.elevation: __footerIsVisible ? 0 : 1
    }

    header: Rectangle {
        color: picker.Material.theme === Material.Dark ? picker.Material.dialogColor : picker.Material.accent

        Item {
            anchors.fill: parent
            anchors.margins: 16

            GridLayout {
                anchors.verticalCenter: parent.verticalCenter
                anchors.centerIn: parent

                columns: __isLandscape ? 1 : 2
                rows: __isLandscape ? 2 : 1

                Row {
                    Layout.column: 1
                    Layout.row: 1

                    Label {
                        text: timeSelector.selectedTime.getHours() < 10 ? "0" + timeSelector.selectedTime.getHours() : timeSelector.selectedTime.getHours()
                        color: "white"
                        font.pixelSize: __isLandscape ? 30 : 40
                        anchors.verticalCenter: parent.verticalCenter
                        opacity: timeSelector.currentSelector === TulipControlsPrivate.TimeSelector.Hour ? 1 : 0.7

                        MouseArea {
                            anchors.fill: parent
                            onClicked: timeSelector.mode = TulipControlsPrivate.TimeSelector.Hour
                        }
                    }

                    Label {
                        text: ":"
                        color: "white"
                        font.pixelSize: __isLandscape ? 30 : 40
                    }

                    Label {
                        text: timeSelector.selectedTime.getMinutes() < 10 ? "0" + timeSelector.selectedTime.getMinutes() : timeSelector.selectedTime.getMinutes()
                        color: "white"
                        font.pixelSize: __isLandscape ? 30 : 40
                        opacity: timeSelector.currentSelector === TulipControlsPrivate.TimeSelector.Minute ? 1 : 0.7

                        MouseArea {
                            anchors.fill: parent
                            onClicked: timeSelector.mode = TulipControlsPrivate.TimeSelector.Minute
                        }
                    }

                    Label {
                        text: ":"
                        color: "white"
                        font.pixelSize: __isLandscape ? 30 : 40
                    }

                    Label {
                        text: timeSelector.selectedTime.getSeconds() < 10 ? "0" + timeSelector.selectedTime.getSeconds() : timeSelector.selectedTime.getSeconds()
                        color: "white"
                        font.pixelSize: __isLandscape ? 30 : 40
                        opacity: timeSelector.currentSelector === TulipControlsPrivate.TimeSelector.Second ? 1 : 0.7

                        MouseArea {
                            anchors.fill: parent
                            onClicked: timeSelector.mode = TulipControlsPrivate.TimeSelector.Second
                        }
                    }
                }

                Column {
                    Layout.column: __isLandscape ? 1 : 2
                    Layout.row: __isLandscape ? 2 : 1

                    visible: !timeSelector.prefer24Hour
                    anchors.horizontalCenter: __isLandscape ? parent.horizontalCenter : undefined

                    Label {
                        text: "AM"
                        color: "white"
                        font.pixelSize: 18
                        opacity: timeSelector.timeMode === TulipControlsPrivate.TimeSelector.AM ? 1 : 0.7
                        horizontalAlignment: Text.AlignHCenter

                        MouseArea {
                            anchors.fill: parent
                            onClicked: timeSelector.timeMode = TulipControlsPrivate.TimeSelector.AM
                        }
                    }

                    Label {
                        text: "PM"
                        color: "white"
                        opacity: timeSelector.timeMode === TulipControlsPrivate.TimeSelector.PM ? 1 : 0.7
                        font.pixelSize: 18
                        horizontalAlignment: Text.AlignHCenter

                        MouseArea {
                            anchors.fill: parent
                            onClicked: timeSelector.timeMode = TulipControlsPrivate.TimeSelector.PM
                        }
                    }
                }
            }
        }
    }

    selector: TulipControlsPrivate.TimeSelector {
        id: timeSelector
        prefer24Hour: picker.prefer24Hour
        mode: TulipControlsPrivate.TimeSelector.Hour
        onSelectedTimeChanged: {
            if (picker.selectedTime !== selectedTime)
                picker.selectedTime = selectedTime;
        }
    }
}
