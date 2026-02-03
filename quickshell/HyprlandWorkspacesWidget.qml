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
            id: workspace
            width: 30
            height: workspace.workspaceWrapperHeight()
            color: theme.backgroundColor
            required property var modelData

            function onThisScreen() {
                return modelData.monitor.name == helloo.screen.name
            }

            function isSpecialWorkspace() {
                console.log(modelData.id < 0)
                return modelData.id < 0
            }

            function workspaceWrapperHeight() {
                if (!workspace.onThisScreen() || workspace.isSpecialWorkspace()) {
                    return 0
                } else {
                    return 20
                }
            }

            function workspaceButtonHeight() {
                if (!workspace.onThisScreen() || workspace.isSpecialWorkspace()) {
                    return 0
                } else if (modelData.active) {
                    return 20
                } else {
                    return 8
                }
            }

            Rectangle {
                color: parent.modelData.active ? theme.foregroundColor : theme.foregroundColor
                radius: 10
                height: parent.workspaceButtonHeight()
                visible: parent.onThisScreen()
                Layout.alignment: Qt.AlignHCenter
                width: parent.parent.width / 4
                anchors.centerIn: parent

                Behavior on height {
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
