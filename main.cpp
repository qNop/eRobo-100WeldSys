#include <QGuiApplication>
#include <QQmlApplicationEngine>
#include <QtQml>
#include "WeldAPI/appconfig.h"
#include <QDebug>


int main(int argc, char *argv[])
{
    QGuiApplication app(argc, argv);
    qmlRegisterType<APPConfig>("WeldSys.APPConfig",1,0,"APPConfig");
    QQmlApplicationEngine engine;
    engine.setOfflineStoragePath("offlineSrorage");
    qDebug()<<engine.offlineStoragePath();
    engine.load(QUrl(QStringLiteral("qrc:/main.qml")));
    return app.exec();
}
