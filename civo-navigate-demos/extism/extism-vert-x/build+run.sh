#!/bin/bash
LD_LIBRARY_PATH="/usr/local/lib" \
WASM_FILE="/home/ubuntu/civo-navigate-demos/extism/hello-world/hello-world.wasm" \
HTTP_PORT="8888" \
FUNCTION_NAME="helloWorld" \
./mvnw clean compile exec:java
