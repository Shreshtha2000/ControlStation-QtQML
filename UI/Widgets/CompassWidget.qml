import QtQuick 2.15

Item {
    height: 20
    width: height
    Rectangle{
        height: parent.height
        width: height
        radius: width/2
        color: "transparent"
        Image {
            id: compassImg
            height: parent.height*0.9
            width: height
            anchors.centerIn: parent
            fillMode: Image.PreserveAspectFit
            source: "qrc:/compass.png"
        }
    }
}
