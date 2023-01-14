#!/bin/bash
pkill -f extism-function

LD_LIBRARY_PATH="/usr/local/lib" \
WASM_FILE="/home/ubuntu/civo-navigate-demos/extism/hello-go/hello-go.wasm" \
HTTP_PORT="8888" \
FUNCTION_NAME="helloWorld" \
bash -c \
"exec -a extism-helloWorld-8888 java -jar extism-vert-x/target/starter-1.0.0-SNAPSHOT-fat.jar &"

# pkill -f extism-function-java-hello
# ps aux | grep 'extism-function'

WASM_FILE="/home/ubuntu/civo-navigate-demos/extism/hello-rust/target/wasm32-wasi/release/hello_rust.wasm" \
HTTP_PORT="9999" \
FUNCTION_NAME="hello_world" \
bash -c \
"exec -a extism-hello_world-9999 java -jar extism-vert-x/target/starter-1.0.0-SNAPSHOT-fat.jar &"
