import QtQuick 2.15
import QtPositioning
import QtLocation
MapItemGroup{
    property var waypointsCoordinates: null
    property var missionPolygon: null
    onWaypointsCoordinatesChanged: {
        let temp=[]
        for(let i=0;i<waypointsCoordinates.length;i++){
            temp.push(QtPositioning.coordinate(waypointsCoordinates[i][0],waypointsCoordinates[i][1]))
        }
        waypoints.missionItems = temp
        waypointLines.waypointPath = temp
        let temp2 = []
        for (let i = 0; i < temp.length - 1; i++) {

            let c1 = temp[i]
            let c2 = temp[i + 1]

            let bearing = c1.azimuthTo(c2)

            let midpoint =
                QtPositioning.coordinate(
                    (c1.latitude + c2.latitude) / 2,
                    (c1.longitude + c2.longitude) / 2
                )
            temp2.push({coordinate: midpoint, heading: bearing})
            console.log("Bearing:", bearing)
            console.log("Midpoint:", midpoint)
        }
        waypointsDirection.missionItemsDirection = temp2
    }
    onMissionPolygonChanged: {
        let temp=[]
        for(let i=0;i<missionPolygon.length;i++){
            temp.push(QtPositioning.coordinate(missionPolygon[i][0],missionPolygon[i][1]))
        }
        missionPolygonLines.polygonPath = temp
    }

    MapPolygonOverlay{
        id: missionPolygonLines
        property var polygonPath: []
        path: polygonPath
    }

    MapPolyline{
        id: waypointLines
        property var waypointPath: []
        path: waypointPath
        line.width: 3
        line.color: '#1A8CFD'

    }
    MapItemView {
        id: waypoints
        property var missionItems: []
        model: missionItems
        delegate: WaypointItem{
            coordinate: modelData
            num: index.toFixed()
        }
    }

    MapItemView {
        id: waypointsDirection
        property var missionItemsDirection: []
        model: missionItemsDirection
        delegate: LineDirectionIndicatorArrow{
            coordinate: modelData.coordinate
            rotation: modelData.heading
            num: index.toFixed()
        }
    }



}


