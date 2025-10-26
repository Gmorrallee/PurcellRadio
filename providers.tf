terraform {
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      #version = "=4.1.0"
      version = ">= 4.11.0"
    }
  }
}

provider "azurerm" {
  features {}
 subscription_id = "43d74b2b-f6c0-4c6b-9e12-1095e6955562"
}

provider "azurerm" {
  features {}
  subscription_id = var.subscription_identity
  alias = "sub-identity"
}

provider "azurerm" {
  features {}
  subscription_id = var.subscription_connectivity
  alias = "sub-connectivity"
}

provider "azurerm" {
  features {}
  subscription_id = var.subscription_security
  alias = "sub-security"
}

provider "azurerm" {
  features {}
  subscription_id = var.subscription_production
  alias = "sub-production"
}

provider "azurerm" {
  features {}
  subscription_id = var.subscription_devtest
  alias = "sub-devtest"
}