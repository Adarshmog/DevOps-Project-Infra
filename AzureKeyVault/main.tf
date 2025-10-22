terraform {
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "4.38.1"
    }
  }

  backend "azurerm" {
    # configure backend details in terraform.tfvars or pipeline
  }
}

provider "azurerm" {
  features {}
}

# Fetch existing resource group
data "azurerm_resource_group" "rg" {
  name = var.resource_group_name
}

# Create Key Vault
resource "azurerm_key_vault" "kv" {
  name                = var.keyvault_name
  location            = data.azurerm_resource_group.rg.location
  resource_group_name = data.azurerm_resource_group.rg.name
  tenant_id           = var.tenant_id
  sku_name            = var.sku_name

  # (Optional) Enable purge protection
  purge_protection_enabled = true
  soft_delete_retention_days = 90

  tags = {
    environment = "dev"
  }
}

# Assign access policy (new recommended approach — separate resource)
resource "azurerm_key_vault_access_policy" "policy" {
  key_vault_id = azurerm_key_vault.kv.id
  tenant_id    = var.tenant_id
  object_id    = "5a6243f0-d76e-44bd-b444-46462d3ace1b" # Replace with your AAD object ID

  key_permissions = [
    "Get",
    "List",
    "Create",
  ]

  secret_permissions = [
    "Get",
    "List",
    "Set",
  ]
}

