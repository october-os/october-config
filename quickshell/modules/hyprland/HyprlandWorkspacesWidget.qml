import Quickshell.Hyprland
import Quickshell
import QtQuick
import QtQuick.Layouts

import qs.theme

Rectangle {
    implicitWidth: col.width
    implicitHeight: col.height
    color: "transparent"
    radius: 10

    ColumnLayout {
        id: col
        spacing: theme.workspacesSpacing

        Repeater {
            model: Hyprland.workspaces.values

            Rectangle {
                id: workspace
                width: 20
                height: workspaceWrapperHeight
                color: "transparent"
                visible: onThisScreen && !isSpecialWorkspace
                required property var modelData

                readonly property bool onThisScreen: modelData.monitor.name == bar.screen.name
                readonly property bool isActive: modelData.active
                readonly property bool isSpecialWorkspace: modelData.id < 0
                readonly property int workspaceWrapperHeight: 35
                readonly property int workspaceButtonHeight: modelData.active ? 20 : 8

                Rectangle {
                    color: isActive ? theme.activeWorkspace : theme.inactiveWorkspace
                    radius: 10
                    height: workspaceButtonHeight
                    visible: onThisScreen && !isSpecialWorkspace
                    width: parent.parent.width / 2.5
                    anchors.centerIn: parent

                    Behavior on height {
                        NumberAnimation { duration: theme.workspacesAnimationDelay; easing.type: Easing.InOutQuad }
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
