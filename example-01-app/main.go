// hello-go-deploy-gae main.go

package main

import (
	"fmt"
	"net/http"

	"google.golang.org/appengine"
)

func main() {

	http.HandleFunc("/", handle)
	appengine.Main()

	// Starts listening on localhost (127.0.0.1:1234)
	// log.Fatal(http.ListenAndServe(":1234", nil))
}

func handle(w http.ResponseWriter, r *http.Request) {
	fmt.Fprintln(w, "Hello, world!")
}
