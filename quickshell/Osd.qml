import Quickshell
import Quickshell.Wayland
import QtQuick

PanelWindow {
    id: parentWindow

    WlrLayershell.layer: WlrLayer.Top
    mask: Region {}

    anchors.bottom: true
    exclusiveZone: 0

    implicitHeight: 400
    implicitWidth: 400
    color: "transparent"

    PopupWindow {
        id: osdWindow

        anchor.window: parentWindow
        anchor.rect.x: parentWindow.width / 2 - width / 2
        anchor.rect.y: parentWindow.height / 2
        implicitHeight: 30
        implicitWidth: 400
        visible: true

        color: "transparent"

        Rectangle {
            anchors.fill: parent
            radius: 10

            color: "#ff00ff"

            Column {
                padding: 5

                Text {
                    text: "hello"
                }
            }
        }
    }
}
