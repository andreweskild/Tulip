import qbs 1.0
import qbs.FileInfo
import qbs.TextFile

Product {
    name: "tulip-qbs"
    type: ["qbs_module"]

    Depends { name: "tulipdeployment" }

    Rule {
        requiresInputs: false
        multiplex: true

        Artifact {
            filePath: "Tulip.qbs"
            fileTags: ["qbs_module"]
        }

        prepare: {
            var cmd = new JavaScriptCommand();
            cmd.description = "generate Tulip.qbs";
            cmd.highlight = "codegen";
            cmd.sourceCode = function() {
                var outputFile = new TextFile(output.filePath, TextFile.WriteOnly);
                outputFile.writeLine("import qbs");
                outputFile.writeLine("");
                outputFile.writeLine("Module {");
                outputFile.writeLine("    version: \"" + project.version + "\"");
                outputFile.writeLine("}");
                outputFile.close();
            };
            return [cmd];
        }
    }

    Group {
        qbs.install: true
        qbs.installDir: FileInfo.joinPaths(tulipdeployment.qbsModulesDir, "Tulip")
        fileTagsFilter: ["qbs_module"]
    }
}
