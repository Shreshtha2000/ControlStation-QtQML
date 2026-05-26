import QtQuick 2.15

Item {
    height: 150
    width: 150
    Rectangle{
        id: _joystickRoot
        anchors.fill: parent
        color: "transparent"
        radius: width/2
        Rectangle{
            anchors.fill: parent
            color: "#0A0A0A"
            radius: width/2
            opacity: 0.6
        }

        Rectangle{
            id: joystick

            width: parent.width * 0.6
            height: width
            radius: width / 2
            color: "black"

            x: (_joystickRoot.width - width) / 2
            y: (_joystickRoot.height - height) / 2
            function centerJoystick() {
                x = (_joystickRoot.width - width) / 2
                y = (_joystickRoot.height - height) / 2
            }
            Behavior on x {
                NumberAnimation {
                    duration: 120
                }
            }

            Behavior on y {
                NumberAnimation {
                    duration: 120
                }
            }
            MouseArea{
                anchors.fill: parent

                drag.target: joystick
                drag.axis: Drag.XAndYAxis

                drag.minimumX: -_joystickRoot.width/2
                drag.maximumX: _joystickRoot.width/2

                drag.minimumY: -_joystickRoot.height/2
                drag.maximumY: _joystickRoot.height/2
                onReleased: {
                    joystick.centerJoystick()
                }
            }
        }
    }
}
