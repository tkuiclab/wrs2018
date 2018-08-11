// Auto-generated. Do not edit!

// (in-package linear_motion.msg)


"use strict";

const _serializer = _ros_msg_utils.Serialize;
const _arraySerializer = _serializer.Array;
const _deserializer = _ros_msg_utils.Deserialize;
const _arrayDeserializer = _deserializer.Array;
const _finder = _ros_msg_utils.Find;
const _getByteLength = _ros_msg_utils.getByteLength;

//-----------------------------------------------------------

class LM_Cmd {
  constructor(initObj={}) {
    if (initObj === null) {
      // initObj === null is a special case for deserialization where we don't initialize fields
      this.id = null;
      this.x = null;
      this.z = null;
      this.left = null;
      this.x_curr_pos = null;
      this.z_curr_pos = null;
      this.left_curr_pos = null;
      this.is_busy = null;
      this.status = null;
    }
    else {
      if (initObj.hasOwnProperty('id')) {
        this.id = initObj.id
      }
      else {
        this.id = 0;
      }
      if (initObj.hasOwnProperty('x')) {
        this.x = initObj.x
      }
      else {
        this.x = 0;
      }
      if (initObj.hasOwnProperty('z')) {
        this.z = initObj.z
      }
      else {
        this.z = 0;
      }
      if (initObj.hasOwnProperty('left')) {
        this.left = initObj.left
      }
      else {
        this.left = 0;
      }
      if (initObj.hasOwnProperty('x_curr_pos')) {
        this.x_curr_pos = initObj.x_curr_pos
      }
      else {
        this.x_curr_pos = 0;
      }
      if (initObj.hasOwnProperty('z_curr_pos')) {
        this.z_curr_pos = initObj.z_curr_pos
      }
      else {
        this.z_curr_pos = 0;
      }
      if (initObj.hasOwnProperty('left_curr_pos')) {
        this.left_curr_pos = initObj.left_curr_pos
      }
      else {
        this.left_curr_pos = 0;
      }
      if (initObj.hasOwnProperty('is_busy')) {
        this.is_busy = initObj.is_busy
      }
      else {
        this.is_busy = false;
      }
      if (initObj.hasOwnProperty('status')) {
        this.status = initObj.status
      }
      else {
        this.status = '';
      }
    }
  }

  static serialize(obj, buffer, bufferOffset) {
    // Serializes a message object of type LM_Cmd
    // Serialize message field [id]
    bufferOffset = _serializer.int32(obj.id, buffer, bufferOffset);
    // Serialize message field [x]
    bufferOffset = _serializer.int32(obj.x, buffer, bufferOffset);
    // Serialize message field [z]
    bufferOffset = _serializer.int32(obj.z, buffer, bufferOffset);
    // Serialize message field [left]
    bufferOffset = _serializer.int32(obj.left, buffer, bufferOffset);
    // Serialize message field [x_curr_pos]
    bufferOffset = _serializer.int32(obj.x_curr_pos, buffer, bufferOffset);
    // Serialize message field [z_curr_pos]
    bufferOffset = _serializer.int32(obj.z_curr_pos, buffer, bufferOffset);
    // Serialize message field [left_curr_pos]
    bufferOffset = _serializer.int32(obj.left_curr_pos, buffer, bufferOffset);
    // Serialize message field [is_busy]
    bufferOffset = _serializer.bool(obj.is_busy, buffer, bufferOffset);
    // Serialize message field [status]
    bufferOffset = _serializer.string(obj.status, buffer, bufferOffset);
    return bufferOffset;
  }

  static deserialize(buffer, bufferOffset=[0]) {
    //deserializes a message object of type LM_Cmd
    let len;
    let data = new LM_Cmd(null);
    // Deserialize message field [id]
    data.id = _deserializer.int32(buffer, bufferOffset);
    // Deserialize message field [x]
    data.x = _deserializer.int32(buffer, bufferOffset);
    // Deserialize message field [z]
    data.z = _deserializer.int32(buffer, bufferOffset);
    // Deserialize message field [left]
    data.left = _deserializer.int32(buffer, bufferOffset);
    // Deserialize message field [x_curr_pos]
    data.x_curr_pos = _deserializer.int32(buffer, bufferOffset);
    // Deserialize message field [z_curr_pos]
    data.z_curr_pos = _deserializer.int32(buffer, bufferOffset);
    // Deserialize message field [left_curr_pos]
    data.left_curr_pos = _deserializer.int32(buffer, bufferOffset);
    // Deserialize message field [is_busy]
    data.is_busy = _deserializer.bool(buffer, bufferOffset);
    // Deserialize message field [status]
    data.status = _deserializer.string(buffer, bufferOffset);
    return data;
  }

  static getMessageSize(object) {
    let length = 0;
    length += object.status.length;
    return length + 33;
  }

  static datatype() {
    // Returns string type for a message object
    return 'linear_motion/LM_Cmd';
  }

  static md5sum() {
    //Returns md5sum for a message object
    return '8a5050a3fcf89f1ce1c712656c2d84a1';
  }

  static messageDefinition() {
    // Returns full string definition for message
    return `
    int32 id
    
    int32 x
    int32 z
    int32 left
    
    int32 x_curr_pos
    int32 z_curr_pos
    int32 left_curr_pos
    
    bool is_busy
    string status 
    `;
  }

  static Resolve(msg) {
    // deep-construct a valid message object instance of whatever was passed in
    if (typeof msg !== 'object' || msg === null) {
      msg = {};
    }
    const resolved = new LM_Cmd(null);
    if (msg.id !== undefined) {
      resolved.id = msg.id;
    }
    else {
      resolved.id = 0
    }

    if (msg.x !== undefined) {
      resolved.x = msg.x;
    }
    else {
      resolved.x = 0
    }

    if (msg.z !== undefined) {
      resolved.z = msg.z;
    }
    else {
      resolved.z = 0
    }

    if (msg.left !== undefined) {
      resolved.left = msg.left;
    }
    else {
      resolved.left = 0
    }

    if (msg.x_curr_pos !== undefined) {
      resolved.x_curr_pos = msg.x_curr_pos;
    }
    else {
      resolved.x_curr_pos = 0
    }

    if (msg.z_curr_pos !== undefined) {
      resolved.z_curr_pos = msg.z_curr_pos;
    }
    else {
      resolved.z_curr_pos = 0
    }

    if (msg.left_curr_pos !== undefined) {
      resolved.left_curr_pos = msg.left_curr_pos;
    }
    else {
      resolved.left_curr_pos = 0
    }

    if (msg.is_busy !== undefined) {
      resolved.is_busy = msg.is_busy;
    }
    else {
      resolved.is_busy = false
    }

    if (msg.status !== undefined) {
      resolved.status = msg.status;
    }
    else {
      resolved.status = ''
    }

    return resolved;
    }
};

module.exports = LM_Cmd;
