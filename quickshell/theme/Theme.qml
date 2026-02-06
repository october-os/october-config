import QtQuick

QtObject {
    id: theme
    readonly property font ubuntuMonoNerdFont: Qt.font({
        family: "Ubuntu Mono Nerd Font Propo",
        pointSize: 12
    })
    readonly property color backgroundColor: "#ee150911"
    readonly property color foregroundColor: "#c4c1c3"
    readonly property int widgetsSpacing: 10
    readonly property int workspacesSpacing: -10
    readonly property color activeWorkspace: "#746685"
    readonly property color inactiveWorkspace: "#c4c1c3"
    readonly property color accentColor: "#97576E"
    readonly property int workspacesAnimationDelay: 200
}
