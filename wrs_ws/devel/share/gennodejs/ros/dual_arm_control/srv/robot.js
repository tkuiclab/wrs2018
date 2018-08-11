// Auto-generated. Do not edit!

// (in-package dual_arm_control.srv)


"use strict";

const _serializer = _ros_msg_utils.Serialize;
const _arraySerializer = _serializer.Array;
const _deserializer = _ros_msg_utils.Deserialize;
const _arrayDeserializer = _deserializer.Array;
const _finder = _ros_msg_utils.Find;
const _getByteLength = _ros_msg_utils.getByteLength;

//-----------------------------------------------------------


//-----------------------------------------------------------

class robotRequest {
  constructor(initObj={}) {
    if (initObj === null) {
      // initObj === null is a special case for deserialization where we don't initialize fields
      this.slide_R = null;
      this.joint1_R = null;
      this.joint2_R = null;
      this.joint3_R = null;
      this.joint4_R = null;
      this.joint5_R = null;
      this.joint6_R = null;
      this.joint7_R = null;
      this.gripper_R = null;
      this.slide_L = null;
      this.joint1_L = null;
      this.joint2_L = null;
      this.joint3_L = null;
      this.joint4_L = null;
      this.joint5_L = null;
      this.joint6_L = null;
      this.joint7_L = null;
      this.gripper_L = null;
    }
    else {
      if (initObj.hasOwnProperty('slide_R')) {
        this.slide_R = initObj.slide_R
      }
      else {
        this.slide_R = 0.0;
      }
      if (initObj.hasOwnProperty('joint1_R')) {
        this.joint1_R = initObj.joint1_R
      }
      else {
        this.joint1_R = 0.0;
      }
      if (initObj.hasOwnProperty('joint2_R')) {
        this.joint2_R = initObj.joint2_R
      }
      else {
        this.joint2_R = 0.0;
      }
      if (initObj.hasOwnProperty('joint3_R')) {
        this.joint3_R = initObj.joint3_R
      }
      else {
        this.joint3_R = 0.0;
      }
      if (initObj.hasOwnProperty('joint4_R')) {
        this.joint4_R = initObj.joint4_R
      }
      else {
        this.joint4_R = 0.0;
      }
      if (initObj.hasOwnProperty('joint5_R')) {
        this.joint5_R = initObj.joint5_R
      }
      else {
        this.joint5_R = 0.0;
      }
      if (initObj.hasOwnProperty('joint6_R')) {
        this.joint6_R = initObj.joint6_R
      }
      else {
        this.joint6_R = 0.0;
      }
      if (initObj.hasOwnProperty('joint7_R')) {
        this.joint7_R = initObj.joint7_R
      }
      else {
        this.joint7_R = 0.0;
      }
      if (initObj.hasOwnProperty('gripper_R')) {
        this.gripper_R = initObj.gripper_R
      }
      else {
        this.gripper_R = 0.0;
      }
      if (initObj.hasOwnProperty('slide_L')) {
        this.slide_L = initObj.slide_L
      }
      else {
        this.slide_L = 0.0;
      }
      if (initObj.hasOwnProperty('joint1_L')) {
        this.joint1_L = initObj.joint1_L
      }
      else {
        this.joint1_L = 0.0;
      }
      if (initObj.hasOwnProperty('joint2_L')) {
        this.joint2_L = initObj.joint2_L
      }
      else {
        this.joint2_L = 0.0;
      }
      if (initObj.hasOwnProperty('joint3_L')) {
        this.joint3_L = initObj.joint3_L
      }
      else {
        this.joint3_L = 0.0;
      }
      if (initObj.hasOwnProperty('joint4_L')) {
        this.joint4_L = initObj.joint4_L
      }
      else {
        this.joint4_L = 0.0;
      }
      if (initObj.hasOwnProperty('joint5_L')) {
        this.joint5_L = initObj.joint5_L
      }
      else {
        this.joint5_L = 0.0;
      }
      if (initObj.hasOwnProperty('joint6_L')) {
        this.joint6_L = initObj.joint6_L
      }
      else {
        this.joint6_L = 0.0;
      }
      if (initObj.hasOwnProperty('joint7_L')) {
        this.joint7_L = initObj.joint7_L
      }
      else {
        this.joint7_L = 0.0;
      }
      if (initObj.hasOwnProperty('gripper_L')) {
        this.gripper_L = initObj.gripper_L
      }
      else {
        this.gripper_L = 0.0;
      }
    }
  }

