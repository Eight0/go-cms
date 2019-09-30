package controllers

import (
	"github.com/gin-gonic/gin"
	"net/http"
	"project/cms/model"
	"strings"
)
func AdminCreate(c *gin.Context){
	username,_ := c.GetQuery("username")
	passwd,_:=c.GetQuery("password")
	var user model.User
	user.CreateUser(username,passwd)
	if user.Id>0{
		c.JSON(http.StatusOK,gin.H{
			"token":user.AccessToken,
			"msg":"创建成功",
			"code":200,
		})
	}else {
		c.JSON(http.StatusOK,gin.H{
			"msg":"创建失败",
			"code":500,
		})
	}
}
func AdminLogin(c *gin.Context){
	username,_ := c.GetQuery("username")
	passwd,_:=c.GetQuery("password")

	var user model.User

	if user.Login(username,passwd){
		c.JSON(http.StatusOK,gin.H{
			"access-token":user.AccessToken,
		})
	}else{
		c.JSON(200,gin.H{
			"access-token":"",
		})
	}
}

func AdminList(c *gin.Context){
	var users []model.User
	var user model.User
	user.GetList(&users,&model.User{Status:10},10,0,"id desc")

	var username  string
	for _,user :=range users{
		username += (user.Username+",")
	}
	c.JSON(http.StatusOK,gin.H{
		"usernames":strings.Trim(username,","),
	})
}
