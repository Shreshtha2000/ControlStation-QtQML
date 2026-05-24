import QtQuick 2.15
import QtQuick.Layouts
import GCS.UI.Widgets

Item {
    height: 50
    width: parent.width
    property double marginsLeft: 5
    property double marginsRight: 5
    property double marginsTop: 5
    property double marginsBottom: 5
    property double marginsAll: 5
    property double colSpacing: 1
    property double rowSpacing: 5
    property double spacerWidth: 0.5

    Rectangle{
        anchors.fill: parent
        color: "transparent"
        Rectangle{
            anchors.fill: parent
            color: "#0A0A0A"
            opacity: 0.9
        }

        StatusIndicator{
            id: statusIndicator
            anchors.left: parent.left
            anchors.verticalCenter: parent.verticalCenter
        }

        Rectangle{
            id: statusIndicatorRect

        }
    }
}
