package main

import (
	"log"
	"net/http"
)

func main() {
	http.Handle("/ping", Ping())

	if err := http.ListenAndServe(":8080", nil); err != nil {
		log.Fatal(err)
	}
}

func Ping() http.HandlerFunc {
	return func(w http.ResponseWriter, r *http.Request) {
		if _, err := w.Write([]byte("pong")); err != nil {
			http.Error(w, "Internal server error", http.StatusInternalServerError)
		}
	}
}
