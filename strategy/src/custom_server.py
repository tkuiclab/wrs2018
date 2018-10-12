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

# SerialKey motion command number
nIDEL               = 0
nMoveToP1           = 1
nMoveToP2           = 2
nRotToDeg90         = 3
nRotToDeg0          = 4
nTakeObj_Ori        = 5
nTakeObj_MoveDown   = 6
nTakeObj_AboveObj   = 7
nTakeObj_SuckObj    = 8
nTakeObj_TakeOut    = 9
nGiveObj1           = 10
nGiveObj2           = 11
nDelaySuctOffObj1   = 12
nDelaySuctOffObj2   = 13
nInitArmPos         = 14
nSTOP               = 15

# SerialKey motion command set
SerialKey_RobotIdel  = [nIDEL,      nSTOP]
SerialKey_LeadCustom = [nMoveToP1,  nSTOP]
SerialKey_TakeObjToCustom_Type1 = \
    [nRotToDeg90,       nTakeObj_Ori,       nTakeObj_MoveDown, nTakeObj_AboveObj,
     nTakeObj_SuckObj,  nTakeObj_AboveObj,  nTakeObj_TakeOut,  nRotToDeg0,
     nGiveObj1,         nDelaySuctOffObj1,  nInitArmPos,
     nSTOP]
SerialKey_TakeObjToCustom_Type2 = \
    [nRotToDeg90,       nTakeObj_Ori,       nTakeObj_MoveDown,  nTakeObj_AboveObj,
     nTakeObj_SuckObj,  nTakeObj_AboveObj,  nTakeObj_TakeOut,   nRotToDeg0,
     nMoveToP2,         nGiveObj2,          nDelaySuctOffObj2,  nInitArmPos,
     nSTOP]

# SerialKey Num for function GetMissionSerialKey
RobotIdel  = 0
LeadCustom = 1
TakeObjToCustom_Type1 = 2
TakeObjToCustom_Type2 = 3

class CDualArmTask:
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
            self.suction.gripper_vaccum_off()
    
    def SetSuctionDeg(self, Deg):
        self.suction.gripper_suction_deg(Deg)

    def SuckSuccess(self):
        return self.suction.is_grip()
        
