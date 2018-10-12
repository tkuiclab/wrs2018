#!/usr/bin/env node
'use strict';

var express = require('express');
var fs      = require('fs');
var path    = require('path');
var app     = module.exports = express();
var https   = require('https');
var server  = https.createServer({
  key: fs.readFileSync('server.key'),
  cert: fs.readFileSync('server.cert')
},app);
server.listen(8080);
var io = require('socket.io').listen(server);

const rosnodejs = require('rosnodejs');
const AssistantState = rosnodejs.require('strategy').srv.AssistantState;
const PaymentCallback = function(msg) {
  if (msg.data == "Payment OK") {
    var j = '{"info": "The payment process is complete, thank you"}';
    io.emit("say", j); 
  }else {
  }
}

var serviceClient;

rosnodejs.initNode('index')
.then((rosNode) => {
  /* Topic Subscriber */
  const sub = rosNode.subscribe('/topic', 'std_msgs/String', PaymentCallback);

  /* Service Server */
  const LetRobotSay = (req, resp) => {
    console.log(req.info);
    io.emit("say", JSON.stringify(req));
    resp.success = true;
    return resp;
  };
  let service = rosNode.advertiseService('/let_robot_say', 'nodejs_pkg/LetRobotSay', LetRobotSay);

  /* Service Client */
  serviceClient = rosNode.serviceClient('/assistant_service','strategy/AssistantState');
  rosNode.waitForService(serviceClient.getService(), 2000)
    .then((available) => {
      if (available) {
        const request = new AssistantState.Request();
        request.state = 0;
        serviceClient.call(request).then((resp) => {
          console.log('Service response ' + JSON.stringify(resp));
        });
      } else {
        console.log('Service not available');
      }
    });
});

app.get('/', function (req, res) {
  app.use(express.static(path.join(__dirname, '../web')));
  app.use(express.static(path.join(__dirname, '..')));

  res.sendFile(path.join(__dirname + '/../web/demo03.html'));
});

io.on('connect', (socket) => {
  console.log('A user connected.');

  io.emit("news", "Hello from Socket.io server");

  socket.on('message', (data) => {
    console.log('Call service with: '+data);
    const request = new AssistantState.Request();
    request.state = data;
    // Need to and Timeout ?
    serviceClient.call(request).then((resp) => {
      console.log('Service response ' + JSON.stringify(resp));
      io.emit("news", JSON.stringify(resp));
    });
  });
  socket.on('error', (error) => {
    console.log("Socket.io error occured: " + error);
  });
  socket.on('disconnect', () => {
    console.log("A user go out");
  });
});
