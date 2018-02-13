import qbs 1.0
import qbs.FileInfo

TulipProduct {
    property string pluginPath

    type: ["dynamiclibrary", "android.nativelibrary"]
    targetName: name + (qbs.enableDebugCode && qbs.targetOS.contains("windows") ? "d" : "")

    cpp.includePaths: [product.sourceDirectory]

    Depends { name: "tulipdeployment" }
    Depends { name: "Qt"; submodules: ["qml", "quick"] }
    Depends { name: "bundle"; condition: qbs.targetOS.contains("macos"); required: false }

    Properties {
        condition: qbs.targetOS.contains("macos")
        bundle.isBundle: false
    }

    FileTagger {
        patterns: ["qmldir", "*.qml", "*.qmltypes"]
        fileTags: ["qml"]
    }

    Group {
        qbs.install: true
        qbs.installDir: FileInfo.joinPaths(tulipdeployment.qmlDir, pluginPath)
        fileTagsFilter: ["debuginfo", "dynamiclibrary", "qml"]
    }
}
