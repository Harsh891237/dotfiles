//@ pragma UseQApplication

import Quickshell
import Quickshell.Wayland
import Quickshell.Hyprland
import QtQuick
import QtQuick.Layouts
import "."

Column {
	id: workspacesColumn
	spacing: 20
	width: parent.width
	anchors.horizontalCenter: parent.horizontalCenter

	Repeater {
		model: 10

		Rectangle {
			id: dot
			
			// --- 1. Identify States ---
			property var ws: Hyprland.workspaces.values.find(w => w.id === index + 1)
			property bool isActive: Hyprland.focusedWorkspace?.id === (index + 1)

			// --- 2. Define Sizes ---
			// Active: 29px (Big)
			// Occupied: 12px (Medium dot)
			// Empty: 8px (Tiny dot)
			readonly property real dotSize: {
				if (isActive) return 27
				if (ws)       return 12
				return 10
			}

			// --- 3. Define Colors ---
			readonly property color dotColor: {
				if (isActive) return Qt.rgba(Theme.primary_fixed.r, Theme.primary_fixed.g, Theme.primary_fixed.b, 0.8)
				if (ws)       return Theme.outline
				return Theme.surface_container_high    
			}

			anchors.horizontalCenter: parent.horizontalCenter
			
			// --- 4. Apply Dynamic Size ---
			width: dotSize
			height: dotSize
			radius: height / 2
			color: dotColor

			// Optional: Smooth animation when changing sizes
			Behavior on width { NumberAnimation { duration: 180; easing.type: Easing.OutQuad } }
			Behavior on height { NumberAnimation { duration: 180; easing.type: Easing.OutQuad } }
			Behavior on color { ColorAnimation { duration: 180 } }

			Text {
				anchors.centerIn: parent
				
				// Only show the number if the dot is big (Active)
				// Otherwise it won't fit in the small 12px/8px dots
				text: isActive ? String(index + 1) : ""
				
				color: Theme.shadow
				font { family: "Rubik"; pixelSize: 16; bold: false }
				
				// Fade the text in/out
				opacity: isActive ? 1 : 0
				Behavior on opacity { NumberAnimation { duration: 150 } }
			}

			MouseArea {
				anchors.fill: parent
				// Slightly expand hit area for small dots so they are easier to click
				anchors.margins: -5 
				onClicked: Hyprland.dispatch("workspace " + (index + 1))
			}
		}
	}
}
