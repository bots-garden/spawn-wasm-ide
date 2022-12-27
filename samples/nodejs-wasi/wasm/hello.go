package main

import (
	"github.com/bots-garden/wasi-tinygo-js/wasihelpers"
)

func main() {
  wasihelpers.SetHandler(Handler)
}

func Handler(param []byte) ([]byte, error) {

  message := "👋 hello " + string(param)
  return []byte(message), nil
}
