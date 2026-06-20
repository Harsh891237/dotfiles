import QtQuick
import Quickshell
import Quickshell.Widgets
import Quickshell.Services.SystemTray

Column {
    id: root
    spacing: 5

    Repeater {
        // SystemTray.items is the list of active tray entries
        model: SystemTray.items

        delegate: Item {
            // Set the size of the tray icon container
            width: 30
            height: 30

            // Text {
            //     text: modelData.title
            //     color: "white"
            // }

            // The tray icon image
            IconImage {
                anchors.centerIn: parent
                width: 20
                height: 20

                source: modelData.icon // 'modelData' refers to the SystemTrayItem
            }

            // Mouse handling for clicks and menus
            MouseArea {
                anchors.fill: parent
                acceptedButtons: Qt.LeftButton | Qt.RightButton

                onClicked: (mouse) => {
                const needsMenu = modelData.onlyMenu || modelData.category >=2 ;
                if (mouse.button === Qt.LeftButton)
                {
                    if (needsMenu)
                    {
                        menuAnchor.open();
                    }
                    else {
                        modelData.activate();
                    }
                } else if (mouse.button === Qt.RightButton) {
                // Right click opens the context menu
                menuAnchor.open();
            }
        }
    }

    // The anchor that positions and displays the tray menu
    QsMenuAnchor {
        id: menuAnchor
        anchor.item: parent
        menu: modelData.menu // Binds to the specific app's menu
    }
}
}

}