import qbs 1.0

InstallPackage {
    name: "tulip-artifacts"
    targetName: name
    builtByDefault: false

    archiver.type: "tar"
    archiver.outputDirectory: project.buildDirectory

    Depends { name: "tulip-demo" }
    Depends { name: "tulipcontrolsplugin" }
    Depends { name: "tulipcoreplugin" }
    Depends { name: "tulipeffectsplugin" }
    Depends { name: "tuliplayoutsplugin" }
    Depends { name: "tuliptemplatesplugin" }
}
