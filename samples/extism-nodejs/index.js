import { Context } from '@extism/extism';
import { readFileSync } from 'fs';

let ctx = new Context();
let wasm = readFileSync('./hello-go/hello-go.wasm');
let plugin = ctx.plugin(wasm, true);

if (!plugin.functionExists('helloWorld')) {
  console.log("no function 'helloWorld' in wasm");
  process.exit(1);
}

let buf = await plugin.call('helloWorld', "😀 Hey! 👋"); // if I use emoji, the output is truncated: { message: '👋 Hello World 🌍', input: '😀 He' }
console.log(JSON.parse(buf.toString()));
plugin.free();


