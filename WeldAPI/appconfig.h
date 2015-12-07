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
    /*当前基础色彩*/
    Q_PROPERTY(QString themeprimarycolor READ  getthemeprimarycolor WRITE setthemeprimarycolor NOTIFY themeprimarycolorchanged )
    /*当前前景色彩*/
    Q_PROPERTY(QString themeaccentcolor READ  getthemeaccentcolor WRITE setthemeaccentcolor NOTIFY themeaccentcolorchanged)
    /*当前背景色彩*/
    Q_PROPERTY(QString themebackgroundcolor READ  getthemebackgroundcolor WRITE setthemebackgroundcolor NOTIFY themebackgroundcolorchanged )
    /*系统背光*/
     Q_PROPERTY(int backlight READ  getbacklight WRITE setbacklight NOTIFY backlightchanged )
    /*当前坡口*/
    Q_PROPERTY(int currentgroove READ  getcurrentgroove WRITE setcurrentgroove NOTIFY currentgroovechanged)
public:
    APPConfig();
    ~APPConfig();

    int getcurrentgroove(); // 当前坡口
    void setcurrentgroove(int);

    QString currentusername();  // 当前用户名称
    void  setcurrentusername(QString username);

    QString currentuserpassword();//当前用户密码
    void  setcurrentuserpassword(QString userpassword);

    QString currentusertype();     //当前用户类型
    void setcurrentusertype(QString usertype);

    QString lastuser();//上一次使用用户
    void setlastuser(QString username);

    QString localdatetime();//本地系统时间
    void setlocaldatetime(QString datetime);

    int screenWidth();//屏幕宽度
    void setScreenWidth(int width);

    int screenHeight();       //屏幕长度
    void setScreenHeight(int height);



     QString SoftWare_Description; // 软件描述
     QString SoftWare_Author;         //软件作者
     QString SoftWare_Company;    //软件公司
     QString SoftWare_Version;                //软件版本

     QString getthemeprimarycolor();  //系统主题前景颜色
     void setthemeprimarycolor(QString color);
     QString getthemeaccentcolor();  //系统主题前景颜色
     void setthemeaccentcolor(QString color);
     QString getthemebackgroundcolor();  //系统主题前景颜色
     void setthemebackgroundcolor(QString color);

     int getbacklight();//系统背光
     void setbacklight(int value);

 signals:
    void screenWidthChanged(int width);
    void screenHeightChanged(int hight);
    void currentusernameChanged(QString username);
    void currentuserpasswordChanged(QString userpassword);
    void currentusertypeChanged(QString usertype);
    void lastuserChanged(QString username);
    void localdatetimeChanged(QString datetime);
    void themeprimarycolorchanged(QString color);
    void themeaccentcolorchanged(QString color);
    void themebackgroundcolorchanged(QString color);
    void backlightchanged(int value);
    void currentgroovechanged(int value);

};

#endif // APPCONFIG_H
