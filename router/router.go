package router

import (
	"project/cms/controllers"

	"github.com/gin-gonic/gin"
)

func RegisterRouter(r *gin.Engine) {
	adminRouter := r.Group("/v1/admin")
	{
		adminRouter.GET("/login", controllers.AdminLogin)
		adminRouter.GET("/create", controllers.AdminCreate)
		adminRouter.GET("/list", controllers.AdminList)
	}

	bnbRouter := r.Group("/v1/bnb")
	{
		bnbRouter.GET("/account", controllers.BNBAccount)           //bnb 账户
		bnbRouter.GET("/tokens", controllers.BNBTokens)             //bnb 代币
		bnbRouter.GET("/tx", controllers.BNBTx)                     //交易详情
		bnbRouter.GET("/transactions", controllers.BNBTransactions) //转账交易数据
		bnbRouter.GET("/balance", controllers.BNBBalance)           //账户余额
		bnbRouter.GET("/broadcast_tx", controllers.BNBBroadcastTx)  //广播交易
	}

	testRouter := r.Group("test")
	{
		testRouter.GET("/auth", controllers.Auth)
	}
}
