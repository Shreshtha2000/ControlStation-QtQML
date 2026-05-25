import QtQuick

Item {

    property string dataValue: "0"
    property string dataHeading: "data"
    property bool reverseOrder: false
    property string unitOfMeasurement: "m"
    property string dataIconUrl: ""
    anchors.margins: marginsAll
    Rectangle{
        id: dataDisplayRect
        height: parent.height
        width: parent.width
        Rectangle {
            anchors.fill: parent
            color: "#0A0A0A"
            radius: 4
            opacity: 0.8
        }

        Row{
            id: dataDisplay
            width: parent.width*0.9
            height: parent.height*0.9
            anchors.margins: marginsAll
            anchors.centerIn: parent
            Text{
                anchors.left: reverseOrder? parent.left : undefined
                anchors.right: !reverseOrder ? parent.right : undefined
                text: qsTr(dataValue+unitOfMeasurement)
                color: "white"
                font.pixelSize: 15
                font.bold: true
                anchors.verticalCenter: parent.verticalCenter
            }
            Rectangle{ //data icon
                anchors.left: !reverseOrder? parent.left : undefined
                anchors.right: reverseOrder ? parent.right : undefined
                height: parent.height*0.8
                anchors.verticalCenter: parent.verticalCenter
                width: height
                radius: width/2
            }
        }
    }
}
