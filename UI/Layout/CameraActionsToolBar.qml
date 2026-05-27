import QtQuick 2.15

Item {
    // height: cameraActionsToolBarRect.height
    property real availableWidth: 200
    width: Math.min(cameraActionsToolBarRow.implicitWidth*1.05, availableWidth)
    anchors.margins: marginsAll
    readonly property var cameraSettingsToolBarList: [
        {heading:"ISO", value: "00000"},
        {heading:"FL", value: "0.0"},
        {heading:"Shutter", value: "1/30"},
        {heading:"EV", value: "+0.0"}
    ]
    Rectangle{
        id: cameraActionsToolBarRect
        height: parent.height
        width: parent.width
        color: "transparent"
        Rectangle{
            anchors.fill: parent
            color: "#0A0A0A"
            opacity: 0.9
            radius: 6
        }
        Component.onCompleted: {
            console.log(height, width)
        }
        Flickable{
            id: cameraActionsToolbarFlick
            height: parent.height
            width: parent.width
            contentWidth: cameraActionsToolBarRow.implicitWidth
            flickableDirection: Flickable.HorizontalFlick
            clip: true
            Row{
                id: cameraActionsToolBarRow
                spacing: rowSpacing*2
                anchors.centerIn: parent
                Repeater{
                    model:  cameraSettingsToolBarList
                    delegate: Rectangle{
                        height: cameraSettingsLabelCol.implicitHeight*1.2
                        width: cameraSettingsLabelCol.implicitWidth*1.3
                        anchors.verticalCenter: parent.verticalCenter
                        // Layout.margins: marginsAll*0.5
                        color: "transparent"
                        Column{
                            id: cameraSettingsLabelCol
                            // Layout.alignment: Qt.AlignVCenter
                            anchors.verticalCenter: parent.verticalCenter
                            anchors.horizontalCenter: parent.horizontalCenter
                            anchors.left: parent.left
                            spacing: colSpacing * 7
                            Text {
                                id: cameraSettingsHeadingLabel
                                text: qsTr(modelData.heading)
                                anchors.horizontalCenter: parent.horizontalCenter
                                color: "#FFFFFF"
                                font.pixelSize: 8
                            }
                            Text {
                                id: cameraSettingsValueStatusLabel
                                text: qsTr(modelData.value)
                                anchors.horizontalCenter: parent.horizontalCenter
                                color: "#FFFFFF"
                                font.bold: true
                                font.family: "Tahom"
                                font.pixelSize: 10
                            }
                        }

                    }


                }
                Rectangle{
                    height: appertureLockLabelCol.implicitHeight*1.2
                    width: appertureLockLabelCol.implicitWidth*1.3
                    anchors.verticalCenter: parent.verticalCenter
                    // Layout.margins: marginsAll*0.5
                    color: "transparent"
                    Column{
                        id: appertureLockLabelCol
                        // Layout.alignment: Qt.AlignVCenter
                        anchors.verticalCenter: parent.verticalCenter
                        anchors.horizontalCenter: parent.horizontalCenter
                        anchors.left: parent.left
                        spacing: colSpacing
                        Text {
                            id: appertureLockHeadingLabel
                            text: qsTr("AE")
                            anchors.horizontalCenter: parent.horizontalCenter
                            color: "yellow"
                            font.pixelSize: 8
                        }
                        Rectangle {
                            id: appertureLockValueStatusLabel
                            height: 20
                            width: height
                            radius: 50
                            anchors.horizontalCenter: parent.horizontalCenter
                            color:"transparent"
                            Image {
                                id: aeLockImg
                                height: parent.height*0.8
                                width: height
                                anchors.centerIn: parent
                                fillMode: Image.PreserveAspectFit
                                source: "qrc:/lock.png"
                            }
                        }
                    }

                }
                Rectangle{
                    height: autoFocusLabelCol.implicitHeight*1.2
                    width: autoFocusLabelCol.implicitWidth*1.3
                    anchors.verticalCenter: parent.verticalCenter
                    // Layout.margins: marginsAll*0.5
                    color: "transparent"
                    Column{
                        id: autoFocusLabelCol
                        // Layout.alignment: Qt.AlignVCenter
                        anchors.verticalCenter: parent.verticalCenter
                        anchors.horizontalCenter: parent.horizontalCenter
                        anchors.left: parent.left
                        spacing: colSpacing
                        Text {
                            id: autoFocusLabel
                            text: qsTr("AFC")
                            anchors.horizontalCenter: parent.horizontalCenter
                            color: "yellow"
                            font.bold: true
                            font.pixelSize: 12
                        }
                    }

                }
                Rectangle{
                    height: captureModeLabelCol.implicitHeight*1.2
                    width: captureModeLabelCol.implicitWidth*1.3
                    anchors.verticalCenter: parent.verticalCenter
                    // Layout.margins: marginsAll*0.5
                    color: "transparent"
                    Column{
                        id: captureModeLabelCol
                        // Layout.alignment: Qt.AlignVCenter
                        anchors.verticalCenter: parent.verticalCenter
                        anchors.horizontalCenter: parent.horizontalCenter
                        anchors.left: parent.left
                        spacing: colSpacing
                        Rectangle {
                            id: captureModeValueStatusLabel
                            height: 20
                            width: height
                            radius: 50
                            anchors.horizontalCenter: parent.horizontalCenter
                            color:"transparent"
                            Image {
                                id: captureModeImg
                                height: parent.height*0.8
                                width: height
                                anchors.centerIn: parent
                                fillMode: Image.PreserveAspectFit
                                source: "qrc:/night.png"
                            }
                        }
                        Text {
                            id: captureModeHeadingLabel
                            text: qsTr("Auto")
                            anchors.horizontalCenter: parent.horizontalCenter
                            color: "white"
                            font.pixelSize: 8
                        }

                    }

                }

                Rectangle{
                    height: optimiserLabelCol.implicitHeight*1.2
                    width: optimiserLabelCol.implicitWidth*1.3
                    anchors.verticalCenter: parent.verticalCenter
                    // Layout.margins: marginsAll*0.5
                    color: "transparent"
                    Column{
                        id: optimiserLabelCol
                        // Layout.alignment: Qt.AlignVCenter
                        anchors.verticalCenter: parent.verticalCenter
                        anchors.horizontalCenter: parent.horizontalCenter
                        anchors.left: parent.left
                        spacing: colSpacing
                        Rectangle {
                            id: optimiserValueStatusLabel
                            height: 20
                            width: height
                            radius: 50
                            anchors.horizontalCenter: parent.horizontalCenter
                            color:"transparent"
                            Image {
                                id: optimiserImg
                                height: parent.height*0.8
                                width: height
                                anchors.centerIn: parent
                                fillMode: Image.PreserveAspectFit
                                source: "qrc:/scene.png"
                            }
                        }
                        Text {
                            id: optimiserHeadingLabel
                            text: qsTr("On")
                            anchors.horizontalCenter: parent.horizontalCenter
                            color: "white"
                            font.pixelSize: 8
                        }

                    }

                }
                Rectangle{
                    height: sdCardLabelCol.implicitHeight*1.2
                    width: sdCardLabelCol.implicitWidth*1.3
                    anchors.verticalCenter: parent.verticalCenter
                    // Layout.margins: marginsAll*0.5
                    color: "transparent"
                    Column{
                        id: sdCardLabelCol
                        // Layout.alignment: Qt.AlignVCenter
                        anchors.verticalCenter: parent.verticalCenter
                        anchors.horizontalCenter: parent.horizontalCenter
                        anchors.left: parent.left
                        spacing: colSpacing
                        Text {
                            id: sdCardHeadingLabel
                            text: qsTr("DCV1")
                            anchors.horizontalCenter: parent.horizontalCenter
                            color: "white"
                            font.pixelSize: 8
                        }
                        Text {
                            id: sdCardValueStatusLabel
                            text: qsTr("00000")
                            anchors.horizontalCenter: parent.horizontalCenter
                            color: "#FFFFFF"
                            font.bold: true
                            font.family: "Tahom"
                            font.pixelSize: 10
                        }

                    }

                }

                Rectangle{
                    height: autoFocusLabelCol.implicitHeight*1.2
                    width: autoFocusLabelCol.implicitWidth*1.3
                    anchors.verticalCenter: parent.verticalCenter
                    // Layout.margins: marginsAll*0.5
                    color: "transparent"
                    Column{
                        id: cameraModeLabelCol
                        // Layout.alignment: Qt.AlignVCenter
                        anchors.verticalCenter: parent.verticalCenter
                        anchors.horizontalCenter: parent.horizontalCenter
                        anchors.left: parent.left
                        spacing: colSpacing
                        Rectangle {
                            height: 30
                            width: height
                            radius: 50
                            anchors.horizontalCenter: parent.horizontalCenter
                            color: "transparent"
                            Image {
                                id: cameraModeImg
                                height: parent.height
                                width: height
                                anchors.centerIn: parent
                                fillMode: Image.PreserveAspectFit
                                source: "qrc:/auto_cam.png"
                            }
                        }
                    }

                }
            }
        }

    }
}
