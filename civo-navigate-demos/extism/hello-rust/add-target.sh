#!/bin/bash
rustup target add wasm32-wasi
rm -rf ~/.cargo/registry/index/*
rm -rf ~/.cargo/.package-cache
cargo clean
cargo build --release --target wasm32-wasi
# ls -lh *.wasm
