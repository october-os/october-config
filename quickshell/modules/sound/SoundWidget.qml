import Quickshell
import Quickshell.Services.Pipewire
import QtQuick

import qs.theme

Rectangle {
    id: batteryWidget
    color: "transparent"
    height: col.height
    width: parent.width

    PwObjectTracker { objects: [ Pipewire.defaultAudioSink ] }

    Theme {
        id: theme
    }

    function getVolume() {
        if (Pipewire.defaultAudioSink != null) {
            return (Pipewire.defaultAudioSink.audio.volume * 100).toFixed()
        }
    }

    function getIcon() {
        var volume = batteryWidget.getVolume()
        if (Pipewire.defaultAudioSink == null) {
            return ""
        }

        if (Pipewire.defaultAudioSink.audio.muted) {
            return "󰝟";
        }

        switch (true) {
            case (volume >= 75): return "󰕾"
            case (volume >= 25): return "󰖀"
            default:             return "󰕿"
        }
    }

    visible: Pipewire.defaultAudioSink != null

    Column {
        id: col
        width: parent.width

        Text {
            id: icon
            text: batteryWidget.getIcon()
            anchors.horizontalCenter: parent.horizontalCenter
            font: theme.ubuntuMonoNerdFont
            color: theme.foregroundColor
        }


        Text {
            text: batteryWidget.getVolume() + "%"
            anchors.horizontalCenter: parent.horizontalCenter
            font: theme.ubuntuMonoNerdFont
            color: theme.foregroundColor
        }
    }


}
