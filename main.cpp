#include <QApplication>
#include <QQmlApplicationEngine>
#include <QtQml>
#include "appconfig.h"
#include "ERModbus.h"
#include "ERLed.h"
#include <QDebug>


int main(int argc, char *argv[])
{
    QApplication app(argc, argv);
  //  QApplication::setOverrideCursor(Qt::ArrowCursor);
   QApplication::setOverrideCursor(Qt::ArrowCursor);
    qmlRegisterType<APPConfig>("WeldSys.APPConfig",1,0,"APPConfig");
    qmlRegisterType<ERModbus>("WeldSys.ERModbus",1,0,"ERModbus");
    qmlRegisterType<ERLed>("WeldSys.ERLed",1,0,"ERLed");
    QQmlApplicationEngine engine;
    engine.setOfflineStoragePath("offlineSrorage");
    qDebug()<<engine.offlineStoragePath();
    engine.load(QUrl(QStringLiteral("qrc:/main.qml")));
    return app.exec();
}
