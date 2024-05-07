package main

import (
	"context"
	"fmt"
    "log"
	"net/http"
	"os"
	"time"
	"os/signal"
	"syscall"

	"gorm.io/driver/postgres"
    "gorm.io/gorm"
)

type Pet struct {
    gorm.Model
    Name string
    Age  int
}


func InsertAndFetch(w http.ResponseWriter, r *http.Request) {
	dsn := "host=postgres user=mike password=mikedb dbname=mikes_db port=5432 sslmode=disable TimeZone=America/New_York"
    db, err := gorm.Open(postgres.Open(dsn), &gorm.Config{})
    if err != nil {
        log.Fatalf("Failed to connect to database: %v", err)
    }
    // Insert a new pet
    newPet := Pet{Name: "Fido", Age: 3}
    db.Create(&newPet)

    // Retrieve and print the inserted pet
    var retrievedPets []Pet
    db.Find(&retrievedPets, "name = ?", "Fido")
    log.Printf("Retrieved Pets: %v", retrievedPets)

	fmt.Fprintf(w, fmt.Sprintf("Here are the pets we found: %v", retrievedPets))
}

func main() {
	log.Println("mike we hardcoded the IP to start, when building/deploying PLEASE do not forget to make it the name of the service/registry")
	// here the hostname is the name of the service!
    dsn := "host=postgres user=mike password=mikedb dbname=mikes_db port=5432 sslmode=disable TimeZone=America/New_York"
    db, err := gorm.Open(postgres.Open(dsn), &gorm.Config{})
    if err != nil {
        log.Fatalf("Failed to connect to database: %v", err)
    }

    // Auto-migrate the schema
    db.AutoMigrate(&Pet{})

    // Insert a new pet
    newPet := Pet{Name: "Fido", Age: 3}
    db.Create(&newPet)

    // Retrieve and print the inserted pet
    var retrievedPets []Pet
    db.Find(&retrievedPets, "name = ?", "Fido")
    log.Printf("Retrieved Pets: %v", retrievedPets)
	http.HandleFunc("/", InsertAndFetch)

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
