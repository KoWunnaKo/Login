TEMPLATE = app

QT += qml quick
CONFIG += c++11

SOURCES += main.cpp \
    login.cpp

RESOURCES += qml.qrc \
    icon.qrc

TRANSLATIONS = Translator/test_Fr.ts

# Additional import path used to resolve QML modules in Qt Creator's code model
QML_IMPORT_PATH =

# Default rules for deployment.
include(deployment.pri)

DISTFILES += \
    CustomMenu.qml

HEADERS += \
    login.h
