import QtQuick
import GCS.UI.Layout
import GCS.UI.Map
import QtPositioning
Window {
    width: 640
    height: 480
    visible: true
    title: qsTr("Hello World")
    property var coordsList: [
    [28.66,77.22],
    [28.55,77.21]
    ]
    MapView{
        anchors.fill: parent
        WaypointItem{
            coordinate: QtPositioning.coordinate(28.64, 77.22)
        }

        MissionOverlay{
            waypointsCoordinates: coordsList
        }
    }

    HeaderBar{
        id: headerBar
        anchors.top: parent.top
    }
    LeftMissionPanel {
        id: missionPanel
        anchors.left: parent.left
        anchors.top: headerBar.bottom
        height: parent.height - headerBar.height
    }
    RightToolBar{
        anchors.right: parent.right
    }
    CameraPreview{
        anchors.left: missionPanel.right
        anchors.bottom: parent.bottom
        height: 100
    }
    BottomHUD{
        anchors.bottom: parent.bottom
        anchors.horizontalCenter: parent.horizontalCenter
    }
}
