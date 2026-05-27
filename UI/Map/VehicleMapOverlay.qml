import QtQuick
import QtLocation
import QtPositioning

MapItemGroup{
    property var vehicleTrailPoints: []
    property var vehicleLocation: []

    onVehicleTrailPointsChanged: {
        let temp=[]
        for(let i=0;i<vehicleTrailPoints.length;i++){
            temp.push(QtPositioning.coordinate(vehicleTrailPoints[i][0],vehicleTrailPoints[i][1]))
        }
        vehicleTrailLine.vehicleTrail = temp
    }

    onVehicleLocationChanged: {
        let temp = vehicleTrailLine.vehicleTrail
        let currentLoc = QtPositioning.coordinate(vehicleLocation[0],vehicleLocation[1])
        temp.push(currentLoc)
        vehicleTrailLine.vehicleTrail = temp
        vehiclePosition.vehiclePos = currentLoc
    }

    MapPolyline{
        id: vehicleTrailLine
        property var vehicleTrail: []
        path: vehicleTrail
        line.color: "orange"
        line.width: 3
    }

    VehicleMapItem{
        id: vehiclePosition
        property var vehiclePos: null
        coordinate: vehiclePos
    }

}
