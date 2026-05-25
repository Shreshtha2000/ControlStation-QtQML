import QtQuick 2.15

Item {
    property real dataValue: 0.0
    property string dataHeading: "UNT"
    property string dataUnit: "m/s"
    property bool showBackground: true
    property bool reverse: false
    Rectangle{
        anchors.fill: parent
        anchors.centerIn: parent
        color: "transparent"
        Rectangle{
            anchors.fill: parent
            color: "#0A0A0A"
            visible: showBackground
            radius: 5
            opacity: 0.5
        }

        Row{
            width: parent.width*0.9
            height: parent.height*0.9
            anchors.margins: marginsAll * 2
            Text{
                text: qsTr((dataValue).toFixed(2))
                color: "#90EE90"
                font.pixelSize: 20
                font.bold: true
                anchors.verticalCenter: parent.verticalCenter
                anchors.left: reverse? parent.left : undefined
                anchors.right: !reverse? parent.right: undefined
                anchors.leftMargin: marginsLeft
            }

            Column{
                anchors.verticalCenter: parent.verticalCenter
                // anchors.right: parent.right
                anchors.left: !reverse? parent.left : undefined
                anchors.right: reverse? parent.right: undefined
                anchors.leftMargin: marginsLeft
                Text{
                   color: "white"
                   text: qsTr(dataHeading)
                   font.pixelSize: 8
                   font.bold: true
                }
                Text{
                    color: "white"
                    text: qsTr(dataUnit)
                    font.pixelSize: 8
                    font.bold: true
                }
            }

        }
    }
}
