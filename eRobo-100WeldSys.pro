TEMPLATE = app

QT += qml quick core widgets sql serialport

SOURCES += main.cpp \
    WeldAPI/appconfig.cpp\
    3rdparty/libmodbus/src/modbus.c \
    3rdparty/libmodbus/src/modbus-data.c \
    3rdparty/libmodbus/src/modbus-rtu.c \
    3rdparty/qextserialport/posix_qextserialport.cpp \
    3rdparty/qextserialport/qextserialenumerator_unix.cpp \
    3rdparty/qextserialport/qextserialport.cpp \
    WeldAPI/ERModbus.cpp

RESOURCES += qml.qrc

CONFIG += console qml_debug

# Additional import path used to resolve QML modules in Qt Creator's code model
QML_IMPORT_PATH =

# Default rules for deployment.
#include(deployment.pri)

HEADERS += \
    WeldAPI/appconfig.h \
    WeldAPI/gloabldefine.h \
    WeldAPI/qextserialenumerator.h \
    3rdparty/libmodbus/src/modbus.h \
    3rdparty/qextserialport/qextserialenumerator.h \
    3rdparty/qextserialport/qextserialport.h \
    3rdparty/libmodbus/src/modbus-rtu.h \
    3rdparty/libmodbus/src/modbus-rtu-private.h \
    WeldAPI/ERModbus.h

INCLUDEPATH +=3rdparty/libmodbus \
              3rdparty/libmodbus/src \
              3rdparty/qextserialport \
              WeldAPI\





