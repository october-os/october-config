import QtQuick

QtObject {
    id: theme
    readonly property font ubuntuMonoNerdFont: Qt.font({
        family: "Ubuntu Mono Nerd Font Propo",
        pointSize: 12
    })
    readonly property color backgroundColor: "{background}"
    readonly property color foregroundColor: "{foreground}"
    readonly property int widgetsSpacing: 10
    readonly property int workspacesSpacing: 5
    readonly property color activeWorkspace: "{color2}"
    readonly property color inactiveWorkspace: "{foreground}"
    readonly property color accentColor: "{color1}"
}
