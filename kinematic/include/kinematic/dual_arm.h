#include <eigen3/Eigen/Dense>
#include <sstream>
#include "ros/ros.h"
#include "std_msgs/Float64.h"
#include "std_msgs/Float64MultiArray.h"
using namespace Eigen;

VectorXd left_arm( VectorXd &, VectorXd &  );
VectorXd right_arm( VectorXd &, VectorXd & );

