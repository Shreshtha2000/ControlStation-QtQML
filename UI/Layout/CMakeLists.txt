qt_add_library(Layout STATIC)

qt_add_qml_module(Layout
    URI GCS.UI.Layout
    VERSION 1.0
    RESOURCE_PREFIX /
    QML_FILES
        HeaderBar.qml
        LeftMissionPanel.qml
        QML_FILES RightToolBar.qml
        QML_FILES CameraPreview.qml
        QML_FILES BottomHUD.qml
    )
