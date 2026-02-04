import Quickshell.Hyprland
import Quickshell
import QtQuick
import QtQuick.Layouts

import qs.theme

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
                visible: workspace.onThisScreen() && !workspace.isSpecialWorkspace()
                required property var modelData

                Theme {
                    id: theme
                }

                function onThisScreen() {
                    return modelData.monitor.name == bar.screen.name
                }

                function isSpecialWorkspace() {
                    return modelData.id < 0
                }

                function workspaceWrapperHeight() {
                    return 20
                }

                function workspaceButtonHeight() {
                    if (modelData.active) {
                        return 20
                    } else {
                        return 8
                    }
                }

                Rectangle {
                    color: parent.modelData.active ? theme.activeWorkspace : theme.inactiveWorkspace
                    radius: 10
                    height: parent.workspaceButtonHeight()
                    visible: parent.onThisScreen() && !workspace.isSpecialWorkspace()
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
