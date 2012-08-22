var zmq = require('zmq')
  , sock = zmq.socket('push')

sock.bindSync('tcp://127.0.0.1:3210')
console.log('Producer bound to 3210')

setInterval(function() {
  console.log('sending work')
  sock.send('some work')
}, 500)

