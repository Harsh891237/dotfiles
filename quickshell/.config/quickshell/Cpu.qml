import QtQuick
import QtQuick.Layouts

import Quickshell.Io
import "."
Item {
    id: root

    property real cpuUsage: 0
        property int prevIdle: -1
            property int prevTotal: -1

                ColumnLayout {
                    spacing: 0
                    anchors.centerIn: parent
                    Layout.alignment: Qt.AlignVCenter
                    Text {
                        font.family: "Material Symbols Outlined"
                        font.pixelSize: 14
                        color: Theme.on_background
                        text: "\ue8b8"
                    }
                    Text {
                        font.family: "Rubik"
                        font.pixelSize: 13
                        color: Math.round(cpuUsage) > 80 ? Theme.error : Theme.on_background
                        text: `${Math.round(cpuUsage)}`
                    }

                }

                Process {
                    id: cpuProc
                    command: ["sh", "-c", "head -n1 /proc/stat"]

                    stdout: SplitParser {
                        onRead: (line) => {
                        const parts = line.trim().split(/\s+/).slice(1).map(Number)
                        const idle = parts[3] + parts[4]  // idle + iowait
                        const total = parts.reduce((a, b) => a + b, 0)

                        if (prevIdle >= 0 && prevTotal >= 0)
                        {
                            const diffIdle = idle - prevIdle
                            const diffTotal = total - prevTotal
                            if (diffTotal > 0)
                            {
                                cpuUsage = 100 * (1 - diffIdle / diffTotal)
                            }
                        }

                        prevIdle = idle
                        prevTotal = total
                    }
                }
            }

            Timer {
                interval: 2000
                running: true
                repeat: true
                onTriggered: {
                    cpuProc.running = false
                    cpuProc.running = true
                }
            }
        }
