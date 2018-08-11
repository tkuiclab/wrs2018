[ control info ]
control_cycle = 8   # milliseconds

[ port info ]
# PORT NAME  | BAUDRATE
/dev/ttyUSB0 | 1000000  | r_joint1

[ device info ]
# TYPE    | PORT NAME    | ID  | MODEL          | PROTOCOL | DEV NAME | BULK READ ITEMS
dynamixel | /dev/ttyUSB0 | 1   | H54-200-S500-R | 2.0      | r_joint1   | present_position, present_voltage
dynamixel | /dev/ttyUSB0 | 2   | H54-200-S500-R | 2.0      | r_joint2   | present_position, present_voltage
dynamixel | /dev/ttyUSB0 | 3   | H54-100-S500-R | 2.0      | r_joint3   | present_position, present_voltage
dynamixel | /dev/ttyUSB0 | 4   | H54-100-S500-R | 2.0      | r_joint4   | present_position, present_voltage
dynamixel | /dev/ttyUSB0 | 5   | H42-20-S300-R  | 2.0      | r_joint5   | present_position, present_voltage
dynamixel | /dev/ttyUSB0 | 6   | H42-20-S300-R  | 2.0      | r_joint6   | present_position, present_voltage
dynamixel | /dev/ttyUSB0 | 7   | H42-20-S300-R  | 2.0      | r_joint7   | present_position, present_voltage
