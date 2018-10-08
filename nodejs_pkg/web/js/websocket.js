ws = new WebSocket("wss://shengruchatbot1.mybluemix.net/ws/sound");
var heartbeat_msg = '--heartbeat--', heartbeat_interval = null, missed_heartbeats = 0;
var output = document.getElementById('output');
function __log(e, data) {
  log.innerHTML += "\n" + e + " " + (data || '');
}

var socket = io.connect('https://'+location.host, {secure: true});
socket.on('news', function(m) {
  console.log('Socket.IO Connected: '+m);
  __log('Socket.IO Connected');
});

ws.onopen = function(){
  console.log("Connected websocket");
  __log('[Chat Connected]');
  /* Ping/Pong signal for keeping websocket alive */
  if (heartbeat_interval === null) {
    missed_heartbeats = 0;
    heartbeat_interval = setInterval(function() {
      try {
        missed_heartbeats++;
        if (missed_heartbeats >= 3)
          throw new Error("Too many missed heartbeats.");
        ws.send(heartbeat_msg);
      } catch(e) {
        clearInterval(heartbeat_interval);
        heartbeat_interval = null;
        console.warn("Closing connection. Reason: " + e.message);
        ws.close();
      }
    }, 5000);
  }
};
ws.onerror = function(){ 
  console.log("Websocket error");
  __log('[Chat Connected Error]');
};
ws.onclose = function () {
  __log('[Chat Disconnected]');
}
ws.onmessage = function(evt){
  if (IsJsonString(evt.data)) {
    var j = JSON.parse(evt.data)
    if (j.role === "State Machine") {
      __log('Pass '+j.state+' to socket server');
      socket.emit('message', j.state);
    }
    return;
  }
  /* Ping/Pong signal for keeping websocket alive */
  if (evt.data === heartbeat_msg) {
    /* reset the counter for missed heartbeats */
    console.log('pong : '+evt.data);
    missed_heartbeats = 0;
    return;
  }
  if (evt.data[2] != "m") {
    console.log(evt+" , "+evt.data);
    output.src = window.URL.createObjectURL(evt.data);
    output.play();
    __log('play audio');
  }
};
function IsJsonString (json) {
  var str = json.toString();
  try {
    JSON.parse(str);
  }catch (e) {
    return false;
  }
  return true;
}