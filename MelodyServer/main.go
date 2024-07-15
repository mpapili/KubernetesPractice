package main

import (
	"log"
	"net/http"

	"github.com/olahol/melody"
)

func main() {
	m := melody.New()

	http.HandleFunc("/", func(w http.ResponseWriter, r *http.Request) {
		http.ServeFile(w, r, "index.html")
	})

	http.HandleFunc("/ws", func(w http.ResponseWriter, r *http.Request) {
		m.HandleRequest(w, r)
	})

	m.HandleMessage(func(s *melody.Session, msg []byte) {
		log.Printf("got message : %s", msg)
		m.Broadcast(msg)
	})

	http.ListenAndServe(":5000", nil)
}
