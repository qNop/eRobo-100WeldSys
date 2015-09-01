TEMPLATE = app

QT += qml quick core widgets sql serialport

SOURCES += main.cpp \
    WeldAPI/appconfig.cpp\
    WeldAPI/modbusport.cpp \
    libmodbus/modbus.c \
    libmodbus/modbus-data.c \
    libmodbus/modbus-rtu.c

RESOURCES += qml.qrc

CONFIG += console

# Additional import path used to resolve QML modules in Qt Creator's code model
QML_IMPORT_PATH =

# Default rules for deployment.
#include(deployment.pri)

HEADERS += \
    WeldAPI/appconfig.h \
    WeldAPI/gloabldefine.h \
    libmodbus/modbus.h \
    libmodbus/modbus-private.h \
    libmodbus/modbus-rtu.h \
    libmodbus/modbus-rtu-private.h \
    libmodbus/modbus-version.h.in \
    WeldAPI/modbusport.h





