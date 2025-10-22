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


