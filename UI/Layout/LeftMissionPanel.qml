import QtQuick 2.15
import QtQuick.Controls
import QtQuick.Layouts
import GCS.UI.Widgets

Item {
    id: _missionPanelRoot
    property int missionValue: 20
    property int progressWidth: 200
    property int progressHeight: 6
    property string missionName: "Default_Mission_1"
    anchors.margins: marginsAll
    property var missionDetails: [
        {heading:"Mapping Area", value: "5.67 Km2"},
        {heading:"GSD", value: "5.01cm/px"},
        {heading:"Distance Left", value:"8098m"},
        {heading:"Est. Duration", value:"55m 4s"},
        {heading:"Images", value: "50"}
    ]
    Rectangle{
        color:"transparent"
        width: progressWidth*1.2
        height: 200
        Rectangle{
            id: missionProgressRect
            width: missionProgressCol.width * 1.2
            height: missionProgressCol.height * 1.4
            color: "transparent"
            Rectangle{
                anchors.fill: parent
                color: "#0A0A0A"
                radius: 5
                opacity: 0.9
            }

            Column{
                id: missionProgressCol
                anchors.centerIn: parent
                // height: parent.height
                // width: parent.width
                spacing: colSpacing * 2
                RowLayout{
                    // width: parent.width
                    width: progressWidth

                    Text{
                        // anchors.left: parent.left
                        Layout.alignment: Qt.AlignLeft
                        text: qsTr(missionName)
                        font.bold: true
                        color: "white"
                    }
                    Text{
                        // anchors.right: parent.right
                        Layout.alignment: Qt.AlignRight
                        text: missionValue + qsTr(" %")
                        font.bold: true
                        color: "white"
                    }
                }
                ProgressBar{
                    id: missionProgressBar
                    from: 0
                    to: 100
                    value: missionValue
                    padding: 2
                    background: Rectangle{
                        implicitHeight: progressHeight
                        implicitWidth: progressWidth
                        color:  "#e6e6e6"
                        radius: 5
                    }

                    contentItem: Item{
                        implicitHeight: progressHeight-2
                        implicitWidth: progressWidth
                        Rectangle{
                            width: missionProgressBar.visualPosition*parent.width
                            height: parent.height
                            radius:4
                            color: "#17a81a"
                        }
                    }
                }
            }
        }

        Rectangle {
            id: missionDetailsRect
            width: missionDetailsRowLayout.implicitWidth*1
            height: missionDetailsRowLayout.implicitHeight*1.2
            anchors.top: missionProgressRect.bottom
            anchors.margins: marginsAll * 2
            color: "transparent"
            Rectangle{
                anchors.fill: parent
                color:"#0A0A0A"
                radius: 5
            }


            Row{
                id: missionDetailsRowLayout
                // Layout.alignment: Qt.AlignVCenter
                anchors.verticalCenter: parent.verticalCenter
                // Layout.margins: marginsAll
                anchors.margins: marginsAll
                // width: parent.width
                spacing: rowSpacing
                Repeater{
                    id: missionDetailsRepeater
                    model: missionDetails
                    delegate: Rectangle{
                        height: missionStatusLabelCol.implicitHeight*1.2
                        width: missionStatusLabelCol.implicitWidth*1.3
                        anchors.verticalCenter: parent.verticalCenter
                        // Layout.margins: marginsAll*0.5
                        color: "transparent"
                        Column{
                            id: missionStatusLabelCol
                            // Layout.alignment: Qt.AlignVCenter
                            anchors.verticalCenter: parent.verticalCenter
                            anchors.horizontalCenter: parent.horizontalCenter
                            anchors.left: parent.left
                            spacing: colSpacing
                            Text {
                                id: missionHeadingLabel
                                text: qsTr(modelData.heading)
                                anchors.horizontalCenter: parent.horizontalCenter
                                color: "#FFFFFF"
                                font.pixelSize: 8
                            }
                            Text {
                                id: missionValueStatusLabel
                                text: qsTr(modelData.value)
                                anchors.horizontalCenter: parent.horizontalCenter
                                color: "#FFFFFF"
                                font.bold: true
                                font.family: "Tahom"
                                font.pixelSize: 10
                            }
                        }
                       SectionLineVertical{
                           anchors.right: parent.right
                           height: parent.height*0.7
                            anchors.verticalCenter: parent.verticalCenter
                       }
                    }
                }
            }
        }
    }
}
