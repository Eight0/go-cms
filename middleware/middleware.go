package middleware

import (
	"fmt"
	"time"

	"github.com/gin-gonic/gin"
)

/*
@author york
gin 中间件
IPRateLimiter 访问频率限制
WhiteIP 白名单
BlackIP 黑名单
*/
type IPAccess struct {
	IP          string
	Allowance   int
	AllowanceAt time.Time
}

var IPAccessList []IPAccess

//10秒钟只能访问一次
var Allowance int = 5
var AllowanceTime int64 = 60

func UseMiddleWare(r *gin.Engine) {
	r.Use(BlackIP(), WhiteIP(), IPRateLimter())
}

//IP访问限制
func IPRateLimter() gin.HandlerFunc {
	return func(c *gin.Context) {
		ip := c.ClientIP()
		ipExist := false

		for index, ipAccess := range IPAccessList {
			fmt.Printf("\n%v\n", ipAccess)
			if ipAccess.IP == ip {
				ipExist = true
				//超过时间限制
				fmt.Print("\n____start__\n")
				fmt.Print(ipAccess.AllowanceAt.Unix() + AllowanceTime)
				fmt.Print("\n")
				fmt.Print(time.Now().Unix())
				fmt.Print("\n____end___\n")
				if (ipAccess.AllowanceAt.Unix() + AllowanceTime) < time.Now().Unix() {
					IPAccessList[index].Allowance = Allowance - 1
					IPAccessList[index].AllowanceAt = time.Now()
				} else {
					IPAccessList[index].Allowance--
				}
				fmt.Print(IPAccessList[index].Allowance)
				if IPAccessList[index].Allowance <= 0 {
					c.JSON(403, gin.H{
						"msg": "ip access over limit",
					})
					c.Abort()
				}
				break
			}
		}
		if !ipExist {
			IPAccessList = append(IPAccessList, IPAccess{
				IP:          ip,
				Allowance:   Allowance,
				AllowanceAt: time.Now(),
			})
		}
	}
}

func BlackIP() gin.HandlerFunc {
	return func(c *gin.Context) {
		var ipList = []string{
			"127.0.0.2",
		}
		clientIP := c.ClientIP()
		for _, ip := range ipList {
			if ip == clientIP {
				c.JSON(401, gin.H{"msg": "IP Blocks"})
				c.Abort()
			}
		}
	}
}

func WhiteIP() gin.HandlerFunc {
	return func(c *gin.Context) {
		var ipList = []string{
			"127.0.0.1",
		}
		flag := false
		clientIP := c.ClientIP()
		for _, ip := range ipList {
			if ip == clientIP {
				flag = true
				break
			}
		}
		if !flag {
			c.JSON(403, gin.H{"msg": "IP Not Allowed"})
			c.Abort()
		}
	}
}
