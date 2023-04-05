package main

import "github.com/corazawaf/coraza/v3"


func initCoraza() {
	coraza.NewWaf()
}

func main() {
	initCoraza()
}
