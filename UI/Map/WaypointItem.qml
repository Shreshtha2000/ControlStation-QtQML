import QtQuick 2.15
import QtLocation

MapQuickItem{
    property string num: "0"
    anchorPoint.x: sourceItem.width / 2
    anchorPoint.y: sourceItem.height / 2 + waypointImg.height/2
    // zoomLevel: 15
    autoFadeIn: false
    sourceItem: Rectangle{
        height: 50
        width: 50
        color: "transparent"

        Image {
            id: waypointImg
            anchors.horizontalCenter: parent.horizontalCenter
            height: parent.height*0.9
            width: parent.height*0.9
            source: "qrc:/gps.png"
            fillMode: Image.PreserveAspectFit
            z: 10
            Text{
                // anchors.centerIn: parent
                anchors.horizontalCenter: parent.horizontalCenter
                y: parent.y + parent.height*0.1
                text: qsTr(num)
                font.bold: true
                style: Text.Raised
                font.pixelSize: 15
                color: "white"

            }
        }

    }
}
