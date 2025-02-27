
#Subnet
resource "azurerm_subnet" "snet" {
  count                = length(var.subnets)
  name                 = var.subnets[count.index].snet_name
  resource_group_name  = var.rg_name
  virtual_network_name = var.vnet_name
  address_prefixes     = var.subnets[count.index].address_prefixes
  dynamic "delegation" {
    for_each = lookup(var.subnets[count.index], "delegations", [])
    content {
      name = delegation.value.name

      service_delegation {
        name = delegation.value.service_delegation.name
      }
    }
  }
}
