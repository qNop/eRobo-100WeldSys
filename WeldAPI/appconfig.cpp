/*
 *
 *
 *
 *
 */
#include "appconfig.h"
#include <QFile>
#include <QDir>
#include <QSettings>
#include <QDebug>
#include <QTime>
#include <QDateTime>
#include <QProcess>
#include "gloabldefine.h"

APPConfig::APPConfig(){

}
APPConfig::~APPConfig(){

}
/*
 ********************************************************************************检测文件是否存在
 */
bool File_Is_Exist(QString Qfilename){
     QFile tempfile(Qfilename);
     return tempfile.exists();
}
/*
 ************************************************************************************APP配置文件
 */
void Write_APP_Config(QSettings *Set){
     Set->beginGroup("eRoboWeldSysAppConfig");
     Set->setValue("Last_User",EROBOWELDSYS_LAST_USER_TYPE);
   //  Set->setValue("Current_Groove",EROBOWELDSYS_CU);

     Set->setValue("Current_User_Name",EROBOWELDSYS_CURRENT_USER_NAME);
     Set->setValue("Current_User_PassWord",EROBOWELDSYS_CURRENT_USER_PASSWORD);
     Set->setValue("Current_User_Type",EROBOWELDSYS_CURRENT_USER_TYPE);

     Set->setValue("Screen_Height",EROBOWELDSYS_SCREEN_HEGHT);
     Set->setValue("Screen_Width",EROBOWELDSYS_SCREEN_WIDTH);

     Set->setValue("Theme_AccentColor",EROBOWELDSYS_THEMEACCENTCOLOR);
     Set->setValue("Theme_BackgroundColor",EROBOWELDSYS_THEMEBACKGROUNDCOLOR);
     Set->setValue("Theme_PrimaryColor",EROBOWELDSYS_THEMEPRIMARYCOLOR);

     Set->setValue("SoftWare_Author",EROBOWELDSYS_SOFTWAREAUTHOR);
     Set->setValue("SoftWare_Company",EROBOWELDSYS_SOFTWARECOMPANY);
     Set->setValue("SoftWare_Description",EROBOWELDSYS_SOFTWAREDESCRIPTION);
     Set->setValue("SoftWare_Version",EROBOWELDSYS_SOFTWAREVREASION);
     Set->endGroup();
}
/*
 **********************************************************************************获取配置ini指针
 */
QSettings *getPfromQfile(){
    QSettings *path;
    bool IsExist;
    QString QFilename = EROBOWELDSYS_DIR;
           QFilename = QFilename+"Config.txt";
    IsExist = File_Is_Exist(QFilename);
    path=new QSettings(QFilename,QSettings::IniFormat);
    if(!IsExist){
        qDebug()<<"配置文件不存在，已创建模板";
        Write_APP_Config(path);
    }
    return(path);
}
/*
 ************************************************************************************屏幕宽度读写
 */
int APPConfig::screenWidth(){
    int Screen_Width;
   QSettings *Set =getPfromQfile();
   Set->beginGroup("eRoboWeldSysAppConfig");
   Screen_Width = Set->value("Screen_Width").toInt();
   Set->endGroup();
   qDebug()<<"Screen width read"<<Screen_Width;
   return Screen_Width;
}
void APPConfig::setScreenWidth(int width){
    QSettings *Set =getPfromQfile();
    Set->beginGroup("eRoboWeldSysAppConfig");
    Set->setValue("Screen_Width",width);
    Set->endGroup();
    emit screenWidthChanged(width);
   qDebug() <<"Screen width change";
}
/*
 ************************************************************************************屏幕高度读写
 */
int APPConfig::screenHeight(){
    int Screen_Height;
   QSettings *Set =getPfromQfile();
   Set->beginGroup("eRoboWeldSysAppConfig");
   Screen_Height = Set->value("Screen_Height").toInt();
   Set->endGroup();
   qDebug()<<"Screen height read"<<Screen_Height;
   return Screen_Height;
}
void APPConfig::setScreenHeight(int height){
    QSettings *Set =getPfromQfile();
    Set->beginGroup("eRoboWeldSysAppConfig");
    Set->setValue("Screen_Height",height);
    Set->endGroup();
    emit screenHeightChanged(height);
   qDebug() <<"Screen height change";
}
/*
 ************************************************************************************当前用户称
 */
QString APPConfig::currentusername(){
    QString name;
   QSettings *Set =getPfromQfile();
   Set->beginGroup("eRoboWeldSysAppConfig");
   name = Set->value("Current_User_Name").toString();
   Set->endGroup();
   qDebug()<<"current user name read"<<name;
   return name;
}
void APPConfig::setcurrentusername(QString username){
    QSettings *Set =getPfromQfile();
    Set->beginGroup("eRoboWeldSysAppConfig");
    Set->setValue("Current_User_Name",username);
    Set->endGroup();
    emit currentusernameChanged(username);
   qDebug() <<"current user name change";
}
/*
 ************************************************************************************当前密码
 */
QString APPConfig::currentuserpassword(){
    QString password;
   QSettings *Set =getPfromQfile();
   Set->beginGroup("eRoboWeldSysAppConfig");
   password = Set->value("Current_User_PassWord").toString();
   Set->endGroup();
   qDebug()<<"current password read"<<password;
   return password;
}
void APPConfig::setcurrentuserpassword(QString userpassword){
    QSettings *Set =getPfromQfile();
    Set->beginGroup("eRoboWeldSysAppConfig");
    Set->setValue("Current_User_PassWord",userpassword);
    Set->endGroup();
    emit currentuserpasswordChanged(userpassword);
   qDebug() <<"current password change";
}
/*
 ************************************************************************************当前用户类型
 */
QString APPConfig::currentusertype(){
   QString type;
   QSettings *Set =getPfromQfile();
   Set->beginGroup("eRoboWeldSysAppConfig");
   type = Set->value("Current_User_Type").toString();
   Set->endGroup();
   qDebug()<<"current type read"<<type;
   return type;
}
void APPConfig::setcurrentusertype(QString usertype){
    QSettings *Set =getPfromQfile();
    Set->beginGroup("eRoboWeldSysAppConfig");
    Set->setValue("Current_User_Type",usertype);
    Set->endGroup();
    emit currentusertypeChanged(usertype);
   qDebug() <<"current password change";
}
/*
 ************************************************************************************当前用户类型
 */
QString APPConfig::lastuser(){
   QString username;
   QSettings *Set =getPfromQfile();
   Set->beginGroup("eRoboWeldSysAppConfig");
   username = Set->value("Last_User").toString();
   Set->endGroup();
   qDebug()<<"last user read"<<username;
   return username;
}
void APPConfig::setlastuser(QString username){
    QSettings *Set =getPfromQfile();
    Set->beginGroup("eRoboWeldSysAppConfig");
    Set->setValue("Last_User",username);
    Set->endGroup();
    emit lastuserChanged(username);
   qDebug() <<"last user change";
}


