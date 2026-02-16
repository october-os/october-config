import Quickshell
import QtQuick

import qs.theme

ShellRoot {

    Connections { // Hide reload popups (disable for dev)
        target: Quickshell
        function onReloadCompleted() { Quickshell.inhibitReloadPopup() }
        function onReloadFailed() { Quickshell.inhibitReloadPopup() }
        }

    Theme { id: theme }

    Notifications{}
    BarCorners{}
    Bar {}
}
