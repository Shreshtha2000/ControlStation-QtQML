import QtQuick 2.15
import QtPositioning
import QtLocation
MapItemGroup{
    property var waypointsCoordinates: null
    onWaypointsCoordinatesChanged: {
        let temp=[]
        for(let i=0;i<waypointsCoordinates.length;i++){
            temp.push(QtPositioning.coordinate(waypointsCoordinates[i][0],waypointsCoordinates[i][1]))
        }
        waypoints.missionItems = temp
        waypointLines.waypointPath = temp
    }
    MapItemView {
        id: waypoints
        property var missionItems: []
        model: missionItems
        delegate: WaypointItem{
            coordinate: modelData
        }
    }

    MapPolyline{
        id: waypointLines
        property var waypointPath: []
        path: waypointPath
        line.width: 3
        line.color: 'green'

    }
}


