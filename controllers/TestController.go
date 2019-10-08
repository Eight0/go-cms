package controllers

import (
	"fmt"

	"github.com/gin-gonic/gin"
)

/**
* auth test
 */
func Auth(c *gin.Context) {

	fmt.Print("\nURL:")
	if c.Request.URL.Path == "/test/auth" {
		//c.JSON(401, c.Request.URL.Path)
	}
	fmt.Printf("%v", c.Request.URL.Path)
	fmt.Print("\n")

	/*
		user, _ := c.GetQuery(gin.AuthUserKey)
		var auth string = string(c.Request.Header["Authorization"][0])
		auths := strings.Split(auth, " ")

		//basic auth
		if auths[0] == "Basic" {
			if ret, err := base64.StdEncoding.DecodeString(auths[1]); err == nil {
				user_pwd := strings.Split(string(ret), ":")
				if user_pwd[0] == "foo" && user_pwd[1] == "bar" {
					c.JSON(401, gin.H{"msg": "auth faile"})
					c.Abort()
				}
			} else {
				c.JSON(401, gin.H{"msg": err})
				c.Abort()
			}
		}

		if secret, ok := secrets[user]; ok {
			c.JSON(200, gin.H{"user": user, "secret": secret})
		} else {
			c.JSON(200, gin.H{"user": user, "secret": "No SECRET :("})
		}*/
}
