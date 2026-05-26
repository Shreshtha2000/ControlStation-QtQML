import QtQuick 2.15
import QtQuick.Layouts
Item {
    height: signalStrengthRect.implicitHeight
    width: signalStrengthRect.width
    Rectangle{
        id: signalStrengthRect
        height: signalStrengthStatusLayout.height*1.2
        width: signalStrengthStatusLayout.width*1.2
        color: "transparent"
        anchors.verticalCenter: parent.verticalCenter
        Row{
            id: signalStrengthStatusLayout
            anchors.centerIn: parent
            spacing: rowSpacing
            Rectangle{
                id: signalStrengthImageRect
                height: 20
                width: 20
                color: "transparent"
                radius: 5
                Layout.alignment: Qt.AlignLeft
                Image {
                    id: signalStrenthImg
                    height: parent.height
                    width: height
                    anchors.centerIn: parent
                    fillMode: Image.PreserveAspectFit
                    source: "qrc:/signal.png"
                }
            }

            ColumnLayout{
                id: signalStrengthLabelCol
                Layout.alignment: Qt.AlignRight
                spacing: colSpacing
                Text {
                    id: signalStrengthLabel
                    text: qsTr("RSSI")
                    color: "#FFFFFF"
                    font.pixelSize: 8
                }
                Text {
                    id: signalStrengthStatusLabel
                    text: qsTr("100dbm")
                    color: "#FFFFFF"
                    font.bold: true
                    font.family: "Tahom"
                    font.pixelSize: 10
                }

            }

        }
    }
}
