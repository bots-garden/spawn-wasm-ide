package helpers

import (
	"context"
	"errors"
	"fmt"
	"os"

	"github.com/tetratelabs/wazero"
	"github.com/tetratelabs/wazero/api"
	"github.com/tetratelabs/wazero/imports/wasi_snapshot_preview1"
)

func Hello() {
	fmt.Println("Hello")
}

func NewWasmRunTime() (wazero.Runtime, context.Context) {
	// Choose the context to use for function calls.
	ctx := context.Background()

	// Create a new WebAssembly Runtime.
	//wasmRuntime := wazero.NewRuntime(ctx)
	wasmRuntime := wazero.NewRuntimeWithConfig(ctx, wazero.NewRuntimeConfigInterpreter())

	//🖐️ defer wasmRuntime.Close(ctx) // This closes everything this Runtime created.

	/*
		Package wasi_snapshot_preview1 contains Go-defined functions to access system calls,
		such as opening a file, similar to Go's x/sys package.
		These are accessible from WebAssembly-defined functions via importing ModuleName.
		All WASI functions return a single Errno result: ErrnoSuccess on success.
	*/
	wasi_snapshot_preview1.MustInstantiate(ctx, wasmRuntime)

	return wasmRuntime, ctx

}

func LoadWasmFile(wasmFilePath string) ([]byte, error) {
	// Load the WebAssembly module
	wasmFile, err := os.ReadFile(wasmFilePath)
	if err != nil {
		//log.Panicln(err)
		return nil, err
	}
	return wasmFile, nil
}

func InstantiateWasmModule(wasmRuntime wazero.Runtime, ctx context.Context, wasmFile []byte) (api.Module, error) {

	// Instantiate the WebAssembly module
	wasmModule, err := wasmRuntime.Instantiate(ctx, wasmFile)
	if err != nil {
		//log.Panicln(err)
		return nil, err
	}
	return wasmModule, nil
}

func CopyBufferParameterToMemory(wasmModule api.Module, ctx context.Context, param []byte) (uint64, uint64, error) {
	paramSize := uint64(len(param))
	// These are undocumented, but exported. See tinygo-org/tinygo#2788
	malloc := wasmModule.ExportedFunction("malloc")
	free := wasmModule.ExportedFunction("free")

	// Instead of an arbitrary memory offset, use TinyGo's allocator. Notice
	// there is nothing string-specific in this allocation function. The same
	// function could be used to pass binary serialized data to Wasm.

	// book some place in memory for the parameter
	results, err := malloc.Call(ctx, paramSize)
	if err != nil {
		return 0, 0, err
	}
	paramPtr := results[0]
	// This pointer is managed by TinyGo, but TinyGo is unaware of external usage.
	// So, we have to free it when finished
	defer free.Call(ctx, paramPtr)

	// The pointer is a linear memory offset, which is where we write the name.

	// write the name parameter in memory
	ok := wasmModule.Memory().Write(uint32(paramPtr), []byte(param))
	if !ok {
		return 0, 0, err
	}
	return paramPtr, paramSize, nil
}

func GetBufferPosSizeFromMemory(retValue []uint64) (uint32, uint32) {
	// Note: This pointer is still owned by TinyGo, so don't try to free it!
	bufferPos := uint32(retValue[0] >> 32)
	bufferSize := uint32(retValue[0])
	return bufferPos, bufferSize
}

func ReadBufferFromMemory(wasmModule api.Module, resultPos, resultSize uint32) ([]byte, error) {

	// The pointer is a linear memory offset, which is where we write the name.
	bytes, ok := wasmModule.Memory().Read(resultPos, resultSize)
	if !ok {
		return nil, errors.New("😡 Houston, We've Got a Problem")
	} else {
		return bytes, nil
	}

}
