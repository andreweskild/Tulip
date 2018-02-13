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

    TulipControls.BottomSheetList {
        id: listBottomSheet
        title: qsTr("Save As")
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
            }
        ]
    }
}
//! [file]
