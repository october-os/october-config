import QtQuick
import QtQuick.Layouts
import Quickshell
import Quickshell.Wayland

import "modules/bluetooth"
import "modules/battery"
import "modules/clock"
import "modules/hyprland"
import "modules/sound"
import "modules/network"

import qs.theme

Variants {
    id: barRoot

    model: Quickshell.screens

    delegate: Component {
        PanelWindow {
            WlrLayershell.layer: WlrLayer.Top

            required property var modelData

            QtObject {
                id: bar
                readonly property ShellScreen screen: modelData
            }

            color: theme.backgroundColor

            screen: modelData

            anchors {
                top: true
                bottom: true
                left: true
            }

            implicitWidth: 40

            Rectangle {
                id: top

                height: topcol.height
                width: topcol.width
                anchors.top: parent.top

                color: "transparent"
                radius: 7

                ColumnLayout {
                    id: topcol

                    width: parent.parent.width
                    height: parent.parent.height / 3
                    spacing: theme.widgetsSpacing

                    ClockWidget {
                        Layout.topMargin: 5
                    }

                    BatteryWidget {}

                    Item { // fill height so that widgets are pushed to the top
                        Layout.fillHeight: true
                    }
                }
            }

            Rectangle {
                id: mid

                height: parent.height / 3
                width: parent.width
                anchors.top: top.bottom

                color: "transparent"
                radius: 7

                HyprlandWorkspacesWidget {
                    anchors.centerIn: parent
                }
            }

            Rectangle {
                id: bottom

                height: parent.height / 3
                width: parent.width
                anchors.top: mid.bottom
                anchors.bottom: parent.bottom

                color: "transparent"
                radius: 7

                ColumnLayout {
                    id: bottomcol
                    width: parent.width
                    height: parent.height / 3
                    anchors.bottom: parent.bottom
                    spacing: theme.widgetsSpacing

                    Item { // fill height so that widgets are pushed to the top
                        Layout.fillHeight: true
                    }

                    SoundWidget {
                        Layout.bottomMargin: 5
                    }

                    NetworkWidget {
                        Layout.bottomMargin: 5
                    }

                    BluetoothWidget {
                        Layout.bottomMargin: 5
                    }
                }
            }
        }
    }
}
