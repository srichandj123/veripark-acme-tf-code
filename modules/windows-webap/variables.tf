variable "webapp_name" {
  type = string
}

#location of the svc plan
variable "location" {
  type    = string
  default = ""
}

#Resourcegroup name
variable "rg_name" {
  type = string
}

#Service Pland ID
variable "svc_plan_id" {
  type = string
}

#Public Access
variable "public_access" {
  type = bool
}
