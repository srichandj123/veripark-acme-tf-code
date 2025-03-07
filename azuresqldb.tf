
#Azure SQL Server
resource "azurerm_mssql_server" "mssql" {
  name                         = var.mssql_name
  resource_group_name          = module.rg.rg_name
  location                     = module.rg.location
  version                      = "12.0"
  administrator_login          = data.azurerm_key_vault_secret.uname.value
  administrator_login_password = data.azurerm_key_vault_secret.pass.value
}

#Azure SQL DB
resource "azurerm_mssql_database" "mssqldb" {
  name         = var.mssql_db
  server_id    = azurerm_mssql_server.mssql.id
  collation    = "SQL_Latin1_General_CP1_CI_AS"
  license_type = "LicenseIncluded"
  sku_name     = var.mssqlsku
  tags         = module.rg.tags
  identity {
    type         = "UserAssigned"
    identity_ids = [azurerm_user_assigned_identity.admin.id]
  }

  transparent_data_encryption_key_vault_key_id = azurerm_key_vault_key.sqlkey.id

  # prevent the possibility of accidental data loss
  lifecycle {
    prevent_destroy = true
  }
}
