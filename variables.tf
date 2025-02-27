#Resource Group Name
variable "rg_name" {
  type = string
}
#Location
variable "location" {
  type = string
}

#VNet Name
variable "vnet_name" {
  type = string
}

#Front-End app SVC Plan
variable "fe_apsvc_plan" {
  type = string
}

#Front-End app SVC Name
variable "fe_webapi_name" {
  type = string
}

#Front-End app SKU
variable "fe_webapi_sku" {
  type = string
}

#Middleware app SVC Plan
variable "mid_apsvc_plan" {
  type = string
}

#Middleware app SVC Name
variable "mid_webapi_name" {
  type = string
}

#Middleware app svc KU
variable "mid_webapi_sku" {
  type = string
}

#Azure SQL Server SKU
variable "mssqlsku" {
  type = string
}

#Azure SQL Server Name
variable "mssql_name" {
  type = string
}

#Azure SQL Server DB
variable "mssql_db" {
  type = string
}