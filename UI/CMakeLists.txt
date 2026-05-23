
qt_add_library(UI STATIC)

add_subdirectory(Layout)
add_subdirectory(Map)
add_subdirectory(Widgets)

qt_add_qml_module(UI
    URI GCS.UI
    VERSION 1.0
    RESOURCE_PREFIX /
    QML_FILES
        MainWindow.qml
)

