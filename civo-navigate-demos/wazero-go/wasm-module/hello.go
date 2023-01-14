package main

import(
	"wazero/wasmhelpers"
)

func main() {
	
}

//export sayHello
func sayHello(pos, size uint32) (posAndSize uint64) {
	
	// read the parameter from the memory
	parameter := helpers.ReadBufferFromMemory(pos, size)
	name := string(parameter)

	// copy the function return value to the memory
	// and get its position and size
	pos, size = helpers.CopyBufferToMemory([]byte("👋 hello " + name + " 😃"))

	// pack the position and the size in only one value
	return (uint64(pos) << uint64(32)) | uint64(size)

	/* use this to decode the 2 values:
		pos := uint32(retValue[0] >> 32)
		size := uint32(retValue[0])
	*/
}
