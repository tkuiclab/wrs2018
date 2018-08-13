// Generated by gencpp from file manipulator_h_base_module_msgs/GetKinematicsPoseRequest.msg
// DO NOT EDIT!


#ifndef MANIPULATOR_H_BASE_MODULE_MSGS_MESSAGE_GETKINEMATICSPOSEREQUEST_H
#define MANIPULATOR_H_BASE_MODULE_MSGS_MESSAGE_GETKINEMATICSPOSEREQUEST_H


#include <string>
#include <vector>
#include <map>

#include <ros/types.h>
#include <ros/serialization.h>
#include <ros/builtin_message_traits.h>
#include <ros/message_operations.h>


namespace manipulator_h_base_module_msgs
{
template <class ContainerAllocator>
struct GetKinematicsPoseRequest_
{
  typedef GetKinematicsPoseRequest_<ContainerAllocator> Type;

  GetKinematicsPoseRequest_()
    : group_name()  {
    }
  GetKinematicsPoseRequest_(const ContainerAllocator& _alloc)
    : group_name(_alloc)  {
  (void)_alloc;
    }



   typedef std::basic_string<char, std::char_traits<char>, typename ContainerAllocator::template rebind<char>::other >  _group_name_type;
  _group_name_type group_name;





  typedef boost::shared_ptr< ::manipulator_h_base_module_msgs::GetKinematicsPoseRequest_<ContainerAllocator> > Ptr;
  typedef boost::shared_ptr< ::manipulator_h_base_module_msgs::GetKinematicsPoseRequest_<ContainerAllocator> const> ConstPtr;

}; // struct GetKinematicsPoseRequest_

typedef ::manipulator_h_base_module_msgs::GetKinematicsPoseRequest_<std::allocator<void> > GetKinematicsPoseRequest;

typedef boost::shared_ptr< ::manipulator_h_base_module_msgs::GetKinematicsPoseRequest > GetKinematicsPoseRequestPtr;
typedef boost::shared_ptr< ::manipulator_h_base_module_msgs::GetKinematicsPoseRequest const> GetKinematicsPoseRequestConstPtr;

// constants requiring out of line definition



template<typename ContainerAllocator>
std::ostream& operator<<(std::ostream& s, const ::manipulator_h_base_module_msgs::GetKinematicsPoseRequest_<ContainerAllocator> & v)
{
ros::message_operations::Printer< ::manipulator_h_base_module_msgs::GetKinematicsPoseRequest_<ContainerAllocator> >::stream(s, "", v);
return s;
}

} // namespace manipulator_h_base_module_msgs

namespace ros
{
namespace message_traits
{



// BOOLTRAITS {'IsFixedSize': False, 'IsMessage': True, 'HasHeader': False}
// {'geometry_msgs': ['/opt/ros/kinetic/share/geometry_msgs/cmake/../msg'], 'std_msgs': ['/opt/ros/kinetic/share/std_msgs/cmake/../msg'], 'manipulator_h_base_module_msgs': ['/home/wrs/wrs2018/wrs_ws/src/ROBOTIS/ROBOTIS-MANIPULATOR-H/manipulator_h_base_module_msgs/msg']}

// !!!!!!!!!!! ['__class__', '__delattr__', '__dict__', '__doc__', '__eq__', '__format__', '__getattribute__', '__hash__', '__init__', '__module__', '__ne__', '__new__', '__reduce__', '__reduce_ex__', '__repr__', '__setattr__', '__sizeof__', '__str__', '__subclasshook__', '__weakref__', '_parsed_fields', 'constants', 'fields', 'full_name', 'has_header', 'header_present', 'names', 'package', 'parsed_fields', 'short_name', 'text', 'types']




template <class ContainerAllocator>
struct IsFixedSize< ::manipulator_h_base_module_msgs::GetKinematicsPoseRequest_<ContainerAllocator> >
  : FalseType
  { };

template <class ContainerAllocator>
struct IsFixedSize< ::manipulator_h_base_module_msgs::GetKinematicsPoseRequest_<ContainerAllocator> const>
  : FalseType
  { };

template <class ContainerAllocator>
struct IsMessage< ::manipulator_h_base_module_msgs::GetKinematicsPoseRequest_<ContainerAllocator> >
  : TrueType
  { };

template <class ContainerAllocator>
struct IsMessage< ::manipulator_h_base_module_msgs::GetKinematicsPoseRequest_<ContainerAllocator> const>
  : TrueType
  { };

template <class ContainerAllocator>
struct HasHeader< ::manipulator_h_base_module_msgs::GetKinematicsPoseRequest_<ContainerAllocator> >
  : FalseType
  { };

template <class ContainerAllocator>
struct HasHeader< ::manipulator_h_base_module_msgs::GetKinematicsPoseRequest_<ContainerAllocator> const>
  : FalseType
  { };


template<class ContainerAllocator>
struct MD5Sum< ::manipulator_h_base_module_msgs::GetKinematicsPoseRequest_<ContainerAllocator> >
{
  static const char* value()
  {
    return "967d0b0c0d858ded8a6a69abbce0c981";
  }

  static const char* value(const ::manipulator_h_base_module_msgs::GetKinematicsPoseRequest_<ContainerAllocator>&) { return value(); }
  static const uint64_t static_value1 = 0x967d0b0c0d858dedULL;
  static const uint64_t static_value2 = 0x8a6a69abbce0c981ULL;
};

template<class ContainerAllocator>
struct DataType< ::manipulator_h_base_module_msgs::GetKinematicsPoseRequest_<ContainerAllocator> >
{
  static const char* value()
  {
    return "manipulator_h_base_module_msgs/GetKinematicsPoseRequest";
  }

  static const char* value(const ::manipulator_h_base_module_msgs::GetKinematicsPoseRequest_<ContainerAllocator>&) { return value(); }
};

template<class ContainerAllocator>
struct Definition< ::manipulator_h_base_module_msgs::GetKinematicsPoseRequest_<ContainerAllocator> >
{
  static const char* value()
  {
    return "string    group_name\n\
";
  }

  static const char* value(const ::manipulator_h_base_module_msgs::GetKinematicsPoseRequest_<ContainerAllocator>&) { return value(); }
};

} // namespace message_traits
} // namespace ros

namespace ros
{
namespace serialization
{

  template<class ContainerAllocator> struct Serializer< ::manipulator_h_base_module_msgs::GetKinematicsPoseRequest_<ContainerAllocator> >
  {
    template<typename Stream, typename T> inline static void allInOne(Stream& stream, T m)
    {
      stream.next(m.group_name);
    }

    ROS_DECLARE_ALLINONE_SERIALIZER
  }; // struct GetKinematicsPoseRequest_

} // namespace serialization
} // namespace ros

namespace ros
{
namespace message_operations
{

template<class ContainerAllocator>
struct Printer< ::manipulator_h_base_module_msgs::GetKinematicsPoseRequest_<ContainerAllocator> >
{
  template<typename Stream> static void stream(Stream& s, const std::string& indent, const ::manipulator_h_base_module_msgs::GetKinematicsPoseRequest_<ContainerAllocator>& v)
  {
    s << indent << "group_name: ";
    Printer<std::basic_string<char, std::char_traits<char>, typename ContainerAllocator::template rebind<char>::other > >::stream(s, indent + "  ", v.group_name);
  }
};

} // namespace message_operations
} // namespace ros

#endif // MANIPULATOR_H_BASE_MODULE_MSGS_MESSAGE_GETKINEMATICSPOSEREQUEST_H
