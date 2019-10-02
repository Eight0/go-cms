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
		bnbRouter.GET("/account", controllers.BNBAccount)
		bnbRouter.GET("/tokens", controllers.BNBTokens)
		bnbRouter.GET("/tx", controllers.BNBTx)
		bnbRouter.GET("/transactions", controllers.BTNTransactions)
	}
}
