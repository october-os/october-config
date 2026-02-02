import Quickshell
import QtQuick

Rectangle {
    id: clockWidget
    color: theme.backgroundColor

    Text {
        text: TimeData.time
        color: theme.foregroundColor
        font: theme.ubuntuMonoNerdFont
        anchors.centerIn: parent
    }
}
