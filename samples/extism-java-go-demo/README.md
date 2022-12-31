# Java Extism Sample

> From https://github.com/thomasdarimont/extism-java-example

## Build the Jar file

```bash
LD_LIBRARY_PATH=/usr/local/lib mvn verify
```

## Test: with TinyGo

### Build the wasm plugin

```bash
cd hello-world
tinygo build -o hello-world.wasm -target wasi main.go
```

### Execute the wasm plugin from Java

```bash
LD_LIBRARY_PATH=/usr/local/lib java -cp target/extism-java-*-with-dependencies.jar example.ExtismExample "hello-world/hello-world.wasm" helloWorld "Hey!"
```

