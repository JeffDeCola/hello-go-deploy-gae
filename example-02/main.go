// hello-go-deploy-gae main.go

package main

import (
	"net/http"

	"google.golang.org/appengine"
)

func main() {

	http.HandleFunc("/", handle)
	appengine.Main()
}

func handle(w http.ResponseWriter, r *http.Request) {
}
