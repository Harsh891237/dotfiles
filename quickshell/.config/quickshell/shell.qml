//@ pragma UseQApplication

import Quickshell
import Quickshell.Io
import QtQuick
import QtQuick.Controls
import Quickshell.Wayland
import Quickshell.Hyprland
import Quickshell.Widgets

import "./Bar/"

ShellRoot {
    // property bool enableBar: true
    Bar{}
 //    LazyLoader { 
	// active: enableBar
	// component: Bar{}
 //    }
}
