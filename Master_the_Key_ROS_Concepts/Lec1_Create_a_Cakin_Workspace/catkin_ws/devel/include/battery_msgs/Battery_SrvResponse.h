// Generated by gencpp from file battery_msgs/Battery_SrvResponse.msg
// DO NOT EDIT!


#ifndef BATTERY_MSGS_MESSAGE_BATTERY_SRVRESPONSE_H
#define BATTERY_MSGS_MESSAGE_BATTERY_SRVRESPONSE_H


#include <string>
#include <vector>
#include <memory>

#include <ros/types.h>
#include <ros/serialization.h>
#include <ros/builtin_message_traits.h>
#include <ros/message_operations.h>


namespace battery_msgs
{
template <class ContainerAllocator>
struct Battery_SrvResponse_
{
  typedef Battery_SrvResponse_<ContainerAllocator> Type;

  Battery_SrvResponse_()
    : success(false)  {
    }
  Battery_SrvResponse_(const ContainerAllocator& _alloc)
    : success(false)  {
  (void)_alloc;
    }



   typedef uint8_t _success_type;
  _success_type success;





  typedef boost::shared_ptr< ::battery_msgs::Battery_SrvResponse_<ContainerAllocator> > Ptr;
  typedef boost::shared_ptr< ::battery_msgs::Battery_SrvResponse_<ContainerAllocator> const> ConstPtr;

}; // struct Battery_SrvResponse_

typedef ::battery_msgs::Battery_SrvResponse_<std::allocator<void> > Battery_SrvResponse;

typedef boost::shared_ptr< ::battery_msgs::Battery_SrvResponse > Battery_SrvResponsePtr;
typedef boost::shared_ptr< ::battery_msgs::Battery_SrvResponse const> Battery_SrvResponseConstPtr;

// constants requiring out of line definition



template<typename ContainerAllocator>
std::ostream& operator<<(std::ostream& s, const ::battery_msgs::Battery_SrvResponse_<ContainerAllocator> & v)
{
ros::message_operations::Printer< ::battery_msgs::Battery_SrvResponse_<ContainerAllocator> >::stream(s, "", v);
return s;
}


template<typename ContainerAllocator1, typename ContainerAllocator2>
bool operator==(const ::battery_msgs::Battery_SrvResponse_<ContainerAllocator1> & lhs, const ::battery_msgs::Battery_SrvResponse_<ContainerAllocator2> & rhs)
{
  return lhs.success == rhs.success;
}

template<typename ContainerAllocator1, typename ContainerAllocator2>
bool operator!=(const ::battery_msgs::Battery_SrvResponse_<ContainerAllocator1> & lhs, const ::battery_msgs::Battery_SrvResponse_<ContainerAllocator2> & rhs)
{
  return !(lhs == rhs);
}


} // namespace battery_msgs

namespace ros
{
namespace message_traits
{





template <class ContainerAllocator>
struct IsMessage< ::battery_msgs::Battery_SrvResponse_<ContainerAllocator> >
  : TrueType
  { };

template <class ContainerAllocator>
struct IsMessage< ::battery_msgs::Battery_SrvResponse_<ContainerAllocator> const>
  : TrueType
  { };

template <class ContainerAllocator>
struct IsFixedSize< ::battery_msgs::Battery_SrvResponse_<ContainerAllocator> >
  : TrueType
  { };

template <class ContainerAllocator>
struct IsFixedSize< ::battery_msgs::Battery_SrvResponse_<ContainerAllocator> const>
  : TrueType
  { };

template <class ContainerAllocator>
struct HasHeader< ::battery_msgs::Battery_SrvResponse_<ContainerAllocator> >
  : FalseType
  { };

template <class ContainerAllocator>
struct HasHeader< ::battery_msgs::Battery_SrvResponse_<ContainerAllocator> const>
  : FalseType
  { };


template<class ContainerAllocator>
struct MD5Sum< ::battery_msgs::Battery_SrvResponse_<ContainerAllocator> >
{
  static const char* value()
  {
    return "358e233cde0c8a8bcfea4ce193f8fc15";
  }

  static const char* value(const ::battery_msgs::Battery_SrvResponse_<ContainerAllocator>&) { return value(); }
  static const uint64_t static_value1 = 0x358e233cde0c8a8bULL;
  static const uint64_t static_value2 = 0xcfea4ce193f8fc15ULL;
};

template<class ContainerAllocator>
struct DataType< ::battery_msgs::Battery_SrvResponse_<ContainerAllocator> >
{
  static const char* value()
  {
    return "battery_msgs/Battery_SrvResponse";
  }

  static const char* value(const ::battery_msgs::Battery_SrvResponse_<ContainerAllocator>&) { return value(); }
};

template<class ContainerAllocator>
struct Definition< ::battery_msgs::Battery_SrvResponse_<ContainerAllocator> >
{
  static const char* value()
  {
    return "bool success\n"
"\n"
;
  }

  static const char* value(const ::battery_msgs::Battery_SrvResponse_<ContainerAllocator>&) { return value(); }
};

} // namespace message_traits
} // namespace ros

namespace ros
{
namespace serialization
{

  template<class ContainerAllocator> struct Serializer< ::battery_msgs::Battery_SrvResponse_<ContainerAllocator> >
  {
    template<typename Stream, typename T> inline static void allInOne(Stream& stream, T m)
    {
      stream.next(m.success);
    }

    ROS_DECLARE_ALLINONE_SERIALIZER
  }; // struct Battery_SrvResponse_

} // namespace serialization
} // namespace ros

namespace ros
{
namespace message_operations
{

template<class ContainerAllocator>
struct Printer< ::battery_msgs::Battery_SrvResponse_<ContainerAllocator> >
{
  template<typename Stream> static void stream(Stream& s, const std::string& indent, const ::battery_msgs::Battery_SrvResponse_<ContainerAllocator>& v)
  {
    s << indent << "success: ";
    Printer<uint8_t>::stream(s, indent + "  ", v.success);
  }
};

} // namespace message_operations
} // namespace ros

#endif // BATTERY_MSGS_MESSAGE_BATTERY_SRVRESPONSE_H
