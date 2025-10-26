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

import "root:/widgets" 

PanelWindow {
id: panelWindow

anchors {
    left: true
    top: true
    bottom: true
}
margins { 
    left: 7
    right: 0
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
    radius: 20
    color: "#0f1513"
    // border.width: 1
    // border.color: "#918f8a"
    
    anchors.left: parent.left
    anchors.top: parent.top
    anchors.topMargin: 7
    anchors.bottom: parent.bottom
    anchors.bottomMargin: 7

    ColumnLayout {
        anchors {
            fill: parent
            horizontalCenter: parent.horizontalCenter
        }
        Layout.alignment: Qt.AlignHCenter

        workspaces {
            Layout.alignment: Qt.AlignHCenter
            Layout.topMargin: 12
        }

        Item {
            Layout.fillHeight: true
        }

        cpu {
            Layout.bottomMargin: 25
            Layout.alignment: Qt.AlignHCenter
        }

        memory {
            Layout.bottomMargin: 17
            Layout.alignment: Qt.AlignHCenter
        }
        Item {
            Layout.alignment: Qt.AlignHCenter
            Layout.bottomMargin: 225
            ColumnLayout {
                id: statusArea
                anchors.horizontalCenter: parent.horizontalCenter
                spacing: 20
                clock_date {Layout.alignment: Qt.AlignHCenter}
                audio     {Layout.alignment: Qt.AlignHCenter}
                network   {Layout.alignment: Qt.AlignHCenter}
                battery   {
                    Layout.alignment: Qt.AlignHCenter
                }
            }
        }
    }      
}
}

