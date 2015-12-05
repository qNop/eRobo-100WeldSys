#ifndef LED_H
#define LED_H

#include <QObject>
#include <QString>
#include <QtQml/QQmlListProperty>


class ERLed : public QObject
{
     Q_OBJECT
    Q_PROPERTY(QString leds READ getleds WRITE setleds)
    Q_PROPERTY(int lcdbacklight READ getlcdbacklight WRITE setlcdbacklight)

   public:
    ERLed();
   ~ERLed();

    void setleds(QString status);
    QString getleds();
    QString led_status;

    void setlcdbacklight(int value);
    int getlcdbacklight();
    int pwmbacklight;

};

#endif // LED_H
