import QtQuick
import QtQuick.Layouts
import QtQuick.Controls
import Qt5Compat.GraphicalEffects
import Quickshell
import Quickshell.Io
import "."
Item {
    id: text
    ColumnLayout {
        spacing: 0
        anchors.centerIn: parent
        Layout.alignment: Qt.AlignVCenter
        // Icon
        Text {
            font.family: "Material Symbols Outlined"
            font.pixelSize: 17
            color: Theme.on_background
            text: "\uf7a3"
        }
        // Percentage
        Text {
            font.family: "Rubik"
            font.pixelSize: 14
            color: Math.floor(percentFree) > 80 ? Theme.error : Theme.on_background
            text: `${Math.floor(percentFree)}`
        }
         
    }

    property real percentFree

    Process {
        id: memProc
        command: ["sh", "-c", "free | grep Mem | awk '{print $3/$2 * 100.0}'"]
        running: true

        stdout: SplitParser {
            onRead: data => percentFree = data
        }
    }

    Timer {
        interval: 3000
        running: true
        repeat: true
        onTriggered: memProc.running = true
    }
}
// import Quickshell
// import Quickshell.Io
// import QtQuick
// import QtQuick.Shapes
// import QtQuick.Layouts
// import Qt5Compat.GraphicalEffects

// Item {
//     id: memoryRoot
//     width: 44
//     height: 44

//     // This property drives the visual bar and text
//     property int percentUsed: 0

//     // --- 1. DATA FETCHING (Corrected) ---
//     Process {
//         id: memProc
//         // Using your verified working command
//         command: ["sh", "-c", "free | awk '/Mem:/ {print int($3/$2 * 100)}'"]
//         running: true // Start immediately
        
//         stdout: SplitParser {
//             // No split char needed for a single line output, 
//             // but we must convert the raw data to a string.
//             onRead: data => {
//                 let str = data.toString().trim();
//                 if (str.length > 0) {
//                     let val = parseInt(str);
//                     if (!isNaN(val)) {
//                         memoryRoot.percentUsed = val;
//                     }
//                 }
//             }
//         }
//     }

//     Timer {
//         interval: 3000
//         running: true
//         repeat: true
//         onTriggered: {
//             // Re-running the process to get fresh data
//             memProc.running = false;
//             memProc.running = true;
//         }
//     }

//     // --- 2. CIRCULAR FILL (Progress Ring) ---
//     Shape {
//         anchors.fill: parent
//         layer.enabled: true
//         layer.samples: 4 

//         // Background Track (Dark)
//         ShapePath {
//             fillColor: "transparent"
//             strokeColor: Theme.outline_variant
//             strokeWidth: 3
//             capStyle: ShapePath.RoundCap
//             PathAngleArc {
//                 centerX: 22; centerY: 22
//                 radiusX: 18; radiusY: 18
//                 startAngle: -90
//                 sweepAngle: 360
//             }
//         }

//         // Animated Foreground (Lavender)
//         ShapePath {
//             fillColor: "transparent"
//             strokeColor: Theme.primary
//             strokeWidth: 3
//             capStyle: ShapePath.RoundCap
//             PathAngleArc {
//                 centerX: 22; centerY: 22
//                 radiusX: 18; radiusY: 18
//                 startAngle: -90
//                 // Use the percentage to determine the circle's "sweep"
//                 sweepAngle: 360 * (memoryRoot.percentUsed / 100)
                
//                 Behavior on sweepAngle {
//                     NumberAnimation { duration: 1000; easing.type: Easing.OutCubic }
//                 }
//             }
//         }
//     }

//     // --- 3. CENTERED CONTENT ---
//     Column {
//         anchors.centerIn: parent
//         spacing: -2

//         // Icon
//         Text {
//             anchors.horizontalCenter: parent.horizontalCenter
//             font.family: "Material Symbols Outlined"
//             font.pixelSize: 14
//             color: "#bac2de"
//             text: "\uf7a3"
//         } 

//         // Number
//         Text {
//             anchors.horizontalCenter: parent.horizontalCenter
//             font.family: "Rubik"
//             font.pixelSize: 10
//             // font.bold: true
//             color: "white"
//             text: memoryRoot.percentUsed
//         }
//     }
// }