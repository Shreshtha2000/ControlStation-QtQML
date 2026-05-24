import QtQuick 2.15
import QtQuick.Controls
import QtQuick.Layouts
Item {
    id: _batteryRoot
    height: parent.height*0.4
    anchors.verticalCenter: parent.verticalCenter
    property int currentPercentage: 100
    Timer{
        id: batteryChangeTimer
        interval: 5000 //every 5s
        repeat: true
        running: true
        onTriggered: {
            currentPercentage = currentPercentage>0? currentPercentage - 5:0
        }
    }

    Rectangle{
        anchors.fill: parent
        border.color: "white"
        border.width: 1
        color:"transparent"
        Row{
            anchors.fill: parent
            anchors.centerIn: parent
            anchors.rightMargin: 2
            anchors.leftMargin: 2
            Rectangle{ //battery filled indicator
                width: (parent.width) * (currentPercentage/100.00)
                height: parent.height-2
                anchors.leftMargin: 3
                anchors.verticalCenter: parent.verticalCenter
                color: currentPercentage > 75? "green" : currentPercentage > 40? "orange" : "red"

            }
            Rectangle{//battery empty indicator
                width: (parent.width-6) * (100 - currentPercentage)/100.00
                height: parent.height-2
                // anchors.rightMargin: 3
                anchors.verticalCenter: parent.verticalCenter
                color: "transparent"
            }
        }

        Text{
            text: qsTr(currentPercentage + "%")
            color: "white"
            anchors.centerIn: parent
            font.bold: true
        }
    }



}
