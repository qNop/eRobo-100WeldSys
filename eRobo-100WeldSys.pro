TEMPLATE = app

QT += qml quick core widgets sql serialport

SOURCES += main.cpp \
    WeldAPI/appconfig.cpp\
    libmodbus/src/modbus.c\
    libmodbus/src/modbus-data.c\
    libmodbus/src/modbus-rtu.c \
    WeldAPI/modbusport.cpp

RESOURCES += qml.qrc

CONFIG += console

# Additional import path used to resolve QML modules in Qt Creator's code model
QML_IMPORT_PATH =

# Default rules for deployment.
#include(deployment.pri)

HEADERS += \
    WeldAPI/appconfig.h \
    WeldAPI/gloabldefine.h \
    libmodbus/src/modbus.h \
    WeldAPI/modbusport.h





