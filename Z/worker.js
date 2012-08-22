var zmq = require('zmq')
  , sock = zmq.socket('pull')

sock.connect('tcp://127.0.0.1:3210')
console.log('Worker connected to 3210')

sock.on('message', function(msg) {
  console.log('got work: %s', msg.toString())
})

