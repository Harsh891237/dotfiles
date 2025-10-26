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

ColumnLayout {
    id: clockContainer
    Layout.alignment: Qt.AlignHCenter
    spacing: 0 // Adjust vertical spacing between elements

    // --- Time ---
    Text {
        id: timeHour
        Layout.alignment: Qt.AlignHCenter // Center horizontally in the layout
        font.pixelSize: 19
        font.family: "Rubik"
        font.weight: Font.Bold
        color: "white"
    }

    Text {
        id: timeMinute
        Layout.alignment: Qt.AlignHCenter
        Layout.bottomMargin: 5
        font.pixelSize: 18
        font.family: "Rubik"
        font.weight: Font.Bold
        color: "white"
    }

    // Text {
    //     id: timeAmPm
    //     Layout.alignment: Qt.AlignHCenter
    //     Layout.bottomMargin: 5 // Add extra space before the date
    //     font.pixelSize: 18
    //     font.family: "Rubik"
    //     color: "white"
    // }

    // --- Date ---
    Text {
        id: dateDay
        Layout.alignment: Qt.AlignHCenter
        font.pixelSize: 15
        font.family: "Rubik"
        color: "#bbbbbb"
    }
    
    Text {
        id: dateMonthDay
        Layout.alignment: Qt.AlignHCenter
        font.pixelSize: 15
        font.family: "Rubik"
        color: "#bbbbbb"
    }
    
    Text {
        id: dateMonth
        Layout.alignment: Qt.AlignHCenter
        font.pixelSize: 15
        font.family: "Rubik"
        color: "#bbbbbb"
    }


    // --- Update Logic ---
    Timer {
        interval: 1000
        running: true
        repeat: true
        onTriggered: updateClock()
    }

    Component.onCompleted: updateClock()

    function updateClock() {
        const now = new Date()
        timeHour.text = Qt.formatTime(now, "hh")
        timeMinute.text = Qt.formatTime(now, "mm")
        //timeAmPm.text = Qt.formatTime(now, "AP")
        dateDay.text = Qt.formatDate(now, "ddd")
        dateMonthDay.text = Qt.formatDate(now, "dd")
        dateMonth.text = Qt.formatDate(now, "MMM")
    }
}
