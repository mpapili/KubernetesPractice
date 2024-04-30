package main

import (
	"context"
	"fmt"
	"log"
	"net/http"
	"os"
	"os/exec"
	"os/signal"
	"strings"
	"syscall"
	"time"
)

func getLocalHostname() (string, error) {
	cmd := exec.Command("hostname")
	output, err := cmd.CombinedOutput()
	if err != nil {
		return "", fmt.Errorf("failed to get local hostname : %w", err)
	}
	return strings.TrimSpace(string(output)), nil
}

func MyHandler(w http.ResponseWriter, r *http.Request) {
	hostname, err := getLocalHostname()
	if err != nil {
		fmt.Fprintf(w, "failed to get hostname - %w", err)
	}
	fmt.Fprintf(w, fmt.Sprintf("Czesc from %s (v2 is polish)", hostname))
}

func main() {
	log.Println("hello, world")
	http.HandleFunc("/", MyHandler)

	srv := &http.Server{
		Addr: "0.0.0.0:8080",
		// Good practice to set timeouts to avoid Slowloris attacks.
		WriteTimeout: 15 * time.Second,
		ReadTimeout:  15 * time.Second,
	}

	go func() {
		log.Fatal(srv.ListenAndServe())
	}()

	// Channel to listen for interrupt or terminate signal
	quit := make(chan os.Signal, 1)
	// Only catch interrupt and SIGTERM signals
	signal.Notify(quit, os.Interrupt, syscall.SIGTERM)

	// Block until we receive our signal.
	<-quit

	// Create a deadline to wait for.
	ctx, cancel := context.WithTimeout(context.Background(), 10*time.Second)
	defer cancel()
	// Doesn't block if no connections, but will otherwise wait
	// until the timeout deadline.
	srv.Shutdown(ctx)

	fmt.Println("Shutting down server...")
}
