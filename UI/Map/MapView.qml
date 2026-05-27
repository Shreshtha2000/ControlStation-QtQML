import QtQuick 2.15
import QtLocation
import QtPositioning


Map {
    id: map
    anchors.fill: parent

    Plugin {
        id: mapPlugin
        name: "osm"
        PluginParameter {
            name: "osm.mapping.custom.host"
            value: "https://tile.opentopomap.org/"
        }

        PluginParameter {
            name: "osm.mapping.providersrepository.disabled"
            value: true
        }
    }
    plugin: mapPlugin


    center: QtPositioning.coordinate(28.459033019728, 77.1240234375) // Delhi
    zoomLevel: 16
    property geoCoordinate startCentroid

    PinchHandler {
        id: pinch
        target: null
        onActiveChanged: if (active) {
                             map.startCentroid = map.toCoordinate(pinch.centroid.position, false)
                         }
        onScaleChanged: (delta) => {
                            map.zoomLevel += Math.log2(delta)
                            map.alignCoordinateToPoint(map.startCentroid, pinch.centroid.position)
                        }
        onRotationChanged: (delta) => {
                               map.bearing -= delta
                               map.alignCoordinateToPoint(map.startCentroid, pinch.centroid.position)
                           }
        grabPermissions: PointerHandler.TakeOverForbidden
    }
    WheelHandler {
        id: wheel
        // workaround for QTBUG-87646 / QTBUG-112394 / QTBUG-112432:
        // Magic Mouse pretends to be a trackpad but doesn't work with PinchHandler
        // and we don't yet distinguish mice and trackpads on Wayland either
        acceptedDevices: Qt.platform.pluginName === "cocoa" || Qt.platform.pluginName === "wayland"
                         ? PointerDevice.Mouse | PointerDevice.TouchPad
                         : PointerDevice.Mouse
        rotationScale: 1/120
        property: "zoomLevel"
    }
    DragHandler {
        id: drag
        target: null
        onTranslationChanged: (delta) => map.pan(-delta.x, -delta.y)
    }
    Shortcut {
        enabled: map.zoomLevel < map.maximumZoomLevel
        sequence: StandardKey.ZoomIn
        onActivated: map.zoomLevel = Math.round(map.zoomLevel + 1)
    }
    Shortcut {
        enabled: map.zoomLevel > map.minimumZoomLevel
        sequence: StandardKey.ZoomOut
        onActivated: map.zoomLevel = Math.round(map.zoomLevel - 1)
    }
    // Component.onCompleted: {
    //         for (let i = 0; i < supportedMapTypes.length; ++i) {
    //             console.log(supportedMapTypes[i].name)
    //             console.log(supportedMapTypes[i].name.includes("Terrain"))
    //             if (supportedMapTypes[i].name.includes("Terrain")) {
    //                 console.log("Setting it")
    //                 activeMapType = supportedMapTypes[i]
    //             }
    //         }
    //     }
}

