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
    implicitWidth: 0

    Behavior on implicitWidth {
        SmoothedAnimation {
            velocity: 600
        }
    }

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
                parentWindow.implicitWidth = 300;

                var t = 5000;
                if (n.expireTimeout != -1) {
                    t = n.expireTimeout * 1000
                }

                notificationPopup.delay(t, function() {
                    parentWindow.implicitWidth = 0;

                    notificationPopup.delay(400, function() {
                        notificationPopup.visible = false;
                    });
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
