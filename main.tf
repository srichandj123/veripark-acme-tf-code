#Resource Group Module
module "rg" {
  source   = "./modules/resource-group"
  rg_name  = var.rg_name
  location = var.location
  tags = {
    Application = "E-Commerce Web Api"
    Owner       = "Acme Corp"
    GL          = "9999"
  }
}

#VNET Module
module "prodvnet" {
  source        = "./modules/vnet"
  vnet_name     = var.vnet_name
  location      = module.rg.location
  rg_name       = module.rg.rg_name
  address_space = ["10.0.0.0/16"]
  tags          = module.rg.tags
}

#Subnet Module
module "subnet" {
  source = "./modules/subnet"
  subnets = [
    {
      snet_name          = "frondend-subnet"
      address_prefixes   = ["10.0.1.0/24"]
      delegation_name    = "webdelegation"
      delegation_service = "Microsoft.Web/serverFarms"
    },
    {
      snet_name          = "middleware-subnet"
      address_prefixes   = ["10.0.2.0/24"]
      delegation_name    = null
      delegation_service = null
    },
    {
      snet_name          = "data-subnet"
      address_prefixes   = ["10.0.3.0/24"]
      delegation_name    = null
      delegation_service = null
    }
  ]
  rg_name   = module.rg.rg_name
  vnet_name = module.prodvnet.vnet_name
}

#User assigned managed identity -KV
resource "azurerm_user_assigned_identity" "admin" {
  name                = "sql-admin"
  location            = module.rg.location
  resource_group_name = module.rg.rg_name
}
