// hello-go-deploy-gae main.go

package main

import (
	"fmt"
	"net/http"
	"sync"
	"time"

	"google.golang.org/appengine"
)

// Counter is the sum and mutex.
type Counter struct {
	sum  int
	lock sync.RWMutex
}

var counter = &Counter{}

// Result
func (c *Counter) Result() int {
	c.lock.Lock()
	count := c.sum
	c.lock.Unlock()
	return count
}

// addThis adds
func (c *Counter) addThis(i int) {
	c.lock.Lock()
	c.sum = c.sum + i
	c.lock.Unlock()
}

func loopForever() {
	counter.sum = 5
	var i = 1
	for true {
		counter.addThis(i)
		fmt.Println("Jeff - The count is:", counter.sum)
		time.Sleep(2000 * time.Millisecond)
	}
}

func main() {

	go loopForever()

	http.HandleFunc("/", handleJeff)
	appengine.Main()
	// log.Fatal(http.ListenAndServe(":1234", nil))

}

func handleJeff(w http.ResponseWriter, r *http.Request) {
	fmt.Fprintln(w, "Hello, world! - Example 03")
	fmt.Fprintln(w, "The current count is", counter.Result())
}
