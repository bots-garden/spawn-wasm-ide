#!/bin/bash
extism call --input "👋 Hello I'm Bob 🤗" ./target/wasm32-wasi/release/hello_rust.wasm hello_world --wasi
