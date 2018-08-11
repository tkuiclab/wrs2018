// Auto-generated. Do not edit!

// (in-package manipulator_h_base_module_msgs.srv)


"use strict";

const _serializer = _ros_msg_utils.Serialize;
const _arraySerializer = _serializer.Array;
const _deserializer = _ros_msg_utils.Deserialize;
const _arrayDeserializer = _deserializer.Array;
const _finder = _ros_msg_utils.Find;
const _getByteLength = _ros_msg_utils.getByteLength;

//-----------------------------------------------------------

let geometry_msgs = _finder('geometry_msgs');

//-----------------------------------------------------------

class GetKinematicsPoseRequest {
  constructor(initObj={}) {
    if (initObj === null) {
      // initObj === null is a special case for deserialization where we don't initialize fields
      this.group_name = null;
    }
    else {
      if (initObj.hasOwnProperty('group_name')) {
        this.group_name = initObj.group_name
      }
      else {
        this.group_name = '';
      }
    }
  }

  static serialize(obj, buffer, bufferOffset) {
    // Serializes a message object of type GetKinematicsPoseRequest
    // Serialize message field [group_name]
    bufferOffset = _serializer.string(obj.group_name, buffer, bufferOffset);
    return bufferOffset;
  }

  static deserialize(buffer, bufferOffset=[0]) {
    //deserializes a message object of type GetKinematicsPoseRequest
    let len;
    let data = new GetKinematicsPoseRequest(null);
    // Deserialize message field [group_name]
    data.group_name = _deserializer.string(buffer, bufferOffset);
    return data;
  }

  static getMessageSize(object) {
    let length = 0;
    length += object.group_name.length;
    return length + 4;
  }

  static datatype() {
    // Returns string type for a service object
    return 'manipulator_h_base_module_msgs/GetKinematicsPoseRequest';
  }

  static md5sum() {
    //Returns md5sum for a message object
    return '967d0b0c0d858ded8a6a69abbce0c981';
  }

  static messageDefinition() {
    // Returns full string definition for message
    return `
    string    group_name
    
    `;
  }

  static Resolve(msg) {
    // deep-construct a valid message object instance of whatever was passed in
    if (typeof msg !== 'object' || msg === null) {
      msg = {};
    }
    const resolved = new GetKinematicsPoseRequest(null);
    if (msg.group_name !== undefined) {
      resolved.group_name = msg.group_name;
    }
    else {
      resolved.group_name = ''
    }

    return resolved;
    }
};

class GetKinematicsPoseResponse {
  constructor(initObj={}) {
    if (initObj === null) {
      // initObj === null is a special case for deserialization where we don't initialize fields
      this.group_pose = null;
      this.phi = null;
    }
    else {
      if (initObj.hasOwnProperty('group_pose')) {
        this.group_pose = initObj.group_pose
      }
      else {
        this.group_pose = new geometry_msgs.msg.Pose();
      }
      if (initObj.hasOwnProperty('phi')) {
        this.phi = initObj.phi
      }
      else {
        this.phi = 0.0;
      }
    }
  }

  static serialize(obj, buffer, bufferOffset) {
    // Serializes a message object of type GetKinematicsPoseResponse
    // Serialize message field [group_pose]
    bufferOffset = geometry_msgs.msg.Pose.serialize(obj.group_pose, buffer, bufferOffset);
    // Serialize message field [phi]
    bufferOffset = _serializer.float64(obj.phi, buffer, bufferOffset);
    return bufferOffset;
  }

  static deserialize(buffer, bufferOffset=[0]) {
    //deserializes a message object of type GetKinematicsPoseResponse
    let len;
    let data = new GetKinematicsPoseResponse(null);
    // Deserialize message field [group_pose]
    data.group_pose = geometry_msgs.msg.Pose.deserialize(buffer, bufferOffset);
    // Deserialize message field [phi]
    data.phi = _deserializer.float64(buffer, bufferOffset);
    return data;
  }

  static getMessageSize(object) {
    return 64;
  }

  static datatype() {
    // Returns string type for a service object
    return 'manipulator_h_base_module_msgs/GetKinematicsPoseResponse';
  }

  static md5sum() {
    //Returns md5sum for a message object
    return '6263acace284e74dd391246b8f61717d';
  }

  static messageDefinition() {
    // Returns full string definition for message
    return `
    geometry_msgs/Pose group_pose
    float64        phi
    
    ================================================================================
    MSG: geometry_msgs/Pose
    # A representation of pose in free space, composed of position and orientation. 
    Point position
    Quaternion orientation
    
    ================================================================================
    MSG: geometry_msgs/Point
    # This contains the position of a point in free space
    float64 x
    float64 y
    float64 z
    
    ================================================================================
    MSG: geometry_msgs/Quaternion
    # This represents an orientation in free space in quaternion form.
    
    float64 x
    float64 y
    float64 z
    float64 w
    
    `;
  }

  static Resolve(msg) {
    // deep-construct a valid message object instance of whatever was passed in
    if (typeof msg !== 'object' || msg === null) {
      msg = {};
    }
    const resolved = new GetKinematicsPoseResponse(null);
    if (msg.group_pose !== undefined) {
      resolved.group_pose = geometry_msgs.msg.Pose.Resolve(msg.group_pose)
    }
    else {
      resolved.group_pose = new geometry_msgs.msg.Pose()
    }

    if (msg.phi !== undefined) {
      resolved.phi = msg.phi;
    }
    else {
      resolved.phi = 0.0
    }

    return resolved;
    }
};

module.exports = {
  Request: GetKinematicsPoseRequest,
  Response: GetKinematicsPoseResponse,
  md5sum() { return '2ed4552089555c3a5dd1cab00b55e858'; },
  datatype() { return 'manipulator_h_base_module_msgs/GetKinematicsPose'; }
};
