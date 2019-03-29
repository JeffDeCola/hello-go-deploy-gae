// hello-go-deploy-gae main.go

package main

import (
	"fmt"
	"net/http"
	"time"

	"google.golang.org/appengine"
)

// Addthis Adds two ints together
func addThis(a int, b int) (temp int) {
	temp = a + b
	return
}

// Looping forever - For the testing Marathon and Mesos
func main() {
	appengine.Main()
	http.HandleFunc("/", handle)

	var a = 0
	var b = 1
	for {
		a = addThis(a, b)
		fmt.Println("Hello everyone, the count is:", a)
		time.Sleep(2000 * time.Millisecond)
	}
}

func handle(w http.ResponseWriter, r *http.Request) {
	fmt.Fprintln(w, "Hello, world!")
}
