# Declare data sources for existing virtual networks

data azurerm_virtual_network "AZ01-idy-uks" {
  name                = "AZ01-idy-uks"
  resource_group_name = data.azurerm_resource_group.rg-identity-networking.name
  provider            = azurerm.sub-identity
}

data azurerm_virtual_network "AZ01-idy-ukw" {
  name                = "AZ01-idy-ukw"
  resource_group_name = data.azurerm_resource_group.rg-identity-networking.name
  provider            = azurerm.sub-identity
}

data azurerm_virtual_network "AZ01-conn-uks" {
  name                = "AZ01-conn-uks"
  resource_group_name = data.azurerm_resource_group.rg-connectivity-networking.name
  provider            = azurerm.sub-connectivity
}

data azurerm_virtual_network "AZ01-conn-ukw" {
  name                = "AZ01-conn-ukw"
  resource_group_name = data.azurerm_resource_group.rg-connectivity-networking.name
  provider            = azurerm.sub-connectivity
}

data "azurerm_virtual_network" "AZ01-prod-uks" {
  name                = "AZ01-prod-uks"
  resource_group_name = data.azurerm_resource_group.rg-production-networking.name
  provider            = azurerm.sub-production
}
data "azurerm_virtual_network" "AZ01-prod-ukw" {
  name                = "AZ01-prod-ukw"
  resource_group_name = data.azurerm_resource_group.rg-production-networking.name
  provider            = azurerm.sub-production
}

data "azurerm_virtual_network" "AZ01-devtest-uks" {
  name                = "AZ01-devtest-uks"
  resource_group_name = data.azurerm_resource_group.rg-devtest-networking.name
  provider            = azurerm.sub-devtest
}

data "azurerm_virtual_network" "AZ01-devtest-ukw" {
  name                = "AZ01-devtest-ukw"
  resource_group_name = data.azurerm_resource_group.rg-devtest-networking.name
  provider            = azurerm.sub-devtest
}

# Subnet definitions for Identity VNets

resource "azurerm_subnet" "Sn-Idy-DirServices-UKS" {
    name                 = "Sn-Idy-DirServices-UKS"
    resource_group_name  = data.azurerm_resource_group.rg-identity-networking.name
    virtual_network_name = data.azurerm_virtual_network.AZ01-idy-uks.name
    address_prefixes     = ["10.200.10.0/23"]
    provider             = azurerm.sub-identity
}

resource "azurerm_subnet" "Sn-Idy-Management-UKS" {
    name                 = "Sn-Idy-Management-UKS "
    resource_group_name  = data.azurerm_resource_group.rg-identity-networking.name
    virtual_network_name = data.azurerm_virtual_network.AZ01-idy-uks.name
    address_prefixes     = ["10.200.50.0/23"]
    provider             = azurerm.sub-identity
}

resource "azurerm_subnet" "Sn-Idy-DirServices-UKW" {
    name                 = "Sn-Idy-DirServices-UKW"
    resource_group_name  = data.azurerm_resource_group.rg-identity-networking.name
    virtual_network_name = data.azurerm_virtual_network.AZ01-idy-ukw.name
    address_prefixes     = ["10.201.10.0/23"]
    provider             = azurerm.sub-identity
}

resource "azurerm_subnet" "Sn-Idy-Management-UKW" {
    name                 = "Sn-Idy-Management-UKW"
    resource_group_name  = data.azurerm_resource_group.rg-identity-networking.name
    virtual_network_name = data.azurerm_virtual_network.AZ01-idy-ukw.name
    address_prefixes     = ["10.201.50.0/23"]
    provider             = azurerm.sub-identity
}

# Subnet definitions for Connectivity VNets

resource "azurerm_subnet" "Sn-Conn-Management-UKS" {
    name                 = "Sn-Conn-Management-UKS "
    resource_group_name  = data.azurerm_resource_group.rg-connectivity-networking.name
    virtual_network_name = data.azurerm_virtual_network.AZ01-conn-uks.name
    address_prefixes     = ["10.202.50.0/23"]
    provider             = azurerm.sub-connectivity
}

resource "azurerm_subnet" "Sn-Conn-Management-UKW" {
    name                 = "Sn-Conn-Management-UKW"
    resource_group_name  = data.azurerm_resource_group.rg-connectivity-networking.name
    virtual_network_name = data.azurerm_virtual_network.AZ01-conn-ukw.name
    address_prefixes     = ["10.203.50.0/23"]
    provider             = azurerm.sub-connectivity
}

