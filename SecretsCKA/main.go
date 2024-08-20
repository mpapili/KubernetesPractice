package main

import (
	"os"
	"fmt"
	"net/http"
)

func main() {
	http.HandleFunc("/", func(w http.ResponseWriter, r *http.Request) {
		secret := os.Getenv("my-secret")
		if secret != "" {
			fmt.Fprintf(w, "my-secret: %s", secret)
		} else {
			fmt.Fprintf(w, "No environment variable 'my-secret' is set.")
		}
	})

	fmt.Println("Server is running on port 5000...")
	err := http.ListenAndServe(":5000", nil)
	if err != nil {
		fmt.Printf("Error starting server: %s\n", err)
	}
}
