#!/usr/bin/env python
from mobile_platform.srv import *
from strategy.srv import *
from std_msgs.msg import Int32
from std_msgs.msg import Bool
from arm_control import ArmTask, SuctionTask

import os
import sys
import rospy
import time

IDEL          = 0
MoveToP1      = 1
MoveToP2      = 2
RotToDeg90    = 3
RotToDeg0     = 4
TakeObj       = 5
TakeObjStep1  = 6
TakeObjStep2  = 7
TakeObjStep3  = 8
TakeObjStep4  = 9
TakeObjStep5  = 10
GiveObj_Type1 = 11
GiveObj_Type2 = 12
STOP          = 13
InitArm       = 14
TakeObjStep6  = 15
TakeObjStep7  = 16
TakeObjStep8  = 17
TakeObjStep9  = 18

SerialKey_RobotIdel  = [IDEL, STOP]
SerialKey_LeadCustom = [MoveToP1, STOP]

SerialKey_TakeObjToCustom_Type1 = [RotToDeg90, TakeObjStep1, TakeObjStep2, TakeObjStep3, TakeObjStep4, TakeObjStep5, RotToDeg0, GiveObj_Type1, STOP]
#SerialKey_TakeObjToCustom_Type1 = [TakeObjStep1, TakeObjStep2, TakeObjStep3, TakeObjStep4, TakeObjStep5, STOP] # Test for dual-arm command
#SerialKey_TakeObjToCustom_Type1 = [RotToDeg90, TakeObj, RotToDeg0, GiveObj_Type1, STOP]
SerialKey_TakeObjToCustom_Type2 = [RotToDeg90, TakeObj, RotToDeg0, MoveToP2, GiveObj_Type2, STOP]
#SerialKey_TakeObjToCustom_Type2 = [RotToDeg90, TakeObj, MoveToP2, GiveObj_Type2, STOP]

# SerialKey Num for function GetMissionSerialKey
RobotIdel  = 0
LeadCustom = 1
TakeObjToCustom_Type1 = 2
TakeObjToCustom_Type2 = 3

class exampleTask:
    def __init__(self, _name = '/robotis'):
        """Initial object."""
        en_sim = False
        if len(sys.argv) >= 2:
            rospy.set_param('en_sim', sys.argv[1])
            en_sim = rospy.get_param('en_sim')
       
        self.name  = _name
        self.arm   = ArmTask(self.name + '_arm')
        self.pick_list = 2
        self.pos   = (0, 0, 0)
        self.euler = (0, 0, 0)
        self.phi   = 0
        if en_sim:
            self.suction = SuctionTask(self.name + '_gazebo')
            print "aa"
        else:
            self.suction = SuctionTask(self.name)
            print "bb"

    def InitialPos(self):
        self.arm.set_speed(30)
        self.arm.jointMove(0, (0, -0.5, 0, 1, 0, -0.5, 0))
        self.suction.gripper_suction_deg(0)

    def MoveAbs(self, Line_PtP, Pos, Euler, Redun):
        if(Line_PtP == 'line'):
            Line_PtP = 'line'
        else:
            Line_PtP = 'p2p'
        self.arm.ikMove(Line_PtP, Pos, Euler, Redun)
    
    def MoveRelPos(self, Line_PtP, Pos):
        if(Line_PtP == 'line'):
            Line_PtP = 'line'
        else:
            Line_PtP = 'p2p'
        self.arm.relative_move_pose(Line_PtP, Pos)

    def SuctionEnable(self, On_Off):
        if(On_Off == True):
            self.suction.gripper_vaccum_on()
        elif(On_Off == False):
            self.success.gripper_vaccum_off()
    
    def SetSuctionDeg(self, Deg):
        self.suction.gripper_suction_deg(Deg)
        
