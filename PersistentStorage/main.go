package main

import (
	"log"
	"net/http"
	"os"
)

func main() {
	// Create or open the log file
	file, err := os.OpenFile("/app/logs/access.log", os.O_CREATE|os.O_APPEND|os.O_WRONLY, 0666)
	if err != nil {
		log.Fatal(err)
	}
	defer file.Close()

	// Set the logger to use this file
	log.SetOutput(file)

	// Simple HTTP server that logs each request
	http.HandleFunc("/", func(w http.ResponseWriter, r *http.Request) {
		log.Printf("Received request from %s\n", r.RemoteAddr)
		w.Write([]byte("Hello, World!"))
	})
	log.Println("Server starting on port 8081...")
	http.ListenAndServe(":8081", nil)
}
