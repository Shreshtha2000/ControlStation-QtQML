import QtQuick 2.15
import QtQuick.Layouts
import GCS.UI.Widgets

Item {
    height: 50
    width: parent.width


    Rectangle{
        id: _headerRoot
        anchors.fill: parent
        color: "transparent"
        Rectangle{
            anchors.fill: parent
            color: "#0A0A0A"
            opacity: 0.9
        }
        Row{
            height: parent.height
            width: parent.width
            Component.onCompleted: {
                console.log("Row ",height, width)
            }

            Flickable{
                height: parent.height
                // width: Math.min(parent.width*0.3, leftRowHeader.implicitWidth)
                width: parent.width*0.3
                contentWidth: leftRowHeader.implicitWidth
                flickableDirection: Flickable.HorizontalFlick
                // Layout.alignment: Qt.AlignLeft
                anchors.left: parent.left
                clip: true
                RowLayout{
                    id: leftRowHeader
                    height: parent.height
                    width: statusIndicator.width
                    // Layout.alignment: Qt.AlignCenter
                    // anchors.centerIn: parent
                    StatusIndicator{
                        id: statusIndicator
                        // anchors.left: parent.left
                        // anchors.verticalCenter: parent.verticalCenter
                        Layout.alignment: Qt.AlignVCenter
                        Component.onCompleted: {
                            console.log("Status ",height, width)
                        }
                    }
                }

            }
            Flickable{
                height: parent.height
                width: Math.min(parent.width*0.6, rightRowHeader.implicitWidth)
                contentWidth: rightRowHeader.implicitWidth
                // Layout.alignment: Qt.AlignRight
                anchors.right: parent.right
                flickableDirection: Flickable.HorizontalFlick
                clip: true
                RowLayout{
                    id: rightRowHeader
                    height: parent.height

                    spacing: 10

                    FlightTimeIndicator{
                        Layout.alignment: Qt.AlignVCenter
                    }

                    SectionLineVertical{
                        height: 25
                        // anchors.right: toolsWidgetRect.left
                        // anchors.verticalCenter: toolsWidgetRect.verticalCenter
                        Layout.alignment: Qt.AlignVCenter
                        Layout.rightMargin: 10
                    }

                    GPSIndicator{
                        Layout.alignment: Qt.AlignVCenter
                        // Layout.rightMargin: 10
                    }

                    SectionLineVertical{
                        height: 25
                        // anchors.right: toolsWidgetRect.left
                        // anchors.verticalCenter: toolsWidgetRect.verticalCenter
                        Layout.alignment: Qt.AlignVCenter
                        Layout.rightMargin: 10
                    }

                    SignalStrengthIndicator{
                        id: signalStrengthIndicator
                        // anchors.right: sectionLine2.left
                        // anchors.verticalCenter: parent.verticalCenter
                        Layout.alignment: Qt.AlignVCenter
                        // Layout.rightMargin: 10
                    }

                    SectionLineVertical{
                        height: 25
                        // anchors.right: toolsWidgetRect.left
                        // anchors.verticalCenter: toolsWidgetRect.verticalCenter
                        Layout.alignment: Qt.AlignVCenter
                        // Layout.rightMargin: 10
                    }

                    Rectangle{
                        id: toolsWidgetRect
                        height: 30
                        width: 200
                        color: "transparent"
                        // anchors.right: batteryStatusIndicatorRect.left
                        // anchors.verticalCenter: parent.verticalCenter
                        Layout.alignment: Qt.AlignVCenter
                        // Layout.rightMargin: 10


                        ToolsWidget{
                            anchors.verticalCenter: parent.verticalCenter
                            anchors.horizontalCenter: parent.horizontalCenter
                            width: parent.width
                        }

                    }



                    Rectangle{
                        id: batteryStatusIndicatorRect
                        // anchors.right: parent.right
                        height: 40
                        width: 40
                        color: "transparent"
                        // anchors.verticalCenter: parent.verticalCenter
                        Layout.alignment: Qt.AlignVCenter
                        Layout.rightMargin: 10
                        BatteryIndicator{
                            width: parent.width
                        }
                    }
                }
            }
            }

    }
}
