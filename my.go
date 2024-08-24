package main

import (
	"fmt"
	"os"
)


func main() {
    switch os.Getenv("CHEZMOI_COMMAND") {
	case "update":
	    fmt.Println("Test")

	default:
	    fmt.Println("Test")
    }
}
