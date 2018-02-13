import qbs 1.0
import qbs.FileInfo

Product {
    property string pluginPath: "Tulip/Layouts"

    name: "tuliplayoutsplugin"

    Depends { name: "tulipdeployment" }

    files: ["qmldir", "*.qml", "*.qmltypes"]

    FileTagger {
        patterns: ["qmldir", "*.qml", "*.qmltypes"]
        fileTags: ["qml"]
    }

    Group {
        qbs.install: true
        qbs.installDir: FileInfo.joinPaths(tulipdeployment.qmlDir, pluginPath)
        fileTagsFilter: ["qml"]
    }
}
