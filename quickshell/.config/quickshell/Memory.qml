import QtQuick
import QtQuick.Layouts
import QtQuick.Controls
import Quickshell
import Quickshell.Io
import "."
Item {
    id: text
    RowLayout {
        spacing: 2
        anchors.centerIn: parent
        Layout.alignment: Qt.AlignVCenter

        // Percentage
        Text {
            font.family: "Rubik"
            font.pixelSize: 14
            color: Theme.on_background
            text: `${Math.floor(percentFree)}`
        }
        // Icon
        Text {
            font.family: "Material Symbols Outlined"
            font.pixelSize: 17
            color: Theme.on_background
            text: "\uf7a3"
        } 
    }

    property real percentFree

    Process {
        id: memProc
        command: ["sh", "-c", "free | grep Mem | awk '{print $3/$2 * 100.0}'"]
        running: true

        stdout: SplitParser {
            onRead: data => percentFree = data
        }
    }

    Timer {
        interval: 3000
        running: true
        repeat: true
        onTriggered: memProc.running = true
    }
}
