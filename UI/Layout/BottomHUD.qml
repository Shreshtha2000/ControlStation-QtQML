import QtQuick 2.15
import GCS.UI.Widgets
import QtQuick.Effects
import Qt5Compat.GraphicalEffects

Item {
    height: Math.min(Math.max(parent.height*0.15, 80),Math.max(parent.width*0.1, 80))
    width: height
    anchors.bottomMargin: marginsBottom*2

    Rectangle{
        id: compassOverlay
        height: parent.height*1.3
        width: height
        radius: width/2
        anchors.centerIn: parent
        color: "transparent"
        Rectangle{
            height: parent.height*0.9
            width: height
            anchors.centerIn: parent
            color: "#0A0A0A"
            opacity: 0.4
            radius: width/2

        }
        Image {
            id: outerCompassImg
            height: parent.height*0.9
            width: height
            anchors.centerIn: parent
            fillMode: Image.PreserveAspectFit
            source: "qrc:/compass_out.png"
        }
    }
    Rectangle{
        id: hudWidget
        anchors.fill: parent
        radius: width/2
        clip: true
        color: "transparent"
        visible: true

        Rectangle {
            id: maskRect
            anchors.fill: parent
            radius: width / 2
            visible: false
        }

        ArtificialHorizon {
            id: horizon
            anchors.fill: parent
            visible: false
            roll: 0
            Image {
                id: hud_pitchImg
                height: parent.height*0.9
                width: height
                anchors.centerIn: parent
                fillMode: Image.PreserveAspectFit
                source: "qrc:/hud_pitch.png"
            }
        }

        OpacityMask {
            anchors.fill: parent

            source: horizon
            maskSource: maskRect
        }
    }

    VehicleDataWidgetColumn{
        id: leftSideColumn
        anchors.right: compassOverlay.left
        anchors.bottom: parent.bottom
        anchors.rightMargin: marginsRight
        dataValue1:  "0000"
        dataValue2:  "0000"
        dataUnit1:   "m"
        dataUnit2:   "m"
        reverse:     true
        url1: "qrc:/home.png"
        url2: "qrc:/console.png"
    }

    VehicleDataWidgetColumn{
        id: rightSideColumn
        anchors.left: compassOverlay.right
        anchors.bottom: parent.bottom
        anchors.leftMargin: marginsLeft
        dataValue1:  "0000"
        dataValue2:  "0000"
        dataUnit1:   "m"
        dataUnit2:   "m"
        reverse:     false
        url1: "qrc:/distance_to.png"
        url2: "qrc:/velocity.png"
    }

    TelemDataLargeWidget{
        anchors.right: compassOverlay.left
        anchors.top: hudWidget.top
        height: 30
        width: 80
        reverse: true
        dataValue: 0.0
        dataHeading: "SPD"
        dataUnit: "m/s"
    }

    TelemDataLargeWidget{
        anchors.left: compassOverlay.right
        anchors.top: hudWidget.top
        height: 30
        width: 80
        reverse: false
        dataValue: 0.0
        dataHeading: "ALT"
        dataUnit: "m"
    }

    TelemDataLargeWidget{
        anchors.horizontalCenter: parent.horizontalCenter
        anchors.bottom: compassOverlay.top
        anchors.bottomMargin: marginsBottom
        height: 30
        width: 100
        reverse: true
        dataValue: 360
        dataHeading: "Deg"
        dataUnit: ""
    }


}
