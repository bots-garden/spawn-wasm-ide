"use strict";
const fs = require("fs");
const { WASI } = require("wasi");

const wasi = new WASI({args: ["", "John"]});

const importObject = { wasi_snapshot_preview1: wasi.wasiImport };

(async () => {
  const wasm = await WebAssembly.compile(
    fs.readFileSync("./hello/hello.wasm")
  );
  const instance = await WebAssembly.instantiate(wasm, importObject);

  wasi.start(instance);
})();

// Refs: https://nodejs.org/api/wasi.html
