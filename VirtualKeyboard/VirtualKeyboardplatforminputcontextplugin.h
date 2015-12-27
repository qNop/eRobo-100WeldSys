#ifndef VIRTUALKEYBOARDPLATFORMINPUTCONTEXTPLUGIN_H
#define VIRTUALKEYBOARDPLATFORMINPUTCONTEXTPLUGIN_H

#include "virtualkeyboard_global.h"
#include <qpa/qplatforminputcontextplugin_p.h>

class VIRTUALKEYBOARDSHARED_EXPORT VirtualKeyboardPlatformInputContextPlugin: public QPlatformInputContextPlugin
{
    Q_OBJECT
    Q_PLUGIN_METADATA(IID "org.qt-project.Qt.QPlatformInputContextFactoryInterface.5.1" FILE "VirtualKeyboard.json")

public:
    QPlatformInputContext *create(const QString&, const QStringList&);
};


#endif 
