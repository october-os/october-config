import Quickshell.Networking

import QtQuick
import qs.theme

Rectangle {
    id: networkWidget
    implicitWidth: parent.width
    implicitHeight: icon.height
    color: "transparent"

    readonly property string iconText: {
        return Networking.connectivity != 1 ? "󰇧" : "󱐅";
    }

    Text {
        id: icon
        text: iconText
        anchors.horizontalCenter: parent.horizontalCenter
        font: theme.ubuntuMonoNerdFont
        color: theme.foregroundColor
    }
}
