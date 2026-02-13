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

    margins {
        top: 20
        right: 20
    }

    color: "transparent"

    implicitHeight: 100
    implicitWidth: 300

    PopupWindow {
        id: notificationPopup

        anchor.window: parentWindow
        implicitWidth: parentWindow.width
        implicitHeight: parentWindow.height
        visible: uiRect.opacity > 0
        color: "transparent"

        property var lastNotification: Notification

        Timer {
            id: notifTimer
            repeat: false
            onTriggered: {
                uiRect.shown = false
            }
        }

        function getLastNotification() {
            return lastNotification
        }

        NotificationServer{
            onNotification: (n) => {
                notificationPopup.lastNotification = n;
                uiRect.shown = true;

                notifTimer.interval = 5000;
                if (n.expireTimeout != -1) {
                    notifTimer.interval = n.expireTimeout * 1000
                }

                notifTimer.start();
            }
        }

        Rectangle {
            id: uiRect
            anchors.fill: parent
            color: theme.backgroundColor
            radius: 10
            visible: opacity > 0
            opacity: shown ? 1 : 0

            property bool shown: false

            Behavior on opacity {
                NumberAnimation {
                    duration: 200
                }
            }

            Column {
                padding: 10
                spacing: 5
                width: parent.width

                Text {
                    text: notificationPopup.getLastNotification().appName + "/" + notificationPopup.getLastNotification().summary
                    font: theme.ubuntuMonoNerdFont
                    color: theme.foregroundColor
                    opacity: 0.5
                }

                Row {
                    spacing: 5
                    height: 50
                    width: parent.width

                    Image {
                        id: image
                        source: notificationPopup.getLastNotification().image
                        height: parent.height
                        width: parent.width / 6
                        fillMode: Image.PreserveAspectFit
                        visible: notificationPopup.getLastNotification().image != ""
                    }

                    Text {
                        text: notificationPopup.getLastNotification().body
                        font: theme.ubuntuMonoNerdFont
                        color: theme.foregroundColor
                        wrapMode: Text.Wrap
                        elide: Text.ElideRight
                        height: parent.height
                        width: image.visible ? parent.width - (image.width + 10) : parent.width
                    }
                }
            }
        }
    }
}
