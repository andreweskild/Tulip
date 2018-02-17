import QtQuick 2.10

ParallelAnimation {
    id: root
    running: false

    property Item target

    ColorAnimation { target: root.target; to: "black"; duration: 100 }

}
