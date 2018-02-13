import qbs 1.0

QtGuiApplication {
    name: "tst_tulip_controls"
    condition: project.autotestEnabled && !qbs.targetOS.contains("android")
    type: base.concat(["autotest"])

    Depends { name: "Qt"; submodules: ["gui", "testlib", "qmltest"] }
    Depends { name: "tulipcontrolsplugin"; cpp.link: false }
    Depends { name: "tulipcontrolsprivateplugin"; cpp.link: false }

    cpp.defines: base.concat(['QUICK_TEST_SOURCE_DIR="' + product.sourceDirectory + '"'])

    files: ["*.cpp", "*.qml"]
}
