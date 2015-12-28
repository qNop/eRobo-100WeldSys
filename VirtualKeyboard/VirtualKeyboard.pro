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

linux-g++{
    DESTDIR = $$[QT_INSTALL_PLUGINS]/platforminputcontexts
}else{
#存储位置为 downloadfiles
    DESTDIR = /home/nop/DownLoadFiles/eRobo-100WeldSys/rootfs/opt/Qt5/plugins/platforminputcontexts
}

SOURCES += VirtualKeyboardplatforminputcontextplugin.cpp \
    VirtualKeyboardinputcontext.cpp \
    VirtualKeyboardkeyeventdispatcher.cpp \
    pinyininputmethod.cpp

HEADERS += VirtualKeyboardplatforminputcontextplugin.h\
    VirtualKeyboardinputcontext.h \
    VirtualKeyboardkeyeventdispatcher.h \
    pinyininputmethod.h

OTHER_FILES += \
    InputPanel.qml \
    KeyModel.qml \
    KeyButton.qml

RESOURCES += \
    res/res.qrc \
    qml/qml.qrc

