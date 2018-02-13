import qbs 1.0

Product {
    property string versionTag: project.version.replace(/\.|-/g, "")

    name: "tulip-doc"
    condition: project.withDocumentation && !qbs.targetOS.contains("android")
    builtByDefault: true
    type: "qch"

    Depends { name: "tulipdeployment" }
    Depends { name: "Qt.core"; versionAtLeast: project.minimumQtVersion }

    Qt.core.qdocEnvironment: [
        "TULIP_VERSION=" + project.version,
        "TULIP_VERSION_TAG=" + versionTag,
        "SRCDIR=" + path,
        "QT_INSTALL_DOCS=" + Qt.core.docPath
    ]

    files: [
        "config/*.qdocconf",
        "src/*.qdoc",
    ]

    Group {
        name: "Main qdocconf file"
        files: "tulip.qdocconf"
        fileTags: "qdocconf-main"
    }

    Group {
        name: "Online qdocconf file"
        files: "tulip-online.qdocconf"
        fileTags: "qdocconf-online"
    }

    Group {
        name: "Style"
        prefix: "template/style/"
        files: "**"
    }

    Group {
        fileTagsFilter: ["qdoc-output"]
        qbs.install: true
        qbs.installDir: qbs.targetOS.contains("linux") ? tulipdeployment.docDir + "/tulip/html" : "Docs"
        qbs.installSourceBase: Qt.core.qdocOutputDir
    }

    Group {
        fileTagsFilter: ["qch"]
        qbs.install: false
        qbs.installDir: qbs.targetOS.contains("linux") ? tulipdeployment.docDir + "/tulip/html" : "Docs"
    }
}
