import Quickshell
import Quickshell.Networking
import QtQuick
import QtQuick.Layouts

import "."

ColumnLayout {
    id: networkRoot
    Layout.bottomMargin: 11

    // 1. Break the loop: rely only on NetworkManager's connection state
    readonly property bool isConnected: Networking.connectivity !== NetworkConnectivity.None &&
                                        Networking.connectivity !== NetworkConnectivity.Unknown

    // 2. This can now safely depend on isConnected without creating a loop
    readonly property var activeDevice: isConnected 
        ? Networking.devices.values.find(device => device.connected) 
        : null

    // 3. Identify the connection type
    readonly property bool isWifi: isConnected && activeDevice?.type === DeviceType.Wifi
    readonly property bool isEthernet: isConnected && activeDevice?.type === DeviceType.Wired

    // 4. Changed from 'WifiNetwork' to 'var' to allow undefined values safely
    readonly property var activeNetwork: isWifi 
        ? activeDevice?.networks?.values?.find(net => net.connected) 
        : null

    // 5. Retrieve signal strength (safely defaulting to 0.0)
    readonly property real signalStrength: activeNetwork?.signalStrength ?? 0.0

    // 6. Reactively determine the connection icon
    readonly property string connectionIcon: {
        if (!isConnected) {
            return "󰤭" // Disconnected icon
        }

        if (isEthernet) {
            return "󰈁" // Ethernet icon
        }

        if (isWifi) {
            if (signalStrength >= 0.75) return "󰤨" // Wi-Fi 4 bars (Strong)
            if (signalStrength >= 0.50) return "󰤥" // Wi-Fi 3 bars (Medium-Strong)
            if (signalStrength >= 0.25) return "󰤢" // Wi-Fi 2 bars (Medium-Weak)
            return "󰤟" // Wi-Fi 1 bar (Weak)
        }

        return "󱚵" // Fallback
    }

    // 7. Reactively determine the tooltip text
    readonly property string tooltipText: {
        if (!isConnected) {
            return "No active connection"
        }

        if (isEthernet) {
            return "Connected via Ethernet"
        }

        if (isWifi && activeNetwork) {
            return `Connected to ${activeNetwork.name} (${Math.round(signalStrength * 100)}%)`
        }

        return "No active connection"
    }

    Row {
        Layout.alignment: Qt.AlignCenter
        spacing: 6

        Text {
            text: networkRoot.connectionIcon
            font.pixelSize: 16
            color: Theme.on_background
            font.family: "JetBrainsMono Nerd Font Propo"
        }
    }
}
