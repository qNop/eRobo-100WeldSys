/****************************************************************************
** Meta object code from reading C++ file 'ERModbus.h'
**
** Created by: The Qt Meta Object Compiler version 67 (Qt 5.5.0)
**
** WARNING! All changes made in this file will be lost!
*****************************************************************************/

#include "../WeldAPI/ERModbus.h"
#include <QtCore/qbytearray.h>
#include <QtCore/qmetatype.h>
#if !defined(Q_MOC_OUTPUT_REVISION)
#error "The header file 'ERModbus.h' doesn't include <QObject>."
#elif Q_MOC_OUTPUT_REVISION != 67
#error "This file was generated using the moc from 5.5.0. It"
#error "cannot be used with the include files from this version of Qt."
#error "(The moc has changed too much.)"
#endif

QT_BEGIN_MOC_NAMESPACE
struct qt_meta_stringdata_ERModbus_t {
    QByteArrayData data[8];
    char stringdata0[83];
};
#define QT_MOC_LITERAL(idx, ofs, len) \
    Q_STATIC_BYTE_ARRAY_DATA_HEADER_INITIALIZER_WITH_OFFSET(len, \
    qptrdiff(offsetof(qt_meta_stringdata_ERModbus_t, stringdata0) + ofs \
        - idx * sizeof(QByteArrayData)) \
    )
static const qt_meta_stringdata_ERModbus_t qt_meta_stringdata_ERModbus = {
    {
QT_MOC_LITERAL(0, 0, 8), // "ERModbus"
QT_MOC_LITERAL(1, 9, 20), // "modbus_statuschanged"
QT_MOC_LITERAL(2, 30, 0), // ""
QT_MOC_LITERAL(3, 31, 6), // "status"
QT_MOC_LITERAL(4, 38, 13), // "modbus_status"
QT_MOC_LITERAL(5, 52, 10), // "modbusdata"
QT_MOC_LITERAL(6, 63, 9), // "modbusreg"
QT_MOC_LITERAL(7, 73, 9) // "modbusnum"

    },
    "ERModbus\0modbus_statuschanged\0\0status\0"
    "modbus_status\0modbusdata\0modbusreg\0"
    "modbusnum"
};
#undef QT_MOC_LITERAL

static const uint qt_meta_data_ERModbus[] = {

 // content:
       7,       // revision
       0,       // classname
       0,    0, // classinfo
       1,   14, // methods
       4,   22, // properties
       0,    0, // enums/sets
       0,    0, // constructors
       0,       // flags
       1,       // signalCount

 // signals: name, argc, parameters, tag, flags
       1,    1,   19,    2, 0x06 /* Public */,

 // signals: parameters
    QMetaType::Void, QMetaType::QString,    3,

 // properties: name, type, flags
       4, QMetaType::QString, 0x00495003,
       5, QMetaType::Int, 0x00095003,
       6, QMetaType::Int, 0x00095003,
       7, QMetaType::Int, 0x00095003,

 // properties: notify_signal_id
       0,
       0,
       0,
       0,

       0        // eod
};

