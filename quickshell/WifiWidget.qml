import Quickshell
import QtQuick

// waiting on next quickshell release

Rectangle {
    id: wifiWidget
    height: 100
    color: "#ff0000"

    function getConnectionType() {
        Networking.devices.values.forEach(device => {
            console.log(device.state.toString() + ", " + device.name)
        })
        return "uwu"
    }

    Text {
        text: wifiWidget.getConnectionType()
    }
}
