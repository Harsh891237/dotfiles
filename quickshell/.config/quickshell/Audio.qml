import Quickshell.Services.Pipewire
import QtQuick
import QtQuick.Layouts
import "."

ColumnLayout {
   id: root

   // Reference to the default audio sink
   readonly property var sink: Pipewire.defaultAudioSink

   // Direct, reactive binding to the native mute state
   readonly property bool isMuted: sink?.audio?.muted ?? false

   // Check if the current sink is a Bluetooth device
   function isBluetoothSink() {
      return sink?.name?.includes("bluez") ?? false;
   }

   // This binds the default sink properties so that volume & mute state update live
   PwObjectTracker {
      objects: [Pipewire.defaultAudioSink]
   }

   RowLayout {
      spacing: 2
      Layout.alignment: Qt.AlignVCenter

      Text {
         font.family: "Material Symbols Outlined"
         font.pixelSize: 18
         color: Theme.on_background
         text: {
            if (isMuted) {
               return "󰖁"; // muted icon
            } else if (isBluetoothSink()) {
               return "\ue1a8"; // bluetooth icon
            } else {
               return "\ue050"; // normal volume icon
            }
         }
      }
   }
}
