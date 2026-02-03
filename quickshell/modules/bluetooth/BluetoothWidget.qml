import Quickshell
import Quickshell.Bluetooth
import QtQuick

Rectangle {
    id: bluetoothWidget
    width: parent.width
    height: 20
    visible: Bluetooth.defaultAdapter != undefined
    color: "transparent"

    signal togglePopup()

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

    Text {
        id: icon
        text: bluetoothWidget.getIcon()
        anchors.horizontalCenter: parent.horizontalCenter
        font: theme.ubuntuMonoNerdFont
        color: theme.foregroundColor
    }

    MouseArea {
        anchors.fill: parent
        onClicked: bluetoothWidget.togglePopup()
    }
}
