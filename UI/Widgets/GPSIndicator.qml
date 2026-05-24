import QtQuick 2.15
import QtQuick.Layouts
Item {
    height: gpsCountRect.implicitHeight
    width: gpsCountRect.width
    Rectangle{
        id: gpsCountRect
        height: gpsCountStatusLayout.height*1.2
        width: gpsCountStatusLayout.width*1.2
        color: "transparent"
        anchors.verticalCenter: parent.verticalCenter
        Row{
            id: gpsCountStatusLayout
            anchors.centerIn: parent
            spacing: rowSpacing
            Rectangle{
                id: gpsCountImageRect
                height: 20
                width: 20
                color: "blue"
                radius: 5
                Layout.alignment: Qt.AlignLeft
            }

            ColumnLayout{
                id: gpsCountLabelCol
                Layout.alignment: Qt.AlignRight
                spacing: colSpacing
                Text {
                    id: gpsCountStatusLabel
                    text: qsTr("0")
                    color: "#FFFFFF"
                    font.bold: true
                    font.family: "Tahom"
                    font.pixelSize: 10
                }
                Text {
                    id: gpsCountLabel
                    text: qsTr("Satellites")
                    color: "#FFFFFF"
                    font.pixelSize: 8
                }

            }

        }
    }
}
