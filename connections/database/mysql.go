package DB

import (
	"fmt"
	"github.com/jinzhu/gorm"
	_ "github.com/jinzhu/gorm/dialects/mysql"
	"project/cms/config"
)
var(
	db *gorm.DB
	err error
)

func init(){
	sql_con := fmt.Sprintf("%s:%s@/%s?charset=utf8&parseTime=True&loc=Local", config.DB_USER,config.DB_PASS,config.DB_NAME)
	db, err = gorm.Open("mysql", sql_con)
	if err != nil {
		panic(err)
	}else{
		db.LogMode(true)
		db.SingularTable(true)
	}
}
func UpdateRecord(record interface{}){
	db.Save(record)
}
func CreateRecord(record interface{}){
	if db.NewRecord(record){
		db.Create(record)
	}
}
func GetList(outs interface{},where interface{},limit int,offset int,order string){
	db.Where(where).Offset(offset).Limit(limit).Order(order).Find(outs);
}
func GetOne(out interface{},where interface{},order string){
	db.Where(where).Order(order).First(out)
}

