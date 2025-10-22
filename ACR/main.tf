data "azurerm_resource_group" "existing_rg" {
  name     = var.resource_group_name
  
}

resource "azurerm_container_registry" "acr" {
  name                = var.container_registry_name
  resource_group_name = data.azurerm_resource_group.existing_rg.name
  location            = data.azurerm_resource_group.existing_rg.location
  sku                 = "Premium"
  admin_enabled       = false
  georeplications {
    location                = var.georeplication_location
    zone_redundancy_enabled = true
    tags                    = {}
  }
}

