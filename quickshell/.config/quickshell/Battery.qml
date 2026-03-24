// if (battery.state === 1) return "lightgreen"; // Charging
// if (battery.state === 4) return "white";      // Full
// if (battery.state === 2) { if (battery.percentage < 0.2) return "#EE4B2B"; else return "#FFD180" }

import Quickshell
import Quickshell.Services.UPower
import QtQuick
import QtQuick.Layouts
import Qt5Compat.GraphicalEffects

Item {
    id: batteryRoot
    width: 22
    height: 38

    property var battery: UPower.displayDevice
    readonly property real p: battery ? battery.percentage : 0.41 

    // 1. THE MASK (Outer Shape)
    Rectangle {
        id: maskShape
        anchors.fill: parent
        radius: width / 2 // Rounds the top and bottom
        visible: false 
    }

    // 2. THE CONTENT
    Item {
        id: contentArea
        anchors.fill: parent
        visible: false 

        // Background (Dark)
        Rectangle {
            anchors.fill: parent
            color: Qt.alpha(Theme.surface_variant,0.99)
        }

        // The Dynamic Fill (Fills Bottom -> Up)
        Rectangle {
            id: fillArea
            anchors.bottom: parent.bottom // Locked to bottom
            width: parent.width
            height: parent.height * batteryRoot.p // Dynamic height
            
            radius: 0 // Flat top edge
            color: if ( battery && battery.state === 1) { return "#a6e3a1" }
                   else if ( batteryRoot.p === 1 ){ return Theme.primary }
                   else { return Qt.alpha(Theme.tertiary,0.9) }
            
            Behavior on height {
                NumberAnimation { duration: 400; easing.type: Easing.OutCubic }
            }
        }

        // Layer A: White text (visible on the dark background)
        Text {
            id: mainText
            anchors.centerIn: parent
            text: (batteryRoot.p === 1) ? "󱟢" : Math.round(batteryRoot.p * 100)
            font.family: "Rubik"
            font.pixelSize: 12
            font.bold: true
            color: Theme.on_surface
        }

        // Layer B: Dark text (revealed by the fill area)
        Item {
            anchors.bottom: parent.bottom // Anchored to bottom to match fillArea
            width: parent.width
            height: fillArea.height // Matches the height of the lavender fill
            clip: true 

            Text {
                // Anchored back to the root batteryRoot so the text 
                // doesn't move while the clip-box moves.
                width: batteryRoot.width
                height: batteryRoot.height
                anchors.bottom: parent.bottom 
                
                horizontalAlignment: Text.AlignHCenter
                verticalAlignment: Text.AlignVCenter
                
                text: mainText.text
                font: mainText.font
                color: Theme.background
            }
        }
    }

    // 3. THE RENDERER
    OpacityMask {
        anchors.fill: parent
        source: contentArea
        maskSource: maskShape
    }
}