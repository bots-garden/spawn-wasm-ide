package helpers

import (
	"reflect"
	"unsafe"
)

// CopyBufferToMemory copy the buffer to the memory
// and return the buffer position (pointer) in memory 
// and its size
// in a way compatible with WebAssembly numeric types.
func CopyBufferToMemory(buf []byte) (uint32, uint32) {
	ptr := &buf[0]
	unsafePtr := uintptr(unsafe.Pointer(ptr))
	return uint32(unsafePtr), uint32(len(buf))
}

// ReadBufferFromMemory returns an array of bytes
// reading the memory with the position of the buffer in memory
// and its size
func ReadBufferFromMemory(pos uint32, size uint32) []byte {
	return *(*[]byte)(unsafe.Pointer(&reflect.SliceHeader{
		Data: uintptr(pos),
		Len:  uintptr(size), // Tinygo requires these as uintptrs even if they are int fields.
		Cap:  uintptr(size), // ^^ See https://github.com/tinygo-org/tinygo/issues/1284
	}))
}