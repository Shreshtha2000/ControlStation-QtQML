import QtQuick

Item {
    property real availableHeight: 400
    height: Math.min(rightToolBarIconsCol.height, availableHeight)
    // width: 20
    // width: rightToolbarFlick.width
    // width: rightToolBarRect.width

    anchors.topMargin: marginsTop
    property var rightToolBarIconsUrlList: [
        "qrc:/shutter.png",
        "qrc:/settings.png",
        "qrc:/camera.png",
        "qrc:/video.png",
        "qrc:/record.png",
        "qrc:/viewVideo.png",
        "qrc:/gimbal_cam.png",
        "qrc:/manual_camera.png"
    ]
    Rectangle{
        // anchors.fill: parent
        id: rightToolBarRect
        color: "transparent"
        height:parent.height
        width: parent.width
        Rectangle{
            anchors.fill: parent
            color: "#0A0A0A"
            opacity: 0.9
            // radius: 10
            topLeftRadius: 10
            bottomLeftRadius: 10
        }

        Flickable{
            id: rightToolbarFlick
            height: parent.height
            width: parent.width
            flickableDirection: Flickable.VerticalFlick
            contentHeight: rightToolBarIconsCol.height
            clip: true
            Column{
                id: rightToolBarIconsCol
                spacing: colSpacing*12
                anchors.centerIn: parent
                Repeater{
                    model: rightToolBarIconsUrlList
                    delegate: Rectangle{
                        height: 40
                        width: 40
                        radius: 50
                        color: "transparent"
                        Image {
                            id: rightToolbarImg
                            height: parent.height*0.8
                            width: height
                            anchors.centerIn: parent
                            fillMode: Image.PreserveAspectFit
                            source: modelData
                        }
                    }
                }

                Rectangle{
                    height: 20
                    width: 40
                    color: "transparent"
                    Image {
                        id: expandImg
                        height: parent.height
                        width: height
                        anchors.centerIn: parent
                        fillMode: Image.PreserveAspectFit
                        source: "qrc:/expand_dot.png"
                    }
                }
            }
        }
    }


}
