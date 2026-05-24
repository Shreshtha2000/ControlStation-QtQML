import QtQuick 2.15

Item {
    property double pitchAngle: 0 //angle goes from -90 to 90
    property double roll: 0
    Rectangle{//main rect
        anchors.fill: parent
        anchors.centerIn: parent
        color: "transparent"
        rotation: roll
        // radius: 50
        Rectangle{//sky
            id: skyRect
            anchors.top: parent.top
            color: "blue"
            width: parent.width
            height: parent.height/2 + pitchAngle/90*parent.height/2

            Component.onCompleted: {
                print("sky",height,width)
            }
        }
        Rectangle{//land
            color: "green"
            anchors.bottom: parent.bottom
            width:  parent.width
            height: (skyRect.height<parent.height)? parent.height - skyRect.height:0
            Component.onCompleted: {
                print("land",height,width)
            }
        }
    }
}
