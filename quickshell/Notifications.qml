import Quickshell
import Quickshell.Wayland
import Quickshell.Services.Notifications
import QtQuick

PanelWindow {
    id: parentWindow

    WlrLayershell.layer: WlrLayer.Top
    mask: Region {}

    anchors {
        top: true
        right: true
    }

    color: "transparent"

    implicitHeight: 100
    implicitWidth: 300

    PopupWindow {
        id: notificationPopup

        anchor.window: parentWindow
        implicitWidth: parentWindow.width
        implicitHeight: parentWindow.height
        visible: false

        property var lastNotification: Notification

        function getLastNotification() {
            return lastNotification
        }

        NotificationServer{
            onNotification: (n) => {
                notificationPopup.lastNotification = n
                notificationPopup.visible = true
            }
        }

        Rectangle {
            anchors.fill: parent
            color: theme.backgroundColor

            Text {
                id: appNameText
                text: notificationPopup.getLastNotification().appName
                font: theme.ubuntuMonoNerdFont
                color: theme.foregroundColor
            }

            Text {
                id: summaryText
                text: notificationPopup.getLastNotification().summary
                anchors.top: appNameText.bottom
                font: theme.ubuntuMonoNerdFont
                color: theme.foregroundColor
            }

            Text {
                text: notificationPopup.getLastNotification().body
                anchors.top: summaryText.bottom
                font: theme.ubuntuMonoNerdFont
                color: theme.foregroundColor
            }
        }
    }
}
