import Quickshell
import Quickshell.Io
import QtQuick
import QtQuick.Layouts
import "modules/bluetooth"

ShellRoot {
    Background{}

    BluetoothManager {
        id: bluetoothManager
        visible: false
    }

    Bar {
        onPanelReady: (panelWindow) => {
            bluetoothManager.anchor.window = panelWindow
        }

        onToggleBluetoothPopup: {
            bluetoothManager.visible = !bluetoothManager.visible
        }
    }
}
