#-------------------------------------------------
#
# Project created by QtCreator 2013-04-04T23:11:38
#
#-------------------------------------------------

QT       += qml quick gui-private widgets

CONFIG += plugin

TARGET = VirtualKeyboard
TEMPLATE = lib

DEFINES += VIRTUALKEYBOARD_LIBRARY

win32 {
    DESTDIR = $$PWD/../build-IPTest/platforminputcontexts
    OBJECTS_DIR = $$DESTDIR/obj
    MOC_DIR = $$DESTDIR/moc
}
unix{
    DESTDIR = $$[QT_INSTALL_PLUGINS]/platforminputcontexts
}


SOURCES += VirtualKeyboardplatforminputcontextplugin.cpp \
    VirtualKeyboardinputcontext.cpp \
    VirtualKeyboardkeyeventdispatcher.cpp \
    pinyininputmethod.cpp

HEADERS += VirtualKeyboardplatforminputcontextplugin.h\
        virtualkeyboard_global.h \
    VirtualKeyboardinputcontext.h \
    VirtualKeyboardkeyeventdispatcher.h \
    pinyininputmethod.h

//INSTALLS += target

OTHER_FILES += \
    InputPanel.qml \
    KeyModel.qml \
    KeyButton.qml

RESOURCES += \
    res/res.qrc \
    qml/qml.qrc

