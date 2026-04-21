resource "azurerm_role_assignment" "hr_reader" {
  scope                = azurerm_resource_group.hr.id
  role_definition_name = "Reader"
  principal_id         = var.hr_group_object_id
}

resource "azurerm_role_assignment" "finance_blob_reader" {
  scope                = azurerm_storage_account.finance_storage.id
  role_definition_name = "Storage Blob Data Reader"
  principal_id         = var.finance_group_object_id
}

resource "azurerm_role_assignment" "it_vm_contributor" {
  scope                = azurerm_resource_group.ops.id
  role_definition_name = "Virtual Machine Contributor"
  principal_id         = var.it_support_group_object_id
}

resource "azurerm_role_assignment" "cloud_admin_hr" {
  scope                = azurerm_resource_group.hr.id
  role_definition_name = "Contributor"
  principal_id         = var.cloud_admins_group_object_id
}

resource "azurerm_role_assignment" "cloud_admin_finance" {
  scope                = azurerm_resource_group.finance.id
  role_definition_name = "Contributor"
  principal_id         = var.cloud_admins_group_object_id
}

resource "azurerm_role_assignment" "cloud_admin_ops" {
  scope                = azurerm_resource_group.ops.id
  role_definition_name = "Contributor"
  principal_id         = var.cloud_admins_group_object_id
}