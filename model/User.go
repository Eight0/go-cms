package model

import (
	"crypto/md5"
	"fmt"
	"project/cms/tool"
	"time"
)

type User struct {
	Model
	Id                 uint   `gorm:"primary_key"`
	Username           string `gorm:"type:varchar(30);not null;unique"`
	PasswordHash       string `gorm:"type:varchar(64);not null;column:password_hash"`
	PasswordResetToken string
	Email              string
	AuthKey            string
	Status             uint8
	AccessToken        string `gorm:"column:access_token"`
	Allowance          uint
	CreatedAt          time.Time `gorm:"type:varchar(64);column:created_at"`
	UpdatedAt          time.Time `gorm:"column:updated_at"`
	AllowanceUpdatedAt time.Time `gorm:"column:allowance_updated_at"`
}
func (u User) TableName() string {
	return "user"
}

func (u *User) generatePassword(password string) string{
	Md5Inst := md5.New()
	Md5Inst.Write([]byte(password))
	password = fmt.Sprintf("%x",Md5Inst.Sum([]byte("")))
	return password
}

func (u *User) CreateUser(username string,passwd string)  {
	u.Username = username
	u.PasswordHash = u.generatePassword(passwd)
	u.CreatedAt = time.Now()
	u.UpdatedAt = time.Now()
	u.AccessToken = tool.GetRandomString(64)
	u.Status = 10
	u.Create(u)
}

func (u *User) GetUserByName(username string) {
	u.GetOne(u,&User{Username:username},"id desc")
}

func (u *User) GetUserByAccessToken(accessToken string){
	u.GetOne(u,&User{AccessToken:accessToken},"id desc")
}

func (u *User) Login(username string,password string) bool{
	u.GetUserByName(username)
	if u.PasswordHash == u.generatePassword(password){
		u.UpdatedAt = time.Now()
		u.Update(u)
		return true
	}else {
		return false
	}
}

