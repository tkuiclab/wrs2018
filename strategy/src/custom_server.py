#!/usr/bin/env python
from mobile_platform.srv import *
from strategy.srv import *
from std_msgs.msg import Int32
from std_msgs.msg import Bool
import rospy
import time

IDEL          = 0
MoveToP1      = 1
MoveToP2      = 2
RotToDeg90    = 3
RotToDeg0     = 4
TakeObj       = 5
GiveObj_Type1 = 6
GiveObj_Type2 = 7
STOP          = 9

SerialKey_RobotIdel  = [IDEL, STOP]
SerialKey_LeadCustom = [MoveToP1, STOP]
SerialKey_TakeObjToCustom_Type1 = [RotToDeg90, TakeObj, RotToDeg0, GiveObj_Type1, STOP]
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
        # if en_sim:
        #     print en_sim
        #     return
        
        # self.name  = _name
        # self.state = initPose
        # self.nextState = idle
        # self.arm   = ArmTask(self.name + '_arm')
        # self.pick_list = 2
        # self.pos   = (0, 0, 0)
        # self.euler = (0, 0, 0)
        # self.phi   = 0
        # if en_sim:
        #     self.suction = SuctionTask(self.name + '_gazebo')
        #     print "aa"
        # else:
        #     self.suction = SuctionTask(self.name)
        #     print "bb"
    
class CDualArmCommand(object):
    def __init__(self):
        self.right = exampleTask('right')      #Set up right arm controller
        self.left  = exampleTask('left')       #Set up left arm controller

        self.DualArmIsBusyFlag = False

    def TakeObj(self):
        pass

    def GiveObj_Type1(self):
        pass

    def GiveObj_Type2(self):
        pass

    def IDEL(self):
        self.DualArmIsBusyFlag = False
        # Do nothing
    
    def DualArmIsBusy(self):
        #self.DualArmIsBusyFlag = (self.right.arm.is_busy) or (self.left.arm.is_busy)
        self.DualArmIsBusyFlag = False
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
        DualArmCommandSet.TakeObj()
    elif(Key == GiveObj_Type1):
        DualArmCommandSet.GiveObj_Type1
    elif(Key == GiveObj_Type2):
        DualArmCommandSet.GiveObj_Type2
    elif(Key == STOP):
        print("STOP")
        # Key in DualArm & Mobile Robot STOP function here.
        pass

index = 0

def handle_state(req):
    Get_Req = req.state
    print("Returning [%s]"%(req.state)) # Show the state from Assistant

    MobileCommandSet = CMobileCommand()
    DualArmCommandSet= CDualArmCommand()

    SerialKeyIndex   = 0
    MissionExecuteFlag = True

    MotionSerialKey = GetMissionSerialKey(Get_Req)
  
    while((MissionExecuteFlag == True) and (MotionSerialKey != None)):
        if not(MobileCommandSet.MobileIsBusy()): #or DualArmCommandSet.DualArmIsBusy()):
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

    ### Response the result of Strategy
    res = AssistantStateResponse()
    res.success = True            # Bool
    res.info    = "Test response" # String
    return res

def assistant_server():
    rospy.init_node('assistant_node')
    s = rospy.Service('assistant_service', AssistantState, handle_state)
    print "Listening on TIMDA Assistant."
    rospy.spin()

if __name__ == "__main__":
    assistant_server()

    # MissionExecuteFlag = False
    # SerialKeyIndex   = 0
    # MobileCommandSet = CMobileCommand()
    # DualArmCommandSet= CDualCommand()

    # while(True):
    #     if(MissionExecuteFlag == False):
    #         MissionExecuteFlag = True
    #         MotionSerialKey = GetMissionSerialKey(Get_Req)
    #     elif((MissionExecuteFlag == True) and (MotionSerialKey != None)):
    #         if not(MobileCommandSet.MobileIsBusy() or DualArmCommandSet.DualArmIsBusy()):
    #             MotionKey = MotionSerialKey[SerialKeyIndex]
    #             MotionKeyDetector(MotionKey, MobileCommandSet, DualArmCommandSet)
                
    #             if(MotionKey != STOP):
    #                 SerialKeyIndex += 1
    #             else:
    #                 SerialKeyIndex = 0
    #                 MissionExecuteFlag = False
            
    
