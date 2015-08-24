/****************************************************************************
** Meta object code from reading C++ file 'appconfig.h'
**
** Created by: The Qt Meta Object Compiler version 67 (Qt 5.5.0)
**
** WARNING! All changes made in this file will be lost!
*****************************************************************************/

#include "../WeldAPI/appconfig.h"
#include <QtCore/qbytearray.h>
#include <QtCore/qmetatype.h>
#if !defined(Q_MOC_OUTPUT_REVISION)
#error "The header file 'appconfig.h' doesn't include <QObject>."
#elif Q_MOC_OUTPUT_REVISION != 67
#error "This file was generated using the moc from 5.5.0. It"
#error "cannot be used with the include files from this version of Qt."
#error "(The moc has changed too much.)"
#endif

QT_BEGIN_MOC_NAMESPACE
struct qt_meta_stringdata_APPConfig_t {
    QByteArrayData data[21];
    char stringdata0[302];
};
#define QT_MOC_LITERAL(idx, ofs, len) \
    Q_STATIC_BYTE_ARRAY_DATA_HEADER_INITIALIZER_WITH_OFFSET(len, \
    qptrdiff(offsetof(qt_meta_stringdata_APPConfig_t, stringdata0) + ofs \
        - idx * sizeof(QByteArrayData)) \
    )
static const qt_meta_stringdata_APPConfig_t qt_meta_stringdata_APPConfig = {
    {
QT_MOC_LITERAL(0, 0, 9), // "APPConfig"
QT_MOC_LITERAL(1, 10, 18), // "screenWidthChanged"
QT_MOC_LITERAL(2, 29, 0), // ""
QT_MOC_LITERAL(3, 30, 5), // "width"
QT_MOC_LITERAL(4, 36, 19), // "screenHeightChanged"
QT_MOC_LITERAL(5, 56, 5), // "hight"
QT_MOC_LITERAL(6, 62, 22), // "currentusernameChanged"
QT_MOC_LITERAL(7, 85, 8), // "username"
QT_MOC_LITERAL(8, 94, 26), // "currentuserpasswordChanged"
QT_MOC_LITERAL(9, 121, 12), // "userpassword"
QT_MOC_LITERAL(10, 134, 22), // "currentusertypeChanged"
QT_MOC_LITERAL(11, 157, 8), // "usertype"
QT_MOC_LITERAL(12, 166, 15), // "lastuserChanged"
QT_MOC_LITERAL(13, 182, 20), // "localdatetimeChanged"
QT_MOC_LITERAL(14, 203, 8), // "datetime"
QT_MOC_LITERAL(15, 212, 11), // "screenWidth"
QT_MOC_LITERAL(16, 224, 12), // "screenHeight"
QT_MOC_LITERAL(17, 237, 15), // "currentusername"
QT_MOC_LITERAL(18, 253, 19), // "currentuserpassword"
QT_MOC_LITERAL(19, 273, 15), // "currentusertype"
QT_MOC_LITERAL(20, 289, 12) // "lastusertype"

    },
    "APPConfig\0screenWidthChanged\0\0width\0"
    "screenHeightChanged\0hight\0"
    "currentusernameChanged\0username\0"
    "currentuserpasswordChanged\0userpassword\0"
    "currentusertypeChanged\0usertype\0"
    "lastuserChanged\0localdatetimeChanged\0"
    "datetime\0screenWidth\0screenHeight\0"
    "currentusername\0currentuserpassword\0"
    "currentusertype\0lastusertype"
};
#undef QT_MOC_LITERAL

static const uint qt_meta_data_APPConfig[] = {

 // content:
       7,       // revision
       0,       // classname
       0,    0, // classinfo
       7,   14, // methods
       6,   70, // properties
       0,    0, // enums/sets
       0,    0, // constructors
       0,       // flags
       7,       // signalCount

 // signals: name, argc, parameters, tag, flags
       1,    1,   49,    2, 0x06 /* Public */,
       4,    1,   52,    2, 0x06 /* Public */,
       6,    1,   55,    2, 0x06 /* Public */,
       8,    1,   58,    2, 0x06 /* Public */,
      10,    1,   61,    2, 0x06 /* Public */,
      12,    1,   64,    2, 0x06 /* Public */,
      13,    1,   67,    2, 0x06 /* Public */,

 // signals: parameters
    QMetaType::Void, QMetaType::Int,    3,
    QMetaType::Void, QMetaType::Int,    5,
    QMetaType::Void, QMetaType::QString,    7,
    QMetaType::Void, QMetaType::QString,    9,
    QMetaType::Void, QMetaType::QString,   11,
    QMetaType::Void, QMetaType::QString,    7,
    QMetaType::Void, QMetaType::QString,   14,

 // properties: name, type, flags
      15, QMetaType::Int, 0x00495103,
      16, QMetaType::Int, 0x00495103,
      17, QMetaType::QString, 0x00495003,
      18, QMetaType::QString, 0x00495003,
      19, QMetaType::QString, 0x00495003,
      20, QMetaType::QString, 0x00495003,

 // properties: notify_signal_id
       0,
       1,
       2,
       3,
       4,
       5,

       0        // eod
};

