import QtQuick
import GCS.UI.Layout
import GCS.UI.Map
import QtPositioning
Window {
    width: 1280
    height: 720
    visible: true
    title: qsTr("Hello World")
    property var coordsList: [
    [28.66,77.22],
    [28.55,77.21]
    ]

    property double marginsLeft: 5
    property double marginsRight: 5
    property double marginsTop: 5
    property double marginsBottom: 5
    property double marginsAll: 5
    property double colSpacing: 1
    property double rowSpacing: 5
    property double spacerWidth: 0.5
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
        // height: parent.height - headerBar.height
    }
    RightToolBar{
        id: rightToolBar
        anchors.right: parent.right
        anchors.top: headerBar.bottom
        // height: parent.height - headerBar.height
    }
    CameraActionsToolBar{
        anchors.right: rightToolBar.left
        anchors.top: headerBar.bottom
    }

    CameraPreview{
        anchors.left: missionPanel.right
        anchors.bottom: parent.bottom
    }
    BottomHUD{
        anchors.bottom: parent.bottom
        anchors.horizontalCenter: parent.horizontalCenter
    }
}
