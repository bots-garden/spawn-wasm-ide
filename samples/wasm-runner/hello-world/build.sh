#!/bin/bash
tinygo build -o hello-world.wasm -target wasi main.go
ls -lh *.wasm
