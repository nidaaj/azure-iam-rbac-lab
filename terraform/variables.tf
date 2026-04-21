variable "location" {
  description = "Azure region"
  type        = string
  default     = "Canada Central"
}

variable "rg_hr_name" {
  type    = string
  default = "rg-hr-dev"
}

variable "rg_finance_name" {
  type    = string
  default = "rg-finance-dev"
}

variable "rg_ops_name" {
  type    = string
  default = "rg-ops-dev"
}

variable "storage_account_name" {
  type    = string
  default = "finstoragenida001"
}

variable "finance_container_name" {
  type    = string
  default = "finance-docs"
}

variable "vnet_name" {
  type    = string
  default = "vnet-ops-dev"
}

variable "subnet_name" {
  type    = string
  default = "subnet-ops-dev"
}

variable "public_ip_name" {
  type    = string
  default = "pip-ops-dev-01"
}

variable "nic_name" {
  type    = string
  default = "nic-ops-dev-01"
}

variable "vm_name" {
  type    = string
  default = "vm-ops-dev-01"
}

variable "admin_username" {
  type    = string
  default = "azureadmin"
}

variable "admin_password" {
  type        = string
  sensitive   = true
  description = "VM admin password"
}

variable "hr_group_object_id" {
  type        = string
  description = "Object ID of HR-Team group"
}

variable "finance_group_object_id" {
  type        = string
  description = "Object ID of Finance-Team group"
}

variable "it_support_group_object_id" {
  type        = string
  description = "Object ID of IT-Support group"
}

variable "cloud_admins_group_object_id" {
  type        = string
  description = "Object ID of Cloud-Admins group"
}