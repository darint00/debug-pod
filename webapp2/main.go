package main

import (
	"net/http"
	"os"
)

func indexHandler(w http.ResponseWriter, r *http.Request) {
	w.Write([]byte("<h1>Hello From webapp2!</h1>"))
	name, _ := os.Hostname()
	w.Write([]byte(name))
}

func main() {
	port := os.Getenv("PORT")
	if port == "" {
		port = "3030"
	}

	mux := http.NewServeMux()

	mux.HandleFunc("/", indexHandler)
	http.ListenAndServe(":"+port, mux)
}
