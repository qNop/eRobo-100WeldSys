#ifndef MODBUSPORT_H
#define MODBUSPORT_H


#include <QObject>
#include <QString>
#include <QtQml/QQmlListProperty>

/*
 *  实现modbus与qml的联合调用
*/

class ModbusPort : public QObject
{
    Q_OBJECT


    public:
    ModbusPort();
    ~ModbusPort();


     signals:

}





#endif
