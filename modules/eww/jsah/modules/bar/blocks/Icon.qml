import QtQuick
import QtQuick.Layouts
import QtQuick.Controls
import Quickshell
import Quickshell.Io
import Quickshell.Widgets
import "../"
import "root:/"

BarBlock {
  id: root
  Layout.preferredWidth: 20
  
  content: Item {
    implicitWidth: iconText.implicitWidth
    implicitHeight: iconText.implicitHeight
    
    BarText {
      id: iconText
      text: "󰣇"
      pointSize: 12
      anchors.horizontalCenterOffset: 5
      anchors.verticalCenterOffset: 0
    }
  }
  
  color: "transparent"
  
  MouseArea {
    anchors.fill: parent
    onClicked: {
      launcher.running = true
    }
  }
  
  Process {
    id: launcher
    command: ["rofi", "-show", "drun"]
  }
}
