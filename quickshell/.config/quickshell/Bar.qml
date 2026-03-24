//@ pragma UseQApplication

import Quickshell
import Quickshell.Io
import Quickshell.Wayland
import Quickshell.Hyprland
import Quickshell.Widgets
import Quickshell.Services.Pipewire
import Quickshell.Services.UPower
import Quickshell.Services.SystemTray
import QtQuick
import QtQuick.Effects
import QtQuick.Controls
import QtQuick.Layouts
import Qt5Compat.GraphicalEffects

import "."

PanelWindow {
id: panelWindow

anchors {
    // left: true
    right: true
    top: true
    bottom: true
}
margins { 
    left: 1
    right: 7
    top: 200
    bottom: 200
}
color: "transparent"
implicitWidth: 60 // e.g., 50px for the bar + 10px for shadow space

RectangularShadow {
    anchors.fill: bar 
    offset.x: -1
    offset.y: 1
    radius: 20
    blur: 10
    spread: 0.3
    color: Qt.darker(bar.color, 1.6)
}

Rectangle {
    id: bar
    width: 52
    radius: 50
    color: Theme.on_secondary
    // border.width: 1
    // border.color: "#918f8a"
    
    anchors.right: parent.right
    anchors.top: parent.top
    anchors.topMargin: 7
    anchors.bottom: parent.bottom
    anchors.bottomMargin: 7

    ColumnLayout {
        anchors.fill: parent
        anchors.topMargin: 10   // Give some breathing room at the top
        anchors.bottomMargin: 10  // Critical: Stops items from hitting the bottom edge
        spacing: 0                // We control spacing manually between big groups

        Clock_date { Layout.alignment: Qt.AlignHCenter }

        // --- TOP SECTION (Workspaces) ---
        Workspaces {
            Layout.alignment: Qt.AlignHCenter
            Layout.topMargin: 15
            Layout.bottomMargin: 20 
        }

        // --- MIDDLE SECTION (Spacer) ---
        Item {
            Layout.fillHeight: true 
            Layout.fillWidth: true
        }

        // --- BOTTOM SECTION (Stats & Tray) ---
        ColumnLayout {
            Layout.alignment: Qt.AlignHCenter
            spacing: 19 // Consistent spacing between CPU, Clock, Audio, etc.

            // Hardware Stats
            // Cpu { 
            //     Layout.alignment: Qt.AlignHCenter
            //     // Layout.preferredHeight: 9
            //     Layout.bottomMargin: 20
            // }
            // Memory { 
            //     Layout.alignment: Qt.AlignHCenter 
            //     Layout.bottomMargin: 12
            // }
            
            // Controls
            Audio   { Layout.alignment: Qt.AlignHCenter }
            Network { Layout.alignment: Qt.AlignHCenter }
            Battery { Layout.topMargin: -7; Layout.alignment: Qt.AlignHCenter }
            
            // Tray (At the very bottom of the content stack)
            SysTray { 
                Layout.alignment: Qt.AlignHCenter 
                Layout.bottomMargin: 5 // Tiny extra lift from the bottom edge
            }
        }
    }   
}
}

