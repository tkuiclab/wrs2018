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

app.get('/', function (req, res) {
  app.use(express.static(path.join(__dirname, '../web')));
  app.use(express.static(path.join(__dirname, '..')));

  res.sendFile(path.join(__dirname + '/../web/demo03.html'));
});

io.on('connect', (socket) => {
  console.log('A user connected.');

  io.emit("news", "Hello from Socket.io server");

  socket.on('message', (data) => {
    console.log(data);
  });
  socket.on('error', (error) => {
    console.log("Socket.io error occured: " + error);
  });
  socket.on('disconnect', () => {
    console.log("A user go out");
  });
});