/********************************************************************************
** Form generated from reading UI file 'main_window.ui'
**
** Created by: Qt User Interface Compiler version 4.8.7
**
** WARNING! All changes made in this file will be lost when recompiling UI file!
********************************************************************************/

#ifndef UI_MAIN_WINDOW_H
#define UI_MAIN_WINDOW_H

#include <QtCore/QLocale>
#include <QtCore/QVariant>
#include <QtGui/QAction>
#include <QtGui/QApplication>
#include <QtGui/QButtonGroup>
#include <QtGui/QDockWidget>
#include <QtGui/QDoubleSpinBox>
#include <QtGui/QFrame>
#include <QtGui/QGridLayout>
#include <QtGui/QGroupBox>
#include <QtGui/QHBoxLayout>
#include <QtGui/QHeaderView>
#include <QtGui/QLabel>
#include <QtGui/QListView>
#include <QtGui/QMainWindow>
#include <QtGui/QMenu>
#include <QtGui/QMenuBar>
#include <QtGui/QPushButton>
#include <QtGui/QStatusBar>
#include <QtGui/QTabWidget>
#include <QtGui/QVBoxLayout>
#include <QtGui/QWidget>

QT_BEGIN_NAMESPACE

class Ui_MainWindowDesign
{
public:
    QAction *action_Quit;
    QAction *action_Preferences;
    QAction *actionAbout;
    QAction *actionAbout_Qt;
    QWidget *centralwidget;
    QHBoxLayout *hboxLayout;
    QTabWidget *tab_manager;
    QWidget *tab_status;
    QVBoxLayout *verticalLayout_2;
    QGroupBox *groupBox_12;
    QGridLayout *gridLayout_3;
    QListView *view_logging;
    QMenuBar *menubar;
    QMenu *menu_File;
    QStatusBar *statusbar;
    QDockWidget *dock_status;
    QWidget *dockWidgetContents_2;
    QGridLayout *gridLayout_2;
    QFrame *frame;
    QGridLayout *gridLayout;
    QGroupBox *task_space;
    QVBoxLayout *verticalLayout;
    QPushButton *curr_pos_button;
    QLabel *pos_x;
    QDoubleSpinBox *pos_x_spinbox;
    QLabel *pos_y;
    QDoubleSpinBox *pos_y_spinbox;
    QLabel *pos_z;
    QDoubleSpinBox *pos_z_spinbox;
    QLabel *ori_roll;
    QDoubleSpinBox *ori_roll_spinbox;
    QLabel *ori_pitch;
    QDoubleSpinBox *ori_pitch_spinbox;
    QLabel *ori_yaw;
    QDoubleSpinBox *ori_yaw_spinbox;
    QLabel *ori_phi;
    QDoubleSpinBox *ori_phi_spinbox;
    QPushButton *des_pos_button;
    QPushButton *des_p2p_button;
    QGroupBox *joint_space;
    QVBoxLayout *verticalLayout_5;
    QPushButton *curr_joint_button;
    QLabel *slide;
    QDoubleSpinBox *slide_spinbox;
    QLabel *joint1;
    QDoubleSpinBox *joint1_spinbox;
    QLabel *joint2;
    QDoubleSpinBox *joint2_spinbox;
    QLabel *joint3;
    QDoubleSpinBox *joint3_spinbox;
    QLabel *joint4;
    QDoubleSpinBox *joint4_spinbox;
    QLabel *joint5;
    QDoubleSpinBox *joint5_spinbox;
    QLabel *joint6;
    QDoubleSpinBox *joint6_spinbox;
    QLabel *joint7;
    QDoubleSpinBox *joint7_spinbox;
    QPushButton *des_joint_button;
    QFrame *frame_2;
    QHBoxLayout *horizontalLayout;
    QPushButton *set_mode_button;
    QPushButton *ini_pose_button;
    QPushButton *des_initial_button;
    QPushButton *quit_button;

