/****************************************************************************
 * This file is part of Tulip.
 *
 * Copyright (C) 2018 Pier Luigi Fiorini <pierluigi.fiorini@gmail.com>
 *
 * $BEGIN_LICENSE:FDL$
 *
 * Permission is granted to copy, distribute and/or modify this document
 * under the terms of the GNU Free Documentation License, Version 1.3
 * or any later version published by the Free Software Foundation;
 * with no Invariant Sections, no Front-Cover Texts, and no Back-Cover Texts.
 * A copy of the license is included in the section entitled "GNU
 * Free Documentation License".
 *
 * $END_LICENSE$
 ***************************************************************************/

//! [file]
import QtQuick 2.10
import QtQuick.Controls 2.3
import Tulip.Core 1.0 as TulipCore
import Tulip.Controls 1.0 as TulipControls

Item {
    Button {
        anchors.centerIn: parent
        text: qsTr("Press Me")
        onClicked: gridBottomSheet.open()
    }

    TulipControls.BottomSheetGrid {
        id: gridBottomSheet
        actions: [
            TulipControls.Action {
                text: qsTr("Folder")
                icon.source: TulipCore.Utils.iconUrl("file/folder")
            },
            TulipControls.Action {
                text: qsTr("New Folder")
                icon.source: TulipCore.Utils.iconUrl("file/create_new_folder")
            },
            TulipControls.Action {
                text: qsTr("Shared Folder")
                icon.source: TulipCore.Utils.iconUrl("file/folder_shared")
            },
            TulipControls.Action {
                text: qsTr("Cloud")
                icon.source: TulipCore.Utils.iconUrl("file/cloud")
            },
            TulipControls.Action {
                text: qsTr("Email Attachment")
                icon.source: TulipCore.Utils.iconUrl("file/attachment")
            },
            TulipControls.Action {
                text: qsTr("Upload")
                icon.source: TulipCore.Utils.iconUrl("file/file_upload")
            },
            TulipControls.Action {
                text: qsTr("Placeholder 1")
                icon.source: TulipCore.Utils.iconUrl("file/cloud_done")
            },
            TulipControls.Action {
                text: qsTr("Placeholder 2")
                icon.source: TulipCore.Utils.iconUrl("file/cloud_done")
            },
            TulipControls.Action {
                text: qsTr("Placeholder 3")
                icon.source: TulipCore.Utils.iconUrl("file/cloud_done")
            },
            TulipControls.Action {
                text: qsTr("Placeholder 4")
                icon.source: TulipCore.Utils.iconUrl("file/cloud_done")
            },
            TulipControls.Action {
                text: qsTr("Placeholder 5")
                icon.source: TulipCore.Utils.iconUrl("file/cloud_done")
            },
            TulipControls.Action {
                text: qsTr("Placeholder 6")
                icon.source: TulipCore.Utils.iconUrl("file/cloud_done")
            },
            TulipControls.Action {
                text: qsTr("Placeholder 7")
                icon.source: TulipCore.Utils.iconUrl("file/cloud_done")
            },
            TulipControls.Action {
                text: qsTr("Placeholder 8")
                icon.source: TulipCore.Utils.iconUrl("file/cloud_done")
            },
            TulipControls.Action {
                text: qsTr("Placeholder 9")
                icon.source: TulipCore.Utils.iconUrl("file/cloud_done")
            },
            TulipControls.Action {
                text: qsTr("Placeholder 10")
                icon.source: TulipCore.Utils.iconUrl("file/cloud_done")
            },
            TulipControls.Action {
                text: qsTr("Placeholder 11")
                icon.source: TulipCore.Utils.iconUrl("file/cloud_done")
            },
            TulipControls.Action {
                text: qsTr("Placeholder 12")
                icon.source: TulipCore.Utils.iconUrl("file/cloud_done")
            },
            TulipControls.Action {
                text: qsTr("Placeholder 13")
                icon.source: TulipCore.Utils.iconUrl("file/cloud_done")
            },
            TulipControls.Action {
                text: qsTr("Placeholder 14")
                icon.source: TulipCore.Utils.iconUrl("file/cloud_done")
            },
            TulipControls.Action {
                text: qsTr("Placeholder 15")
                icon.source: TulipCore.Utils.iconUrl("file/cloud_done")
            },
            TulipControls.Action {
                text: qsTr("Placeholder 16")
                icon.source: TulipCore.Utils.iconUrl("file/cloud_done")
            },
            TulipControls.Action {
                text: qsTr("Placeholder 17")
                icon.source: TulipCore.Utils.iconUrl("file/cloud_done")
            },
            TulipControls.Action {
                text: qsTr("Placeholder 18")
                icon.source: TulipCore.Utils.iconUrl("file/cloud_done")
            },
            TulipControls.Action {
                text: qsTr("Placeholder 19")
                icon.source: TulipCore.Utils.iconUrl("file/cloud_done")
            },
            TulipControls.Action {
                text: qsTr("Placeholder 20")
                icon.source: TulipCore.Utils.iconUrl("file/cloud_done")
            }
        ]
    }
}
//! [file]
