package main

import (
	"fmt"
	"log"
	"net/http"
)

func testHandler(w http.ResponseWriter, r *http.Request) {
	fmt.Fprintf(w, "hello, 1!")
}
func main() {
	fmt.Println("hello 1")
	http.HandleFunc("/", testHandler)
	srv := &http.Server{
		Addr: "0.0.0.0:8080",
	}
	log.Fatal(srv.ListenAndServe())
}
