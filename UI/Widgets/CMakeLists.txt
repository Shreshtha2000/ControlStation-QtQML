qt_add_library(Widgets STATIC)

qt_add_qml_module(Widgets
    URI GCS.UI.Widgets
    VERSION 1.0
    RESOURCE_PREFIX /
    QML_FILES
        ArtificialHorizon.qml
        QML_FILES CompassWidget.qml
        QML_FILES SignalStrengthIndicator.qml
        QML_FILES BatteryIndicator.qml
        QML_FILES StatusIndicator.qml
)
