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
        color: "transparent"

        property var lastNotification: Notification

        Timer {
            id: timer
        }

        function delay(t, cb) {
            timer.interval = t;
            timer.repeat = false;
            timer.triggered.connect(cb);
            timer.start();
        }

        function getLastNotification() {
            return lastNotification
        }

        NotificationServer{
            onNotification: (n) => {
                notificationPopup.lastNotification = n;
                notificationPopup.visible = true;

                var t = 5000;
                if (n.expireTimeout != -1) {
                    t = n.expireTimeout * 1000
                }

                notificationPopup.delay(t, function() {
                    notificationPopup.visible = false;
                    });
            }
        }

        Rectangle {
            anchors.fill: parent
            color: theme.backgroundColor
            radius: 10

            Column {
                padding: 10
                spacing: 5

                Text {
                    text: notificationPopup.getLastNotification().appName + "/" + notificationPopup.getLastNotification().summary
                    font: theme.ubuntuMonoNerdFont
                    color: theme.foregroundColor
                    opacity: 0.5
                }

                Row {
                    spacing: 5
                    leftPadding: 10
                    height: 50

                    Image {
                        source: notificationPopup.getLastNotification().image
                        height: parent.height
                        fillMode: Image.PreserveAspectFit
                    }

                    Text {
                        text: notificationPopup.getLastNotification().body
                        font: theme.ubuntuMonoNerdFont
                        color: theme.foregroundColor
                    }
                }
            }
        }
    }
}
