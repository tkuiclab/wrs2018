#!/usr/bin/env node

'use strict';

// Require rosnodejs itself
const rosnodejs = require('rosnodejs');
// Requires the std_msgs message package

rosnodejs.initNode('/my_node')
.then((rosNode) => {
  const AssistantState = rosnodejs.require('strategy').srv.AssistantState;
  const request = new AssistantState.Request();

  let serviceClient = rosNode.serviceClient('/assistant_service','strategy/AssistantState');
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