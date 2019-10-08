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

/**
* curl
* 返回json数据
 */
func responseJSON(c *gin.Context, apiURL string) {
	req := curl.NewRequest()
	resp, err := req.SetUrl(apiURL).Get()
	if err != nil {
		fmt.Println(err)
	} else {
		if resp.IsOk() {
			fmt.Println(resp.Body)
			c.String(200, resp.Body)
			//c.JSON(200, gin.H{"data": resp.Body})
		} else {
			panic(resp.Raw)
		}
	}
}

/**
* 返回error
* 格式json
 */
func responseError(c *gin.Context, err string) {
	c.JSON(201, gin.H{"err": err})
}

/**
 * 获取账号详情
 */
func BNBAccount(c *gin.Context) {
	if address, ok := c.GetQuery("address"); ok {
		apiURL := V1HttpServer + "account/" + address
		if len(address) > 0 {
			responseJSON(c, apiURL)
		} else {
			responseError(c, "address is none")
		}

	} else {
		responseError(c, "need address params")
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
func BNBTransactions(c *gin.Context) {
	apiURL := V1HttpServer + "/transactions?address=bnb1jxfh2g85q3v0tdq56fnevx6xcxtcnhtsmcu64m&limit=10&txAsset=BNB"
	responseJSON(c, apiURL)
}

/**
* 获取账户余额
 */
func BNBBalance(c *gin.Context) {
	if address, ok := c.GetQuery("address"); ok {
		apiURL := V1HttpServer + "balance?address=" + address
		responseJSON(c, apiURL)
	} else {
		responseError(c, "address can not be none")
	}
}

/**
* 广播交易
* broadcast tx
 */
func BNBBroadcastTx(c *gin.Context) {
	if tx, ok := c.GetQuery("tx"); ok {
		apiURL := V1HttpServer + "/broadcast?tx=" + tx
		responseJSON(c, apiURL)
	} else {
		responseError(c, "tx can not be none")
	}
}
