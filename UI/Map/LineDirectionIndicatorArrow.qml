import QtQuick 2.15
import QtLocation

MapQuickItem{
    property string num: "0"
    anchorPoint.x: sourceItem.width / 2
    anchorPoint.y: sourceItem.height / 2
    // zoomLevel: 15
    autoFadeIn: false
    sourceItem: Rectangle{
        height: 20
        width: 20
        color: "transparent"

        Image {
            id: waypointImg
            anchors.horizontalCenter: parent.horizontalCenter
            height: parent.height*0.9
            width: parent.height*0.9
            source: "qrc:/mission_guide_direction.png"
            fillMode: Image.PreserveAspectFit
            z: 10

        }

    }
}
