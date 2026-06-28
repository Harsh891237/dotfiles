import Quickshell
import Quickshell.Hyprland
import Quickshell.Networking
import QtQuick
import QtQuick.Layouts
import QtQuick.Controls

import "."

ColumnLayout {
   id: networkRoot
   Layout.bottomMargin: 11

   readonly property bool isConnected: Networking.connectivity !== NetworkConnectivity.None && Networking.connectivity !== NetworkConnectivity.Unknown

   readonly property var activeDevice: isConnected ? Networking.devices.values.find(device => device.connected) : null

   // 3. Identify the connection type
   readonly property bool isWifi: isConnected && activeDevice?.type === DeviceType.Wifi
   readonly property bool isEthernet: isConnected && activeDevice?.type === DeviceType.Wired

   readonly property var activeNetwork: isWifi ? activeDevice?.networks?.values?.find(net => net.connected) : null

   // 5. Retrieve signal strength (safely defaulting to 0.0)
   readonly property real signalStrength: activeNetwork?.signalStrength ?? 0.0

   // 6. Reactively determine the connection icon
   readonly property string connectionIcon: {
      if (!isConnected) {
         return "󰤭"; // Disconnected icon
      }

      if (isEthernet) {
         return "󰈁"; // Ethernet icon
      }

      if (isWifi) {
         if (signalStrength >= 0.75)
            return "󰤨"; // Wi-Fi 4 bars (Strong)
         if (signalStrength >= 0.50)
            return "󰤥"; // Wi-Fi 3 bars (Medium-Strong)
         if (signalStrength >= 0.25)
            return "󰤢"; // Wi-Fi 2 bars (Medium-Weak)
         return "󰤟"; // Wi-Fi 1 bar (Weak)
      }

      return "󱚵"; // Fallback
   }

   // 7. Reactively determine the tooltip text
   readonly property string tooltipText: {
      if (!isConnected) {
         return "No active connection";
      }

      if (isEthernet) {
         return "Connected via Ethernet";
      }

      if (isWifi && activeNetwork) {
         return `Connected to ${activeNetwork.name} (${Math.round(signalStrength * 100)}%)`;
      }

      return "No active connection";
   }

   Row {
      Layout.alignment: Qt.AlignCenter
      spacing: 6

      Text {
         text: networkRoot.connectionIcon
         font.pixelSize: 16
         color: Theme.on_background
         font.family: "JetBrainsMono Nerd Font Propo"

         MouseArea {
            id: mouseArea
            anchors.fill: parent
            cursorShape: Qt.PointingHandCursor

            // Allow tracking mouse position (for tooltips) and right clicks
            hoverEnabled: true
            acceptedButtons: Qt.LeftButton | Qt.RightButton

            // --- 1. Tooltip ---
            // ToolTip {
            //     visible: mouseArea.containsMouse
            //     text: networkRoot.tooltipText
            //     delay: 400 // Wait 400ms before showing

            //     // Simple styling to match your theme
            //     contentItem: Text {
            //         // text: parent.text
            //         text: "Net"
            //         color: Theme.on_background
            //         font.pixelSize: 12
            //     }
            //     background: Rectangle {
            //         color: Theme.surface_container_high
            //         radius: 6
            //         border.color: Theme.outline
            //         border.width: 1
            //     }
            // }

            // --- 2. Context Menu (Right Click) ---
            Menu {
               id: contextMenu

               MenuItem {
                  // Dynamically change text based on current state
                  text: networkRoot.isWifi ? "Turn Wi-Fi Off" : "Turn Wi-Fi On"
                  onTriggered: {
                     // Uses nmcli to toggle wifi directly in the background
                     let state = networkRoot.isWifi ? "off" : "on";
                     Hyprland.dispatch(`hl.dsp.exec_cmd("nmcli radio wifi ${state}")`);
                  }
               }
            }

            // --- 3. Click Handling ---
            onClicked: mouse => {
               if (mouse.button === Qt.RightButton) {
                  // Right-click opens the context menu
                  contextMenu.popup();
               } else if (mouse.button === Qt.LeftButton) {
                  // Left-click directly launches Kitty
                  Hyprland.dispatch('hl.dsp.exec_cmd("kitty -e nmtui")');
               }
            }
         }
      }
   }
}
