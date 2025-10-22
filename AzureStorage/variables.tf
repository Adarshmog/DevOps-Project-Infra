

# Azure authentication details
variable "subscription_id" {
  description = "Azure Subscription ID"
  type        = string
}

variable "tenant_id" {
  description = "Azure Tenant ID"
  type        = string
}

# Resource Group details
variable "rg_name" {
  description = "Name of the resource group to store backend"
  type        = string
  default     = "rg-tfstate"
}

variable "location" {
  description = "Azure region to deploy resources"
  type        = string
  default     = "eastus"
}

# Storage account configuration
variable "storage_account_prefix" {
  description = "Prefix for storage account name (will be made unique automatically)"
  type        = string
  default     = "tfstate"
}

variable "container_name" {
  description = "Name of the blob container to store Terraform state"
  type        = string
  default     = "tfstate"
}


