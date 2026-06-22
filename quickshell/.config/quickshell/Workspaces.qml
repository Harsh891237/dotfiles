//@ pragma UseQApplication

import Quickshell
import Quickshell.Hyprland
import Quickshell.Wayland
import QtQuick
import QtQuick.Layouts
import "."

ColumnLayout {
Layout.alignment: Qt.AlighHCenter
Column {
    id: workspacesColumn
    spacing: 20
    width: parent.width
    // Layout.alignment: Qt.AlighHCenter

    Repeater {
        model: 10

        Rectangle {
            id: dot
            
            // --- 1. Identify Workspace ---
            // 'ws' will be undefined if the workspace is empty
            property var ws: Hyprland.workspaces.values.find(w => w.id === index + 1)
            
            // --- 2. Check State ---
            property bool isActive: Hyprland.focusedWorkspace?.id === (index + 1)
            
            // We use (ws && ws.urgent) because 'ws' might be null if empty
            property bool isUrgent: ws ? ws.urgent : false

            // --- 4. Define Sizes ---
            readonly property real dotSize: {
                if (isActive || isUrgent) return 27
                if (ws) return 12
                return 10
            }

            // --- 5. Define Colors ---
            readonly property color dotColor: {
                if (isUrgent) {
					return Theme.error
                }

                if (isActive) {
                    return Qt.rgba(Theme.primary_fixed.r, Theme.primary_fixed.g, Theme.primary_fixed.b, 0.8)
                }

                if (ws) return Theme.outline

                return Theme.surface_container_high    
            }

            anchors.horizontalCenter: parent.horizontalCenter
            
            // Apply Properties
            width: dotSize
            height: dotSize
            radius: height / 2
            color: dotColor

            // Smooth animations
            Behavior on width { NumberAnimation { duration: 180; easing.type: Easing.OutQuad } }
            Behavior on height { NumberAnimation { duration: 180; easing.type: Easing.OutQuad } }
            Behavior on color { ColorAnimation { duration: 200 } }

            Text {
                anchors.centerIn: parent
                
                // Show number if Active OR Urgent
                text: (isActive || isUrgent) ? String(index + 1) : ""
                
                // If urgent, use the "On Error" text color (usually white/black depending on the red)
                // Otherwise use the shadow color
                color: isUrgent ? Theme.on_error : Theme.shadow
                
                font { family: "Rubik"; pixelSize: 16; bold: false }
                
                opacity: (isActive || isUrgent) ? 1 : 0
                Behavior on opacity { NumberAnimation { duration: 150 } }
            }

            MouseArea {
                anchors.fill: parent
                anchors.margins: -5
                onClicked: Hyprland.dispatch("hl.dsp.focus( { workspace = " + (index + 1) + " })")
            }
        }
    }
}
}