import qbs 1.0

Project {
    // Project name
    name: "Per-project Qbs"

    // Your sub-projects go here
    references: [
        "src/src.qbs"
    ]

    // Add Tulip search paths here
    qbsSearchPaths: ["tulip/qbs/shared", "tulip/qbs/local"]

    // Minimum Qbs version required (don't go below 1.6)
    minimumQbsVersion: "1.6"

    // Include Tulip project
    SubProject {
        filePath: "tulip/tulip.qbs"

        Properties {
            documentationEnabled: false
            demoEnabled: false
            autotestEnabled: false
        }
    }
}
