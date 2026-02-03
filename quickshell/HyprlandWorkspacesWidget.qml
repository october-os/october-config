import Quickshell.Hyprland
import Quickshell
import QtQuick
import QtQuick.Layouts


Rectangle {
    width: col.width
    height: col.height
    color: "transparent"

    ColumnLayout {
        id: col
        spacing: theme.workspacesSpacing

        Repeater {
            model: Hyprland.workspaces.values

            Rectangle {
                id: workspace
                width: 30
                height: workspace.workspaceWrapperHeight()
                color: "transparent"
                required property var modelData

                function onThisScreen() {
                    return modelData.monitor.name == bar.screen.name
                }

                function isSpecialWorkspace() {
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
                    color: parent.modelData.active ? theme.activeWorkspace : theme.inactiveWorkspace
                    radius: 10
                    height: parent.workspaceButtonHeight()
                    visible: parent.onThisScreen()
                    width: parent.parent.width / 4
                    anchors.centerIn: parent

                    Behavior on height {
                        NumberAnimation { duration: 200; easing.type: Easing.InOutQuad }
                    }
                }

                MouseArea {
                    anchors.fill: parent
                    onClicked: Hyprland.dispatch("workspace " + parent.modelData.id)
                }
            }
        }
    }
}
