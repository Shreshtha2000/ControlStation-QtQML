import QtQuick

Item {
    // height: parent.height
    // width: 20
    height: rightToolBarRect.height
    width: rightToolBarRect.width
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
        height: rightToolBarIconsCol.implicitHeight*1.1
        width: rightToolBarIconsCol.implicitWidth*1.2
        Rectangle{
            anchors.fill: parent
            color: "#0A0A0A"
            opacity: 0.9
            // radius: 10
            topLeftRadius: 10
            bottomLeftRadius: 10
        }

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
        }
    }

}
