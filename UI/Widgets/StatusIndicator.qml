import QtQuick 2.15
import QtQuick.Layouts
Item {
    height: connectionStatusRect.implicitHeight
    width: connectionStatusRect.implicitWidth + missionStatusRect.implicitWidth
    Rectangle{
        id: connectionStatusRect
        height: connectionStatusLayout.height*1.2
        width: connectionStatusLayout.width*1.2
        anchors.left: parent.left
        color: "transparent"
        anchors.verticalCenter: parent.verticalCenter
        Row{
            id: connectionStatusLayout
            anchors.centerIn: parent
            spacing: rowSpacing
            Rectangle{
                id: imageRect
                height: 20
                width: 20
                color: "green"
                radius: 50
                Layout.alignment: Qt.AlignLeft
            }

            ColumnLayout{
                id: connectionStatusLabelCol
                Layout.alignment: Qt.AlignRight
                spacing: colSpacing
                Text {
                    id: connectionStatusLabel
                    text: qsTr("Connected")
                    color: "#FFFFFF"
                    font.bold: true
                    font.family: "Tahom"
                    font.pixelSize: 10
                }
                Text {
                    id: vehicleStatusLabel
                    text: qsTr("Not Ready")
                    color: "#FFFFFF"
                    font.pixelSize: 8
                }
            }

        }
    }
    SectionLineVertical{
        id: statusBreakLine1
        height: connectionStatusRect.height * 0.8
        anchors.left: connectionStatusRect.right
        anchors.verticalCenter: connectionStatusRect.verticalCenter
    }

    Rectangle{
        id: missionStatusRect
        height: missionStatusLayout.height*1.2
        width: missionStatusLayout.width*1.2
        anchors.left: statusBreakLine1.right
        color: "transparent"
        anchors.verticalCenter: parent.verticalCenter
        Row{
            id: missionStatusLayout
            anchors.centerIn: parent
            spacing: rowSpacing
            Rectangle{
                id: missionStatusImageRect
                height: 20
                width: 20
                color: "green"
                radius: 50
                Layout.alignment: Qt.AlignLeft
            }

            ColumnLayout{
                id: missionStatusLabelCol
                Layout.alignment: Qt.AlignRight
                spacing: colSpacing
                Text {
                    id: missionStatusLabel
                    text: qsTr("Mission Status")
                    color: "#FFFFFF"
                    font.pixelSize: 8
                }
                Text {
                    id: vehicleMissionStatusLabel
                    text: qsTr("Flying")
                    color: "#FFFFFF"
                    font.bold: true
                    font.family: "Tahom"
                    font.pixelSize:10
                }
            }

        }
    }

}
