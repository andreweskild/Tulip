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

import QtQuick 2.10
import QtQuick.Controls 2.3
import QtQuick.Controls.Material 2.3
import Tulip.Controls 1.0 as TulipControls

Item {
    Column {
        anchors.centerIn: parent

        Button {
            text: qsTr("List-style BottomSheet")
            onClicked: listBottomSheet.open()
        }

        Button {
            text: qsTr("Long List-style BottomSheet")
            onClicked: longListBottomSheet.open()
        }

        Button {
            text: qsTr("Grid-style BottomSheet")
            onClicked: gridBottomSheet.open()
        }

        Button {
            text: qsTr("Custom BottomSheet")
            onClicked: customBottomSheet.open()
        }
    }

    TulipControls.BottomSheetList {
        id: listBottomSheet
        title: qsTr("Save As")
        actions: [
            TulipControls.Action {
                text: qsTr("Folder")
                icon.source: TulipControls.Utils.iconUrl("file/folder")
            },
            TulipControls.Action {
                text: qsTr("New Folder")
                icon.source: TulipControls.Utils.iconUrl("file/create_new_folder")
            },
            TulipControls.Action {
                text: qsTr("Shared Folder")
                icon.source: TulipControls.Utils.iconUrl("file/folder_shared")
            },
            TulipControls.Action {
                text: qsTr("Cloud")
                icon.source: TulipControls.Utils.iconUrl("file/cloud")
            },
            TulipControls.Action {
                text: qsTr("Email Attachment")
                icon.source: TulipControls.Utils.iconUrl("file/attachment")
            },
            TulipControls.Action {
                text: qsTr("Upload")
                icon.source: TulipControls.Utils.iconUrl("file/file_upload")
            },
            TulipControls.Action {
                text: qsTr("Warning (Disabled)")
                icon.source: TulipControls.Utils.iconUrl("alert/warning")
                enabled: false
            }
        ]
    }

    TulipControls.BottomSheetList {
        id: longListBottomSheet
        title: qsTr("Save As")
        actions: [
            TulipControls.Action {
                text: qsTr("Folder")
                icon.source: TulipControls.Utils.iconUrl("file/folder")
            },
            TulipControls.Action {
                text: qsTr("New Folder")
                icon.source: TulipControls.Utils.iconUrl("file/create_new_folder")
            },
            TulipControls.Action {
                text: qsTr("Shared Folder")
                icon.source: TulipControls.Utils.iconUrl("file/folder_shared")
            },
            TulipControls.Action {
                text: qsTr("Cloud")
                icon.source: TulipControls.Utils.iconUrl("file/cloud")
            },
            TulipControls.Action {
                text: qsTr("Email Attachment")
                icon.source: TulipControls.Utils.iconUrl("file/attachment")
            },
            TulipControls.Action {
                text: qsTr("Upload")
                icon.source: TulipControls.Utils.iconUrl("file/file_upload")
            },
            TulipControls.Action {
                text: qsTr("Warning (Disabled)")
                icon.source: TulipControls.Utils.iconUrl("alert/warning")
                enabled: false
                hasDividerAfter: true
            },
            TulipControls.Action {
                text: qsTr("Placeholder 1")
                icon.source: TulipControls.Utils.iconUrl("file/cloud_done")
            },
            TulipControls.Action {
                text: qsTr("Placeholder 2")
                icon.source: TulipControls.Utils.iconUrl("file/cloud_done")
            },
            TulipControls.Action {
                text: qsTr("Placeholder 3")
                icon.source: TulipControls.Utils.iconUrl("file/cloud_done")
            },
            TulipControls.Action {
                text: qsTr("Placeholder 4")
                icon.source: TulipControls.Utils.iconUrl("file/cloud_done")
            },
            TulipControls.Action {
                text: qsTr("Placeholder 5")
                icon.source: TulipControls.Utils.iconUrl("file/cloud_done")
            },
            TulipControls.Action {
                text: qsTr("Placeholder 6")
                icon.source: TulipControls.Utils.iconUrl("file/cloud_done")
            },
            TulipControls.Action {
                text: qsTr("Placeholder 7")
                icon.source: TulipControls.Utils.iconUrl("file/cloud_done")
            },
            TulipControls.Action {
                text: qsTr("Placeholder 8")
                icon.source: TulipControls.Utils.iconUrl("file/cloud_done")
            },
            TulipControls.Action {
                text: qsTr("Placeholder 9")
                icon.source: TulipControls.Utils.iconUrl("file/cloud_done")
            },
            TulipControls.Action {
                text: qsTr("Placeholder 10")
                icon.source: TulipControls.Utils.iconUrl("file/cloud_done")
            }
        ]
    }

    TulipControls.BottomSheetGrid {
        id: gridBottomSheet
        actions: [
            TulipControls.Action {
                text: qsTr("Folder")
                icon.source: TulipControls.Utils.iconUrl("file/folder")
            },
            TulipControls.Action {
                text: qsTr("New Folder")
                icon.source: TulipControls.Utils.iconUrl("file/create_new_folder")
            },
            TulipControls.Action {
                text: qsTr("Shared Folder")
                icon.source: TulipControls.Utils.iconUrl("file/folder_shared")
            },
            TulipControls.Action {
                text: qsTr("Cloud")
                icon.source: TulipControls.Utils.iconUrl("file/cloud")
            },
            TulipControls.Action {
                text: qsTr("Email Attachment")
                icon.source: TulipControls.Utils.iconUrl("file/attachment")
            },
            TulipControls.Action {
                text: qsTr("Upload")
                icon.source: TulipControls.Utils.iconUrl("file/file_upload")
            },
            TulipControls.Action {
                text: qsTr("Warning (Disabled)")
                icon.source: TulipControls.Utils.iconUrl("alert/warning")
                enabled: false
            },
            TulipControls.Action {
                text: qsTr("Placeholder 1")
                icon.source: TulipControls.Utils.iconUrl("file/cloud_done")
            },
            TulipControls.Action {
                text: qsTr("Placeholder 2")
                icon.source: TulipControls.Utils.iconUrl("file/cloud_done")
            },
            TulipControls.Action {
                text: qsTr("Placeholder 3")
                icon.source: TulipControls.Utils.iconUrl("file/cloud_done")
            },
            TulipControls.Action {
                text: qsTr("Placeholder 4")
                icon.source: TulipControls.Utils.iconUrl("file/cloud_done")
            },
            TulipControls.Action {
                text: qsTr("Placeholder 5")
                icon.source: TulipControls.Utils.iconUrl("file/cloud_done")
            },
            TulipControls.Action {
                text: qsTr("Placeholder 6")
                icon.source: TulipControls.Utils.iconUrl("file/cloud_done")
            },
            TulipControls.Action {
                text: qsTr("Placeholder 7")
                icon.source: TulipControls.Utils.iconUrl("file/cloud_done")
            },
            TulipControls.Action {
                text: qsTr("Placeholder 8")
                icon.source: TulipControls.Utils.iconUrl("file/cloud_done")
            },
            TulipControls.Action {
                text: qsTr("Placeholder 9")
                icon.source: TulipControls.Utils.iconUrl("file/cloud_done")
            },
            TulipControls.Action {
                text: qsTr("Placeholder 10")
                icon.source: TulipControls.Utils.iconUrl("file/cloud_done")
            },
            TulipControls.Action {
                text: qsTr("Placeholder 11")
                icon.source: TulipControls.Utils.iconUrl("file/cloud_done")
            },
            TulipControls.Action {
                text: qsTr("Placeholder 12")
                icon.source: TulipControls.Utils.iconUrl("file/cloud_done")
            },
            TulipControls.Action {
                text: qsTr("Placeholder 13")
                icon.source: TulipControls.Utils.iconUrl("file/cloud_done")
            },
            TulipControls.Action {
                text: qsTr("Placeholder 14")
                icon.source: TulipControls.Utils.iconUrl("file/cloud_done")
            },
            TulipControls.Action {
                text: qsTr("Placeholder 15")
                icon.source: TulipControls.Utils.iconUrl("file/cloud_done")
            },
            TulipControls.Action {
                text: qsTr("Placeholder 16")
                icon.source: TulipControls.Utils.iconUrl("file/cloud_done")
            },
            TulipControls.Action {
                text: qsTr("Placeholder 17")
                icon.source: TulipControls.Utils.iconUrl("file/cloud_done")
            },
            TulipControls.Action {
                text: qsTr("Placeholder 18")
                icon.source: TulipControls.Utils.iconUrl("file/cloud_done")
            },
            TulipControls.Action {
                text: qsTr("Placeholder 19")
                icon.source: TulipControls.Utils.iconUrl("file/cloud_done")
            },
            TulipControls.Action {
                text: qsTr("Placeholder 20")
                icon.source: TulipControls.Utils.iconUrl("file/cloud_done")
            }
        ]
    }

    TulipControls.BottomSheet {
        id: customBottomSheet

        Column {
            width: parent.width

            Pane {
                width: parent.width
                padding: 16

                Column {
                    spacing: 8

                    TulipControls.TitleLabel {
                        text: "freedom"
                    }

                    TulipControls.BodyLabel {
                        text: "/ˈfriːdəm/"
                        color: Material.secondaryTextColor
                    }
                }

                Material.background: Material.color(Material.Yellow, Material.Shade800)
            }

            Pane {
                width: parent.width
                implicitHeight: 100
                padding: 16

                Column {
                    TulipControls.SubheadingLabel {
                        text: "noun"
                        color: Material.secondaryTextColor
                    }

                    TulipControls.BodyLabel {
                        text: "the right to live in the way you want without being controlled by anyone else"
                    }
                }
            }
        }
    }
}
