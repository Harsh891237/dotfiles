//@ pragma UseQApplication

import Quickshell
import Quickshell.Io
import Quickshell.Wayland
import Quickshell.Hyprland
import Quickshell.Widgets
import Quickshell.Services.UPower
import QtQuick
import QtQuick.Effects
import QtQuick.Controls
import QtQuick.Layouts
import Qt5Compat.GraphicalEffects

Item {
    id: batteryRoot

    property var battery: UPower.displayDevice
    visible: battery !== null

    ColumnLayout {
        anchors.centerIn: parent
        RowLayout {
            spacing: -2
            Text {
                font.family: "Rubik"
                font.pixelSize: 14
                text: Math.round(battery.percentage * 100)
                color: "white"
            }

            Text {
                id: batteryIcon
                font.family: "Material Symbols Outlined"
                font.pixelSize: 17
            }
        }
    }

    Timer {
        interval: 1000
        running: true
        repeat: true
        onTriggered: updateBatteryStatus()
    }

    Component.onCompleted: updateBatteryStatus()

    function updateBatteryStatus() {
        if (!battery) return;
        batteryIcon.text = getBatteryIcon();
        batteryIcon.color = getBatteryColor();
    }

    function getBatteryIcon() {
        switch (battery.state) {
            case 1: return "\uf0a6"; // Charging
            case 4: return "\ue1a4"; // Full
        }
        const p = battery.percentage * 100;
        if (p > 95) return "\ue1a4";
        if (p > 80) return "\uebd2";
        if (p > 70) return "\uebd4";
        if (p > 60) return "\uebd4";
        if (p > 50) return "\uebe2";
        if (p > 40) return "\uebdd";
        if (p > 30) return "\uebe0";
        if (p > 20) return "\uebd9";
        return "\uebdc";
    }

    function getBatteryColor() {
        if (battery.state === 1) return "lightgreen"; // Charging
        if (battery.state === 4) return "white";      // Full
        if (battery.state === 2) { if (battery.percentage < 0.2) return "#EE4B2B"; else return "#FFD180" }
        return "lightgreen";
    }
}
