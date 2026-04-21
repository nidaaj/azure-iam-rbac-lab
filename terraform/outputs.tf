output "hr_resource_group_name" {
  value = azurerm_resource_group.hr.name
}

output "finance_resource_group_name" {
  value = azurerm_resource_group.finance.name
}

output "ops_resource_group_name" {
  value = azurerm_resource_group.ops.name
}

output "storage_account_name" {
  value = azurerm_storage_account.finance_storage.name
}

output "vm_name" {
  value = azurerm_windows_virtual_machine.ops_vm.name
}

output "log_analytics_workspace_name" {
  value = azurerm_log_analytics_workspace.ops_law.name
}