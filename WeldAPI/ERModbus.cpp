#include "ERModbus.h"
#include "modbus.h"
#include "modbus-rtu.h"
#include "modbus-rtu-private.h"
#include "modbus-private.h"
#include <QDebug>
//#include <qextserialenumerator.h>
//#include <qextserialport.h>

ERModbus::ERModbus(){

}
ERModbus::~ERModbus(){

}

/*
 * Modbus 建立
 */

void ERModbus::setmodbus_status(QString Status){
           status=Status;
          if(Status=="setup"){
               /*获取RTU结构体*/
               ER_Modbus =  modbus_new_rtu("/dev/ttymxc1",115200,'N',8,1);
               /*设置modbus为232模式*/
               modbus_rtu_set_serial_mode(ER_Modbus,MODBUS_RTU_RS232);
               /*为0输出调试信息*/
               modbus_set_debug(ER_Modbus, TRUE);
               /*设置超时时间 500 000 us*/
               modbus_set_response_timeout(ER_Modbus,0,100000);
              /*设置从机地址*/
               modbus_set_slave(ER_Modbus,0x0001);
               /*连接串口*/
               modbus_connect(ER_Modbus);
               qDebug()<<"modbus opened~";
         }
        else  if(Status=="stop"){
              /*关闭modbus*/
              modbus_close(ER_Modbus);
              /*释放modbus内存*/
              modbus_free(ER_Modbus);
              /*清楚modbus指针*/
              ER_Modbus = NULL;
               qDebug()<<"modbus closed~";
            }
}

QString ERModbus::getmodus_status(void){
    return status;
}
void ERModbus::setmodbus_write_reg(int num){
    int s;
    if(ER_Modbus != NULL){
      qDebug()<<"modbus send mesg";
         //写modbus
           s=modbus_write_register(ER_Modbus,1,num);
          qDebug()<<"modbus send "<<s;
    }
    else
    {
        qDebug()<<"modbus is closed ~";
    }
}
int ERModbus::getmodbus_reg(void){
    int s;
    uint16_t data;
     if(ER_Modbus != NULL){
    qDebug()<<"modbus send get mesg";
    //写modbus
    s=modbus_read_registers(ER_Modbus,1,1,&data);
      qDebug()<<"modbus send get mesg"<<s;
       }
     else{
         qDebug()<<"modbus is closed ~";
     }
    return data;

}
