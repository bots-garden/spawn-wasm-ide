package main

import (
	"fmt"
	"io"
	"log"
	"net/http"

	helpers "wazero/hosthelpers"
)

// Load the wasm file
var wasmFile, _ = helpers.LoadWasmFile("../wasm-module/hello.wasm")

func hello(w http.ResponseWriter, req *http.Request) {
	if req.URL.Path != "/" {
		http.Error(w, "404 not found.", http.StatusNotFound)
		return
	}

	name, _ := io.ReadAll(req.Body)

	// Create a wasm runtime
	wasmRuntime, ctx := helpers.NewWasmRunTime()

	// Instantiate the wasm module
	wasmModule, _ := helpers.InstantiateWasmModule(wasmRuntime, ctx, wasmFile)

	// Get references to the wasm functions
	sayHelloWasmFunction := wasmModule.ExportedFunction("sayHello")

	// write the name parameter in memory
	// get the memory position and size of name
	// then the wasm function is able to read the parameter
	namePos, nameSize, _ := helpers.CopyBufferParameterToMemory(wasmModule, ctx, name)

	// call the wasm function with the position and the size of the parameter
	// `retValue` represents a pair of values (position, length) packed into a single value
	retValue, _ := sayHelloWasmFunction.Call(ctx, namePos, nameSize)

	// unpack `retValue` to get the position and the size in memory
	// of the value returned by the function
	resultPos, resultSize := helpers.GetBufferPosSizeFromMemory(retValue)

	// then read from the memory the value of the buffer
	result, _ := helpers.ReadBufferFromMemory(wasmModule, resultPos, resultSize)

	fmt.Fprintf(w, "%v", string(result))

}

func main() {

	http.HandleFunc("/", hello)
	port := ":3000"
	fmt.Println("🌍 listening on", port)
	if err := http.ListenAndServe(port, nil); err != nil {
		log.Fatal(err)
	}

}

// Test it with:
// curl -X POST -d 'Bob Morane' http://localhost:3000
