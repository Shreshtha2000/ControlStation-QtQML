import QtQuick

Item {
    height: dataDisplayRect.height
    width: dataDisplayRect.width
    property string dataValue: "0"
    property string dataHeading: "data"
    Rectangle{
        id: dataDisplayRect
        height: dataDisplay.implicitHeight *1.2
        width: dataDisplay.implicitWidth*1.2
        color: "blue"
        Row{
            id: dataDisplay
            Text{
                anchors.left: parent.left
                text: qsTr(dataValue)
                color: "white"
                font.pixelSize: 10
            }
            Text{
                anchors.right: parent.right
                text: qsTr(dataHeading)
                color: "white"
                font.pixelSize: 10
            }
        }
    }
}
