import Quickshell
import Quickshell.Io
import Quickshell.Bluetooth
import QtQuick

import qs.theme

Rectangle {
    id: bluetoothWidget
    implicitWidth: parent.width
    implicitHeight: icon.height
    visible: hasBluetoothAdapter
    color: "transparent"

    readonly property bool hasBluetoothAdapter: Bluetooth.defaultAdapter != undefined

    readonly property bool hasConnectedDevices: {
        var model = Bluetooth.defaultAdapter

        for (var i in model.devices.values) {
            if (model.devices.values[i].connected) {
                return true
            }
        }

        return false
    }

    readonly property string iconText: {
        var disabled = 4
        var enabled = 1
        var enabling = 2
        var disabling = 3

        switch (Bluetooth.defaultAdapter.state) {
            case disabled: return "󰂲"
            case enabled: {
                if (hasConnectedDevices) {
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

    function launchBlueman() {
        bluemanProcess.running = true
    }

    Process {
        id: bluemanProcess
        command: ["blueman-manager"]
        running: false
    }

    Text {
        id: icon
        text: iconText
        anchors.horizontalCenter: parent.horizontalCenter
        font: theme.ubuntuMonoNerdFont
        color: theme.foregroundColor
    }

    MouseArea {
        anchors.fill: parent
        cursorShape: Qt.PointingHandCursor
        onClicked: bluetoothWidget.launchBlueman()
    }
}
