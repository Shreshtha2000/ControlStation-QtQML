import QtQuick 2.15

Item {
    height: vehicleDataDisplayRect.height
    width: vehicleDataDisplayRect.width
    property bool reverse: false
    property string url1: ""
    property string url2: ""
    property string dataValue1: "0"
    property string dataValue2: "0"
    property string dataHeading1: "0"
    property string dataHeading2: "0"
    property string dataUnit1: "m"
    property string dataUnit2: "m"

    Rectangle{ //Left Side data values
        id: vehicleDataDisplayRect
        height: vehicleDataDisplayCol.implicitHeight
        width: vehicleDataDisplayCol.implicitWidth
        color: "transparent"
        Column{
            id: vehicleDataDisplayCol
            spacing: colSpacing
            VehicleDataDisplayUnit{
                height: 25
                width: 80
                reverseOrder: reverse
                dataIconUrl:  url1
                dataHeading: dataHeading1
                dataValue: dataValue2
                unitOfMeasurement: dataUnit1
            }
            VehicleDataDisplayUnit{
                height: 25
                width: 80
                reverseOrder: reverse
                dataIconUrl: url2
                dataHeading: dataHeading2
                dataValue: dataValue2
                unitOfMeasurement: dataUnit2
            }
        }

    }
}
