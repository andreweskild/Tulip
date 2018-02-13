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
import QtQuick.Controls.Material 2.3
import Tulip.Controls 1.0 as TulipControls

Item {
    Button {
        anchors.centerIn: parent
        text: qsTr("Press Me")
        onClicked: customBottomSheet.open()
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
//! [file]
