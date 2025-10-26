import Quickshell
import Quickshell.Io
import Quickshell.Wayland
import Quickshell.Hyprland
import Quickshell.Widgets
import Quickshell.Services.Pipewire
import QtQuick
import QtQuick.Controls
import QtQuick.Layouts

ColumnLayout {
    id: root
    property QtObject sink: Pipewire.defaultAudioSink
    property bool isMuted: false

    function isBluetoothSink() {
        return sink && sink.name && sink.name.indexOf("bluez") !== -1;
    }

    // Process to listen for mute/volume changes
    Process {
        id: subscribeProc
        command: ["pactl", "subscribe"]
        running: true
        stdout: SplitParser {
            onRead: (data) => {
                if (data.indexOf("'change' on sink") !== -1 ||
                    data.indexOf("'change' on server") !== -1) {
                    pactlCheck.running = true
                }
            }
        }
    }

    // Process to check mute state
    Process {
        id: pactlCheck
        command: ["pactl", "list", "sinks"]
        stdout: SplitParser {
            onRead: (data) => {
                if (data.indexOf("Mute: yes") !== -1) {
                    isMuted = true
                } else if (data.indexOf("Mute: no") !== -1) {
                    isMuted = false
                }
            }
        }
    }

    PwObjectTracker {
        objects: [Pipewire.audioSinks]
        onObjectsChanged: {
            sink = Pipewire.defaultAudioSink
        }
    }

    RowLayout {
        spacing: 2
        Layout.alignment: Qt.AlignVCenter

        Text {
            font.family: "Material Symbols Outlined"
            font.pixelSize: 18
            color: "white"
            text: {
                if (isMuted) {
                    return "󰖁"; // muted
                } else if (isBluetoothSink()) {
                    return "\ue1a8"; // bluetooth
                } else {
                    return "\ue050"; // normal volume
                }
            }
        }
    }
}
