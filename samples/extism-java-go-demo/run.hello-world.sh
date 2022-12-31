#!/bin/bash
export LD_LIBRARY_PATH=/usr/local/lib
java -cp target/extism-java-*-with-dependencies.jar example.ExtismExample "hello-world/hello-world.wasm" helloWorld "😀 Hey!"


