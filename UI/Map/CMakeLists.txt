qt_add_library(Map STATIC)

qt_add_qml_module(Map
    URI GCS.UI.Map
    VERSION 1.0
    RESOURCE_PREFIX /
    QML_FILES
        MapView.qml
        QML_FILES MissionOverlay.qml
        QML_FILES WaypointItem.qml
)
