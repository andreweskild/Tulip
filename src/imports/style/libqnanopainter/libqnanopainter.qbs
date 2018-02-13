import qbs

Product {
    name: "libqnanopainter"
    type: "staticlibrary"
    Depends {
        name: "Qt"
        submodules: ["core", "gui", "quick"] // Add more here if needed
    }

    Depends { name: "cpp" }

    cpp.includePaths: [path]

    files: [
        "include.pri",
        "libqnanopainter.qbs.user",
        "libqnanopainterdata.qrc",
        "qnanoboxgradient.cpp",
        "qnanoboxgradient.h",
        "qnanocolor.cpp",
        "qnanocolor.h",
        "qnanofont.cpp",
        "qnanofont.h",
        "qnanoimage.cpp",
        "qnanoimage.h",
        "qnanoimagepattern.cpp",
        "qnanoimagepattern.h",
        "qnanolineargradient.cpp",
        "qnanolineargradient.h",
        "qnanopainter.cpp",
        "qnanopainter.h",
        "qnanoquickitem.cpp",
        "qnanoquickitem.h",
        "qnanoquickitempainter.cpp",
        "qnanoquickitempainter.h",
        "qnanoradialgradient.cpp",
        "qnanoradialgradient.h",
    ]

    Group {
        name: "OpenGL ES"
        prefix: "private/"
        condition: qbs.targetOS.contains("window") ||
                   qbs.targetOS.contains("android") ||
                   qbs.targetOS.contains("ios")
        files: [
            "qnanobackendgles2.cpp",
            "qnanobackendgles2.h",
            "qnanobackendgles3.cpp",
            "qnanobackendgles3.h"
        ]
    }

    Group {
        name: "OpenGL"
        prefix: "private/"
        condition: qbs.targetOS.contains("window") ||
                   qbs.targetOS.contains("linux") ||
                   qbs.targetOS.contains("osx")
        files: [
            "qnanobackendgl2.cpp",
            "qnanobackendgl2.h",
            "qnanobackendgl3.cpp",
            "qnanobackendgl3.h"
        ]
    }

    Group {
        name: "data"
        prefix: "data/"
        files: [
            "LICENSE.txt",
            "README.txt",
            "Roboto-Bold.ttf",
            "Roboto-BoldItalic.ttf",
            "Roboto-Italic.ttf",
            "Roboto-Light.ttf",
            "Roboto-LightItalic.ttf",
            "Roboto-Regular.ttf",
            "Roboto-Thin.ttf",
            "Roboto-ThinItalic.ttf",
        ]
    }

    Group {
        name: "ext"
        prefix: "ext/"
        files: [
        ]
    }

    Group {
        name: "GLES3"
        prefix: "ext/GLES3/"
        files: [
            "gl3.h",
            "gl3platform.h",
        ]
    }

    Group {
        name: "nanovg"
        prefix: "nanovg/"
        files: [
            "LICENSE.txt",
            "fontstash.h",
            "nanovg.c",
            "nanovg.h",
            "nanovg_gl.h",
            "nanovg_gl_utils.h",
            "nanovg_gl_wrapped.h",
            "stb_image.h",
            "stb_truetype.h",
        ]
    }

    Group {
        name: "private"
        prefix: "private/"
        files: [
            "qnanobackend.h",
            "qnanobackendfactory.h",
            "qnanobrush.h",
            "qnanodataelement.h",
        ]
    }

    cpp.defines: ["QNANO_QT_GL_INCLUDE", "QNANO_ENABLE_GLES3"]
    
    Export {
            Depends { name: "cpp" }
            cpp.includePaths: [product.sourceDirectory]
    }
}
