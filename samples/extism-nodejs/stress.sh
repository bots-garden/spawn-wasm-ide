#!/bin/bash
# -n 10000 -c 1000
#hey -n 10 -c 5 -m POST \

# hey -n 300 -c 100 -m POST \
# Requests/sec: 30.5280
# Requests/sec: 32.1274
# Requests/sec: 31.5995
# Requests/sec: 117.4794 with wazero.NewRuntimeConfigInterpreter()
# Requests/sec: 123.6958 wasi_snapshot_preview1.MustInstantiate(ctx, wasmRuntime)
# Requests/sec: 84.0781 deps: updates wazero to 1.0.0-pre.4
# Requests/sec: 85.5523 use fastjson

hey -n 10000 -c 500 -m POST \
-H "Content-Type: text/plain; charset=utf-8" \
-d 'Bob Morane' \
"http://localhost:3000/hello"
