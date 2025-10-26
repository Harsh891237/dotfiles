//@ pragma UseQApplication

import Quickshell
import Quickshell.Io
import QtQuick
import Quickshell.Wayland
import Quickshell.Hyprland
import Quickshell.Widgets

Column {
    id: workspacesColumn
    spacing: 6

    Repeater {
        model: Hyprland && Hyprland.workspaces ? Hyprland.workspaces : []

        Rectangle {
            anchors.horizontalCenter: parent.horizontalCenter
            width: 27
            height: 27
            radius: 30
            color: modelData.active ? "#86d6be" : "#252b29"

            Behavior on color {
                ColorAnimation {
                    duration: 170
                    easing.type: Easing.InOutQuad
                }
            }

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
        color: "#ffffff"
        font.pixelSize: 14
        font.family: "Rubik"
    }
}

