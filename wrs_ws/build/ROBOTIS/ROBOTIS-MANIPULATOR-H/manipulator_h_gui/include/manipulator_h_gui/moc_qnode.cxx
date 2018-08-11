/****************************************************************************
** Meta object code from reading C++ file 'qnode.hpp'
**
** Created by: The Qt Meta Object Compiler version 63 (Qt 4.8.7)
**
** WARNING! All changes made in this file will be lost!
*****************************************************************************/

#include "../../../../../../src/ROBOTIS/ROBOTIS-MANIPULATOR-H/manipulator_h_gui/include/manipulator_h_gui/qnode.hpp"
#if !defined(Q_MOC_OUTPUT_REVISION)
#error "The header file 'qnode.hpp' doesn't include <QObject>."
#elif Q_MOC_OUTPUT_REVISION != 63
#error "This file was generated using the moc from 4.8.7. It"
#error "cannot be used with the include files from this version of Qt."
#error "(The moc has changed too much.)"
#endif

QT_BEGIN_MOC_NAMESPACE
static const uint qt_meta_data_manipulator_h_gui__QNode[] = {

 // content:
       6,       // revision
       0,       // classname
       0,    0, // classinfo
       6,   14, // methods
       0,    0, // properties
       0,    0, // enums/sets
       0,    0, // constructors
       0,       // flags
       4,       // signalCount

 // signals: signature, parameters, type, tag, flags
      26,   25,   25,   25, 0x05,
      43,   25,   25,   25, 0x05,
      57,   25,   25,   25, 0x05,
     123,   25,   25,   25, 0x05,

 // slots: signature, parameters, type, tag, flags
     210,  199,   25,   25, 0x0a,
     260,  249,   25,   25, 0x0a,

       0        // eod
};

static const char qt_meta_stringdata_manipulator_h_gui__QNode[] = {
    "manipulator_h_gui::QNode\0\0loggingUpdated()\0"
    "rosShutdown()\0"
    "updateCurrentJointPose(manipulator_h_base_module_msgs::JointPose)\0"
    "updateCurrentKinematicsPose(manipulator_h_base_module_msgs::Kinematics"
    "Pose)\0"
    "joint_name\0getJointPose(std::vector<std::string>)\0"
    "group_name\0getKinematicsPose(std::string)\0"
};

void manipulator_h_gui::QNode::qt_static_metacall(QObject *_o, QMetaObject::Call _c, int _id, void **_a)
{
    if (_c == QMetaObject::InvokeMetaMethod) {
        Q_ASSERT(staticMetaObject.cast(_o));
        QNode *_t = static_cast<QNode *>(_o);
        switch (_id) {
        case 0: _t->loggingUpdated(); break;
        case 1: _t->rosShutdown(); break;
        case 2: _t->updateCurrentJointPose((*reinterpret_cast< manipulator_h_base_module_msgs::JointPose(*)>(_a[1]))); break;
        case 3: _t->updateCurrentKinematicsPose((*reinterpret_cast< manipulator_h_base_module_msgs::KinematicsPose(*)>(_a[1]))); break;
        case 4: _t->getJointPose((*reinterpret_cast< std::vector<std::string>(*)>(_a[1]))); break;
        case 5: _t->getKinematicsPose((*reinterpret_cast< std::string(*)>(_a[1]))); break;
        default: ;
        }
    }
}

const QMetaObjectExtraData manipulator_h_gui::QNode::staticMetaObjectExtraData = {
    0,  qt_static_metacall 
};

const QMetaObject manipulator_h_gui::QNode::staticMetaObject = {
    { &QThread::staticMetaObject, qt_meta_stringdata_manipulator_h_gui__QNode,
      qt_meta_data_manipulator_h_gui__QNode, &staticMetaObjectExtraData }
};

#ifdef Q_NO_DATA_RELOCATION
const QMetaObject &manipulator_h_gui::QNode::getStaticMetaObject() { return staticMetaObject; }
#endif //Q_NO_DATA_RELOCATION

const QMetaObject *manipulator_h_gui::QNode::metaObject() const
{
    return QObject::d_ptr->metaObject ? QObject::d_ptr->metaObject : &staticMetaObject;
}

void *manipulator_h_gui::QNode::qt_metacast(const char *_clname)
{
    if (!_clname) return 0;
    if (!strcmp(_clname, qt_meta_stringdata_manipulator_h_gui__QNode))
        return static_cast<void*>(const_cast< QNode*>(this));
    return QThread::qt_metacast(_clname);
}

int manipulator_h_gui::QNode::qt_metacall(QMetaObject::Call _c, int _id, void **_a)
{
    _id = QThread::qt_metacall(_c, _id, _a);
    if (_id < 0)
        return _id;
    if (_c == QMetaObject::InvokeMetaMethod) {
        if (_id < 6)
            qt_static_metacall(this, _c, _id, _a);
        _id -= 6;
    }
    return _id;
}

// SIGNAL 0
void manipulator_h_gui::QNode::loggingUpdated()
{
    QMetaObject::activate(this, &staticMetaObject, 0, 0);
}

// SIGNAL 1
void manipulator_h_gui::QNode::rosShutdown()
{
    QMetaObject::activate(this, &staticMetaObject, 1, 0);
}

// SIGNAL 2
void manipulator_h_gui::QNode::updateCurrentJointPose(manipulator_h_base_module_msgs::JointPose _t1)
{
    void *_a[] = { 0, const_cast<void*>(reinterpret_cast<const void*>(&_t1)) };
    QMetaObject::activate(this, &staticMetaObject, 2, _a);
}

// SIGNAL 3
void manipulator_h_gui::QNode::updateCurrentKinematicsPose(manipulator_h_base_module_msgs::KinematicsPose _t1)
{
    void *_a[] = { 0, const_cast<void*>(reinterpret_cast<const void*>(&_t1)) };
    QMetaObject::activate(this, &staticMetaObject, 3, _a);
}
QT_END_MOC_NAMESPACE
