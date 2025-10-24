resource "azurerm_resource_group" "rg-identity_networking" {
  name     = "RG-Identity-Networking"
  location = "uksouth"
  provider = azurerm.sub-identity
}

resource "azurerm_resource_group" "RG-Identity-Management" {   
  name     = "RG-Identity-Management"
  location = "uksouth"
  provider = azurerm.sub-identity
}
resource "azurerm_resource_group" "RG-Identity-DirServices" {   
  name     = "RG-Identity-DirServices"
  location = "uksouth"
  provider = azurerm.sub-identity
}

resource "azurerm_resource_group" "RG-Connectivity-Networking" {   
  name     = "RG-Connectivity-Networking"
  location = "uksouth"
  provider = azurerm.sub-connectivity
}

resource "azurerm_resource_group" "RG-Connectivity-Management" {
  name = "RG-Connectivity-Management"
    location = "uksouth"
    provider = azurerm.sub-connectivity
}

resource "azurerm_resource_group" "RG-Security-Networking" {
  name     = "RG-Security-Networking"
  location = "uksouth"
  provider = azurerm.sub-security
}

resource "azurerm_resource_group" "RG-Security-Management" {
  name     = "RG-Security-Management"
  location = "uksouth"
  provider = azurerm.sub-security
}

resource "azurerm_resource_group" "RG-Production-Networking" {
  name     = "RG-Production-Networking"
  location = "uksouth"
  provider = azurerm.sub-production
}

resource "azurerm_resource_group" "RG-Production-Management" {
  name     = "RG-Production-Management"
  location = var.location_production
  provider = azurerm.sub-production
}

resource "azurerm_resource_group" "RG-DevTest-Networking" {
  name     = "RG-DevTest-Networking"
  location = "uksouth"
  provider = azurerm.sub-devtest
}

resource "azurerm_resource_group" "RG-DevTest-Management" {
  name     = "RG-DevTest-Management"
  location = var.location_devtest
  provider = azurerm.sub-devtest
}

resource "azurerm_resource_group" "RG-Production-Cornwall" {
  name     = "RG-Production-Cornwall"
  location = var.location_production
  provider = azurerm.sub-production
  
}

resource "azurerm_resource_group" "RG-DevTest-Cornwall" {
  name     = "RG-DevTest-Cornwall"
  location = var.location_devtest
  provider = azurerm.sub-devtest
}

resource "azurerm_resource_group" "RG-Production-EpsomStHelier" {
  name = "RG-Production-EpsomStHelier"
    location = var.location_production
    provider = azurerm.sub-production
}

resource "azurerm_resource_group" "RG-DevTest-EpsomStHelier" {
  name = "RG-DevTest-EpsomStHelier"
    location = var.location_devtest
    provider = azurerm.sub-devtest
}

resource "azurerm_resource_group" "RG-Production-Mitie" {
  name = "RG-Production-Mitie"
    location = var.location_production
    provider = azurerm.sub-production
}

resource "azurerm_resource_group" "RG-DevTest-Mitie" {
  name = "RG-DevTest-Mitie"
    location = var.location_devtest
    provider = azurerm.sub-devtest
}

resource "azurerm_resource_group" "RG-Production-OCS" {
  name = "RG-Production-OCS"
    location = var.location_production
    provider = azurerm.sub-production
}

resource "azurerm_resource_group" "RG-DevTest-OCS" {
  name = "RG-DevTest-OCS"
    location = var.location_devtest
    provider = azurerm.sub-devtest
}

resource "azurerm_resource_group" "RG-Production-Serco" {
 name = "RG-Production-Serco"
    location = var.location_production
    provider = azurerm.sub-production
}

resource "azurerm_resource_group" "RG-DevTest-Serco" {
  name = "RG-DevTest-Serco"
    location = var.location_devtest
    provider = azurerm.sub-devtest
}

resource "azurerm_resource_group" "RG-Production-Sodexo" {
  name = "RG-Production-Sodexo"
    location = var.location_production
    provider = azurerm.sub-production
}

resource "azurerm_resource_group" "RG-DevTest-Sodexo" {
  name = "RG-DevTest-Sodexo"
    location = var.location_devtest
    provider = azurerm.sub-devtest
}

resource "azurerm_resource_group" "RG-Production-Stanley" {
  name = "RG-Production-Wiltshire"
    location = var.location_production
    provider = azurerm.sub-production
}

resource "azurerm_resource_group" "RG-DevTest-Stanley" {
  name = "RG-DevTest-Wiltshire"
    location = var.location_devtest
    provider = azurerm.sub-devtest
}