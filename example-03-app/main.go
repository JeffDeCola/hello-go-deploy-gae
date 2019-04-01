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

func loopForever() {
	var a = 0
	var b = 1
	for true {
		a = addThis(a, b)
		fmt.Println("Hello all, I finished this!! The count is:", a)
		time.Sleep(2000 * time.Millisecond)
	}
}

func main() {

	loopForever()

	http.HandleFunc("/", handleJeff)
	appengine.Main()
}

func handleJeff(w http.ResponseWriter, r *http.Request) {
	fmt.Fprintln(w, "Hello, world! - Example 03")
	fmt.Fprintln(w, "The current number is 7")
}
