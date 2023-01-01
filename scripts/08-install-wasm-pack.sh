#!/bin/bash

curl https://rustwasm.github.io/wasm-pack/installer/init.sh -sSf | sh
rustup target add wasm32-wasi
rustup target add wasm32-unknown-unknown

cargo install -f wasm-bindgen-cli
