#ifndef APPCONFIG_H
#define APPCONFIG_H

#include <QObject>
#include <QString>
#include <QtQml/QQmlListProperty>

class APPConfig : public QObject
{
    Q_OBJECT
    Q_PROPERTY(int screenWidth READ  screenWidth WRITE setScreenWidth NOTIFY screenWidthChanged )
    Q_PROPERTY(int screenHeight READ  screenHeight WRITE setScreenHeight NOTIFY screenHeightChanged)
    Q_PROPERTY(QString currentusername READ  currentusername WRITE setcurrentusername NOTIFY currentusernameChanged )
    Q_PROPERTY(QString currentuserpassword READ  currentuserpassword WRITE setcurrentuserpassword NOTIFY currentuserpasswordChanged)
    Q_PROPERTY(QString currentusertype READ  currentusertype WRITE setcurrentusertype NOTIFY currentusertypeChanged)
    Q_PROPERTY(QString lastusertype READ  lastuser WRITE setlastuser NOTIFY lastuserChanged)
  //  Q_PROPERTY(QString localdatetime READ  localdatetime WRITE setlocaldatetime NOTIFY localdatetimeChanged)
public:
    APPConfig();
    ~APPConfig();
    QString currentusername();  // 当前用户名称
    void  setcurrentusername(QString username);

    QString currentuserpassword();//当前用户密码
    void  setcurrentuserpassword(QString userpassword);

    QString currentusertype();     //当前用户类型
    void setcurrentusertype(QString usertype);

    QString lastuser();
    void setlastuser(QString username);

    QString localdatetime();
    void setlocaldatetime(QString datetime);

    int screenWidth();
    void setScreenWidth(int width);

    int screenHeight();       //屏幕长度
    void setScreenHeight(int height);

     QString Current_Groove; // 当前坡口

     QString SoftWare_Description; // 软件描述
     QString SoftWare_Author;         //软件作者
     QString SoftWare_Company;    //软件公司
     QString SoftWare_Version;                //软件版本

     QString Theme_PrimaryColor;  //系统主题前景颜色
     QString Theme_AccentColor;   //系统组件颜色
     QString Theme_BackgroundColor;//系统背景颜色



 signals:
    void screenWidthChanged(int width);
    void screenHeightChanged(int hight);
    void currentusernameChanged(QString username);
    void currentuserpasswordChanged(QString userpassword);
    void currentusertypeChanged(QString usertype);
    void lastuserChanged(QString username);
    void localdatetimeChanged(QString datetime);
};

#endif // APPCONFIG_H
