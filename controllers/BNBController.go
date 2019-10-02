package controllers

/*
有关于币安的接口控制器
*/
import (
	"fmt"

	"github.com/gin-gonic/gin"
	"github.com/mikemintang/go-curl"
)

var V1HttpServer string = "https://dex.binance.org/api/v1/"

func responseJSON(c *gin.Context, apiURL string) {
	req := curl.NewRequest()
	resp, err := req.SetUrl(apiURL).Get()
	if err != nil {
		fmt.Println(err)
	} else {
		if resp.IsOk() {
			c.JSON(200, resp.Body)
		} else {
			panic(resp.Raw)
		}
	}
}
func responseError(c *gin.Context, err string) {
	c.JSON(201, gin.H{"err": err})
}

/**
 * 获取账号详情
 */
func BNBAccount(c *gin.Context) {
	if address, ok := c.GetQuery("address"); ok {
		apiURL := V1HttpServer + "account/" + address
		responseJSON(c, apiURL)
	} else {
		responseError(c, "address is none")
	}

}

/**
* 获取交易详情
 */
func BNBTx(c *gin.Context) {
	apiURL := V1HttpServer + "tx/433806D6A4AB6359CB56EC55BA99896DFAB2AF11326B74881A2ABA7049C492D3"
	responseJSON(c, apiURL)
}

/**
* 获取币安代币
 */
func BNBTokens(c *gin.Context) {
	apiURL := V1HttpServer + "tokens"
	responseJSON(c, apiURL)
}

/**
* 获取账户交易历史
 */
func BTNTransactions(c *gin.Context) {
	apiURL := V1HttpServer + "/transactions?address=bnb1jxfh2g85q3v0tdq56fnevx6xcxtcnhtsmcu64m&limit=10&txAsset=BNB"
	responseJSON(c, apiURL)
}
