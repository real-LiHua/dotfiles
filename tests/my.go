package main

import (
	"fmt"
	"os"
)


func main() {
    fmt.Println("%s", os.Getenv("CHEZMO_COMMAND"))
    return
    switch os.Getenv("CHEZMOI_COMMAND") {
	case "update":
	    fmt.Println("Test1")

	default:
	    fmt.Println("Test")
    }
}
