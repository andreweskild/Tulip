import qbs 1.0

TulipProduct {
    name: project.privateName
    condition: project.conditionFunction()
    type: ["staticlibrary"]

    Depends { name: "tulipdeployment" }

    Group {
        qbs.install: true
        qbs.installDir: tulipdeployment.libDir
        qbs.installSourceBase: product.buildDirectory
        fileTagsFilter: ["staticlibrary"]
    }
}
