// qmllint disable uncreatable-type unqualified

import Quickshell
import Quickshell.Wayland
import QtQuick
import QtQuick.Effects
import QtQuick.Layouts

import "."

PanelWindow {
    id: panelWindow

    anchors {
        // left: true
        right: true
        top: true
        bottom: true
    }
    margins {
        left: 0
        right: 0
        top: 0
        bottom: 0
    }
    color: "transparent"
    implicitWidth: 60 //  50px for the bar + 10px for shadow space

    RectangularShadow {
        anchors.fill: bar
        offset.x: -1
        offset.y: 1
        radius: 20
        blur: 10
        spread: 0.3
        color: Qt.darker(bar.color, 1.6)
    }

    Rectangle {
        id: bar
        width: 52
        radius: 0
        color: Theme.on_secondary_fixed
        // border.width: 1
        // border.color: "#918f8a"

        anchors.right: parent.right
        anchors.top: parent.top
        anchors.topMargin: 0
        anchors.bottom: parent.bottom
        anchors.bottomMargin: 0

        ColumnLayout {
            anchors.fill: parent
            anchors.topMargin: 10
            anchors.bottomMargin: 10
            spacing: 0

            Clock_date { Layout.alignment: Qt.AlignHCenter }
            Workspaces {
                Layout.alignment: Qt.AlignHCenter
                Layout.topMargin: 15
                Layout.bottomMargin: 20
            }

            Item {
                Layout.fillHeight: true
                // Layout.fillWidth: true
            }

            ColumnLayout {
                Layout.alignment: Qt.AlignHCenter
                spacing: 10

                // Cpu {
                //     Layout.alignment: Qt.AlignHCenter
                //     // Layout.preferredHeight: 9
                //     Layout.bottomMargin: 20
                // }anchors.centerIn: parent
                // Memory {
                //     Layout.alignment: Qt.AlignHCenter
                //     Layout.bottomMargin: 12
                // }

		        // Audio { Layout.alignment: Qt.AlignHCenter }
                Network { Layout.alignment: Qt.AlignHCenter }
                Battery { Layout.topMargin: -7; Layout.alignment: Qt.AlignHCenter }

                SysTray {
                    Layout.alignment: Qt.AlignHCenter
                    Layout.bottomMargin: 7
                }
            }
        }
    }
}

