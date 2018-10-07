// Connecting to ROS
// -----------------
var ros = new ROSLIB.Ros({
  url : 'ws://localhost:9090'
});

ros.on('connection', function() {
  console.log('Connected to websocket server.');
});

ros.on('error', function(error) {
  console.log('Error connecting to websocket server: ', error);
});

ros.on('close', function() {
  console.log('Connection to websocket server closed.');
});
// ROS Component Declare
// ---------------------
var AssistantClient = new ROSLIB.Service({
  ros : ros,
  name : '/assistant_service',
  serviceType : 'assistant_pkg/AssistantState'
});