class CDualArmCommand(object):
    def __init__(self):
        self.right = CDualArmTask('right') # Set up right arm controller
        self.left  = CDualArmTask('left')  # Set up left arm controller

        self.DualArmIsBusyFlag = False

    def InitArmPos(self, select):                
        if(select == 'right'):
            self.right.InitialPos()     # Initial robot arm pose
        elif(select == 'left'):
            self.left.InitialPos()      # Initial robot arm pose
        else:
            self.right.InitialPos()     # Initial robot arm pose
            self.left.InitialPos()      # Initial robot arm pose

    def TakeObj_Ori(self, select): # Take object orientation
        # self.DualArmIsBusyFlag = True
        R_Pos   = [0.3, -0.3006, -0.46]
        R_Euler = [5.029, 82.029, 4.036]
        R_Redun = 60
        
        L_Pos   = [0.3, 0.3506, -0.46]
        L_Euler = [5.029, 82.029, 4.036]
        L_Redun = -60

        if(select == 'right'):
            self.right.MoveAbs('line',R_Pos, R_Euler, R_Redun)
        elif(select == 'left'):
            self.left.MoveAbs('line',L_Pos, L_Euler, L_Redun)
        else:
            self.right.MoveAbs('line',R_Pos, R_Euler, R_Redun)
            self.left.MoveAbs('line',L_Pos, L_Euler, L_Redun)

    def TakeObj_MoveDown(self, select): # Move down for take object 
        # self.DualArmIsBusyFlag = True
        R_Pos   = [0.3, -0.3006, -0.56]
        R_Euler = [5.029, 82.029, 4.036]
        R_Redun = 60
        
        L_Pos   = [0.3, 0.3506, -0.56]
        L_Euler = [5.029, 82.029, 4.036]
        L_Redun = -60
        
        if(select == 'right'):
            self.right.MoveAbs('line',R_Pos, R_Euler, R_Redun)
        elif(select == 'left'):
            self.left.MoveAbs('line',L_Pos, L_Euler, L_Redun)
        else:
            self.right.MoveAbs('line',R_Pos, R_Euler, R_Redun)
            self.left.MoveAbs('line',L_Pos, L_Euler, L_Redun)

    def TakeObj_AboveObj(self, select): # Above object 
        # self.DualArmIsBusyFlag = True
        R_Pos   = [0.45, -0.3006, -0.56]
        R_Euler = [5.029, 82.029, 4.036]
        R_Redun = 60
        
        L_Pos   = [0.45, 0.3506, -0.56]
        L_Euler = [5.029, 82.029, 4.036]
        L_Redun = -60

        if(select == 'right'):
            self.right.SetSuctionDeg(-90)
            self.right.MoveAbs('line',R_Pos, R_Euler, R_Redun)
        elif(select == 'left'):
            self.left.SetSuctionDeg(-90)
            self.left.MoveAbs('line',L_Pos, L_Euler, L_Redun)
        else:
            self.right.SetSuctionDeg(-90)
            self.left.SetSuctionDeg(-90)
            self.right.MoveAbs('line',R_Pos, R_Euler, R_Redun)
            self.left.MoveAbs('line',L_Pos, L_Euler, L_Redun)  

    def TakeObj_SuckObj(self, select):  # Take object and suck it
        # self.DualArmIsBusyFlag = True
        R_Pos   = [0.45, -0.3006, -0.60]
        R_Euler = [5.029, 82.029, 4.036]
        R_Redun = 60
        
        L_Pos   = [0.45, 0.3506, -0.60]
        L_Euler = [5.029, 82.029, 4.036]
        L_Redun = -60
        
        if(select == 'right'):
            self.right.SuctionEnable(True)
            self.right.MoveAbs('line',R_Pos, R_Euler, R_Redun)
        elif(select == 'left'):
            self.left.SuctionEnable(True)
            self.left.MoveAbs('line',L_Pos, L_Euler, L_Redun)
        else:
            self.right.SuctionEnable(True)
            self.left.SuctionEnable(True)
            self.right.MoveAbs('line',R_Pos, R_Euler, R_Redun)
            self.left.MoveAbs('line',L_Pos, L_Euler, L_Redun)

    def TakeObj_TakeOut(self, select):  # Leave object region and take it
        # self.DualArmIsBusyFlag = True
        R_Pos   = [0.15, -0.3006, -0.50]
        R_Euler = [5.029, 82.029, 4.036]
        R_Redun = 60
        
        L_Pos   = [0.15, 0.3506, -0.50]
        L_Euler = [5.029, 82.029, 4.036]
        L_Redun = -60

        if(select == 'right'):
            self.right.MoveAbs('line',R_Pos, R_Euler, R_Redun)
        elif(select == 'left'):
            self.left.MoveAbs('line',L_Pos, L_Euler, L_Redun)
        else:
            self.right.MoveAbs('line',R_Pos, R_Euler, R_Redun)
            self.left.MoveAbs('line',L_Pos, L_Euler, L_Redun)

    def GiveObj1(self, select):    # Give object to customer high
        # self.DualArmIsBusyFlag = True
        R_Pos   = [0.4, -0.3006, -0.40]
        R_Euler = [5.029, 82.029, 4.036]
        R_Redun = 60
        
        L_Pos   = [0.4, 0.3506, -0.40]
        L_Euler = [5.029, 82.029, 4.036]
        L_Redun = -60

        if(select == 'right'):
            self.right.MoveAbs('line',R_Pos, R_Euler, R_Redun)
        elif(select == 'left'):
            self.left.MoveAbs('line',L_Pos, L_Euler, L_Redun)
        else:
            self.right.MoveAbs('line',R_Pos, R_Euler, R_Redun)
            self.left.MoveAbs('line',L_Pos, L_Euler, L_Redun) 

    def GiveObj2(self, select):    # Give object to customer low
        # self.DualArmIsBusyFlag = True
        R_Pos   = [0.4, -0.3006, -0.60]
        R_Euler = [5.029, 82.029, 4.036]
        R_Redun = 60
        
        L_Pos   = [0.4, 0.3506, -0.60]
        L_Euler = [5.029, 82.029, 4.036]
        L_Redun = -60       

        if(select == 'right'):
            self.right.MoveAbs('line',R_Pos, R_Euler, R_Redun)
        elif(select == 'left'):
            self.left.MoveAbs('line',L_Pos, L_Euler, L_Redun)
        else:
            self.right.MoveAbs('line',R_Pos, R_Euler, R_Redun)
            self.left.MoveAbs('line',L_Pos, L_Euler, L_Redun)

    def DelaySuctOffObj1(self, select):
        time.sleep(5)   # Delay for customer take object        
        if(select == 'right'):
            self.right.SuctionEnable(False)
        elif(select == 'left'):
            self.left.SuctionEnable(False)
        else:
            self.right.SuctionEnable(False)
            self.left.SuctionEnable(False)

    def DelaySuctOffObj2(self, select):
        time.sleep(2)   # Delay for customer take object
        if(select == 'right'):
            self.right.SuctionEnable(False)
        elif(select == 'left'):
            self.left.SuctionEnable(False)
        else:
            self.right.SuctionEnable(False)
            self.left.SuctionEnable(False)

    def IDEL(self):
        # self.DualArmIsBusyFlag = False
        # Do nothing
        pass
    
    def DualArmIsBusy(self):
        self.DualArmIsBusyFlag = (self.right.arm.is_busy) or (self.left.arm.is_busy) 
        # self.DualArmIsBusyFlag = False # Force set flag for testing
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
        # self.MobileIsBusyFlag = False # Force set flag for testing
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

