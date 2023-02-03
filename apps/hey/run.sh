#!/bin/bash
#HTTP_PORT=7070 MESSAGE="Hello function 🟢" java -jar target/hello-1.0.0-SNAPSHOT-fat.jar

pkill -f vert-x-


HTTP_PORT="7070" \
MESSAGE="Hello function 🟢" \
bash -c \
"exec -a vert-x-hello-7070 java -jar target/hello-1.0.0-SNAPSHOT-fat.jar &"

HTTP_PORT="7071" \
MESSAGE="Hello function 🟠" \
bash -c \
"exec -a vert-x-hello-7071 java -jar target/hello-1.0.0-SNAPSHOT-fat.jar &"

HTTP_PORT="7072" \
MESSAGE="Hello function 🔵" \
bash -c \
"exec -a vert-x-hello-7072 java -jar target/hello-1.0.0-SNAPSHOT-fat.jar &"
