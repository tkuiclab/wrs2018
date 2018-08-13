#include <iostream>
#include <eigen3/Eigen/Dense>
using namespace Eigen;

int main()
{
  MatrixXd m(2,2);
  m(0,0) = 3;
  m(1,0) = 2.5;
  m(0,1) = -1;
  m(1,1) = m(1,0) + m(0,1);
  MatrixXd z(2,2);
  z(0,0) = 3;
  z(1,0) = 2.5;
  z(0,1) = -1;
  z(1,1) = z(1,0) + z(0,1);
  MatrixXd q(2,2);
  q = m*z;
  std::cout << "Here is the matrix m:\n" << m << std::endl;
  std::cout << "Here is the matrix Tm:\n" << m.transpose() << std::endl;
  std::cout << "Here is the matrix Im:\n" << m.inverse() << std::endl;
  std::cout << "Here is the matrix mxIm:\n" << m*m.inverse() << std::endl;
  std::cout << "q=mxm:"<<q<<std::endl;
  VectorXd v(2);
  v(0) = 4;
  v(1) = v(0) - 1;
  std::cout << "Here is the vector v:\n" << v << std::endl;
}