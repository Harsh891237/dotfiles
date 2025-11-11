//@ pragma UseQApplication

import Quickshell
import Quickshell.Io
import Quickshell.Wayland
import Quickshell.Hyprland
import Quickshell.Widgets
import Quickshell.Services.Pipewire
import Quickshell.Services.UPower
import QtQuick
import QtQuick.Effects
import QtQuick.Controls
import QtQuick.Layouts
import Qt5Compat.GraphicalEffects

ColumnLayout {
    id: workspacesColumn
    spacing: 6
    Layout.alignment: Qt.AlignHCenter

    Repeater {
	model: Hyprland && Hyprland.workspaces ? Hyprland.workspaces : []

	Rectangle {
	    width: 27
	    height: 27
	    radius: 30
	    color: modelData.active ? "#86d6be" : "#252b29"

	    Behavior on color {
		ColorAnimation { duration: 170; easing.type: Easing.InOutQuad }
	    }

	    Layout.alignment: Qt.AlignHCenter

	    MouseArea {
		anchors.fill: parent
		onClicked: Hyprland.dispatch("workspace " + modelData.id)
	    }

	    Text {
		text: modelData.id
		anchors.centerIn: parent
		color: modelData.active ? "#090f0d" : "#cccccc"
		font.pixelSize: 14
		font.family: "Rubik"
	    }
	}
    }

    Text {
	visible: Hyprland && Hyprland.workspaces.length === 0
	text: "No Workspaces"
	font.pixelSize: 14
	font.family: "Rubik"
	color: "#ffffff"
	Layout.alignment: Qt.AlignHCenter
    }
}
