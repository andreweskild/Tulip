/*
 * This file is part of Tulip.
 *
 * Copyright (C) 2018 Magnus Groß <magnus.gross21@gmail.com>
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
    TulipControls.SearchBar {
        id: searchbar
        onSearchTextChanged: {
            if ("tulip".startsWith(searchText)) {
                searchSuggestions.append({text: "tulip"});
                searchSuggestions.append({text: "tulip demo"});
                searchSuggestions.append({text: "tulip interface"});
                searchSuggestions.append({text: "tulip layout"});
            } else if ("tulip".startsWith(searchText)) {
                searchSuggestions.append({text: "tulip"});
                searchSuggestions.append({text: "tulip os"});
            }
        }
        onSearch: {
            searchResults.append({title: "example search result", body: "This text can go over multiple lines and automatically wraps accordingly. This section is used to provide a short description of the search result.", uri: query+"0"})
            searchResults.append({title: "second example search result", body: "Description", uri: query+"1"})
            searchResults.append({title: "third example search result", body: "Description", uri: query+"2"})
        }
    }
    ListView {
        id: resultsListView
        visible: searchbar.searchResults.count !== 0
        anchors.top: searchbar.bottom
        x: searchbar.x
        width: parent.width
        height: parent.height
        model: searchbar.searchResults
        clip: true
        delegate: Item {
            width: parent.width
            height: 128
            TulipControls.Card {
                anchors.fill: parent
                anchors.margins: 8
                TulipControls.Ripple {
                    anchors.fill: parent
                    onClicked: console.log(model.uri)
                }
                Column {
                    anchors.fill: parent
                    anchors.margins: 16
                    spacing: 16
                    TulipControls.TitleLabel {
                        text: model.title
                    }
                    TulipControls.BodyLabel {
                        width: parent.width
                        text: model.body
                        wrapMode: Text.WordWrap
                    }
                }
            }
        }
    }
}