class CDualArmCommand(object):
    def __init__(self):
        self.right = exampleTask('right') # Set up right arm controller
        self.left  = exampleTask('left')  # Set up left arm controller

        self.DualArmIsBusyFlag = False
    #  Right        X       Y       Z      ROLL     PITCH     YAW      PHI    
    #  step1.      0.3  -0.3006   -0.46    5.029    82.029    4.036     60      

    #  step2.      0.3  -0.3006   -0.56    5.029    82.029    4.036     60    

    #  step3.     0.55  -0.3006   -0.56    5.029    82.029    4.036     60

    #  step4.     0.55  -0.3006   -0.46    5.029    82.029    4.036     60

    #  Left
    #  step1.      0.3   0.3506   -0.46    5.029    82.029    4.036     -60
 
    #  step2.      0.3   0.3506   -0.56    5.029    82.029    4.036     -60         
 
    #  step3.     0.55   0.3506   -0.56    5.029    82.029    4.036     -60

    #  step4.     0.55   0.3506   -0.46    5.029    82.029    4.036     -60

    def InitArmPos(self):
        self.right.InitialPos()
        self.left.InitialPos()

    def TakeObj(self):
        # self.DualArmIsBusyFlag = True
        pass

    def TakeObj_Step1(self):
        # self.DualArmIsBusyFlag = True
        R_Pos   = [0.3, -0.3006, -0.46]
        R_Euler = [5.029, 82.029, 4.036]
        R_Redun = 60
        
        L_Pos   = [0.3, 0.3506, -0.46]
        L_Euler = [5.029, 82.029, 4.036]
        L_Redun = -60
        
        self.right.MoveAbs('line',R_Pos, R_Euler, R_Redun)
        self.left.MoveAbs('line',L_Pos, L_Euler, L_Redun)

    def TakeObj_Step2(self):
        # self.DualArmIsBusyFlag = True
        R_Pos   = [0.3, -0.3006, -0.56]
        R_Euler = [5.029, 82.029, 4.036]
        R_Redun = 60
        
        L_Pos   = [0.3, 0.3506, -0.56]
        L_Euler = [5.029, 82.029, 4.036]
        L_Redun = -60
        
        self.right.MoveAbs('line',R_Pos, R_Euler, R_Redun)
        self.left.MoveAbs('line',L_Pos, L_Euler, L_Redun)

    def TakeObj_Step3(self):
        # self.DualArmIsBusyFlag = True
        R_Pos   = [0.55, -0.3006, -0.56]
        R_Euler = [5.029, 82.029, 4.036]
        R_Redun = 60
        
        L_Pos   = [0.55, 0.3506, -0.56]
        L_Euler = [5.029, 82.029, 4.036]
        L_Redun = -60
        
        self.right.MoveAbs('line',R_Pos, R_Euler, R_Redun)
        self.left.MoveAbs('line',L_Pos, L_Euler, L_Redun)

    def TakeObj_Step4(self):
        # self.DualArmIsBusyFlag = True
        R_Pos   = [0.55, -0.3006, -0.46]
        R_Euler = [5.029, 82.029, 4.036]
        R_Redun = 60
        
        L_Pos   = [0.55, 0.3506, -0.46]
        L_Euler = [5.029, 82.029, 4.036]
        L_Redun = -60
        
        self.right.MoveAbs('line',R_Pos, R_Euler, R_Redun)
        self.left.MoveAbs('line',L_Pos, L_Euler, L_Redun)

    def TakeObj_Step5(self):
        # self.DualArmIsBusyFlag = True
        R_Pos   = [0.2, -0.3006, -0.46]
        R_Euler = [5.029, 82.029, 4.036]
        R_Redun = 60
        
        L_Pos   = [0.2, 0.3506, -0.46]
        L_Euler = [5.029, 82.029, 4.036]
        L_Redun = -60
        
        self.right.MoveAbs('line',R_Pos, R_Euler, R_Redun)
        self.left.MoveAbs('line',L_Pos, L_Euler, L_Redun)

    def TakeObj_Step6(self):       #take object
        # self.DualArmIsBusyFlag = True
        R_Pos   = [0.45, -0.3006, -0.56]
        R_Euler = [5.029, 82.029, 4.036]
        R_Redun = 60
        
        L_Pos   = [0.45, 0.3506, -0.56]
        L_Euler = [5.029, 82.029, 4.036]
        L_Redun = -60
        
        self.right.MoveAbs('line',R_Pos, R_Euler, R_Redun)
        self.left.MoveAbs('line',L_Pos, L_Euler, L_Redun)   

    def TakeObj_Step7(self):      #leave object region
        # self.DualArmIsBusyFlag = True
        R_Pos   = [0.15, -0.3006, -0.50]
        R_Euler = [5.029, 82.029, 4.036]
        R_Redun = 60
        
        L_Pos   = [0.15, 0.3506, -0.50]
        L_Euler = [5.029, 82.029, 4.036]
        L_Redun = -60

        self.right.MoveAbs('line',R_Pos, R_Euler, R_Redun)
        self.left.MoveAbs('line',L_Pos, L_Euler, L_Redun)

    def TakeObj_Step8(self):     #take object to customer high
        # self.DualArmIsBusyFlag = True
        R_Pos   = [0.4, -0.3006, -0.40]
        R_Euler = [5.029, 82.029, 4.036]
        R_Redun = 60
        
        L_Pos   = [0.4, 0.3506, -0.40]
        L_Euler = [5.029, 82.029, 4.036]
        L_Redun = -60

        self.right.MoveAbs('line',R_Pos, R_Euler, R_Redun)
        self.left.MoveAbs('line',L_Pos, L_Euler, L_Redun)  

    def TakeObj_Step9(self):     #take object to customer low
        # self.DualArmIsBusyFlag = True
        R_Pos   = [0.4, -0.3006, -0.60]
        R_Euler = [5.029, 82.029, 4.036]
        R_Redun = 60
        
        L_Pos   = [0.4, 0.3506, -0.60]
        L_Euler = [5.029, 82.029, 4.036]
        L_Redun = -60       

        self.right.MoveAbs('line',R_Pos, R_Euler, R_Redun)
        self.left.MoveAbs('line',L_Pos, L_Euler, L_Redun)      

    def GiveObj_Type1(self):
        # self.DualArmIsBusyFlag = True
        pass

    def GiveObj_Type2(self):
        # self.DualArmIsBusyFlag = True
        pass

    def IDEL(self):
        # self.DualArmIsBusyFlag = False
        # Do nothing
        pass
    
    def DualArmIsBusy(self):
        self.DualArmIsBusyFlag = (self.right.arm.is_busy) or (self.left.arm.is_busy)
        
        return self.DualArmIsBusyFlag

