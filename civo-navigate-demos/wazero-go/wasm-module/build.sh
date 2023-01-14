#!/bin/bash
tinygo build -o hello.wasm -target wasi hello.go 

ls -lh *.wasm