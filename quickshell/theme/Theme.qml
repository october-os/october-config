import QtQuick

QtObject {
    id: theme
    readonly property font ubuntuMonoNerdFont: Qt.font({
        family: "Ubuntu Mono Nerd Font Propo",
        pointSize: 12
    })
    readonly property color backgroundColor: "#20160e"
    readonly property color foregroundColor: "#c7c4c2"
    readonly property int widgetsSpacing: 10
    readonly property int workspacesSpacing: 5
    readonly property color activeWorkspace: "#D37846"
    readonly property color inactiveWorkspace: "#c7c4c2"
}
