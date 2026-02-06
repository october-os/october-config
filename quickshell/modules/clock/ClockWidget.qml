import Quickshell
import QtQuick

Rectangle {
    implicitHeight: text.height
    implicitWidth: parent.width
    color: "transparent"

    Text {
        id: text
        text: TimeWidgetData.time
        anchors.horizontalCenter: parent.horizontalCenter
        color: theme.foregroundColor
        font: theme.ubuntuMonoNerdFont
    }
}
