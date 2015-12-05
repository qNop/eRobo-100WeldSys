#include "ERLed.h"
#include <QDebug>
#include <QProcess>
#include <sys/ioctl.h>
#include <stdio.h>
#include <stdlib.h>
#include <errno.h>
#include <fcntl.h>
#include <string.h>


ERLed::ERLed(){

}
ERLed::~ERLed(){

}
/*
 * set led status
 */
void ERLed::setleds(QString status){
       QString s;
       QProcess *poc = new QProcess;
       s="/Nop/leds ";
       s+=status;
       qDebug()<<s;
       poc->start(s);
       led_status=status;
}
QString ERLed::getleds(void){
    return led_status;
}

void ERLed::setlcdbacklight(int value){

    QString s;
    QProcess *poc = new QProcess;
    s="/Nop/backlight ";
    s+=QString::number(value);
    qDebug()<<s;
     poc->start(s);
     pwmbacklight=value;
}
int ERLed::getlcdbacklight(){
    qDebug()<<pwmbacklight;
    return pwmbacklight;
}