class CMobileCommand(object):
    def __init__(self):
        self.pub_behavior= rospy.Publisher('scan_black/strategy_behavior', Int32, queue_size = 1)
        #self.pub_start   = rospy.Publisher('scan_black/strategy_start', Bool, queue_size = 1)
        self.srv_start   = rospy.ServiceProxy('scan_black/strategy_start', strategy_start)
        rospy.Subscriber("scan_black/dualarm_start", Bool, self.Sub_DualArm_Start)

        self.MobileIsBusyFlag = False
        self.SendToSrvSucessFlag = False

    def Mobile_START(self):
        # Move to point 1 (0 deg)
        self.MobileIsBusyFlag = True
        srvData = strategy_start()
        srvData.data = True
        #self.pub_start.publish(start)
        self.SendToSrvSucessFlag = self.srv_start(srvData.data)
        print(self.SendToSrvSucessFlag)

    def Mobile_AID(self):
        # Turn to abs 0 deg
        self.MobileIsBusyFlag = True
        behavior_type = Int32()
        behavior_type.data = 11
        self.pub_behavior.publish(behavior_type)

    def Mobile_ORDER(self):
        # Turn to abs +90 deg
        self.MobileIsBusyFlag = True
        behavior_type = Int32()
        behavior_type.data = 12
        self.pub_behavior.publish(behavior_type)

    def Mobile_NEXT(self):
        # Move to point 2 (0 deg)
        self.MobileIsBusyFlag = True
        behavior_type = Int32()
        behavior_type.data =  3
        self.pub_behavior.publish(behavior_type)

    def Sub_DualArm_Start(self, msg):
        # Subcriber of DualArmStart Callback funciton
        self.__DualArmFlag = msg.data
        if(self.__DualArmFlag == True):
            self.MobileIsBusyFlag = False

    def IDLE(self):
        self.MobileIsBusyFlag = False
        # Do nothing
        
    def MobileIsBusy(self):
        self.MobileIsBusyFlag = False # Force set flag for testing
        return self.MobileIsBusyFlag

def GetMissionSerialKey(MissionReq):
    if(MissionReq == RobotIdel or MissionReq == None):
        return SerialKey_RobotIdel
    elif(MissionReq == LeadCustom):
        return SerialKey_LeadCustom
    elif(MissionReq == TakeObjToCustom_Type1):
        return SerialKey_TakeObjToCustom_Type1
    elif(MissionReq == TakeObjToCustom_Type2):
        return SerialKey_TakeObjToCustom_Type2
    else:
        return SerialKey_RobotIdel

