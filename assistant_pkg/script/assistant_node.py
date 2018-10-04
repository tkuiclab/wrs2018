#!/usr/bin/env python

from assistant_pkg.srv import *
import rospy

def handle_state(req):
    print("Returning [%s]"%(req.state)) # Show the state from Assistant
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