  static serialize(obj, buffer, bufferOffset) {
    // Serializes a message object of type robotRequest
    // Serialize message field [slide_R]
    bufferOffset = _serializer.float32(obj.slide_R, buffer, bufferOffset);
    // Serialize message field [joint1_R]
    bufferOffset = _serializer.float32(obj.joint1_R, buffer, bufferOffset);
    // Serialize message field [joint2_R]
    bufferOffset = _serializer.float32(obj.joint2_R, buffer, bufferOffset);
    // Serialize message field [joint3_R]
    bufferOffset = _serializer.float32(obj.joint3_R, buffer, bufferOffset);
    // Serialize message field [joint4_R]
    bufferOffset = _serializer.float32(obj.joint4_R, buffer, bufferOffset);
    // Serialize message field [joint5_R]
    bufferOffset = _serializer.float32(obj.joint5_R, buffer, bufferOffset);
    // Serialize message field [joint6_R]
    bufferOffset = _serializer.float32(obj.joint6_R, buffer, bufferOffset);
    // Serialize message field [joint7_R]
    bufferOffset = _serializer.float32(obj.joint7_R, buffer, bufferOffset);
    // Serialize message field [gripper_R]
    bufferOffset = _serializer.float32(obj.gripper_R, buffer, bufferOffset);
    // Serialize message field [slide_L]
    bufferOffset = _serializer.float32(obj.slide_L, buffer, bufferOffset);
    // Serialize message field [joint1_L]
    bufferOffset = _serializer.float32(obj.joint1_L, buffer, bufferOffset);
    // Serialize message field [joint2_L]
    bufferOffset = _serializer.float32(obj.joint2_L, buffer, bufferOffset);
    // Serialize message field [joint3_L]
    bufferOffset = _serializer.float32(obj.joint3_L, buffer, bufferOffset);
    // Serialize message field [joint4_L]
    bufferOffset = _serializer.float32(obj.joint4_L, buffer, bufferOffset);
    // Serialize message field [joint5_L]
    bufferOffset = _serializer.float32(obj.joint5_L, buffer, bufferOffset);
    // Serialize message field [joint6_L]
    bufferOffset = _serializer.float32(obj.joint6_L, buffer, bufferOffset);
    // Serialize message field [joint7_L]
    bufferOffset = _serializer.float32(obj.joint7_L, buffer, bufferOffset);
    // Serialize message field [gripper_L]
    bufferOffset = _serializer.float32(obj.gripper_L, buffer, bufferOffset);
    return bufferOffset;
  }

  static deserialize(buffer, bufferOffset=[0]) {
    //deserializes a message object of type robotRequest
    let len;
    let data = new robotRequest(null);
    // Deserialize message field [slide_R]
    data.slide_R = _deserializer.float32(buffer, bufferOffset);
    // Deserialize message field [joint1_R]
    data.joint1_R = _deserializer.float32(buffer, bufferOffset);
    // Deserialize message field [joint2_R]
    data.joint2_R = _deserializer.float32(buffer, bufferOffset);
    // Deserialize message field [joint3_R]
    data.joint3_R = _deserializer.float32(buffer, bufferOffset);
    // Deserialize message field [joint4_R]
    data.joint4_R = _deserializer.float32(buffer, bufferOffset);
    // Deserialize message field [joint5_R]
    data.joint5_R = _deserializer.float32(buffer, bufferOffset);
    // Deserialize message field [joint6_R]
    data.joint6_R = _deserializer.float32(buffer, bufferOffset);
    // Deserialize message field [joint7_R]
    data.joint7_R = _deserializer.float32(buffer, bufferOffset);
    // Deserialize message field [gripper_R]
    data.gripper_R = _deserializer.float32(buffer, bufferOffset);
    // Deserialize message field [slide_L]
    data.slide_L = _deserializer.float32(buffer, bufferOffset);
    // Deserialize message field [joint1_L]
    data.joint1_L = _deserializer.float32(buffer, bufferOffset);
    // Deserialize message field [joint2_L]
    data.joint2_L = _deserializer.float32(buffer, bufferOffset);
    // Deserialize message field [joint3_L]
    data.joint3_L = _deserializer.float32(buffer, bufferOffset);
    // Deserialize message field [joint4_L]
    data.joint4_L = _deserializer.float32(buffer, bufferOffset);
    // Deserialize message field [joint5_L]
    data.joint5_L = _deserializer.float32(buffer, bufferOffset);
    // Deserialize message field [joint6_L]
    data.joint6_L = _deserializer.float32(buffer, bufferOffset);
    // Deserialize message field [joint7_L]
    data.joint7_L = _deserializer.float32(buffer, bufferOffset);
    // Deserialize message field [gripper_L]
    data.gripper_L = _deserializer.float32(buffer, bufferOffset);
    return data;
  }

  static getMessageSize(object) {
    return 72;
  }

  static datatype() {
    // Returns string type for a service object
    return 'dual_arm_control/robotRequest';
  }

  static md5sum() {
    //Returns md5sum for a message object
    return 'bb58b233829e057866371dd14661701c';
  }

  static messageDefinition() {
    // Returns full string definition for message
    return `
    float32 slide_R
    float32 joint1_R
    float32 joint2_R
    float32 joint3_R
    float32 joint4_R
    float32 joint5_R
    float32 joint6_R
    float32 joint7_R
    float32 gripper_R
    float32 slide_L
    float32 joint1_L
    float32 joint2_L
    float32 joint3_L
    float32 joint4_L
    float32 joint5_L
    float32 joint6_L
    float32 joint7_L
    float32 gripper_L
    
    `;
  }

