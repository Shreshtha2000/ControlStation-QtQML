import QtQuick 2.15
import QtQuick.Layouts

Rectangle {
    height: parent.height
    color: "transparent"
    property double calculatedSpace: (parent.width - 4*parent.height)/3
    property double toolSpacing: calculatedSpace > 50 ? 50: calculatedSpace < 5? 5 : calculatedSpace
    Row{
        id: toolsWidget
        height: parent.height
        width: parent.width
        // uniformCellSizes: true
        spacing: toolSpacing
        Rectangle{ //Bluetooth icon
            height: parent.height
            width: height
            color: "blue"
            radius: 50
        }

        Rectangle{ //notification
            height: parent.height
            width: height
            color: "white"
            radius: 50
        }
        Rectangle{ //Qr
            height: parent.height
            width: height
            color: "red"
            radius: 50
        }
        Rectangle{ //Settings
            height: parent.height
            width: height
            color: "green"
            radius: 50
        }
    }
}
