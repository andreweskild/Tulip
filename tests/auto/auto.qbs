import qbs 1.0
import qbs.FileInfo

Project {
    name: "Autotests"

    references: [
        "controls/controls.qbs",
        "core/core.qbs",
    ]

    AutotestRunner {
        Depends { name: "tulipdeployment" }
        Depends { name: "tulipcontrolsplugin" }
        Depends { name: "tulipcoreplugin" }
        Depends { name: "tulipeffectsplugin" }
        Depends { name: "tuliplayoutsplugin" }

        condition: !qbs.targetOS.contains("android")
        builtByDefault: project.autotestEnabled
        name: "tulip-autotest"
        arguments: project.autotestArguments
        wrapper: project.autotestWrapper
        environment: {
            var env = base;
            env.push("QML2_IMPORT_PATH=" + FileInfo.joinPaths(qbs.installRoot, qbs.installPrefix, tulipdeployment.qmlDir));
            env.push("QT_QUICK_CONTROLS_STYLE=tulip");
            return env;
        }
    }
}
