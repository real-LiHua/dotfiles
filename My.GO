package main

import (
	"fmt"
	"os"
)


func main() {
    fmt.Printf("%s", os.Getenv("CHEZMOI_COMMAND"))
}
