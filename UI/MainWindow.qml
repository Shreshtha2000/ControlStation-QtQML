import QtQuick
import GCS.UI.Layout
import GCS.UI.Map
import GCS.UI.Widgets
import QtPositioning

Window {
    width: 1280
    height: 720
    visible: true
    title: qsTr("GCS")
    property var missionPathList: [
        [28.4565381, 77.1264300],
        [28.4618964, 77.1265372],
        [28.4618447, 77.1256377],
        [28.4565982, 77.1255327],
        [28.4566583, 77.1246354],
        [28.4617931, 77.1247381],
        [28.4617414, 77.1238385],
        [28.4567183, 77.1237381],
        [28.4567784, 77.1228408],
        [28.4616897, 77.1229390],
        [28.4616380, 77.1220394],
        [28.4568384, 77.1219435],
        [28.4568985, 77.1210462],
        [28.4615863, 77.1211398]
    ]

    property var vehicleTrail: [
        [28.4565381, 77.1264300],
        [28.4618964, 77.1265372],
        [28.4618447, 77.1256377],
        [28.4565982, 77.1255327],
        [28.4566583, 77.1246354]
    ]

    property var missionPolygonList: [
        [28.4562, 77.1270],
        [28.4620, 77.1270],
        [28.4619, 77.1204],
        [28.4570, 77.1204]
    ]
    property var vehicleLoc: [28.459222, 77.124694]

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
        MissionOverlay{
            waypointsCoordinates: missionPathList
            missionPolygon: missionPolygonList
        }
        VehicleMapOverlay{
            vehicleTrailPoints: vehicleTrail
            vehicleLocation: vehicleLoc
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
        anchors.margins: marginsAll*2
    }
    BottomHUD{
        anchors.bottom: parent.bottom
        anchors.horizontalCenter: parent.horizontalCenter
    }
    CompassWidget{
        anchors.bottom: parent.bottom
        anchors.right: parent.right
        anchors.margins: marginsAll*2
        height: 40
    }
    JoystickWidget{
        anchors.bottom: parent.bottom
        anchors.right: parent.right
        anchors.margins: marginsAll*30
    }
}
