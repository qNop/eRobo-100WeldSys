#include "ERModbus.h"
#include "modbus.h"
#include "modbus-rtu.h"
#include "modbus-rtu-private.h"
#include "modbus-private.h"
#include <QDebug>
#include <qextserialenumerator.h>
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
               ER_Modbus =  modbus_new_rtu("/dev/ttyUSB0",115200,'N',8,1);
               /*设置modbus为232模式*/
               modbus_rtu_set_serial_mode(ER_Modbus,MODBUS_RTU_RS232);
               /*为0输出调试信息*/
               modbus_set_debug(ER_Modbus, TRUE);
               /*设置超时时间 500 000 us*/
               modbus_set_response_timeout(ER_Modbus,0,100000);
              /*设置从机地址*/
               modbus_set_slave(ER_Modbus,0x0001);
               /*连接串口*/
               if(modbus_connect(ER_Modbus) == -1)
                   qDebug()<<"modbus connect fail ...";
               else
                   qDebug()<<"modbus connect OK ...";
         }
        else  if(Status=="stop"){
              /*关闭modbus*/
              modbus_close(ER_Modbus);
              /*释放modbus内存*/
              modbus_free(ER_Modbus);
              /*清楚modbus指针*/
              ER_Modbus = NULL;
               qDebug()<<"modbus closed";
            }
}

QString ERModbus::getmodus_status(void){
    return status;
}
void ERModbus::setmodbus_write_reg(int num){
    qDebug()<<"modbus send mesg";
     //写modbus
   if( modbus_write_register(ER_Modbus,1,num)){
       qDebug()<<"modbus send ok";
   }
   else{
        qDebug()<<"modbus send fail";
   }
}