    void setupUi(QMainWindow *MainWindowDesign)
    {
        if (MainWindowDesign->objectName().isEmpty())
            MainWindowDesign->setObjectName(QString::fromUtf8("MainWindowDesign"));
        MainWindowDesign->resize(1047, 612);
        QIcon icon;
        icon.addFile(QString::fromUtf8(":/images/icon.png"), QSize(), QIcon::Normal, QIcon::Off);
        MainWindowDesign->setWindowIcon(icon);
        MainWindowDesign->setLocale(QLocale(QLocale::English, QLocale::Australia));
        action_Quit = new QAction(MainWindowDesign);
        action_Quit->setObjectName(QString::fromUtf8("action_Quit"));
        action_Quit->setShortcutContext(Qt::ApplicationShortcut);
        action_Preferences = new QAction(MainWindowDesign);
        action_Preferences->setObjectName(QString::fromUtf8("action_Preferences"));
        actionAbout = new QAction(MainWindowDesign);
        actionAbout->setObjectName(QString::fromUtf8("actionAbout"));
        actionAbout_Qt = new QAction(MainWindowDesign);
        actionAbout_Qt->setObjectName(QString::fromUtf8("actionAbout_Qt"));
        centralwidget = new QWidget(MainWindowDesign);
        centralwidget->setObjectName(QString::fromUtf8("centralwidget"));
        hboxLayout = new QHBoxLayout(centralwidget);
        hboxLayout->setObjectName(QString::fromUtf8("hboxLayout"));
        tab_manager = new QTabWidget(centralwidget);
        tab_manager->setObjectName(QString::fromUtf8("tab_manager"));
        tab_manager->setMinimumSize(QSize(100, 0));
        tab_manager->setLocale(QLocale(QLocale::English, QLocale::Australia));
        tab_status = new QWidget();
        tab_status->setObjectName(QString::fromUtf8("tab_status"));
        verticalLayout_2 = new QVBoxLayout(tab_status);
        verticalLayout_2->setObjectName(QString::fromUtf8("verticalLayout_2"));
        groupBox_12 = new QGroupBox(tab_status);
        groupBox_12->setObjectName(QString::fromUtf8("groupBox_12"));
        QSizePolicy sizePolicy(QSizePolicy::MinimumExpanding, QSizePolicy::Preferred);
        sizePolicy.setHorizontalStretch(0);
        sizePolicy.setVerticalStretch(0);
        sizePolicy.setHeightForWidth(groupBox_12->sizePolicy().hasHeightForWidth());
        groupBox_12->setSizePolicy(sizePolicy);
        gridLayout_3 = new QGridLayout(groupBox_12);
        gridLayout_3->setObjectName(QString::fromUtf8("gridLayout_3"));
        view_logging = new QListView(groupBox_12);
        view_logging->setObjectName(QString::fromUtf8("view_logging"));

        gridLayout_3->addWidget(view_logging, 0, 0, 1, 1);


        verticalLayout_2->addWidget(groupBox_12);

        tab_manager->addTab(tab_status, QString());

        hboxLayout->addWidget(tab_manager);

        MainWindowDesign->setCentralWidget(centralwidget);
        menubar = new QMenuBar(MainWindowDesign);
        menubar->setObjectName(QString::fromUtf8("menubar"));
        menubar->setGeometry(QRect(0, 0, 1047, 19));
        menu_File = new QMenu(menubar);
        menu_File->setObjectName(QString::fromUtf8("menu_File"));
        MainWindowDesign->setMenuBar(menubar);
        statusbar = new QStatusBar(MainWindowDesign);
        statusbar->setObjectName(QString::fromUtf8("statusbar"));
        MainWindowDesign->setStatusBar(statusbar);
        dock_status = new QDockWidget(MainWindowDesign);
        dock_status->setObjectName(QString::fromUtf8("dock_status"));
        QSizePolicy sizePolicy1(QSizePolicy::Minimum, QSizePolicy::Minimum);
        sizePolicy1.setHorizontalStretch(0);
        sizePolicy1.setVerticalStretch(0);
        sizePolicy1.setHeightForWidth(dock_status->sizePolicy().hasHeightForWidth());
        dock_status->setSizePolicy(sizePolicy1);
        dock_status->setMinimumSize(QSize(500, 560));
        dock_status->setMaximumSize(QSize(524287, 10000));
        dock_status->setAllowedAreas(Qt::RightDockWidgetArea);
        dockWidgetContents_2 = new QWidget();
        dockWidgetContents_2->setObjectName(QString::fromUtf8("dockWidgetContents_2"));
        gridLayout_2 = new QGridLayout(dockWidgetContents_2);
        gridLayout_2->setObjectName(QString::fromUtf8("gridLayout_2"));
        frame = new QFrame(dockWidgetContents_2);
        frame->setObjectName(QString::fromUtf8("frame"));
        QSizePolicy sizePolicy2(QSizePolicy::Preferred, QSizePolicy::Preferred);
        sizePolicy2.setHorizontalStretch(0);
        sizePolicy2.setVerticalStretch(0);
        sizePolicy2.setHeightForWidth(frame->sizePolicy().hasHeightForWidth());
        frame->setSizePolicy(sizePolicy2);
        frame->setMaximumSize(QSize(16777215, 600));
        frame->setFrameShape(QFrame::StyledPanel);
        frame->setFrameShadow(QFrame::Raised);
        gridLayout = new QGridLayout(frame);
        gridLayout->setObjectName(QString::fromUtf8("gridLayout"));
        task_space = new QGroupBox(frame);
        task_space->setObjectName(QString::fromUtf8("task_space"));
        verticalLayout = new QVBoxLayout(task_space);
        verticalLayout->setObjectName(QString::fromUtf8("verticalLayout"));
        curr_pos_button = new QPushButton(task_space);
        curr_pos_button->setObjectName(QString::fromUtf8("curr_pos_button"));

        verticalLayout->addWidget(curr_pos_button);

        pos_x = new QLabel(task_space);
        pos_x->setObjectName(QString::fromUtf8("pos_x"));

        verticalLayout->addWidget(pos_x);

        pos_x_spinbox = new QDoubleSpinBox(task_space);
        pos_x_spinbox->setObjectName(QString::fromUtf8("pos_x_spinbox"));
        pos_x_spinbox->setDecimals(3);
        pos_x_spinbox->setMinimum(-10);
        pos_x_spinbox->setMaximum(10);
        pos_x_spinbox->setSingleStep(0.01);

        verticalLayout->addWidget(pos_x_spinbox);

        pos_y = new QLabel(task_space);
        pos_y->setObjectName(QString::fromUtf8("pos_y"));

        verticalLayout->addWidget(pos_y);

        pos_y_spinbox = new QDoubleSpinBox(task_space);
        pos_y_spinbox->setObjectName(QString::fromUtf8("pos_y_spinbox"));
        pos_y_spinbox->setDecimals(3);
        pos_y_spinbox->setMinimum(-10);
        pos_y_spinbox->setMaximum(10);
        pos_y_spinbox->setSingleStep(0.01);

        verticalLayout->addWidget(pos_y_spinbox);

        pos_z = new QLabel(task_space);
        pos_z->setObjectName(QString::fromUtf8("pos_z"));

        verticalLayout->addWidget(pos_z);

        pos_z_spinbox = new QDoubleSpinBox(task_space);
        pos_z_spinbox->setObjectName(QString::fromUtf8("pos_z_spinbox"));
        pos_z_spinbox->setDecimals(3);
        pos_z_spinbox->setMinimum(-10);
        pos_z_spinbox->setMaximum(10);
        pos_z_spinbox->setSingleStep(0.01);

        verticalLayout->addWidget(pos_z_spinbox);

        ori_roll = new QLabel(task_space);
        ori_roll->setObjectName(QString::fromUtf8("ori_roll"));

        verticalLayout->addWidget(ori_roll);

        ori_roll_spinbox = new QDoubleSpinBox(task_space);
        ori_roll_spinbox->setObjectName(QString::fromUtf8("ori_roll_spinbox"));
        ori_roll_spinbox->setDecimals(3);
        ori_roll_spinbox->setMinimum(-360);
        ori_roll_spinbox->setMaximum(360);
        ori_roll_spinbox->setSingleStep(0.5);

        verticalLayout->addWidget(ori_roll_spinbox);

        ori_pitch = new QLabel(task_space);
        ori_pitch->setObjectName(QString::fromUtf8("ori_pitch"));

        verticalLayout->addWidget(ori_pitch);

        ori_pitch_spinbox = new QDoubleSpinBox(task_space);
        ori_pitch_spinbox->setObjectName(QString::fromUtf8("ori_pitch_spinbox"));
        ori_pitch_spinbox->setDecimals(3);
        ori_pitch_spinbox->setMinimum(-360);
        ori_pitch_spinbox->setMaximum(360);
        ori_pitch_spinbox->setSingleStep(0.5);

        verticalLayout->addWidget(ori_pitch_spinbox);

        ori_yaw = new QLabel(task_space);
        ori_yaw->setObjectName(QString::fromUtf8("ori_yaw"));

        verticalLayout->addWidget(ori_yaw);

        ori_yaw_spinbox = new QDoubleSpinBox(task_space);
        ori_yaw_spinbox->setObjectName(QString::fromUtf8("ori_yaw_spinbox"));
        ori_yaw_spinbox->setDecimals(3);
        ori_yaw_spinbox->setMinimum(-360);
        ori_yaw_spinbox->setMaximum(360);
        ori_yaw_spinbox->setSingleStep(0.5);

        verticalLayout->addWidget(ori_yaw_spinbox);

        ori_phi = new QLabel(task_space);
        ori_phi->setObjectName(QString::fromUtf8("ori_phi"));

        verticalLayout->addWidget(ori_phi);

        ori_phi_spinbox = new QDoubleSpinBox(task_space);
        ori_phi_spinbox->setObjectName(QString::fromUtf8("ori_phi_spinbox"));
        ori_phi_spinbox->setDecimals(3);
        ori_phi_spinbox->setMinimum(-180);
        ori_phi_spinbox->setMaximum(180);
        ori_phi_spinbox->setSingleStep(0.5);

        verticalLayout->addWidget(ori_phi_spinbox);

        des_pos_button = new QPushButton(task_space);
        des_pos_button->setObjectName(QString::fromUtf8("des_pos_button"));

        verticalLayout->addWidget(des_pos_button);

        des_p2p_button = new QPushButton(task_space);
        des_p2p_button->setObjectName(QString::fromUtf8("des_p2p_button"));

        verticalLayout->addWidget(des_p2p_button);


        gridLayout->addWidget(task_space, 0, 1, 2, 1);

        joint_space = new QGroupBox(frame);
        joint_space->setObjectName(QString::fromUtf8("joint_space"));
        verticalLayout_5 = new QVBoxLayout(joint_space);
        verticalLayout_5->setObjectName(QString::fromUtf8("verticalLayout_5"));
        curr_joint_button = new QPushButton(joint_space);
        curr_joint_button->setObjectName(QString::fromUtf8("curr_joint_button"));

        verticalLayout_5->addWidget(curr_joint_button);

        slide = new QLabel(joint_space);
        slide->setObjectName(QString::fromUtf8("slide"));

        verticalLayout_5->addWidget(slide);

        slide_spinbox = new QDoubleSpinBox(joint_space);
        slide_spinbox->setObjectName(QString::fromUtf8("slide_spinbox"));
        slide_spinbox->setMinimum(-180);
        slide_spinbox->setMaximum(180);
        slide_spinbox->setSingleStep(0.5);

        verticalLayout_5->addWidget(slide_spinbox);

        joint1 = new QLabel(joint_space);
        joint1->setObjectName(QString::fromUtf8("joint1"));

        verticalLayout_5->addWidget(joint1);

        joint1_spinbox = new QDoubleSpinBox(joint_space);
        joint1_spinbox->setObjectName(QString::fromUtf8("joint1_spinbox"));
        joint1_spinbox->setMinimum(-180);
        joint1_spinbox->setMaximum(180);
        joint1_spinbox->setSingleStep(0.5);

        verticalLayout_5->addWidget(joint1_spinbox);

        joint2 = new QLabel(joint_space);
        joint2->setObjectName(QString::fromUtf8("joint2"));

        verticalLayout_5->addWidget(joint2);

        joint2_spinbox = new QDoubleSpinBox(joint_space);
        joint2_spinbox->setObjectName(QString::fromUtf8("joint2_spinbox"));
        joint2_spinbox->setMinimum(-180);
        joint2_spinbox->setMaximum(180);
        joint2_spinbox->setSingleStep(0.5);

        verticalLayout_5->addWidget(joint2_spinbox);

        joint3 = new QLabel(joint_space);
        joint3->setObjectName(QString::fromUtf8("joint3"));

        verticalLayout_5->addWidget(joint3);

        joint3_spinbox = new QDoubleSpinBox(joint_space);
        joint3_spinbox->setObjectName(QString::fromUtf8("joint3_spinbox"));
        joint3_spinbox->setMinimum(-180);
        joint3_spinbox->setMaximum(180);
        joint3_spinbox->setSingleStep(0.5);

        verticalLayout_5->addWidget(joint3_spinbox);

        joint4 = new QLabel(joint_space);
        joint4->setObjectName(QString::fromUtf8("joint4"));

        verticalLayout_5->addWidget(joint4);

        joint4_spinbox = new QDoubleSpinBox(joint_space);
        joint4_spinbox->setObjectName(QString::fromUtf8("joint4_spinbox"));
        joint4_spinbox->setMinimum(-180);
        joint4_spinbox->setMaximum(180);
        joint4_spinbox->setSingleStep(0.5);

        verticalLayout_5->addWidget(joint4_spinbox);

        joint5 = new QLabel(joint_space);
        joint5->setObjectName(QString::fromUtf8("joint5"));

        verticalLayout_5->addWidget(joint5);

        joint5_spinbox = new QDoubleSpinBox(joint_space);
        joint5_spinbox->setObjectName(QString::fromUtf8("joint5_spinbox"));
        joint5_spinbox->setMinimum(-180);
        joint5_spinbox->setMaximum(180);
        joint5_spinbox->setSingleStep(0.5);

        verticalLayout_5->addWidget(joint5_spinbox);

        joint6 = new QLabel(joint_space);
        joint6->setObjectName(QString::fromUtf8("joint6"));

        verticalLayout_5->addWidget(joint6);

        joint6_spinbox = new QDoubleSpinBox(joint_space);
        joint6_spinbox->setObjectName(QString::fromUtf8("joint6_spinbox"));
        joint6_spinbox->setMinimum(-360);
        joint6_spinbox->setMaximum(360);
        joint6_spinbox->setSingleStep(0.5);

        verticalLayout_5->addWidget(joint6_spinbox);

        joint7 = new QLabel(joint_space);
        joint7->setObjectName(QString::fromUtf8("joint7"));

        verticalLayout_5->addWidget(joint7);

        joint7_spinbox = new QDoubleSpinBox(joint_space);
        joint7_spinbox->setObjectName(QString::fromUtf8("joint7_spinbox"));
        joint7_spinbox->setMinimum(-180);
        joint7_spinbox->setMaximum(180);
        joint7_spinbox->setSingleStep(0.5);

        verticalLayout_5->addWidget(joint7_spinbox);

        des_joint_button = new QPushButton(joint_space);
        des_joint_button->setObjectName(QString::fromUtf8("des_joint_button"));

        verticalLayout_5->addWidget(des_joint_button);


        gridLayout->addWidget(joint_space, 0, 0, 2, 1);


        gridLayout_2->addWidget(frame, 0, 0, 1, 1);

        frame_2 = new QFrame(dockWidgetContents_2);
        frame_2->setObjectName(QString::fromUtf8("frame_2"));
        frame_2->setEnabled(true);
        QSizePolicy sizePolicy3(QSizePolicy::Minimum, QSizePolicy::Fixed);
        sizePolicy3.setHorizontalStretch(50);
        sizePolicy3.setVerticalStretch(50);
        sizePolicy3.setHeightForWidth(frame_2->sizePolicy().hasHeightForWidth());
        frame_2->setSizePolicy(sizePolicy3);
        frame_2->setFrameShape(QFrame::StyledPanel);
        frame_2->setFrameShadow(QFrame::Raised);
        horizontalLayout = new QHBoxLayout(frame_2);
        horizontalLayout->setObjectName(QString::fromUtf8("horizontalLayout"));
        set_mode_button = new QPushButton(frame_2);
        set_mode_button->setObjectName(QString::fromUtf8("set_mode_button"));

        horizontalLayout->addWidget(set_mode_button);

        ini_pose_button = new QPushButton(frame_2);
        ini_pose_button->setObjectName(QString::fromUtf8("ini_pose_button"));

        horizontalLayout->addWidget(ini_pose_button);

        des_initial_button = new QPushButton(frame_2);
        des_initial_button->setObjectName(QString::fromUtf8("des_initial_button"));

        horizontalLayout->addWidget(des_initial_button);

        quit_button = new QPushButton(frame_2);
        quit_button->setObjectName(QString::fromUtf8("quit_button"));

        horizontalLayout->addWidget(quit_button);


        gridLayout_2->addWidget(frame_2, 1, 0, 1, 1);

        dock_status->setWidget(dockWidgetContents_2);
        MainWindowDesign->addDockWidget(static_cast<Qt::DockWidgetArea>(2), dock_status);

        menubar->addAction(menu_File->menuAction());
        menu_File->addAction(action_Preferences);
        menu_File->addSeparator();
        menu_File->addAction(actionAbout);
        menu_File->addAction(actionAbout_Qt);
        menu_File->addSeparator();
        menu_File->addAction(action_Quit);

        retranslateUi(MainWindowDesign);
        QObject::connect(action_Quit, SIGNAL(triggered()), MainWindowDesign, SLOT(close()));
        QObject::connect(quit_button, SIGNAL(clicked()), MainWindowDesign, SLOT(close()));

        tab_manager->setCurrentIndex(0);


        QMetaObject::connectSlotsByName(MainWindowDesign);
    } // setupUi

