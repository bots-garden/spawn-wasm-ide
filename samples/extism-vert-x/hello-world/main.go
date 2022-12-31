package main

import (
	"github.com/extism/go-pdk"
)

//export helloWorld
func helloWorld() int32 {
	input := pdk.Input()

	output := `{"message": "👋 Hello World 🌍","input": "` + string(input) + `"}`

	mem := pdk.AllocateString(output)
	// zero-copy output to host
	pdk.OutputMemory(mem)

	return 0
}

func main() {}