void APPConfig::qt_static_metacall(QObject *_o, QMetaObject::Call _c, int _id, void **_a)
{
    if (_c == QMetaObject::InvokeMetaMethod) {
        APPConfig *_t = static_cast<APPConfig *>(_o);
        Q_UNUSED(_t)
        switch (_id) {
        case 0: _t->screenWidthChanged((*reinterpret_cast< int(*)>(_a[1]))); break;
        case 1: _t->screenHeightChanged((*reinterpret_cast< int(*)>(_a[1]))); break;
        case 2: _t->currentusernameChanged((*reinterpret_cast< QString(*)>(_a[1]))); break;
        case 3: _t->currentuserpasswordChanged((*reinterpret_cast< QString(*)>(_a[1]))); break;
        case 4: _t->currentusertypeChanged((*reinterpret_cast< QString(*)>(_a[1]))); break;
        case 5: _t->lastuserChanged((*reinterpret_cast< QString(*)>(_a[1]))); break;
        case 6: _t->localdatetimeChanged((*reinterpret_cast< QString(*)>(_a[1]))); break;
        default: ;
        }
    } else if (_c == QMetaObject::IndexOfMethod) {
        int *result = reinterpret_cast<int *>(_a[0]);
        void **func = reinterpret_cast<void **>(_a[1]);
        {
            typedef void (APPConfig::*_t)(int );
            if (*reinterpret_cast<_t *>(func) == static_cast<_t>(&APPConfig::screenWidthChanged)) {
                *result = 0;
            }
        }
        {
            typedef void (APPConfig::*_t)(int );
            if (*reinterpret_cast<_t *>(func) == static_cast<_t>(&APPConfig::screenHeightChanged)) {
                *result = 1;
            }
        }
        {
            typedef void (APPConfig::*_t)(QString );
            if (*reinterpret_cast<_t *>(func) == static_cast<_t>(&APPConfig::currentusernameChanged)) {
                *result = 2;
            }
        }
        {
            typedef void (APPConfig::*_t)(QString );
            if (*reinterpret_cast<_t *>(func) == static_cast<_t>(&APPConfig::currentuserpasswordChanged)) {
                *result = 3;
            }
        }
        {
            typedef void (APPConfig::*_t)(QString );
            if (*reinterpret_cast<_t *>(func) == static_cast<_t>(&APPConfig::currentusertypeChanged)) {
                *result = 4;
            }
        }
        {
            typedef void (APPConfig::*_t)(QString );
            if (*reinterpret_cast<_t *>(func) == static_cast<_t>(&APPConfig::lastuserChanged)) {
                *result = 5;
            }
        }
        {
            typedef void (APPConfig::*_t)(QString );
            if (*reinterpret_cast<_t *>(func) == static_cast<_t>(&APPConfig::localdatetimeChanged)) {
                *result = 6;
            }
        }
    }
#ifndef QT_NO_PROPERTIES
    else if (_c == QMetaObject::ReadProperty) {
        APPConfig *_t = static_cast<APPConfig *>(_o);
        Q_UNUSED(_t)
        void *_v = _a[0];
        switch (_id) {
        case 0: *reinterpret_cast< int*>(_v) = _t->screenWidth(); break;
        case 1: *reinterpret_cast< int*>(_v) = _t->screenHeight(); break;
        case 2: *reinterpret_cast< QString*>(_v) = _t->currentusername(); break;
        case 3: *reinterpret_cast< QString*>(_v) = _t->currentuserpassword(); break;
        case 4: *reinterpret_cast< QString*>(_v) = _t->currentusertype(); break;
        case 5: *reinterpret_cast< QString*>(_v) = _t->lastuser(); break;
        default: break;
        }
    } else if (_c == QMetaObject::WriteProperty) {
        APPConfig *_t = static_cast<APPConfig *>(_o);
        Q_UNUSED(_t)
        void *_v = _a[0];
        switch (_id) {
        case 0: _t->setScreenWidth(*reinterpret_cast< int*>(_v)); break;
        case 1: _t->setScreenHeight(*reinterpret_cast< int*>(_v)); break;
        case 2: _t->setcurrentusername(*reinterpret_cast< QString*>(_v)); break;
        case 3: _t->setcurrentuserpassword(*reinterpret_cast< QString*>(_v)); break;
        case 4: _t->setcurrentusertype(*reinterpret_cast< QString*>(_v)); break;
        case 5: _t->setlastuser(*reinterpret_cast< QString*>(_v)); break;
        default: break;
        }
    } else if (_c == QMetaObject::ResetProperty) {
    }
#endif // QT_NO_PROPERTIES
}