    void retranslateUi(QMainWindow *MainWindowDesign)
    {
        MainWindowDesign->setWindowTitle(QApplication::translate("MainWindowDesign", "QRosApp", 0, QApplication::UnicodeUTF8));
        action_Quit->setText(QApplication::translate("MainWindowDesign", "&Quit", 0, QApplication::UnicodeUTF8));
        action_Quit->setShortcut(QApplication::translate("MainWindowDesign", "Ctrl+Q", 0, QApplication::UnicodeUTF8));
        action_Preferences->setText(QApplication::translate("MainWindowDesign", "&Preferences", 0, QApplication::UnicodeUTF8));
        actionAbout->setText(QApplication::translate("MainWindowDesign", "&About", 0, QApplication::UnicodeUTF8));
        actionAbout_Qt->setText(QApplication::translate("MainWindowDesign", "About &Qt", 0, QApplication::UnicodeUTF8));
        groupBox_12->setTitle(QApplication::translate("MainWindowDesign", "Logging", 0, QApplication::UnicodeUTF8));
        tab_manager->setTabText(tab_manager->indexOf(tab_status), QApplication::translate("MainWindowDesign", "Ros Communications", 0, QApplication::UnicodeUTF8));
        menu_File->setTitle(QApplication::translate("MainWindowDesign", "&App", 0, QApplication::UnicodeUTF8));
        dock_status->setWindowTitle(QApplication::translate("MainWindowDesign", "Command Panel", 0, QApplication::UnicodeUTF8));
        task_space->setTitle(QApplication::translate("MainWindowDesign", "Task Space Control", 0, QApplication::UnicodeUTF8));
        curr_pos_button->setText(QApplication::translate("MainWindowDesign", "Get current pose", 0, QApplication::UnicodeUTF8));
        pos_x->setText(QApplication::translate("MainWindowDesign", "position x [m]", 0, QApplication::UnicodeUTF8));
        pos_y->setText(QApplication::translate("MainWindowDesign", "position y [m]", 0, QApplication::UnicodeUTF8));
        pos_z->setText(QApplication::translate("MainWindowDesign", "position z [m]", 0, QApplication::UnicodeUTF8));
        ori_roll->setText(QApplication::translate("MainWindowDesign", "orientation roll [deg]", 0, QApplication::UnicodeUTF8));
        ori_pitch->setText(QApplication::translate("MainWindowDesign", "orientation pitch [deg]", 0, QApplication::UnicodeUTF8));
        ori_yaw->setText(QApplication::translate("MainWindowDesign", "orientation yaw [deg]", 0, QApplication::UnicodeUTF8));
        ori_phi->setText(QApplication::translate("MainWindowDesign", "orientation phi [deg]", 0, QApplication::UnicodeUTF8));
        des_pos_button->setText(QApplication::translate("MainWindowDesign", "Send Line Pos.", 0, QApplication::UnicodeUTF8));
        des_p2p_button->setText(QApplication::translate("MainWindowDesign", "Send P2P Pos.", 0, QApplication::UnicodeUTF8));
        joint_space->setTitle(QApplication::translate("MainWindowDesign", "Joint Space Control", 0, QApplication::UnicodeUTF8));
        curr_joint_button->setText(QApplication::translate("MainWindowDesign", "Get current joint values", 0, QApplication::UnicodeUTF8));
        slide->setText(QApplication::translate("MainWindowDesign", "Slide [m]", 0, QApplication::UnicodeUTF8));
        joint1->setText(QApplication::translate("MainWindowDesign", "Joint 1 [deg]", 0, QApplication::UnicodeUTF8));
        joint2->setText(QApplication::translate("MainWindowDesign", "Joint 2 [deg]", 0, QApplication::UnicodeUTF8));
        joint3->setText(QApplication::translate("MainWindowDesign", "Joint 3 [deg]", 0, QApplication::UnicodeUTF8));
        joint4->setText(QApplication::translate("MainWindowDesign", "Joint 4 [deg]", 0, QApplication::UnicodeUTF8));
        joint5->setText(QApplication::translate("MainWindowDesign", "Joint 5 [deg]", 0, QApplication::UnicodeUTF8));
        joint6->setText(QApplication::translate("MainWindowDesign", "Joint 6 [deg]", 0, QApplication::UnicodeUTF8));
        joint7->setText(QApplication::translate("MainWindowDesign", "Joint 7 [deg]", 0, QApplication::UnicodeUTF8));
        des_joint_button->setText(QApplication::translate("MainWindowDesign", "Send Des Joint Val.", 0, QApplication::UnicodeUTF8));
        set_mode_button->setText(QApplication::translate("MainWindowDesign", "Set Mode", 0, QApplication::UnicodeUTF8));
        ini_pose_button->setText(QApplication::translate("MainWindowDesign", "Initial Pose", 0, QApplication::UnicodeUTF8));
        des_initial_button->setText(QApplication::translate("MainWindowDesign", "Back Home", 0, QApplication::UnicodeUTF8));
        quit_button->setText(QApplication::translate("MainWindowDesign", "Quit", 0, QApplication::UnicodeUTF8));
    } // retranslateUi

};

namespace Ui {
    class MainWindowDesign: public Ui_MainWindowDesign {};
} // namespace Ui

QT_END_NAMESPACE

#endif // UI_MAIN_WINDOW_H
