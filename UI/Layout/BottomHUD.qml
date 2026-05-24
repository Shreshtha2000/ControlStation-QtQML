import QtQuick 2.15
import GCS.UI.Widgets
import QtQuick.Effects
import Qt5Compat.GraphicalEffects

Item {
    height: 100
    width: height
    anchors.bottomMargin: marginsBottom*2

    Rectangle{
        height: parent.height*1.2
        width: height
        radius: width/2
        anchors.centerIn: parent
        color: "transparent"
        Rectangle{
            anchors.fill: parent
            color: "#0A0A0A"
            opacity: 0.6
            radius: width/2
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
        }

        OpacityMask {
            anchors.fill: parent

            source: horizon
            maskSource: maskRect
        }
    }

    VehicleDataDisplayUnit{

        anchors.left: hudWidget.right
        anchors.horizontalCenter: hudWidget.horizontalCenter
    }


}
