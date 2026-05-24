import QtQuick 2.15
import QtQuick.Layouts
Item {
    height: flightTimeRect.implicitHeight
    width: flightTimeRect.width
    Rectangle{
        id: flightTimeRect
        height: flightTimeStatusLayout.height*1.2
        width: flightTimeStatusLayout.width*1.2
        color: "transparent"
        anchors.verticalCenter: parent.verticalCenter
        property string flightTime: "00:00:00"
        property int timeSpent: 0
        function totalTime(totalSeconds){
            let hours = Math.floor(totalSeconds / 3600)
            let minutes = Math.floor((totalSeconds % 3600) / 60)
            let seconds = totalSeconds % 60

            return String(hours).padStart(2, '0') + ":" +
                    String(minutes).padStart(2, '0') + ":" +
                    String(seconds).padStart(2, '0')
        }

        Timer{ //for demonstration
            id: flightTimer
            interval: 5000
            repeat: true
            running: true
            onTriggered: {
                flightTimeRect.timeSpent+= 5
                flightTimeRect.flightTime = flightTimeRect.totalTime(flightTimeRect.timeSpent)
            }
        }

        Row{
            id: flightTimeStatusLayout
            anchors.centerIn: parent
            spacing: rowSpacing
            Rectangle{
                id: flightTimeImageRect
                height: 20
                width: 20
                color: "blue"
                radius: 5
                Layout.alignment: Qt.AlignLeft
            }

            ColumnLayout{
                id: flightTimeLabelCol
                Layout.alignment: Qt.AlignRight
                spacing: colSpacing

                Text {
                    id: flightTimeLabel
                    text: qsTr("Flight Time")
                    color: "#FFFFFF"
                    font.pixelSize: 8
                }
                Text {
                    id: flightTimeStatusLabel
                    text: qsTr(flightTimeRect.flightTime)
                    color: "#FFFFFF"
                    font.bold: true
                    font.family: "Tahom"
                    font.pixelSize: 10
                }

            }

        }
    }
}
