#!/bin/bash

# -n 10000 -c 1000
#hey -n 10 -c 5 -m POST \
#hey -n 1000 -c 100 -z 3m -m POST \

hey -n 300 -c 100 -m POST \
-H "Content-Type: text/plain; charset=utf-8" \
-d 'Bob Morane' \
"http://localhost:3000/hey"
