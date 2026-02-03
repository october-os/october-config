import QtQuick

QtObject {
    id: theme
    readonly property font ubuntuMonoNerdFont: Qt.font({
        family: "Ubuntu Mono Nerd Font Propo",
        pointSize: 12
    })
    readonly property color backgroundColor: Qt.rgba(0.09, 0.09, 0.10, 1.0)
    readonly property color foregroundColor: "#ffffff"
    readonly property int widgetsSpacing: 10
    readonly property int workspacesSpacing: 5
    readonly property color activeWorkspace: "#ff99ff"
    readonly property color inactiveWorkspace: "#ffffff"
}
