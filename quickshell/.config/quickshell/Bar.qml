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
    left: true
    top: true
    bottom: true
}
margins { 
    left: 9
    right: -3
    top: 17
    bottom: 17
}
color: "transparent"
implicitWidth: 60 // e.g., 50px for the bar + 10px for shadow space

RectangularShadow {
    anchors.fill: bar 
    offset.x: 2
    offset.y: 2
    radius: 20
    blur: 10
    spread: 0.3
    color: Qt.darker(bar.color, 1.6)
}

Rectangle {
    id: bar
    width: 52
    radius: 30
    color: Theme.background
    // border.width: 1
    // border.color: "#918f8a"
    
    anchors.left: parent.left
    anchors.top: parent.top
    anchors.topMargin: 7
    anchors.bottom: parent.bottom
    anchors.bottomMargin: 7

    ColumnLayout {
        anchors.fill: parent
        anchors.topMargin: 10   // Give some breathing room at the top
        anchors.bottomMargin: 10  // Critical: Stops items from hitting the bottom edge
        spacing: 0                // We control spacing manually between big groups

        // --- TOP SECTION (Workspaces) ---
        Workspaces {
            Layout.alignment: Qt.AlignHCenter
            Layout.topMargin: 10
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
            spacing: 20 // Consistent spacing between CPU, Clock, Audio, etc.

            // Hardware Stats
            Cpu { 
                Layout.alignment: Qt.AlignHCenter
                // Layout.preferredHeight: 9
                Layout.bottomMargin: 9
            }
            Memory { 
                Layout.alignment: Qt.AlignHCenter 
                Layout.bottomMargin: 5
            }

            // System Info
            Clock_date { Layout.alignment: Qt.AlignHCenter }
            
            // Controls
            Audio   { Layout.alignment: Qt.AlignHCenter }
            Network { Layout.alignment: Qt.AlignHCenter }
            Battery { Layout.alignment: Qt.AlignHCenter }
            
            // Tray (At the very bottom of the content stack)
            SysTray { 
                Layout.alignment: Qt.AlignHCenter 
                Layout.bottomMargin: 5 // Tiny extra lift from the bottom edge
            }
        }
    }   
}
}