def MotionKeyDetector(Key, MobileCommandSet, DualArmCommandSet, SelectArm):
    if(Key == nIDEL):
        print("IDEL")
        MobileCommandSet.IDLE()
        DualArmCommandSet.IDEL()       
    elif(Key == nMoveToP1):
        print("MoveToP1")
        MobileCommandSet.Mobile_START()
    elif(Key == nMoveToP2):
        print("MoveToP2")
        MobileCommandSet.Mobile_NEXT()
    elif(Key == nRotToDeg90):
        print("RotToDeg90")
        MobileCommandSet.Mobile_ORDER()
    elif(Key == nRotToDeg0):
        print("RotToDeg0")
        MobileCommandSet.Mobile_AID()

    elif(Key == nTakeObj_Ori):
        print("TakeObj_Ori")
        DualArmCommandSet.TakeObj_Ori(SelectArm)
    elif(Key == nTakeObj_MoveDown):
        print("TakeObj_MoveDown")
        DualArmCommandSet.TakeObj_MoveDown(SelectArm)
    elif(Key == nTakeObj_AboveObj):
        print("TakeObj_AboveObj")
        DualArmCommandSet.TakeObj_AboveObj(SelectArm)
    elif(Key == nTakeObj_SuckObj):
        print("TakeObj_SuckObj")
        DualArmCommandSet.TakeObj_SuckObj(SelectArm)
    elif(Key == nTakeObj_TakeOut):
        print("TakeObj_TakeOut")
        DualArmCommandSet.TakeObj_TakeOut(SelectArm)  

    elif(Key == nGiveObj1):
        print("GiveObj1")
        DualArmCommandSet.GiveObj1(SelectArm)
    elif(Key == nGiveObj2):
        print("nGiveObj2")
        DualArmCommandSet.GiveObj2(SelectArm)
    elif(Key == nDelaySuctOffObj1):
        print("DelaySuctOffObj1")
        DualArmCommandSet.DelaySuctOffObj1(SelectArm)
    elif(Key == nDelaySuctOffObj2):
        print("Delay_SuctOffObj2")
        DualArmCommandSet.DelaySuctOffObj2(SelectArm)
    elif(Key == nInitArmPos):
        DualArmCommandSet.InitArmPos(SelectArm)
    elif(Key == nSTOP):
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

        SelectArm = 'dual'
        if(Get_Req == TakeObjToCustom_Type1):
            SelectArm = 'left'  # Use right arm to take object 1
        elif(Get_Req == TakeObjToCustom_Type2):
            SelectArm = 'right' # Use left arm to take object 2

        while((MissionExecuteFlag == True) and (MotionSerialKey != None)):            
            if not(MobileCommandSet.MobileIsBusy() ):#or DualArmCommandSet.DualArmIsBusy()):
                MotionKey = MotionSerialKey[SerialKeyIndex]
                MotionKeyDetector(MotionKey, MobileCommandSet, DualArmCommandSet, SelectArm)
                if(MotionKey != nSTOP):
                    if not ((MotionKey == nMoveToP1) and (MobileCommandSet.SendToSrvSucessFlag == False)):
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
            
    
