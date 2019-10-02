package main

import (
	"project/cms/middleware"
	"project/cms/router"

	"github.com/gin-gonic/gin"
)

func main() {
	r := gin.Default()
	//add middleware router
	middleware.UseMiddleWare(r)
	router.RegisterRouter(r)
	r.Run(":9001")
}
