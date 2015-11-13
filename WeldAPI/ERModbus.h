#ifndef MODBUSPORT_H
#define MODBUSPORT_H


#include <QObject>
#include <QString>
#include <QtQml/QQmlListProperty>
#include "modbus.h"

/*
 *  实现modbus与qml的联合调用
*/

class ERModbus : public QObject
{
    Q_OBJECT
    /*modbus_status */
    Q_PROPERTY(QString  modbus_status  READ getmodus_status WRITE  setmodbus_status)
    /*modbus_write_reg*/
    Q_PROPERTY(int modbus_write_reg WRITE setmodbus_write_reg)
    public:
    ERModbus();
    ~ERModbus();

    void setmodbus_write_reg(int num);
    void setmodbus_status(QString Status);
    QString getmodus_status(void );
    /*modbus 结构体指针，用于操作modbus*/
    modbus_t *ER_Modbus;
    QString status;
};





#endif
