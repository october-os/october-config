import QtQuick
import Quickshell
import Quickshell.Wayland

PanelWindow {
    WlrLayershell.layer: WlrLayer.Background

    anchors {
        top: true
        left: true
        right: true
        bottom: true
    }

    color: "transparent"

    Rectangle {
        anchors.fill: parent
        color: "transparent"
        Image {
            id: img
            source: "./wallpapers/wallpaper.png"
            fillMode: Image.PreserveAspectCrop
            anchors.fill: parent
            visible: true
            mipmap: true
        }
    }
}
