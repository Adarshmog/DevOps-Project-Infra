terraform {
  required_providers {
    azurerm = {
      source = "hashicorp/azurerm"
      version = "4.49.0"
    }

 random = {
      source  = "hashicorp/random"
      version = "3.7.2"
    }
  }
}

provider "azurerm" {
features {}

  subscription_id = var.subscription_id
  tenant_id       = var.tenant_id

}

# Resource Group
resource "azurerm_resource_group" "tfstate_rg" {
  name     = var.rg_name
  location = var.location
}



# Random suffix for unique storage account name
resource "random_integer" "rand" {
  min = 10000
  max = 99999
}

# Storage Account
resource "azurerm_storage_account" "tfstate_sa" {
  name                     = lower("${var.storage_account_prefix}${random_integer.rand.result}")
  resource_group_name      = azurerm_resource_group.tfstate_rg.name
  location                 = azurerm_resource_group.tfstate_rg.location
  account_tier             = "Standard"
  account_replication_type = "LRS"
  allow_blob_public_access = false

  tags = {
    environment = "terraform-backend"
  }
}

# Container for state file
resource "azurerm_storage_container" "tfstate_container" {
  name                  = var.container_name
  storage_account_name  = azurerm_storage_account.tfstate_sa.name
  container_access_type = "private"
}

# Outputs for backend configuration
output "backend_config" {
  value = {
    resource_group_name  = azurerm_resource_group.tfstate_rg.name
    storage_account_name = azurerm_storage_account.tfstate_sa.name
    container_name       = azurerm_storage_container.tfstate_container.name
    key                  = "terraform.tfstate"
  }
}




