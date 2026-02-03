import Quickshell
import Quickshell.Services.UPower
import QtQuick

import qs.theme

Rectangle {
    id: batteryWidget
    color: "transparent"
    height: col.height
    width: parent.width

    Theme {
        id: theme
    }

    function getPercentage() {
        if (UPower.displayDevice.isLaptopBattery) {
            return (UPower.displayDevice.percentage * 100).toFixed()
        }
    }

    function getIcon() {
        var percentage = batteryWidget.getPercentage()
        if (!UPower.displayDevice.isLaptopBattery) {
            return ""
        }

        if (!UPower.onBattery) {
            return "󰂄"
        }
        switch (true) {
            case (percentage == 100): return "󰁹"
            case (percentage >= 90): return "󰂂"
            case (percentage >= 80): return "󰂁"
            case (percentage >= 70): return "󰂀"
            case (percentage >= 60): return "󰁿"
            case (percentage >= 50): return "󰁾"
            case (percentage >= 40): return "󰁽"
            case (percentage >= 30): return "󰁼"
            case (percentage >= 20): return "󰁻"
            case (percentage >= 10): return "󰁺"
            default:                 return "󱃍"
        }
    }

    function getColor() {
        var percentage = batteryWidget.getPercentage()
        if (!UPower.onBattery) {
            return "#00ff00"
        }

        if (percentage <= 15) {
            return "#ff0000"
        } else {
            return theme.foregroundColor
        }
    }

    visible: UPower.displayDevice.isLaptopBattery

    Column {
        id: col
        width: parent.width

        Text {
            id: icon
            text: batteryWidget.getIcon()
            anchors.horizontalCenter: parent.horizontalCenter
            color: batteryWidget.getColor()
            font: theme.ubuntuMonoNerdFont
        }


        Text {
            text: batteryWidget.getPercentage() + "%"
            anchors.horizontalCenter: parent.horizontalCenter
            font: theme.ubuntuMonoNerdFont
            color: theme.foregroundColor
        }
    }


}
