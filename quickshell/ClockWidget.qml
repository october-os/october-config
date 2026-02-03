import Quickshell
import QtQuick

Rectangle {
    height: text.height
    width: parent.width
    color: "transparent"

    Text {
        id: text
        text: TimeWidgetData.time
        anchors.horizontalCenter: parent.horizontalCenter
        color: theme.foregroundColor
        font: theme.ubuntuMonoNerdFont
    }
}