def MotionKeyDetector(Key, MobileCommandSet, DualArmCommandSet):
    if(Key == IDEL):
        print("IDEL")
        MobileCommandSet.IDLE()
        DualArmCommandSet.IDEL()       
    elif(Key == MoveToP1):
        print("MoveToP1")
        MobileCommandSet.Mobile_START()
    elif(Key == MoveToP2):
        print("MoveToP2")
        MobileCommandSet.Mobile_NEXT()
    elif(Key == RotToDeg90):
        print("RotToDeg90")
        MobileCommandSet.Mobile_ORDER()
    elif(Key == RotToDeg0):
        print("RotToDeg0")
        MobileCommandSet.Mobile_AID()
    elif(Key == TakeObj):
        print("TakeObj")
        DualArmCommandSet.TakeObj()
    elif(Key == TakeObjStep1):
        print("TakeObjStep1")
        DualArmCommandSet.TakeObj_Step1()
    elif(Key == TakeObjStep2):
        print("TakeObjStep2")
        DualArmCommandSet.TakeObj_Step2()
    elif(Key == TakeObjStep3):
        print("TakeObjStep3")
        DualArmCommandSet.TakeObj_Step3()
    elif(Key == TakeObjStep4):
        print("TakeObjStep4")
        DualArmCommandSet.TakeObj_Step4()
    elif(Key == TakeObjStep5):
        print("TakeObjStep5")
        DualArmCommandSet.TakeObj_Step5()

    elif(Key == TakeObjStep6):
        print("TakeObjStep6")
        DualArmCommandSet.TakeObj_Step6()
    elif(Key == TakeObjStep7):
        print("TakeObjStep7")
        DualArmCommandSet.TakeObj_Step7() 
    elif(Key == TakeObjStep8):
        print("TakeObjStep8")
        DualArmCommandSet.TakeObj_Step8() 
    elif(Key == TakeObjStep9):
        print("TakeObjStep9")
        DualArmCommandSet.TakeObj_Step9()            

    elif(Key == GiveObj_Type1):
        print("GiveObj_Type1")
        DualArmCommandSet.GiveObj_Type1()
    elif(Key == GiveObj_Type2):
        print("GiveObj_Type2")
        DualArmCommandSet.GiveObj_Type2()
    elif(Key == InitArm):
        DualArmCommandSet.InitArmPos()
    elif(Key == STOP):
        print("STOP")
        # Key in DualArm & Mobile Robot STOP function here.
        pass
    else:
        MobileCommandSet.IDLE()
        DualArmCommandSet.IDEL()  

def handle_state(req):
    try:
        Get_Req = req.state
        print("Returning [%s]"%(req.state)) # Show the state from Assistant
        
        if type(Get_Req) != int:
            # Input: Mission
            #   0  : Robot idel
            #   1  : Lead customer
            #   2  : Take object to customer type1
            #   3  : Take object to customer type2
            # Other: Robot idel
            raise NotImplementedError("Request state input illegal. Please input an integer.")

        MobileCommandSet = CMobileCommand()
        DualArmCommandSet= CDualArmCommand()
        SerialKeyIndex   = 0
        MissionExecuteFlag = True
        MotionSerialKey = GetMissionSerialKey(Get_Req)

        while((MissionExecuteFlag == True) and (MotionSerialKey != None)):            
            if not(MobileCommandSet.MobileIsBusy() ):#or DualArmCommandSet.DualArmIsBusy()):
                MotionKey = MotionSerialKey[SerialKeyIndex]
                MotionKeyDetector(MotionKey, MobileCommandSet, DualArmCommandSet)
                if(MotionKey != STOP):
                    if not ((MotionKey == MoveToP1) and (MobileCommandSet.SendToSrvSucessFlag == False)):
                        # Check the data send to service or not.
                        # if there were not, it would keep execute the motion (MoveToP1).
                        SerialKeyIndex += 1
                else:
                    SerialKeyIndex = 0
                    MissionExecuteFlag = False

    except Exception, exception:
        ResponseFlag = False
        ResponseInfo = exception.message

    except NotImplementedError, e:
        ResponseFlag = False
        ResponseInfo = e.message

    else:
        if(MotionSerialKey == SerialKey_RobotIdel):
            ResponseFlag = False
            # ResponseInfo = "Mission: Robot idel finish."
            ResponseInfo = "Mission: Robot idel finish."
        elif(MotionSerialKey == SerialKey_LeadCustom):
            ResponseFlag = True
            # ResponseInfo = "Mission: Lead customer finish."
            ResponseInfo = "We have arrived at Sprite's shelves, do you need anything else?"
        elif(MotionSerialKey == SerialKey_TakeObjToCustom_Type1):
            ResponseFlag = True
            # ResponseInfo = "Mission: Take object to customer type1 finish."
            ResponseInfo = "Here you are, do you need anything else?"
        elif(MotionSerialKey == SerialKey_TakeObjToCustom_Type2):
            ResponseFlag = False
            # ResponseInfo = "Mission: Take object to customer type2 finish."
            ResponseInfo = "Mission: Take object to customer type2 finish."

    ### Response the result of Strategy
    res = AssistantStateResponse()
    res.success = ResponseFlag    # Bool  : An flag for Watson speaking or not.
    res.info    = ResponseInfo    # String: It's Watson contents of speaking when flag is true.
                                  # String: It's Watson mission commit when flag is false.
    return res

def assistant_server():
    rospy.init_node('assistant_node')
    s = rospy.Service('assistant_service', AssistantState, handle_state)
    print "Listening on TIMDA Assistant."
    rospy.spin()

if __name__ == "__main__":
    assistant_server()
    # Execute in the handle_state callback function
            
    
