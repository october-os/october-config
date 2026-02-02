import Quickshell
import Quickshell.Bluetooth
import QtQuick

Rectangle {
    id: bluetoothWidget
    function hasBluetoothAdapter() {
        return Bluetooth.defaultAdapter != null
    }

    function hasConnectedDevices() {
        var model = Bluetooth.defaultAdapter

        for (var i in model.devices.values) {
            if (model.devices.values[i].connected) {
                return true
            }
        }

        return false
    }

    function getIcon() {
        if (!bluetoothWidget.hasBluetoothAdapter()) {
            return ""
        }

        var disabled = 4
        var enabled = 1
        var enabling = 2
        var disabling = 3

        switch (Bluetooth.defaultAdapter.state) {
            case disabled: return "󰂲"
            case enabled: {
                if (bluetoothWidget.hasConnectedDevices()) {
                    return "󰂱"
                } else {
                    return "󰂯"
                }
            }
            case enabling:
            case disabling: return "󰂳"
            default: return ""
        }

    }

    height: bluetoothWidget.hasBluetoothAdapter() ? 25 : 0

    Text {
        id: icon
        text: bluetoothWidget.getIcon()
        anchors.centerIn: parent
        font: theme.ubuntuMonoNerdFont
    }

    /*
    Text {
        height: 25
        text: batteryWidget.getPercentage() + "%"
        color: theme.foregroundColor
        anchors.top: icon.bottom
        anchors.leftMargin: 5
        anchors.horizontalCenter: icon.horizontalCenter
        font: theme.ubuntuMonoNerdFont
    }*/
}
