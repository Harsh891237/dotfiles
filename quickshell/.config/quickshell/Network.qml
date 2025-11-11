import Quickshell
import Quickshell.Io
import Quickshell.Wayland
import Quickshell.Widgets
import QtQuick
import QtQuick.Layouts

Item {
    id: networkRoot
    Layout.bottomMargin: 11


    property string connectionIcon: "󰤭"
    property string tooltipText: "No active connection"

    Process {
        id: networkProc
        command: ["nmcli", "-t", "-f", "DEVICE,TYPE,STATE,CONNECTION", "device"]
        running: true

        stdout: StdioCollector {
            onStreamFinished: {
                const lines = text.trim().split("\n")
                for (let i = 0; i < lines.length; i++) {
                    const parts = lines[i].split(":")
                    if (parts[2] === "connected") {
                        const type = parts[1]
                        connectionIcon = type === "ethernet" ? "󰈁" : "󰤥"
                        return
                    }
                }

                // fallback if no connected devices
                connectionIcon = "󰤭"
                tooltipText = "No active connection"
            }
        }
    }

    Timer {
        interval: 5000
        running: true
        repeat: true
        onTriggered: {
            networkProc.running = false
            networkProc.running = true
        }
    }

    Component.onCompleted: {
        networkProc.running = false
        networkProc.running = true
    }
    
    Row {
        anchors.centerIn: parent
        spacing: 6
        Text {
            text: connectionIcon
            font.pixelSize: 16
            color: "white"
            font.family: "JetBrainsMono Nerd Font Propo"
        }
    }
}
