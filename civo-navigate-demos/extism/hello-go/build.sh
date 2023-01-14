#!/bin/bash
tinygo build -o hello-go.wasm -target wasi main.go
ls -lh *.wasm
