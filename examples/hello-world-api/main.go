package main

import (
    "fmt"
    "net/http"
)

func helloWorld(w http.ResponseWriter, r *http.Request) {
    fmt.Println("Hey")
    fmt.Fprintf(w, "Hello World!")
}

func main() {
    http.HandleFunc("/", helloWorld)
    fmt.Println("running!")
    http.ListenAndServe(":8080", nil)
}

