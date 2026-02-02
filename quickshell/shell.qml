import Quickshell
import Quickshell.Io
import QtQuick

Variants {
    model: Quickshell.screens

    delegate: Component {
        PanelWindow {
            QtObject {
                id: theme
                readonly property font ubuntuMonoNerdFont: Qt.font({
                    family: "Ubuntu Mono Nerd Font Propo",
                    pointSize: 12
                })
                readonly property string backgroundColor: "#ffffff"
                readonly property string foregroundColor: "#000000"
            }

            color: theme.backgroundColor

            required property var modelData

            screen: modelData

            anchors {
                top: true
                bottom: true
                left: true
            }

            implicitWidth: 30

            Column {
                id: topcol
                anchors.top: parent.top
                width: parent.width
                height: parent.height / 3

                ClockWidget {
                    id: clockWidget1
                    width: parent.width
                    height: parent.height / 5
                }

                BatteryWidget {
                    id: batteryWidget1
                    width: parent.width
                    height: parent.height / 5
                    anchors.top: clockWidget1.bottom
                }
            }

            Column {
                id: midcol
                anchors.top: topcol.bottom
                width: parent.width
                height: parent.height / 3

                HyprlandWorkspacesWidget {

                }
            }

            Column {
                id: bottomcol
                anchors.top: midcol.bottom
                anchors.bottom: parent.bottom
                width: parent.width
                height: parent.height / 3


                Bluetooth {
                    id: bluetoothWidget
                    anchors.bottom: parent.bottom
                    width: parent.width
                }
            }


        }
    }
}

/*
PanelWindow {
  anchors {
    top: true
    left: true
    right: true
  }

  implicitHeight: 30

  Text {
      text: Time.time
      verticalAlignment: Text.AlignVCenter
  }
}
*/
