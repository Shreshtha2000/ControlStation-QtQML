cmake_minimum_required(VERSION 3.16)

project(GCS VERSION 0.1 LANGUAGES CXX)

set(CMAKE_AUTOMOC ON)
set(CMAKE_CXX_STANDARD_REQUIRED ON)

set(QT_QML_OUTPUT_DIRECTORY ${CMAKE_BINARY_DIR}/)
set(QML_IMPORT_PATH ${CMAKE_BINARY_DIR}/ CACHE STRING "Extra QML Import Paths" FORCE)
set(QT_QML_GENERATE_QMLLS_INI ON)

find_package(Qt6 REQUIRED COMPONENTS Quick Qml Core5Compat)


qt_add_executable(appGCS
    main.cpp
)
add_subdirectory(UI)
# qt_add_qml_module(appGCS
#     URI GCS
#     VERSION 1.0
#     QML_FILES
#         Main.qml
#         QML_FILES UI/MainWindow.qml
# )

# Qt for iOS sets MACOSX_BUNDLE_GUI_IDENTIFIER automatically since Qt 6.1.
# If you are developing for iOS or macOS you should consider setting an
# explicit, fixed bundle identifier manually though.
set_target_properties(appGCS PROPERTIES
#    MACOSX_BUNDLE_GUI_IDENTIFIER com.example.appGCS
    MACOSX_BUNDLE_BUNDLE_VERSION ${PROJECT_VERSION}
    MACOSX_BUNDLE_SHORT_VERSION_STRING ${PROJECT_VERSION_MAJOR}.${PROJECT_VERSION_MINOR}
    MACOSX_BUNDLE TRUE
    WIN32_EXECUTABLE TRUE
)

target_link_libraries(appGCS
    PRIVATE
    Qt6::Quick
    Qt6::Qml
    Qt6::Core5Compat
    UI
    UIplugin
    Layout
    Layoutplugin
    Map
    Mapplugin
    Widgets
    Widgetsplugin
)

include(GNUInstallDirs)
install(TARGETS appGCS
    BUNDLE DESTINATION .
    LIBRARY DESTINATION ${CMAKE_INSTALL_LIBDIR}
    RUNTIME DESTINATION ${CMAKE_INSTALL_BINDIR}
)
