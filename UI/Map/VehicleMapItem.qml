import QtQuick 2.15
import QtLocation

MapQuickItem{
    anchorPoint.x: sourceItem.width / 2
    anchorPoint.y: sourceItem.height / 2
    // zoomLevel: 15
    autoFadeIn: false
    sourceItem: Rectangle{
        height: 60
        width: 60
        color: "transparent"
        Rectangle{
            anchors.fill: parent
            color: "#0A0A0A"
            opacity: 0.4
            radius: width/2
        }

        Image {
            id: vehicleImg
            anchors.centerIn: parent
            height: parent.height*0.9
            width: parent.height*0.9
            source: "qrc:/vehicle.png"
            fillMode: Image.PreserveAspectFit
            z: 10

        }

    }
}
