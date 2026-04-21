resource "azurerm_storage_account" "finance_storage" {
  name                     = var.storage_account_name
  resource_group_name      = azurerm_resource_group.finance.name
  location                 = var.location
  account_tier             = "Standard"
  account_replication_type = "LRS"

  min_tls_version               = "TLS1_2"
  public_network_access_enabled = true
}

resource "azurerm_storage_container" "finance_container" {
  name                  = var.finance_container_name
  storage_account_id    = azurerm_storage_account.finance_storage.id
  container_access_type = "private"
}