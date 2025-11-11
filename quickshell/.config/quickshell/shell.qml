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
    property bool enableBar: true
    LazyLoader { 
	active: enableBar
	component: Bar{}
    }
}
