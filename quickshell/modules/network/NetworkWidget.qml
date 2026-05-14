import Quickshell
import Quickshell.Networking

import QtQuick
import qs.theme

Rectangle {
    id: networkWidget
    implicitWidth: parent.width
    implicitHeight: icon.height
    color: "transparent"

    readonly property string iconText: {
        var wifiDevice = 1
        var wiredDevice = 2
        var devices = Networking.devices.values;

        for (var i in devices) {
            switch (devices[i].type) {
                case wifiDevice: {
                    if (devices[i].scannerEnabled) {
                        return "󱛂"
                    }

                    console.log(Networking.toString(Networking.Connected) == Networking.toString(devices[i].state))

                    switch (Networking.toString(devices[i].state)) {
                        case Networking.toString(Networking.Connected): return "󰤨"
                        case Networking.toString(Networking.Disconnecting): return "󰤩"
                    }
                }
                case wiredDevice: {
                    if (devices[i].connected) {
                        return "󰈁"
                    }
                }
            }
        }

        return "󰈂"
    }

    Text {
        id: icon
        text: iconText
        anchors.horizontalCenter: parent.horizontalCenter
        font: theme.ubuntuMonoNerdFont
        color: theme.foregroundColor
    }
}
