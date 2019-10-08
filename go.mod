module project/cms

go 1.12

require (
	github.com/binance-chain/go-sdk v1.1.3
	github.com/gin-gonic/gin v1.4.0
	github.com/jinzhu/gorm v1.9.10
	github.com/mikemintang/go-curl v0.1.0
	github.com/nsf/gocode v0.0.0-20190302080247-5bee97b48836 // indirect

)

replace github.com/tendermint/go-amino => github.com/binance-chain/bnc-go-amino v0.14.1-binance.1
