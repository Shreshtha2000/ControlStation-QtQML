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
        id: _headerRoot
        anchors.fill: parent
        color: "transparent"
        Rectangle{
            anchors.fill: parent
            color: "#0A0A0A"
            opacity: 0.9
        }
        RowLayout{
            height: parent.height
            width: parent.width
            RowLayout{
                height: parent.height
                Layout.alignment: Qt.AlignLeft
                StatusIndicator{
                    id: statusIndicator
                    // anchors.left: parent.left
                    // anchors.verticalCenter: parent.verticalCenter
                    Layout.alignment: Qt.AlignVCenter
                }
            }
            RowLayout{
                id: rightRowHeader
                height: parent.height
                Layout.alignment: Qt.AlignRight
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
