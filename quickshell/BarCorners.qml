import QtQuick
import Quickshell
import Quickshell.Wayland
import Qt5Compat.GraphicalEffects

import qs.theme

Variants {
    model: Quickshell.screens

    delegate: Component {
        PanelWindow {
            required property var modelData

            screen: modelData

            WlrLayershell.layer: WlrLayer.Top
            mask: Region {}

            anchors {
                top: true
                left: true
                right: true
                bottom: true
            }

            color: "transparent"


            Rectangle {
                id: overlay
                anchors.fill: parent
                color: theme.backgroundColor

                Item {
                    id: maskContainer
                    anchors.fill: parent

                    Rectangle {
                        width: parent.width
                        height: parent.height
                        topLeftRadius: 10
                        bottomLeftRadius: 10
                        color: "black"
                        antialiasing: true
                    }
                }

                layer.enabled: true
                layer.effect: OpacityMask {
                    maskSource: maskContainer
                    invert: true
                }
            }
        }
    }
}
