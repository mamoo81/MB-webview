cmake_minimum_required(VERSION 3.16)

project(MetaBox VERSION 2.0 LANGUAGES CXX)

set(CMAKE_CXX_STANDARD_REQUIRED ON)

find_package(Qt6 6.4 REQUIRED COMPONENTS Quick WebView)

# if(NOT ANDROID)
#     set (NOT_ANDROID TRUE)
# endif()

qt_standard_project_setup()

qt_add_executable(appMetaBox
    main.cpp
)

qt_add_qml_module(appMetaBox
    URI MetaBox
    VERSION 1.0
    QML_FILES Main.qml
)

# Qt for iOS sets MACOSX_BUNDLE_GUI_IDENTIFIER automatically since Qt 6.1.
# If you are developing for iOS or macOS you should consider setting an
# explicit, fixed bundle identifier manually though.
set_target_properties(appMetaBox PROPERTIES
#    MACOSX_BUNDLE_GUI_IDENTIFIER com.example.appMetaBox
    MACOSX_BUNDLE_BUNDLE_VERSION ${PROJECT_VERSION}
    MACOSX_BUNDLE_SHORT_VERSION_STRING ${PROJECT_VERSION_MAJOR}.${PROJECT_VERSION_MINOR}
    MACOSX_BUNDLE TRUE
    WIN32_EXECUTABLE TRUE
)

set_property(TARGET appMetaBox PROPERTY QT_ANDROID_PACKAGE_SOURCE_DIR "${CMAKE_CURRENT_SOURCE_DIR}/android")

target_link_libraries(appMetaBox
    PRIVATE Qt6::Quick Qt6::WebView
)

include(GNUInstallDirs)
install(TARGETS appMetaBox
    BUNDLE DESTINATION .
    LIBRARY DESTINATION ${CMAKE_INSTALL_LIBDIR}
    RUNTIME DESTINATION ${CMAKE_INSTALL_BINDIR}
)
