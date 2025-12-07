//@ pragma UseQApplication

import Quickshell
import Quickshell.Wayland
import Quickshell.Hyprland
import QtQuick
import QtQuick.Layouts

ColumnLayout {
	id: workspacesColumn
	spacing: 10
	Layout.alignment: Qt.AlignHCenter

	Repeater {
		model: 10 // means that the repeater( essentially a for loop ) will repeat 10 times

		Rectangle {
			Layout.alignment: Qt.AlignHCenter
			width: 29
			height: 29
			radius: 30

			property var ws: Hyprland.workspaces.values.find(w => w.id === index + 1 ) // if a workspace has windows on it
			property bool isActive: Hyprland.focusedWorkspace?.id === ( index + 1 ) // checks currently focused workspace
			color: isActive ? "#85d6c0" : "#1d352e" //( ws ? "005143" : "1d352e" )

			Text {
				anchors.centerIn: parent
				text: (ws || isActive) ? String(index + 1) : ""
				color: isActive ? "#000" : "#dee4e0" 
				font { family: "Rubik"; pixelSize: 16; bold: false }
			}

			MouseArea {
				anchors.fill: parent
				onClicked: Hyprland.dispatch("workspace " + (index+1))
			}			
		}
	}
}