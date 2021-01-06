package main

import "fmt"
import "net/http"

func handler(w http.ResponseWriter, r *http.Request) {
	fmt.Fprintf(w, "Hello!")
}

func main() {
    fmt.Println("hello world")

    fmt.Println("Waiting")
    j:=0
    for i:=0; i < 1000000; i++ {
    	for i1:=0; i1 < 6000; i1++ {
		j++
    	}
    }
    fmt.Println("Done")


    http.HandleFunc("/", handler)
    http.ListenAndServe(":9999", nil)
}
