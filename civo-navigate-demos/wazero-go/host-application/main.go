package main

import (
	"fmt"
	"wazero/hosthelpers"
)

func main() {

	// Create a wasm runtime
	wasmRuntime, ctx := helpers.NewWasmRunTime()

	// Load the wasm file
	wasmFile, _ := helpers.LoadWasmFile("../wasm-module/hello.wasm")

	// Instantiate the wasm module
	wasmModule, _ := helpers.InstantiateWasmModule(wasmRuntime, ctx, wasmFile) 

	// This is the parameter of the function
	name := []byte("Bob Morane")

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

	fmt.Println("😃 message from WASM:", string(result))

}
