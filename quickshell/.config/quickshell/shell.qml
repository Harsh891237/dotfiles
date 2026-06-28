//@ pragma UseQApplication

import Quickshell
import Quickshell.Io
import QtQuick
import QtQuick.Controls
import Quickshell.Wayland
import Quickshell.Hyprland
import Quickshell.Widgets

import "."

ShellRoot {
   AppLauncher {
      id: persistentLauncher
   }

   GlobalShortcut {
      name: "toggle_launcher"
      description: "Toggles the Quickshell App Launcher"
      onPressed: {
         persistentLauncher.visible = !persistentLauncher.visible;
      }
   }

   LogoutMenu {
      id: persistentLogout
   }

   GlobalShortcut {
      name: "toggle_logout"
      description: "Toggles the Logout Menu"
      onPressed: {
         persistentLogout.visible = !persistentLogout.visible;
      }
   }

   property bool enableBar: true
   LazyLoader {
      active: enableBar
      component: Bar {}
   }
   Osd {}
   Wallpaper {}
}
