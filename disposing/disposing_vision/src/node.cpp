#include <ros/ros.h>
#include <geometry_msgs/Point.h>
// PCL specific includes
#include <sensor_msgs/PointCloud2.h>
#include <pcl_conversions/pcl_conversions.h>
#include <pcl/point_cloud.h>
#include <pcl/point_types.h>
#include <iostream>

#include "pcl_tutorial.h"
#include "disposing_vision/coordinate_normal.h"

ros::Publisher pub;
Pcl_tutorial Pcl_function;
float x_coordinate_min,y_coordinate_min,z_coordinate_min;
float x_coordinate_Max,y_coordinate_Max,z_coordinate_Max;
disposing_vision::coordinate_normal object_normal;

disposing_vision::coordinate_normal average_normal(pcl::PointCloud<pcl::PointXYZRGB>::Ptr input_cloud
                                                  ,pcl::PointCloud<pcl::PointNormal>::Ptr input_normal){

  disposing_vision::coordinate_normal average_normal;
  average_normal.x=0;
  average_normal.y=0;
  average_normal.z=0;
  average_normal.normal_x = 0.0;
  average_normal.normal_y = 0.0;
  average_normal.normal_z = 0.0;
  int count = 0;

  for (size_t currentPoint = 0; currentPoint < input_normal->points.size(); currentPoint++)
	{
    if(!(isnan(input_normal->points[currentPoint].normal[0])||
         isnan(input_normal->points[currentPoint].normal[1])||
         isnan(input_normal->points[currentPoint].normal[2])))
    {
      average_normal.x = average_normal.x + input_cloud->points[currentPoint].x;
      average_normal.y = average_normal.y + input_cloud->points[currentPoint].y;
      average_normal.z = average_normal.z + input_cloud->points[currentPoint].z;
      average_normal.normal_x = average_normal.normal_x + input_normal->points[currentPoint].normal[0];
      average_normal.normal_y = average_normal.normal_y + input_normal->points[currentPoint].normal[1];
      average_normal.normal_z = average_normal.normal_z + input_normal->points[currentPoint].normal[2];
		  
      count++;
      // std::cout << "Point:" << std::endl;
      // cout << currentPoint << std::endl;
		  // std::cout << "\town:" << average_normal.normal_x << " "
		  		                  // << average_normal.normal_y << " "
		  		                  // << average_normal.normal_z << std::endl;

		  // std::cout << "\tNormal:" << input_cloud->points[currentPoint].x << " "
		  // 		                      << input_cloud->points[currentPoint].y << " "
		  // 		                      << input_cloud->points[currentPoint].z << std::endl;
    }
  }
  // printf("================\ncloud_size = %d \n",count);

  average_normal.x = average_normal.x/count;
  average_normal.y = average_normal.y/count;
  average_normal.z = average_normal.z/count;
  average_normal.normal_x = average_normal.normal_x/count;
  average_normal.normal_y = average_normal.normal_y/count;
  average_normal.normal_z = average_normal.normal_z/count;
  
  return average_normal;
}

void 
cloud_cb (const sensor_msgs::PointCloud2ConstPtr& input)
{
  // 将点云格式为sensor_msgs/PointCloud2 格式转为 pcl/PointCloud
  pcl::PointCloud<pcl::PointXYZRGB>::Ptr cloud(new pcl::PointCloud<pcl::PointXYZRGB>);
  pcl::fromROSMsg (*input, *cloud);   //关键的一句数据的转换
//------------------------------------------------------------------------------
  pcl::PointCloud<pcl::PointXYZRGB>::Ptr object_cloud(new pcl::PointCloud<pcl::PointXYZRGB>);
  pcl::PointCloud<pcl::PointXYZRGB>::Ptr plane_cloud(new pcl::PointCloud<pcl::PointXYZRGB>);

  //cylinder_segmentation
  // Pcl_function.cylinder_segmentation(cloud,object_cloud,plane_cloud);

  //passthrough
  // Pcl_function.passthrough(cloud,object_cloud,"x",x_coordinate_min,x_coordinate_Max);
  // Pcl_function.passthrough(cloud,object_cloud,"y",y_coordinate_min,y_coordinate_Max);
  Pcl_function.passthrough(cloud,object_cloud,"z",z_coordinate_min,z_coordinate_Max);

  pcl::PointCloud<pcl::PointNormal>::Ptr cloud_normal (new pcl::PointCloud<pcl::PointNormal>);
  Pcl_function.calculate_normal(object_cloud,cloud_normal);

  object_normal = average_normal(object_cloud,cloud_normal);

	std::cout << "\tTotal Point:" << object_normal.x << " "
			                          << object_normal.y << " "
			                          << object_normal.z << std::endl;
	std::cout << "\tTotal Normal:" << object_normal.normal_x << " "
			                           << object_normal.normal_y << " "
			                           << object_normal.normal_z << std::endl;
  
  //<<<Save file for debug>>>
  // pcl::PCDWriter writer;
  // writer.write ("object.pcd", *object_cloud, false);
  // writer.write ("plane.pcd", *plane_cloud, false);

  pub.publish (object_normal);
}

void set_coordinate_limit_min(const geometry_msgs::Point& input)
{
  x_coordinate_min = input.x;
  printf("x_coordinatee_min = %f\n",x_coordinate_min);
  y_coordinate_min = input.y;
  printf("y_coordinatee_min = %f\n",y_coordinate_min);
  z_coordinate_min = input.z;
  printf("z_coordinatee_min = %f\n",z_coordinate_min);
}

void set_coordinate_limit_Max(const geometry_msgs::Point& input)
{
  x_coordinate_Max = input.x;
  printf("x_coordinate_Max = %f\n",x_coordinate_Max);  
  y_coordinate_Max = input.y;
  printf("y_coordinate_Max = %f\n",y_coordinate_Max);  
  z_coordinate_Max = input.z;
  printf("z_coordinate_Max = %f\n",z_coordinate_Max);  
}

int main (int argc, char** argv)
{
  // Initialize ROS
  ros::init (argc, argv, "pcl_node");
  ros::NodeHandle nh;

  // Create a ROS subscriber for the input point cloud
  ros::Subscriber sub = nh.subscribe ("/cloud_pcd", 1, cloud_cb);
  ros::Subscriber sub_coordinate_min = nh.subscribe ("/coordinate_limit_min", 1, set_coordinate_limit_min);
  ros::Subscriber sub_coordinate_Max = nh.subscribe ("/coordinate_limit_Max", 1, set_coordinate_limit_Max);

  // Create a ROS publisher for the output point cloud
  pub = nh.advertise<disposing_vision::coordinate_normal> ("output", 1);

  // Spin
  ros::spin ();
}