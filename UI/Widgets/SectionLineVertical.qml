import QtQuick 2.15

Item{
    property double lineWidth: 0.5
    width: lineWidth
    height: parent.height*0.8
    Rectangle{
        anchors.fill: parent
        color: "white"
        opacity: 0.4
        Component.onCompleted: {
            console.log(width, height)
            console.log(x,y)
        }
    }
}