const QMetaObject APPConfig::staticMetaObject = {
    { &QObject::staticMetaObject, qt_meta_stringdata_APPConfig.data,
      qt_meta_data_APPConfig,  qt_static_metacall, Q_NULLPTR, Q_NULLPTR}
};


const QMetaObject *APPConfig::metaObject() const
{
    return QObject::d_ptr->metaObject ? QObject::d_ptr->dynamicMetaObject() : &staticMetaObject;
}

void *APPConfig::qt_metacast(const char *_clname)
{
    if (!_clname) return Q_NULLPTR;
    if (!strcmp(_clname, qt_meta_stringdata_APPConfig.stringdata0))
        return static_cast<void*>(const_cast< APPConfig*>(this));
    return QObject::qt_metacast(_clname);
}

int APPConfig::qt_metacall(QMetaObject::Call _c, int _id, void **_a)
{
    _id = QObject::qt_metacall(_c, _id, _a);
    if (_id < 0)
        return _id;
    if (_c == QMetaObject::InvokeMetaMethod) {
        if (_id < 7)
            qt_static_metacall(this, _c, _id, _a);
        _id -= 7;
    } else if (_c == QMetaObject::RegisterMethodArgumentMetaType) {
        if (_id < 7)
            *reinterpret_cast<int*>(_a[0]) = -1;
        _id -= 7;
    }
#ifndef QT_NO_PROPERTIES
   else if (_c == QMetaObject::ReadProperty || _c == QMetaObject::WriteProperty
            || _c == QMetaObject::ResetProperty || _c == QMetaObject::RegisterPropertyMetaType) {
        qt_static_metacall(this, _c, _id, _a);
        _id -= 6;
    } else if (_c == QMetaObject::QueryPropertyDesignable) {
        _id -= 6;
    } else if (_c == QMetaObject::QueryPropertyScriptable) {
        _id -= 6;
    } else if (_c == QMetaObject::QueryPropertyStored) {
        _id -= 6;
    } else if (_c == QMetaObject::QueryPropertyEditable) {
        _id -= 6;
    } else if (_c == QMetaObject::QueryPropertyUser) {
        _id -= 6;
    }
#endif // QT_NO_PROPERTIES
    return _id;
}

// SIGNAL 0
void APPConfig::screenWidthChanged(int _t1)
{
    void *_a[] = { Q_NULLPTR, const_cast<void*>(reinterpret_cast<const void*>(&_t1)) };
    QMetaObject::activate(this, &staticMetaObject, 0, _a);
}

// SIGNAL 1
void APPConfig::screenHeightChanged(int _t1)
{
    void *_a[] = { Q_NULLPTR, const_cast<void*>(reinterpret_cast<const void*>(&_t1)) };
    QMetaObject::activate(this, &staticMetaObject, 1, _a);
}

// SIGNAL 2
void APPConfig::currentusernameChanged(QString _t1)
{
    void *_a[] = { Q_NULLPTR, const_cast<void*>(reinterpret_cast<const void*>(&_t1)) };
    QMetaObject::activate(this, &staticMetaObject, 2, _a);
}

// SIGNAL 3
void APPConfig::currentuserpasswordChanged(QString _t1)
{
    void *_a[] = { Q_NULLPTR, const_cast<void*>(reinterpret_cast<const void*>(&_t1)) };
    QMetaObject::activate(this, &staticMetaObject, 3, _a);
}

// SIGNAL 4
void APPConfig::currentusertypeChanged(QString _t1)
{
    void *_a[] = { Q_NULLPTR, const_cast<void*>(reinterpret_cast<const void*>(&_t1)) };
    QMetaObject::activate(this, &staticMetaObject, 4, _a);
}

// SIGNAL 5
void APPConfig::lastuserChanged(QString _t1)
{
    void *_a[] = { Q_NULLPTR, const_cast<void*>(reinterpret_cast<const void*>(&_t1)) };
    QMetaObject::activate(this, &staticMetaObject, 5, _a);
}

// SIGNAL 6
void APPConfig::localdatetimeChanged(QString _t1)
{
    void *_a[] = { Q_NULLPTR, const_cast<void*>(reinterpret_cast<const void*>(&_t1)) };
    QMetaObject::activate(this, &staticMetaObject, 6, _a);
}
QT_END_MOC_NAMESPACE