resource "azurerm_subnet" "gatewaysubnet-uks" {
    name                 = "GatewaySubnet"
    resource_group_name  = data.azurerm_resource_group.rg-connectivity-networking.name
    virtual_network_name = data.azurerm_virtual_network.AZ01-conn-uks.name
    address_prefixes     = ["10.202.250.0/24"]
    provider             = azurerm.sub-connectivity
}

resource "azurerm_subnet" "azurebastionsubnet-uks" {
    name                 = "AzureBastionSubnet"
    resource_group_name  = data.azurerm_resource_group.rg-connectivity-networking.name
    virtual_network_name = data.azurerm_virtual_network.AZ01-conn-uks.name
    address_prefixes     = ["10.202.251.0/24"]
    provider             = azurerm.sub-connectivity
}

resource "azurerm_subnet" "azurefirewallsubnet-uks" {
    name                 = "AzureFirewallSubnet"
    resource_group_name  = data.azurerm_resource_group.rg-connectivity-networking.name
    virtual_network_name = data.azurerm_virtual_network.AZ01-conn-uks.name
    address_prefixes     = ["10.202.252.0/24"]
    provider             = azurerm.sub-connectivity
}

resource "azurerm_subnet" "gatewaysubnet-ukw" {
    name                 = "GatewaySubnet"
    resource_group_name  = data.azurerm_resource_group.rg-connectivity-networking.name
    virtual_network_name = data.azurerm_virtual_network.AZ01-conn-ukw.name
    address_prefixes     = ["10.203.250.0/24"]
    provider             = azurerm.sub-connectivity
}

resource "azurerm_subnet" "azurebastionsubnet-ukw" {
    name                 = "AzureBastionSubnet"
    resource_group_name  = data.azurerm_resource_group.rg-connectivity-networking.name
    virtual_network_name = data.azurerm_virtual_network.AZ01-conn-ukw.name
    address_prefixes     = ["10.203.251.0/24"]
    provider             = azurerm.sub-connectivity
}

resource "azurerm_subnet" "azurefirewallsubnet-ukw" {
    name                 = "AzureFirewallSubnet"
    resource_group_name  = data.azurerm_resource_group.rg-connectivity-networking.name
    virtual_network_name = data.azurerm_virtual_network.AZ01-conn-ukw.name
    address_prefixes     = ["10.203.252.0/24"]
    provider             = azurerm.sub-connectivity
}

# Subnet definitions for Production vNets

resource "azurerm_subnet" "Sn-Prod-Management-UKS" {
    name                 = "Sn-Prod-Management-UKS "
    resource_group_name  = data.azurerm_resource_group.rg-production-networking.name
    virtual_network_name = data.azurerm_virtual_network.AZ01-prod-uks.name
    address_prefixes     = ["10.204.50.0/23"]
    provider             = azurerm.sub-production
}
resource "azurerm_subnet" "Sn-Prod-Management-UKW" {
    name                 = "Sn-Prod-Management-UKW"
    resource_group_name  = data.azurerm_resource_group.rg-production-networking.name
    virtual_network_name = data.azurerm_virtual_network.AZ01-prod-ukw.name
    address_prefixes     = ["10.205.50.0/23"]
    provider             = azurerm.sub-production
}

# Subnet definitions for DevTest vNets

resource "azurerm_subnet" "Sn-DevTest-Management-UKS" {
    name                 = "Sn-DevTest-Management-UKS "
    resource_group_name  = data.azurerm_resource_group.rg-devtest-networking.name
    virtual_network_name = data.azurerm_virtual_network.AZ01-devtest-uks.name
    address_prefixes     = ["10.206.50.0/23"]
    provider             = azurerm.sub-devtest
}

resource "azurerm_subnet" "Sn-DevTest-Management-UKW" {
    name                 = "Sn-DevTest-Management-UKW"
    resource_group_name  = data.azurerm_resource_group.rg-devtest-networking.name
    virtual_network_name = data.azurerm_virtual_network.AZ01-devtest-ukw.name
    address_prefixes     = ["10.207.50.0/23"]
    provider             = azurerm.sub-devtest
}