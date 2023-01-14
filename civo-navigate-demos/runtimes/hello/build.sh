#!/bin/bash
tinygo build -o hello.wasm -target wasi ./main.go

ls -lh *.wasm
