import Quickshell
import Quickshell.Io
import Quickshell.Services.Pipewire
import QtQuick

import qs.theme

Rectangle {
    id: soundWidget
    color: "transparent"
    implicitHeight: col.height
    width: parent.width

    PwObjectTracker { objects: [ Pipewire.defaultAudioSink ] }

    readonly property bool hasDefaultAudioSink: Pipewire.defaultAudioSink != null
    readonly property int volumePercentage: hasDefaultAudioSink ? Math.round(Pipewire.defaultAudioSink.audio.volume * 100) : 0
    readonly property string iconText: {
        if (!hasDefaultAudioSink) return ""
        if (Pipewire.defaultAudioSink.audio.muted) return "󰝟"
        if (volumePercentage >= 75) return "󰕾"
        if (volumePercentage >= 25) return "󰖀"
        return "󰕿"
    }

    visible: hasDefaultAudioSink

    Column {
        id: col
        width: parent.width

        Text {
            text: iconText
            anchors.horizontalCenter: parent.horizontalCenter
            font: theme.ubuntuMonoNerdFont
            color: theme.foregroundColor
        }


        Text {
            text: volumePercentage + "%"
            anchors.horizontalCenter: parent.horizontalCenter
            font: theme.ubuntuMonoNerdFont
            color: theme.foregroundColor
        }
    }

    function launchPavuControl() {
        bluemanProcess.running = true
    }

    Process {
        id: bluemanProcess
        command: ["pavucontrol"]
        running: false
    }

    MouseArea {
        anchors.fill: parent
        cursorShape: Qt.PointingHandCursor
        onClicked: soundWidget.launchPavuControl()
    }

}
