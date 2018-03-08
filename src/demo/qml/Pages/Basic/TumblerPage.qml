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
import QtQuick.Layouts 1.3
import Tulip.Controls 1.0
import "../.."

Flickable {
    clip: true
    contentHeight: Math.max(layout.implicitHeight, height)

    ScrollBar.vertical: ScrollBar {}

    ColumnLayout {
        id: layout
        anchors.fill: parent

        Item {
            Layout.fillWidth: true
            Layout.fillHeight: true
            Layout.minimumWidth: grid.width + 80
            Layout.minimumHeight: grid.height + 80

            GridLayout {
                id: grid
                anchors.centerIn: parent
                columns: 2
                rows: 2

                // Row 1


                TitleLabel {
                    text: qsTr("Enabled")

                    Layout.alignment: Qt.AlignHCenter
                }

                TitleLabel {
                    text: qsTr("Disabled")

                    Layout.alignment: Qt.AlignHCenter
                }

                function formatText(count, modelData) {
                        var data = count === 12 ? modelData + 1 : modelData;
                        return data.toString().length < 2 ? "0" + data : data;
                    }

                FontMetrics {
                        id: fontMetrics
                    }

                Component {
                        id: delegateComponent

                        Label {
                            text: grid.formatText(Tumbler.tumbler.count, modelData)
                            opacity: 1.0 - Math.abs(Tumbler.displacement) / (Tumbler.tumbler.visibleItemCount / 2)
                            horizontalAlignment: Text.AlignHCenter
                            verticalAlignment: Text.AlignVCenter
                            font.pixelSize: fontMetrics.font.pixelSize * 1.25
                        }
                    }

                // Row 2

                Frame {
                        padding: 0

                        Row {
                            id: row

                            Tumbler {
                                id: hoursTumbler
                                model: 12
                            }

                            Tumbler {
                                id: minutesTumbler
                                model: 60
                            }

                            Tumbler {
                                id: amPmTumbler
                                model: ["AM", "PM"]
                            }
                        }
                    }

                Frame {
                        padding: 0

                        Row {

                            Tumbler {
                                enabled: false
                                model: 12
                            }

                            Tumbler {
                                enabled: false
                                model: 60
                            }

                            Tumbler {
                                enabled: false
                                model: ["AM", "PM"]
                            }
                        }
                    }

            }
        }
    }
}
