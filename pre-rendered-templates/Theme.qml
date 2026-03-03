import QtQuick

QtObject {
    id: theme
    readonly property font ubuntuMonoNerdFont: Qt.font({
        family: "Ubuntu Mono Nerd Font Propo",
        pointSize: 12
    })
    readonly property color backgroundColor: "#ee090404"
    readonly property color foregroundColor: "#c1c0c0"
    readonly property int widgetsSpacing: 10
    readonly property int workspacesSpacing: -10
    readonly property color activeWorkspace: "#fbb3eb"
    readonly property color inactiveWorkspace: "#c1c0c0"
    readonly property color accentColor: "#fbb3eb"
    readonly property int workspacesAnimationDelay: 200
}
