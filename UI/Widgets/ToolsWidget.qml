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
            color: "transparent"
            radius: 50
            Image {
                height: parent.height*0.8
                width: height
                anchors.centerIn: parent
                fillMode: Image.PreserveAspectFit
                id: bluetoothImg
                source: "qrc:/bluetooth.png"
            }
        }

        Rectangle{ //notification
            height: parent.height
            width: height
            color: "transparent"
            radius: 50
            Image {
                id: notificationImg
                height: parent.height*0.8
                width: height
                anchors.centerIn: parent
                fillMode: Image.PreserveAspectFit
                source: "qrc:/notification.png"
            }
        }
        Rectangle{ //Qr
            height: parent.height
            width: height
            color: "transparent"
            radius: 50
            Image {
                id: qrImg
                height: parent.height*0.8
                width: height
                anchors.centerIn: parent
                fillMode: Image.PreserveAspectFit
                source: "qrc:/qr.png"
            }
        }
        Rectangle{ //Settings
            height: parent.height
            width: height
            color: "transparent"
            radius: 50
            Image {
                id: settings2Img
                height: parent.height
                width: height
                anchors.centerIn: parent
                fillMode: Image.PreserveAspectFit
                source: "qrc:/settings_2.png"
            }
        }
    }
}
