/****************************************************************************
** Meta object code from reading C++ file 'main_window.hpp'
**
** Created by: The Qt Meta Object Compiler version 63 (Qt 4.8.7)
**
** WARNING! All changes made in this file will be lost!
*****************************************************************************/

#include "../../../../../../src/ROBOTIS/ROBOTIS-MANIPULATOR-H/manipulator_h_gui/include/manipulator_h_gui/main_window.hpp"
#if !defined(Q_MOC_OUTPUT_REVISION)
#error "The header file 'main_window.hpp' doesn't include <QObject>."
#elif Q_MOC_OUTPUT_REVISION != 63
#error "This file was generated using the moc from 4.8.7. It"
#error "cannot be used with the include files from this version of Qt."
#error "(The moc has changed too much.)"
#endif

QT_BEGIN_MOC_NAMESPACE
static const uint qt_meta_data_manipulator_h_gui__MainWindow[] = {

 // content:
       6,       // revision
       0,       // classname
       0,    0, // classinfo
      11,   14, // methods
       0,    0, // properties
       0,    0, // enums/sets
       0,    0, // constructors
       0,       // flags
       0,       // signalCount

 // slots: signature, parameters, type, tag, flags
      31,   30,   30,   30, 0x0a,
      64,   58,   30,   30, 0x0a,
      99,   58,   30,   30, 0x0a,
     133,   58,   30,   30, 0x0a,
     166,   58,   30,   30, 0x0a,
     198,   58,   30,   30, 0x0a,
     230,   58,   30,   30, 0x0a,
     263,   58,   30,   30, 0x0a,
     296,   30,   30,   30, 0x0a,
     320,  316,   30,   30, 0x0a,
     390,  316,   30,   30, 0x0a,

       0        // eod
};

static const char qt_meta_stringdata_manipulator_h_gui__MainWindow[] = {
    "manipulator_h_gui::MainWindow\0\0"
    "on_actionAbout_triggered()\0check\0"
    "on_curr_joint_button_clicked(bool)\0"
    "on_des_joint_button_clicked(bool)\0"
    "on_curr_pos_button_clicked(bool)\0"
    "on_des_pos_button_clicked(bool)\0"
    "on_des_p2p_button_clicked(bool)\0"
    "on_ini_pose_button_clicked(bool)\0"
    "on_set_mode_button_clicked(bool)\0"
    "updateLoggingView()\0msg\0"
    "updateCurrJointPoseSpinbox(manipulator_h_base_module_msgs::JointPose)\0"
    "updateCurrKinematicsPoseSpinbox(manipulator_h_base_module_msgs::Kinema"
    "ticsPose)\0"
};

void manipulator_h_gui::MainWindow::qt_static_metacall(QObject *_o, QMetaObject::Call _c, int _id, void **_a)
{
    if (_c == QMetaObject::InvokeMetaMethod) {
        Q_ASSERT(staticMetaObject.cast(_o));
        MainWindow *_t = static_cast<MainWindow *>(_o);
        switch (_id) {
        case 0: _t->on_actionAbout_triggered(); break;
        case 1: _t->on_curr_joint_button_clicked((*reinterpret_cast< bool(*)>(_a[1]))); break;
        case 2: _t->on_des_joint_button_clicked((*reinterpret_cast< bool(*)>(_a[1]))); break;
        case 3: _t->on_curr_pos_button_clicked((*reinterpret_cast< bool(*)>(_a[1]))); break;
        case 4: _t->on_des_pos_button_clicked((*reinterpret_cast< bool(*)>(_a[1]))); break;
        case 5: _t->on_des_p2p_button_clicked((*reinterpret_cast< bool(*)>(_a[1]))); break;
        case 6: _t->on_ini_pose_button_clicked((*reinterpret_cast< bool(*)>(_a[1]))); break;
        case 7: _t->on_set_mode_button_clicked((*reinterpret_cast< bool(*)>(_a[1]))); break;
        case 8: _t->updateLoggingView(); break;
        case 9: _t->updateCurrJointPoseSpinbox((*reinterpret_cast< manipulator_h_base_module_msgs::JointPose(*)>(_a[1]))); break;
        case 10: _t->updateCurrKinematicsPoseSpinbox((*reinterpret_cast< manipulator_h_base_module_msgs::KinematicsPose(*)>(_a[1]))); break;
        default: ;
        }
    }
}

const QMetaObjectExtraData manipulator_h_gui::MainWindow::staticMetaObjectExtraData = {
    0,  qt_static_metacall 
};

const QMetaObject manipulator_h_gui::MainWindow::staticMetaObject = {
    { &QMainWindow::staticMetaObject, qt_meta_stringdata_manipulator_h_gui__MainWindow,
      qt_meta_data_manipulator_h_gui__MainWindow, &staticMetaObjectExtraData }
};

#ifdef Q_NO_DATA_RELOCATION
const QMetaObject &manipulator_h_gui::MainWindow::getStaticMetaObject() { return staticMetaObject; }
#endif //Q_NO_DATA_RELOCATION

const QMetaObject *manipulator_h_gui::MainWindow::metaObject() const
{
    return QObject::d_ptr->metaObject ? QObject::d_ptr->metaObject : &staticMetaObject;
}

void *manipulator_h_gui::MainWindow::qt_metacast(const char *_clname)
{
    if (!_clname) return 0;
    if (!strcmp(_clname, qt_meta_stringdata_manipulator_h_gui__MainWindow))
        return static_cast<void*>(const_cast< MainWindow*>(this));
    return QMainWindow::qt_metacast(_clname);
}

int manipulator_h_gui::MainWindow::qt_metacall(QMetaObject::Call _c, int _id, void **_a)
{
    _id = QMainWindow::qt_metacall(_c, _id, _a);
    if (_id < 0)
        return _id;
    if (_c == QMetaObject::InvokeMetaMethod) {
        if (_id < 11)
            qt_static_metacall(this, _c, _id, _a);
        _id -= 11;
    }
    return _id;
}
QT_END_MOC_NAMESPACE