void ERModbus::qt_static_metacall(QObject *_o, QMetaObject::Call _c, int _id, void **_a)
{
    if (_c == QMetaObject::InvokeMetaMethod) {
        ERModbus *_t = static_cast<ERModbus *>(_o);
        Q_UNUSED(_t)
        switch (_id) {
        case 0: _t->modbus_statuschanged((*reinterpret_cast< QString(*)>(_a[1]))); break;
        default: ;
        }
    } else if (_c == QMetaObject::IndexOfMethod) {
        int *result = reinterpret_cast<int *>(_a[0]);
        void **func = reinterpret_cast<void **>(_a[1]);
        {
            typedef void (ERModbus::*_t)(QString );
            if (*reinterpret_cast<_t *>(func) == static_cast<_t>(&ERModbus::modbus_statuschanged)) {
                *result = 0;
            }
        }
    }
#ifndef QT_NO_PROPERTIES
    else if (_c == QMetaObject::ReadProperty) {
        ERModbus *_t = static_cast<ERModbus *>(_o);
        Q_UNUSED(_t)
        void *_v = _a[0];
        switch (_id) {
        case 0: *reinterpret_cast< QString*>(_v) = _t->getmodus_status(); break;
        case 1: *reinterpret_cast< int*>(_v) = _t->getmodbusdata(); break;
        case 2: *reinterpret_cast< int*>(_v) = _t->getmodbusreg(); break;
        case 3: *reinterpret_cast< int*>(_v) = _t->getmodbusnum(); break;
        default: break;
        }
    } else if (_c == QMetaObject::WriteProperty) {
        ERModbus *_t = static_cast<ERModbus *>(_o);
        Q_UNUSED(_t)
        void *_v = _a[0];
        switch (_id) {
        case 0: _t->setmodbus_status(*reinterpret_cast< QString*>(_v)); break;
        case 1: _t->setmodbusdata(*reinterpret_cast< int*>(_v)); break;
        case 2: _t->setmodbusreg(*reinterpret_cast< int*>(_v)); break;
        case 3: _t->setmodbusnum(*reinterpret_cast< int*>(_v)); break;
        default: break;
        }
    } else if (_c == QMetaObject::ResetProperty) {
    }
#endif // QT_NO_PROPERTIES
}

const QMetaObject ERModbus::staticMetaObject = {
    { &QObject::staticMetaObject, qt_meta_stringdata_ERModbus.data,
      qt_meta_data_ERModbus,  qt_static_metacall, Q_NULLPTR, Q_NULLPTR}
};


const QMetaObject *ERModbus::metaObject() const
{
    return QObject::d_ptr->metaObject ? QObject::d_ptr->dynamicMetaObject() : &staticMetaObject;
}

void *ERModbus::qt_metacast(const char *_clname)
{
    if (!_clname) return Q_NULLPTR;
    if (!strcmp(_clname, qt_meta_stringdata_ERModbus.stringdata0))
        return static_cast<void*>(const_cast< ERModbus*>(this));
    return QObject::qt_metacast(_clname);
}

int ERModbus::qt_metacall(QMetaObject::Call _c, int _id, void **_a)
{
    _id = QObject::qt_metacall(_c, _id, _a);
    if (_id < 0)
        return _id;
    if (_c == QMetaObject::InvokeMetaMethod) {
        if (_id < 1)
            qt_static_metacall(this, _c, _id, _a);
        _id -= 1;
    } else if (_c == QMetaObject::RegisterMethodArgumentMetaType) {
        if (_id < 1)
            *reinterpret_cast<int*>(_a[0]) = -1;
        _id -= 1;
    }
#ifndef QT_NO_PROPERTIES
   else if (_c == QMetaObject::ReadProperty || _c == QMetaObject::WriteProperty
            || _c == QMetaObject::ResetProperty || _c == QMetaObject::RegisterPropertyMetaType) {
        qt_static_metacall(this, _c, _id, _a);
        _id -= 4;
    } else if (_c == QMetaObject::QueryPropertyDesignable) {
        _id -= 4;
    } else if (_c == QMetaObject::QueryPropertyScriptable) {
        _id -= 4;
    } else if (_c == QMetaObject::QueryPropertyStored) {
        _id -= 4;
    } else if (_c == QMetaObject::QueryPropertyEditable) {
        _id -= 4;
    } else if (_c == QMetaObject::QueryPropertyUser) {
        _id -= 4;
    }
#endif // QT_NO_PROPERTIES
    return _id;
}

// SIGNAL 0
void ERModbus::modbus_statuschanged(QString _t1)
{
    void *_a[] = { Q_NULLPTR, const_cast<void*>(reinterpret_cast<const void*>(&_t1)) };
    QMetaObject::activate(this, &staticMetaObject, 0, _a);
}
QT_END_MOC_NAMESPACE
