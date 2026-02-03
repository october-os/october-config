import Quickshell
import Quickshell.Io
import Quickshell.Bluetooth
import QtQuick
import QtQuick.Controls

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
        width: parent.width
        height: parent.height
        radius: 10

        Process {
            id: togglerProcess
            command: ["rfkill", "toggle", "bluetooth"]
        }

        Switch {
            text: bluetoothManager.getBluetoothState() ? "Disable bluetooth" : "Enable bluetooth"
            checked: bluetoothManager.getBluetoothState()
            onClicked: bluetoothManager.toggleBluetooth()
        }
    }
}