  static Resolve(msg) {
    // deep-construct a valid message object instance of whatever was passed in
    if (typeof msg !== 'object' || msg === null) {
      msg = {};
    }
    const resolved = new robotRequest(null);
    if (msg.slide_R !== undefined) {
      resolved.slide_R = msg.slide_R;
    }
    else {
      resolved.slide_R = 0.0
    }

    if (msg.joint1_R !== undefined) {
      resolved.joint1_R = msg.joint1_R;
    }
    else {
      resolved.joint1_R = 0.0
    }

    if (msg.joint2_R !== undefined) {
      resolved.joint2_R = msg.joint2_R;
    }
    else {
      resolved.joint2_R = 0.0
    }

    if (msg.joint3_R !== undefined) {
      resolved.joint3_R = msg.joint3_R;
    }
    else {
      resolved.joint3_R = 0.0
    }

    if (msg.joint4_R !== undefined) {
      resolved.joint4_R = msg.joint4_R;
    }
    else {
      resolved.joint4_R = 0.0
    }

    if (msg.joint5_R !== undefined) {
      resolved.joint5_R = msg.joint5_R;
    }
    else {
      resolved.joint5_R = 0.0
    }

    if (msg.joint6_R !== undefined) {
      resolved.joint6_R = msg.joint6_R;
    }
    else {
      resolved.joint6_R = 0.0
    }

    if (msg.joint7_R !== undefined) {
      resolved.joint7_R = msg.joint7_R;
    }
    else {
      resolved.joint7_R = 0.0
    }

    if (msg.gripper_R !== undefined) {
      resolved.gripper_R = msg.gripper_R;
    }
    else {
      resolved.gripper_R = 0.0
    }

    if (msg.slide_L !== undefined) {
      resolved.slide_L = msg.slide_L;
    }
    else {
      resolved.slide_L = 0.0
    }

    if (msg.joint1_L !== undefined) {
      resolved.joint1_L = msg.joint1_L;
    }
    else {
      resolved.joint1_L = 0.0
    }

    if (msg.joint2_L !== undefined) {
      resolved.joint2_L = msg.joint2_L;
    }
    else {
      resolved.joint2_L = 0.0
    }

    if (msg.joint3_L !== undefined) {
      resolved.joint3_L = msg.joint3_L;
    }
    else {
      resolved.joint3_L = 0.0
    }

    if (msg.joint4_L !== undefined) {
      resolved.joint4_L = msg.joint4_L;
    }
    else {
      resolved.joint4_L = 0.0
    }

    if (msg.joint5_L !== undefined) {
      resolved.joint5_L = msg.joint5_L;
    }
    else {
      resolved.joint5_L = 0.0
    }

    if (msg.joint6_L !== undefined) {
      resolved.joint6_L = msg.joint6_L;
    }
    else {
      resolved.joint6_L = 0.0
    }

    if (msg.joint7_L !== undefined) {
      resolved.joint7_L = msg.joint7_L;
    }
    else {
      resolved.joint7_L = 0.0
    }

    if (msg.gripper_L !== undefined) {
      resolved.gripper_L = msg.gripper_L;
    }
    else {
      resolved.gripper_L = 0.0
    }

    return resolved;
    }
};

class robotResponse {
  constructor(initObj={}) {
    if (initObj === null) {
      // initObj === null is a special case for deserialization where we don't initialize fields
      this.state = null;
    }
    else {
      if (initObj.hasOwnProperty('state')) {
        this.state = initObj.state
      }
      else {
        this.state = '';
      }
    }
  }

  static serialize(obj, buffer, bufferOffset) {
    // Serializes a message object of type robotResponse
    // Serialize message field [state]
    bufferOffset = _serializer.string(obj.state, buffer, bufferOffset);
    return bufferOffset;
  }

  static deserialize(buffer, bufferOffset=[0]) {
    //deserializes a message object of type robotResponse
    let len;
    let data = new robotResponse(null);
    // Deserialize message field [state]
    data.state = _deserializer.string(buffer, bufferOffset);
    return data;
  }

  static getMessageSize(object) {
    let length = 0;
    length += object.state.length;
    return length + 4;
  }

  static datatype() {
    // Returns string type for a service object
    return 'dual_arm_control/robotResponse';
  }

  static md5sum() {
    //Returns md5sum for a message object
    return 'af6d3a99f0fbeb66d3248fa4b3e675fb';
  }

  static messageDefinition() {
    // Returns full string definition for message
    return `
    string state
    
    
    `;
  }

  static Resolve(msg) {
    // deep-construct a valid message object instance of whatever was passed in
    if (typeof msg !== 'object' || msg === null) {
      msg = {};
    }
    const resolved = new robotResponse(null);
    if (msg.state !== undefined) {
      resolved.state = msg.state;
    }
    else {
      resolved.state = ''
    }

    return resolved;
    }
};

module.exports = {
  Request: robotRequest,
  Response: robotResponse,
  md5sum() { return '302798b026bfb5b41c3f90f1e942eb92'; },
  datatype() { return 'dual_arm_control/robot'; }
};
