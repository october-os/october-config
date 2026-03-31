import Quickshell
import Quickshell.Services.UPower
import QtQuick
import qs.theme

Rectangle {
    color: "transparent"
    implicitHeight: col.height
    implicitWidth: parent.width
    visible: isLaptop

    readonly property bool isLaptop: UPower.displayDevice.isLaptopBattery
    readonly property int batteryPercentage: isLaptop ? Math.round(UPower.displayDevice.percentage * 100) : 0
    readonly property bool isCharging: !UPower.onBattery
    readonly property string iconText: {
        if (!isLaptop) return ""
        if (isCharging) {
            if (batteryPercentage >= 100) return "󰂅"
            if (batteryPercentage >= 90)  return "󰂋"
            if (batteryPercentage >= 80)  return "󰂊"
            if (batteryPercentage >= 70)  return "󰢞"
            if (batteryPercentage >= 60)  return "󰂉"
            if (batteryPercentage >= 50)  return "󰢝"
            if (batteryPercentage >= 40)  return "󰂈"
            if (batteryPercentage >= 30)  return "󰂇"
            if (batteryPercentage >= 20)  return "󰂆"
            if (batteryPercentage >= 10)  return "󰢜"
            return "󰢟"
        } else {
            if (batteryPercentage >= 100) return "󰁹"
            if (batteryPercentage >= 90)  return "󰂂"
            if (batteryPercentage >= 80)  return "󰂁"
            if (batteryPercentage >= 70)  return "󰂀"
            if (batteryPercentage >= 60)  return "󰁿"
            if (batteryPercentage >= 50)  return "󰁾"
            if (batteryPercentage >= 40)  return "󰁽"
            if (batteryPercentage >= 30)  return "󰁼"
            if (batteryPercentage >= 20)  return "󰁻"
            if (batteryPercentage >= 10)  return "󰁺"
            return "󱃍"
        }
    }
    readonly property color iconColor: {
        if (isCharging) return "#77ff77"
        if (batteryPercentage <= 15) return "#ff7777"
        return theme.foregroundColor
    }

    Column {
        id: col
        width: parent.width
        spacing: 2 // Optionnel: petit espace entre l'icône et le texte

        Text {
            text: iconText
            anchors.horizontalCenter: parent.horizontalCenter
            color: iconColor
            font: theme.ubuntuMonoNerdFont
        }

        Text {
            text: batteryPercentage + "%"
            anchors.horizontalCenter: parent.horizontalCenter
            font: theme.ubuntuMonoNerdFont
            color: theme.foregroundColor
        }
    }
}
