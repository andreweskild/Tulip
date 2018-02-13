import QtQuick 2.10
import QtQuick.Controls 2.3
import QtQuick.Layouts 1.3
import Tulip.Core 1.0 as TulipCore
import Tulip.Controls 1.0 as TulipControls

TulipControls.ApplicationWindow {
    width: 640
    height: 480
    title: qsTr("Hello World")
    visible: true

    initialPage: TulipControls.TabbedPage {
        title: qsTr("Tabbed Page")

        actions: [
            TulipControls.Action {
                icon.source: TulipCore.Utils.iconUrl("content/add")
                text: qsTr("Add content")
                toolTip: qsTr("Add content")
                onTriggered: console.log("Example action...")
            }
        ]

        TulipControls.Tab {
            title: qsTr("First")

            Page1 {
                anchors.fill: parent
            }
        }

        TulipControls.Tab {
            title: qsTr("Second")

            Label {
                text: qsTr("Second page")
                anchors.centerIn: parent
            }
        }
    }
}
