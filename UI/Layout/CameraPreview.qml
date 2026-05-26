import QtQuick 2.15

Item {
    property string timerSpent: "00:00:00"
    property int timeSpent: 0
    height: cameraPreviewRect.height
    width: cameraPreviewRect.width
    function totalTimeCalculator(totalSeconds){
        let hours = Math.floor(totalSeconds / 3600)
        let minutes = Math.floor((totalSeconds % 3600) / 60)
        let seconds = totalSeconds % 60

        return String(hours).padStart(2, '0') + ":" +
                String(minutes).padStart(2, '0') + ":" +
                String(seconds).padStart(2, '0')
    }
    Timer{
        id: timeStep
        interval: 5000 //currently keeping 10 seconds
        running: true
        repeat: true
        onTriggered: {
            timeSpent+= 5
            timerSpent = totalTimeCalculator(timeSpent)
        }

    }

    Rectangle{
        id: cameraPreviewRect
        height: videoRect.visible ? 240: visiblityBtn.height*2
        width: height*16/9
        color: "transparent"
        radius: 6

        Rectangle{//image rect
            id: videoRect
            anchors.fill: parent
            color: "transparent"
            radius: 6
            visible: true
            Image {
                id: sceneryImg
                anchors.fill: parent
                anchors.centerIn: parent
                fillMode: Image.PreserveAspectCrop
                source: "qrc:/scenerey.jpg"
            }
            Rectangle{//grey overlay
                anchors.fill: parent
                color: "#0A0A0A"
                opacity: 0.5
                radius: 6
            }
        }

        Rectangle{//Visibility button
            id:visiblityBtn
            height: 20
            width: height
            color: videoRect.visible ?"transparent" : "#0A0A0A"
            anchors.top: parent.top
            anchors.left: parent.left
            radius: 50
            anchors.margins: marginsAll
            Image {
                id: hideImg
                height: parent.height*0.9
                width: height
                anchors.centerIn: parent
                fillMode: Image.PreserveAspectFit
                source: "qrc:/hide.png"
            }
            MouseArea{
                anchors.fill: parent
                onClicked: {
                    videoRect.visible = !videoRect.visible
                }
            }

        }

        Rectangle{//timer rect
            id: timerRect
            height: timerLabel.height*1.1
            width: timerLabel.width*1.1
            color: "transparent"
            anchors.top: parent.top
            anchors.right: parent.right
            anchors.margins: marginsAll
            visible: videoRect.visible
            Rectangle{
                anchors.fill: parent
                color: "#0A0A0A"
                opacity: 0.9
                radius: 1
            }

            Text{
                anchors.centerIn: parent
                id: timerLabel
                text: qsTr(timerSpent)
                color: "white"
                font.pointSize: 15
            }

        }
    }
}
