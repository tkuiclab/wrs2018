// Generated by gencpp from file robotis_controller_msgs/SetModuleResponse.msg
// DO NOT EDIT!


#ifndef ROBOTIS_CONTROLLER_MSGS_MESSAGE_SETMODULERESPONSE_H
#define ROBOTIS_CONTROLLER_MSGS_MESSAGE_SETMODULERESPONSE_H


#include <string>
#include <vector>
#include <map>

#include <ros/types.h>
#include <ros/serialization.h>
#include <ros/builtin_message_traits.h>
#include <ros/message_operations.h>


namespace robotis_controller_msgs
{
template <class ContainerAllocator>
struct SetModuleResponse_
{
  typedef SetModuleResponse_<ContainerAllocator> Type;

  SetModuleResponse_()
    : result(false)  {
    }
  SetModuleResponse_(const ContainerAllocator& _alloc)
    : result(false)  {
  (void)_alloc;
    }



   typedef uint8_t _result_type;
  _result_type result;





  typedef boost::shared_ptr< ::robotis_controller_msgs::SetModuleResponse_<ContainerAllocator> > Ptr;
  typedef boost::shared_ptr< ::robotis_controller_msgs::SetModuleResponse_<ContainerAllocator> const> ConstPtr;

}; // struct SetModuleResponse_

typedef ::robotis_controller_msgs::SetModuleResponse_<std::allocator<void> > SetModuleResponse;

typedef boost::shared_ptr< ::robotis_controller_msgs::SetModuleResponse > SetModuleResponsePtr;
typedef boost::shared_ptr< ::robotis_controller_msgs::SetModuleResponse const> SetModuleResponseConstPtr;

// constants requiring out of line definition



template<typename ContainerAllocator>
std::ostream& operator<<(std::ostream& s, const ::robotis_controller_msgs::SetModuleResponse_<ContainerAllocator> & v)
{
ros::message_operations::Printer< ::robotis_controller_msgs::SetModuleResponse_<ContainerAllocator> >::stream(s, "", v);
return s;
}

} // namespace robotis_controller_msgs

namespace ros
{
namespace message_traits
{



// BOOLTRAITS {'IsFixedSize': True, 'IsMessage': True, 'HasHeader': False}
// {'sensor_msgs': ['/opt/ros/kinetic/share/sensor_msgs/cmake/../msg'], 'robotis_controller_msgs': ['/home/wrs/wrs2018/wrs_ws/src/ROBOTIS/ROBOTIS-Framework-msgs/robotis_controller_msgs/msg'], 'std_msgs': ['/opt/ros/kinetic/share/std_msgs/cmake/../msg'], 'geometry_msgs': ['/opt/ros/kinetic/share/geometry_msgs/cmake/../msg']}

// !!!!!!!!!!! ['__class__', '__delattr__', '__dict__', '__doc__', '__eq__', '__format__', '__getattribute__', '__hash__', '__init__', '__module__', '__ne__', '__new__', '__reduce__', '__reduce_ex__', '__repr__', '__setattr__', '__sizeof__', '__str__', '__subclasshook__', '__weakref__', '_parsed_fields', 'constants', 'fields', 'full_name', 'has_header', 'header_present', 'names', 'package', 'parsed_fields', 'short_name', 'text', 'types']




template <class ContainerAllocator>
struct IsFixedSize< ::robotis_controller_msgs::SetModuleResponse_<ContainerAllocator> >
  : TrueType
  { };

template <class ContainerAllocator>
struct IsFixedSize< ::robotis_controller_msgs::SetModuleResponse_<ContainerAllocator> const>
  : TrueType
  { };

template <class ContainerAllocator>
struct IsMessage< ::robotis_controller_msgs::SetModuleResponse_<ContainerAllocator> >
  : TrueType
  { };

template <class ContainerAllocator>
struct IsMessage< ::robotis_controller_msgs::SetModuleResponse_<ContainerAllocator> const>
  : TrueType
  { };

template <class ContainerAllocator>
struct HasHeader< ::robotis_controller_msgs::SetModuleResponse_<ContainerAllocator> >
  : FalseType
  { };

template <class ContainerAllocator>
struct HasHeader< ::robotis_controller_msgs::SetModuleResponse_<ContainerAllocator> const>
  : FalseType
  { };


template<class ContainerAllocator>
struct MD5Sum< ::robotis_controller_msgs::SetModuleResponse_<ContainerAllocator> >
{
  static const char* value()
  {
    return "eb13ac1f1354ccecb7941ee8fa2192e8";
  }

  static const char* value(const ::robotis_controller_msgs::SetModuleResponse_<ContainerAllocator>&) { return value(); }
  static const uint64_t static_value1 = 0xeb13ac1f1354ccecULL;
  static const uint64_t static_value2 = 0xb7941ee8fa2192e8ULL;
};

template<class ContainerAllocator>
struct DataType< ::robotis_controller_msgs::SetModuleResponse_<ContainerAllocator> >
{
  static const char* value()
  {
    return "robotis_controller_msgs/SetModuleResponse";
  }

  static const char* value(const ::robotis_controller_msgs::SetModuleResponse_<ContainerAllocator>&) { return value(); }
};

template<class ContainerAllocator>
struct Definition< ::robotis_controller_msgs::SetModuleResponse_<ContainerAllocator> >
{
  static const char* value()
  {
    return "bool result\n\
";
  }

  static const char* value(const ::robotis_controller_msgs::SetModuleResponse_<ContainerAllocator>&) { return value(); }
};

} // namespace message_traits
} // namespace ros

namespace ros
{
namespace serialization
{

  template<class ContainerAllocator> struct Serializer< ::robotis_controller_msgs::SetModuleResponse_<ContainerAllocator> >
  {
    template<typename Stream, typename T> inline static void allInOne(Stream& stream, T m)
    {
      stream.next(m.result);
    }

    ROS_DECLARE_ALLINONE_SERIALIZER
  }; // struct SetModuleResponse_

} // namespace serialization
} // namespace ros

namespace ros
{
namespace message_operations
{

template<class ContainerAllocator>
struct Printer< ::robotis_controller_msgs::SetModuleResponse_<ContainerAllocator> >
{
  template<typename Stream> static void stream(Stream& s, const std::string& indent, const ::robotis_controller_msgs::SetModuleResponse_<ContainerAllocator>& v)
  {
    s << indent << "result: ";
    Printer<uint8_t>::stream(s, indent + "  ", v.result);
  }
};

} // namespace message_operations
} // namespace ros

#endif // ROBOTIS_CONTROLLER_MSGS_MESSAGE_SETMODULERESPONSE_H
