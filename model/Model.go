package model

import (
	DB "project/cms/connections/database"
)

type Model struct {

}

func (m *Model) GetOne(out interface{},where interface{},order string)  {
	DB.GetOne(out,where,order)
}

func (m *Model) GetList(outs interface{},where interface{},limit int,offset int,order string){
	DB.GetList(outs,where,limit,offset,order)
}

func (m *Model) Create(record interface{}){
	DB.CreateRecord(record)
}

func (m *Model) Update(record interface{}){
	DB.UpdateRecord(record)
}