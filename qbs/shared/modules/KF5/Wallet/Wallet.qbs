import qbs

Module {
    readonly property bool found: probe.found

    Depends { name: "cpp" }

    cpp.includePaths: probe.includePaths
    cpp.libraryPaths: probe.libraryPaths
    cpp.dynamicLibraries: probe.libraries

    TulipLibraryProbe {
        id: probe
        includePathSuffixes: ["include/KF5/KWallet"]
        includeNames: ["kwallet_export.h"]
        libraryNames: ["libKF5Wallet.so"]
    }
}