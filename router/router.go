package router

import (
	"github.com/gin-gonic/gin"
	"project/cms/controllers"
)

func RegisterRouter(r *gin.Engine){
	adminRouter := r.Group("/v1/admin")
	{
		adminRouter.GET("/login",controllers.AdminLogin)
		adminRouter.GET("/create",controllers.AdminCreate)
		adminRouter.GET("/list",controllers.AdminList)
	}
}

