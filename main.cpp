#include <QApplication>
#include <QQmlApplicationEngine>
#include <QtQml>
#include "appconfig.h"
#include "ERModbus.h"
#include <QDebug>

int main(int argc, char *argv[])
{
    QApplication app(argc, argv);
     qputenv("QT_IM_MODULE", QByteArray("mockup"));

    qmlRegisterType<APPConfig>("WeldSys.APPConfig",1,0,"APPConfig");
    qmlRegisterType<ERModbus>("WeldSys.ERModbus",1,0,"ERModbus");
    QQmlApplicationEngine engine;
    engine.setOfflineStoragePath("offlineSrorage");
    qDebug()<<engine.offlineStoragePath();
    engine.load(QUrl(QStringLiteral("qrc:/main.qml")));
    return app.exec();
}
