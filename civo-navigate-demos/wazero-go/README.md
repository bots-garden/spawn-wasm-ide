

## Create a Go project

```bash
mkdir hello
cd hello
go mod init example/hello
```

Create `hello.go`

```golang
package main

import "fmt"

func main() {
    fmt.Println("Hello, World!")
}

```

```bash
go run .
```

```bash
cd $HOME/civo-navigate-demos/wazero-go
mkdir greetings
cd greetings
go mod init example/greetings

```

in `hello`:

```bash
go mod edit -replace example/greetings=../greetings
go mod tidy
````
