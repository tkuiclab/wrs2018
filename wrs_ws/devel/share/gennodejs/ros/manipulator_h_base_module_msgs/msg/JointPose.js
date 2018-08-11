// Auto-generated. Do not edit!

// (in-package manipulator_h_base_module_msgs.msg)


"use strict";

const _serializer = _ros_msg_utils.Serialize;
const _arraySerializer = _serializer.Array;
const _deserializer = _ros_msg_utils.Deserialize;
const _arrayDeserializer = _deserializer.Array;
const _finder = _ros_msg_utils.Find;
const _getByteLength = _ros_msg_utils.getByteLength;

//-----------------------------------------------------------

class JointPose {
  constructor(initObj={}) {
    if (initObj === null) {
      // initObj === null is a special case for deserialization where we don't initialize fields
      this.name = null;
      this.value = null;
      this.slide_pos = null;
    }
    else {
      if (initObj.hasOwnProperty('name')) {
        this.name = initObj.name
      }
      else {
        this.name = [];
      }
      if (initObj.hasOwnProperty('value')) {
        this.value = initObj.value
      }
      else {
        this.value = [];
      }
      if (initObj.hasOwnProperty('slide_pos')) {
        this.slide_pos = initObj.slide_pos
      }
      else {
        this.slide_pos = 0.0;
      }
    }
  }

  static serialize(obj, buffer, bufferOffset) {
    // Serializes a message object of type JointPose
    // Serialize message field [name]
    bufferOffset = _arraySerializer.string(obj.name, buffer, bufferOffset, null);
    // Serialize message field [value]
    bufferOffset = _arraySerializer.float64(obj.value, buffer, bufferOffset, null);
    // Serialize message field [slide_pos]
    bufferOffset = _serializer.float64(obj.slide_pos, buffer, bufferOffset);
    return bufferOffset;
  }

  static deserialize(buffer, bufferOffset=[0]) {
    //deserializes a message object of type JointPose
    let len;
    let data = new JointPose(null);
    // Deserialize message field [name]
    data.name = _arrayDeserializer.string(buffer, bufferOffset, null)
    // Deserialize message field [value]
    data.value = _arrayDeserializer.float64(buffer, bufferOffset, null)
    // Deserialize message field [slide_pos]
    data.slide_pos = _deserializer.float64(buffer, bufferOffset);
    return data;
  }

  static getMessageSize(object) {
    let length = 0;
    object.name.forEach((val) => {
      length += 4 + val.length;
    });
    length += 8 * object.value.length;
    return length + 16;
  }

  static datatype() {
    // Returns string type for a message object
    return 'manipulator_h_base_module_msgs/JointPose';
  }

  static md5sum() {
    //Returns md5sum for a message object
    return '176844734ff1e686d883687541cbc2ab';
  }

  static messageDefinition() {
    // Returns full string definition for message
    return `
    string[]    name
    float64[]   value
    float64     slide_pos
    
    `;
  }

  static Resolve(msg) {
    // deep-construct a valid message object instance of whatever was passed in
    if (typeof msg !== 'object' || msg === null) {
      msg = {};
    }
    const resolved = new JointPose(null);
    if (msg.name !== undefined) {
      resolved.name = msg.name;
    }
    else {
      resolved.name = []
    }

    if (msg.value !== undefined) {
      resolved.value = msg.value;
    }
    else {
      resolved.value = []
    }

    if (msg.slide_pos !== undefined) {
      resolved.slide_pos = msg.slide_pos;
    }
    else {
      resolved.slide_pos = 0.0
    }

    return resolved;
    }
};

module.exports = JointPose;
