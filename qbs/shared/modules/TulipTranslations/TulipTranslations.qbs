import qbs 1.0
import qbs.File
import qbs.TextFile

Module {
    additionalProductTypes: ["tulip.desktop.file"]

    Rule {
        multiplex: true
        inputs: ["tulip.desktop.template", "tulip.desktop.translations"]

        outputArtifacts: {
            var artifacts = [];
            for (var i in inputs["tulip.desktop.template"]) {
                var input = inputs["tulip.desktop.template"][i];
                var artifact = {
                    filePath: input.fileName.replace(".in", ""),
                    fileTags: ["tulip.desktop.file"]
                };
                artifacts.push(artifact);
            }
            return artifacts;
        }
        outputFileTags: ["tulip.desktop.file"]

        prepare: {
            var cmds = [];
            for (var i in inputs["tulip.desktop.template"]) {
                var input = inputs["tulip.desktop.template"][i];
                var cmd = new JavaScriptCommand();
                cmd.description = "merge translations of " + input.filePath;
                cmd.highlight = "filegen";
                cmd.input = input;
                cmd.sourceCode = function() {
                    // Read original desktop entry
                    var file = new TextFile(input.filePath, TextFile.ReadOnly);
                    var contents = file.readAll();
                    file.close();

                    // Collect translations
                    var translations = "";
                    for (var j in inputs["tulip.desktop.translations"]) {
                        var t = inputs["tulip.desktop.translations"][j];
                        var file = new TextFile(t.filePath, TextFile.ReadOnly);
                        while (!file.atEof()) {
                            var line = file.readLine();
                            var re = /\w+\[\w+\]=/
                            if (line.match(re))
                                translations += line + "\n";
                        }
                        file.close();
                    }

                    // Replace marker with translations
                    var contents = "";
                    var file = new TextFile(input.filePath, TextFile.ReadOnly);
                    while (!file.atEof()) {
                        var line = file.readLine();
                        var re = /#TRANSLATIONS/;
                        if (line.match(re))
                            contents += translations;
                        else
                            contents += line + "\n";
                    }
                    file.close();
                    file = new TextFile(output.filePath, TextFile.WriteOnly);
                    file.write(contents);
                    file.close();
                };
                cmds.push(cmd);
            }
            return cmds;
        }
    }
}
