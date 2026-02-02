import Quickshell
import Quickshell.Services.UPower
import QtQuick

Rectangle {
    id: batteryWidget
    color: theme.backgroundColor

    function getPercentage() {
        if (UPower.displayDevice.isLaptopBattery) {
            return (UPower.devices.values[0].percentage * 100).toFixed()
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

    Text {
        id: icon
        text: batteryWidget.getIcon()
        color: batteryWidget.getColor()
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
