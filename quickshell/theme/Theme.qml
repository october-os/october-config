import QtQuick

QtObject {
    id: theme
    readonly property font ubuntuMonoNerdFont: Qt.font({
        family: "Ubuntu Mono Nerd Font Propo",
        pointSize: 12
    })
    readonly property color backgroundColor: "#0b101b"
    readonly property color foregroundColor: "#c2c3c6"
    readonly property int widgetsSpacing: 10
    readonly property int workspacesSpacing: 5
    readonly property color activeWorkspace: "#8B5A33"
    readonly property color inactiveWorkspace: "#c2c3c6"
    readonly property color accentColor: "#66535C"
}
