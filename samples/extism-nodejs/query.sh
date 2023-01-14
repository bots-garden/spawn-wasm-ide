#!/bin/bash
curl -X POST http://localhost:3000/hello \
    -H 'Content-Type: text/plain; charset=utf-8' \
    -d 'Bob Morane'

curl -X POST http://localhost:3000/hello \
    -H 'Content-Type: text/plain; charset=utf-8' \
    -d 'John Doe'

curl -X POST http://localhost:3000/hello \
    -H 'Content-Type: text/plain; charset=utf-8' \
    -d 'Jane Doe'
