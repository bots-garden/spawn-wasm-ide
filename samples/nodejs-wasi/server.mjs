import {WasmHelper, WasmModule} from 'wasi-tinygo-js'
import Fastify from 'fastify'
import process from "node:process";
const fastify = Fastify({
  logger: true
})

const opts = {}
// curl http://localhost:3000
fastify.get('/', async (request, reply) => {
  return { hello: 'world' }
})

/*
text/html; charset=utf-8

curl -X POST http://localhost:3000 \
   -H 'Content-Type: application/json; charset=utf-8' \
   -d '{"name":"bob"}'

curl -X POST http://localhost:3000 \
   -H 'Content-Type: text/plain; charset=utf-8' \
   -d 'Bob Morane'
 */
fastify.post('/', opts, async (request, reply) => {

  return request.body
})



/**
 * Run the server!
 */
const start = async () => {

  const wasm = await WasmHelper.compile("./wasm/hello.wasm")
  let wasmModule = new WasmModule(wasm)

  //let success = await wasmModule.initialize()

  //if(success) {
    /*
    curl -X POST http://localhost:3000/hello \
     -H 'Content-Type: text/plain; charset=utf-8' \
     -d 'Bob Morane'
     */
  var counter = 0

  fastify.post('/hey', opts, async (request, reply) => {
    let result = request.body+" "+counter
    counter+=1

    var sum = 0

    for(var i = 0; i < 100000; i++){
        doSomething();
        sum += i
    }

    fastify.log.info(`🙂 ${result.toString()}`)
    return "🙂 " + result.toString()
  })

  fastify.post('/hello', opts, async (request, reply) => {

    let success = await wasmModule.initialize()

    //let result = wasmModule.callHandlerWithString("John")
    let result = wasmModule.callHandlerWithString(request.body+" "+counter)
    counter+=1
    if(result.isError) {
      //console.log("😡", result.toString())
      fastify.log.error(`😡 ${result.toString()}`)

      return "😡 " + result.toString()
    } else {
      //console.log("🙂", result.toString())
      fastify.log.info(`🙂 ${result.toString()}`)
      return "🙂 " + result.toString()
    }

  })

  //}

  try {
    await fastify.listen({ port: 3000, host: '0.0.0.0'})
  } catch (err) {
    fastify.log.error(err)
    process.exit(1)
  }
}
start().then(r => console.log("😄 started"))

/*
'0.0.0.0'
When deploying to a Docker, and potentially other, containers, 
it is advisable to listen on 0.0.0.0 because 
they do not default to exposing mapped ports to localhost
https://www.fastify.io/docs/latest/Reference/Server/#listen
*/