import qbs 1.0

TulipProduct {
    type: ["dynamiclibrary", "android.nativelibrary"]

    Depends { name: "tulipdeployment" }

    Properties {
        condition: qbs.targetOS.contains("macos")
        bundle.isBundle: false
    }

    Group {
        qbs.install: true
        qbs.installDir: tulipdeployment.libDir
        qbs.installSourceBase: product.buildDirectory
        fileTagsFilter: [
            "dynamiclibrary",
            "dynamiclibrary_symlink",
            "dynamiclibrary_import",
        ];
    }
}
