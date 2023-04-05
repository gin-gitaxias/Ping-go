package main

import (
	"github.com/corazawaf/coraza/v3"
	"github.com/corazawaf/coraza/v3/seclang"
)

func parseRules(waf *coraza.Waf) {
	parser := seclang.NewParser(waf)
	if err := parser.FromString(`SecAction "id:1,phase:1,deny:403,log"`); err != nil {
		panic(err)
	}
}

func main() {
    waf := coraza.NewWaf()
    parseRules(waf)
    waf.Run()
}