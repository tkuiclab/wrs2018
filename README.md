# wrs2018
TKU ICLab join 2018 WRS in Tokoyo

youjun well done!!

# TIMDA IBM Assistant Web UI

## Necessary Packages
```bash
$ sudo apt-get install ros-<distro>-qt-ros
$ sudo apt-get install ros-<distro>-rosbridge-server
$ sudo apt-get install ros-<distro>-rosbridge-server
$ sudo apt-get install libmodbus-dev
$ sudo apt-get install ros-kinetic-rosserial-python ros-kinetic-rosserial-arduino
# install nvm, nodejs, npm
$ git clone git://github.com/creationix/nvm.git ~/.nvm
$ echo ". ~/.nvm/nvm.sh" >> ~/.bashrc
$ source ~/.bashrc
$ nvm install 8.12.0
$ nvm alias default 8.12.0
$ curl -o- https://raw.githubusercontent.com/creationix/nvm/v0.33.2/install.sh | bash 
```

## Build-up
```bash
$ cd <timda_ws>/
$ catkin_make --pkg dual_arm_control
$ catkin_make
```
### Installization
```bash
$ cd <timda_ws>/src/web/myapp
$ npm install
```
### Run Web Server
```bash
$ node index.js
```
