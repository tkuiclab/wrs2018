var express = require('express');
var fs      = require('fs');
var path    = require('path');
var app     = express();
var https   = require('https');
var server  = require('http').Server(app);
var io      = require('socket.io')(server);

app.get('/', function (req, res) {
  app.use(express.static(path.join(__dirname, '../web')));
  app.use(express.static(path.join(__dirname, '..')));

  res.sendFile(path.join(__dirname + '/../web/index.html'));
});
app.get('/origin', function (req, res) {
  app.use(express.static(path.join(__dirname, '../web')));
  app.use(express.static(path.join(__dirname, '..')));

  res.sendFile(path.join(__dirname + '/../web/example_simple_exportwav.html'));
});
app.get('/simple', function (req, res) {
  app.use(express.static(path.join(__dirname, '../web')));
  app.use(express.static(path.join(__dirname, '..')));

  res.sendFile(path.join(__dirname + '/../web/index_simple.html'));
});
https.createServer({
  key: fs.readFileSync('server.key'),
  cert: fs.readFileSync('server.cert')
}, app)
.listen(8080, function() {
  console.log('Example app listening on port 8080');
});

// io.on('connection', (socket) => {
//   console.log('A user connected.');

//   io.emit("news", "Hello from Socket.io server");

//   socket.on('message', (data) => {
//     switch (data) {
//       case 0:
//         console.log("Stop");
//         break;
//       case 1:
//         console.log("Rec");
//         break;
//       default:
//         console.log("Default");
//     }
//   });

//   socket.on("disconnect", () => {
//     console.log("A user go out");
//   });
// });
// server.listen(3001);