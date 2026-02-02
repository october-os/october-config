import Quickshell.Hyprland
import Quickshell
import QtQuick
import QtQuick.Layouts

Column {
    anchors.centerIn: parent
    spacing: 5

    Repeater {
        model: Hyprland.workspaces.values

        Rectangle {
            width: 30
            height: 20
            color: theme.backgroundColor
            required property var modelData

            Rectangle {
                color: parent.modelData.active ? "#ff00ff" : theme.foregroundColor
                radius: 10
                height: parent.modelData.active ? 20 : 8
                Layout.alignment: Qt.AlignHCenter
                width: parent.parent.width / 4
                anchors.centerIn: parent

                Behavior on width {
                    NumberAnimation { duration: 150; easing.type: Easing.InOutQuad }
                }
            }

            MouseArea {
                anchors.fill: parent
                onClicked: Hyprland.dispatch("workspace " + parent.modelData.id)
            }
        }
    }
}
