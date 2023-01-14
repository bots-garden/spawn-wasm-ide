package main

import (
	"github.com/bots-garden/wasi-tinygo-js/wasihelpers"
)

func main() {
  wasihelpers.SetHandler(Handler)
}

func Handler(param []byte) ([]byte, error) {

  sum := 0
  for i := 1; i < 100000; i++ {
    sum += i
  }


  //fmt.Println("🤗")
  message := "👋 hello " + string(param)
  return []byte(message), nil
}
