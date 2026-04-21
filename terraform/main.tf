resource "azurerm_resource_group" "hr" {
  name     = var.rg_hr_name
  location = var.location
}

resource "azurerm_resource_group" "finance" {
  name     = var.rg_finance_name
  location = var.location
}

resource "azurerm_resource_group" "ops" {
  name     = var.rg_ops_name
  location = var.location
}

resource "azurerm_log_analytics_workspace" "ops_law" {
  name                = "log-ops-dev-law"
  location            = var.location
  resource_group_name = azurerm_resource_group.ops.name
  sku                 = "PerGB2018"
  retention_in_days   = 30
}