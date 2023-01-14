package main

import (
	"bufio"
	"fmt"
	"os"
)

func main() {

	fmt.Println("👋 Hello World from Go 🌍")
	
	argsWithoutCaller := os.Args[1:]

	fmt.Println("Hey 👋", argsWithoutCaller[0])

	reader := bufio.NewReader(os.Stdin)
	fmt.Println("say something please 🙏:")
	
	msg, err := reader.ReadString('\n')
	if err != nil {
		fmt.Printf("😡 I got an error: %v", err)
	} else {
		fmt.Printf("🤗 This is what I got: %s", msg)
	}

}
