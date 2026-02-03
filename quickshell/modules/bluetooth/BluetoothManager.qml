import Quickshell
import Quickshell.Io
import Quickshell.Bluetooth
import QtQuick
import QtQuick.Controls

import qs.theme

PopupWindow {
    id: bluetoothManager

    width: 300
    height: 50

    color: "transparent"

    anchor.rect.x: anchor.window.width
    anchor.rect.y: anchor.window.height

    function toggleBluetooth() {
        togglerProcess.running = true
    }

    function getBluetoothState() {
        var disabled = 4

        return Bluetooth.defaultAdapter.state != disabled
    }

    Rectangle {
        Theme {
            id: theme
        }

        width: parent.width
        height: parent.height
        radius: 10

        color: theme.backgroundColor

        Process {
            id: togglerProcess
            command: ["rfkill", "toggle", "bluetooth"]
        }

        Switch {
            id: control

            text: bluetoothManager.getBluetoothState() ? "Disable bluetooth" : "Enable bluetooth"
            checked: bluetoothManager.getBluetoothState()
            onClicked: bluetoothManager.toggleBluetooth()

            contentItem: Text {
                text: control.text
                font: theme.ubuntuMonoNerdFont
                color: theme.foregroundColor
                leftPadding: control.indicator.width + control.spacing
            }
        }
    }
}
