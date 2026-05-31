import Quickshell
import Quickshell.Networking
import Quickshell.Io
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

    function launchNmTui() {
        nmtuiProcess.running = true
    }

    Process {
        id: nmtuiProcess
        command: ["kitty", "nmtui"]
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
        onClicked: networkWidget.launchNmTui()
    }
}
