variable "resource_group_name" {
  description = "Name of the resource group containing the Key Vault"
  type        = string
}

variable "location" {
  description = "Azure region for the Key Vault"
  type        = string
  default     = "Central India"
}

variable "keyvault_name" {
  description = "Name of the Azure Key Vault"
  type        = string
}

variable "tenant_id" {
  description = "Azure Tenant ID for Key Vault access"
  type        = string
}

variable "sku_name" {
  description = "SKU for the Key Vault (standard or premium)"
  type        = string
  default     = "standard"
}

# The following variables are not used by this code
# but can be kept if you plan to extend with storage backend
variable "container_name" {
  description = "Container name (for backend)"
  type        = string
  default     = ""
}

variable "storage_account_name" {
  description = "Storage account name (for backend)"
  type        = string
  default     = ""
}

variable "key" {
  description = "Statefile name (for backend)"
  type        = string
  default     = ""
}

