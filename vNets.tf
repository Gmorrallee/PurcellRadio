data "azurerm_resource_group" "rg-identity-networking" {
  name     = "RG-Identity-Networking"
  provider = azurerm.sub-identity
  
}

data "azurerm_resource_group" "rg-connectivity-networking" {
  name     = "RG-Connectivity-Networking"
  provider = azurerm.sub-connectivity
  
}

data "azurerm_resource_group" "rg-security-networking" {
  name     = "RG-Security-Networking"
  provider = azurerm.sub-security
  
}

data "azurerm_resource_group" "rg-production-networking" {
  name     = "RG-Production-Networking"
  provider = azurerm.sub-production
  
}

data "azurerm_resource_group" "rg-devtest-networking" {
  name     = "RG-DevTest-Networking"
  provider = azurerm.sub-devtest
  
}

resource "azurerm_virtual_network" "Vnet-Idy-UKS" {
  name                = "AZ01-Idy-UKS"
  address_space       = ["10.200.0.0/16"]
  location            = var.location_production
  resource_group_name = data.azurerm_resource_group.rg-identity-networking.name
  provider            = azurerm.sub-identity
}

resource "azurerm_virtual_network" "Vnet-Conn-UKS" {
    name                = "AZ01-Conn-UKS"
    address_space       = ["10.202.0.0/16"]
    location            = var.location_production
    resource_group_name = data.azurerm_resource_group.rg-connectivity-networking.name
    provider            = azurerm.sub-connectivity  
}

resource "azurerm_virtual_network" "Vnet-Sec-UKS" {
    name                = "AZ01-Sec-UKS"
    address_space       = ["10.208.0.0/16"]
    location            = var.location_production
    resource_group_name = data.azurerm_resource_group.rg-security-networking.name   
    provider            = azurerm.sub-security
}

resource "azurerm_virtual_network" "Vnet-Prod-UKS" {
    name                = "AZ01-Prod-UKS"
    address_space       = ["10.204.0.0/16"]
    location            = var.location_production
    resource_group_name = data.azurerm_resource_group.rg-production-networking.name   
    provider            = azurerm.sub-production
}

resource "azurerm_virtual_network" "Vnet-DevTest-UKS" {
    name                = "AZ01-DevTest-UKS"
    address_space       = ["10.206.0.0/16"]
    location            = var.location_production
    resource_group_name = data.azurerm_resource_group.rg-devtest-networking.name
    provider            = azurerm.sub-devtest
}   

resource "azurerm_virtual_network" "Vnet-Idy-UKW" {
  name                = "AZ01-Idy-UKW"
  address_space       = ["10.201.0.0/16"]
  location            = var.location_dr
  resource_group_name = data.azurerm_resource_group.rg-identity-networking.name
  provider            = azurerm.sub-identity
}

resource "azurerm_virtual_network" "Vnet-Conn-UKW" {
    name                = "AZ01-Conn-UKW"
    address_space       = ["10.203.0.0/16"]
    location            = var.location_dr
    resource_group_name = data.azurerm_resource_group.rg-connectivity-networking.name
    provider            = azurerm.sub-connectivity
}

resource "azurerm_virtual_network" "Vnet-Sec-UKW" {
    name                = "AZ01-Sec-UKW"
    address_space       = ["10.209.0.0/16"]
    location            = var.location_dr
    resource_group_name = data.azurerm_resource_group.rg-security-networking.name
    provider            = azurerm.sub-security
}


resource "azurerm_virtual_network" "Vnet-Prod-UKW" {
    name                = "AZ01-Prod-UKW"
    address_space       = ["10.205.0.0/16"]
    location            = var.location_dr
    resource_group_name = data.azurerm_resource_group.rg-production-networking.name
    provider            = azurerm.sub-production
}

resource "azurerm_virtual_network" "Vnet-DevTest-UKW" {
    name                = "AZ01-DevTest-UKW"
    address_space       = ["10.207.0.0/16"]
    location            = var.location_dr
    resource_group_name = data.azurerm_resource_group.rg-devtest-networking.name
    provider            = azurerm.sub-devtest
}

#vNet Peerings - Identity vNets

resource "azurerm_virtual_network_peering" "Vnet-Idy-UKS-to-Vnet-Idy-UKW" {
  name                      = "Peer-Idy-UKS-to-Idy-UKW"
  resource_group_name       = data.azurerm_resource_group.rg-identity-networking.name
  virtual_network_name      = azurerm_virtual_network.Vnet-Idy-UKS.name
  remote_virtual_network_id = azurerm_virtual_network.Vnet-Idy-UKW.id
  allow_forwarded_traffic   = true
  allow_gateway_transit     = false
  use_remote_gateways       = false
  provider                  = azurerm.sub-identity
}

resource "azurerm_virtual_network_peering" "Peer-IDY-UKS-to-Conn-UKS" {
name                     = "Peer-Idy-UKS-to-Conn-UKS"
  resource_group_name       = data.azurerm_resource_group.rg-identity-networking.name
  virtual_network_name      = azurerm_virtual_network.Vnet-Idy-UKS.name
  remote_virtual_network_id = azurerm_virtual_network.Vnet-Conn-UKS.id
  allow_forwarded_traffic   = true
  allow_gateway_transit     = false
  use_remote_gateways       = false
  provider                  = azurerm.sub-identity  
}

resource "azurerm_virtual_network_peering" "Peer-IDY-UKS-to-Sec-UKS" {
name                     = "Peer-Idy-UKS-to-Sec-UKS"
  resource_group_name       = data.azurerm_resource_group.rg-identity-networking.name
  virtual_network_name      = azurerm_virtual_network.Vnet-Idy-UKS.name
  remote_virtual_network_id = azurerm_virtual_network.Vnet-Sec-UKS.id
  allow_forwarded_traffic   = true
  allow_gateway_transit     = false
  use_remote_gateways       = false
  provider                  = azurerm.sub-identity  
}

resource "azurerm_virtual_network_peering" "Peer-IDY-UKS-to-Prod-UKS" {
name                     = "Peer-Idy-UKS-to-Prod-UKS" 
  resource_group_name       = data.azurerm_resource_group.rg-identity-networking.name
  virtual_network_name      = azurerm_virtual_network.Vnet-Idy-UKS.name
  remote_virtual_network_id = azurerm_virtual_network.Vnet-Prod-UKS.id
  allow_forwarded_traffic   = true
  allow_gateway_transit     = false
  use_remote_gateways       = false
  provider                  = azurerm.sub-identity  
}

resource "azurerm_virtual_network_peering" "Peer-IDY-UKS-to-DevTest-UKS" {
name                     = "Peer-Idy-UKS-to-DevTest-UKS"
    resource_group_name       = data.azurerm_resource_group.rg-identity-networking.name
    virtual_network_name      = azurerm_virtual_network.Vnet-Idy-UKS.name
    remote_virtual_network_id = azurerm_virtual_network.Vnet-DevTest-UKS.id
    allow_forwarded_traffic   = true
    allow_gateway_transit     = false
    use_remote_gateways       = false
    provider                  = azurerm.sub-identity  
    }

    resource "azurerm_virtual_network_peering" "Vnet-Idy-UKS-to-Vnet-Conn-UKW" {
name                     = "Peer-Idy-UKS-to-Conn-UKW"
    resource_group_name       = data.azurerm_resource_group.rg-identity-networking.name
    virtual_network_name      = azurerm_virtual_network.Vnet-Idy-UKS.name
    remote_virtual_network_id = azurerm_virtual_network.Vnet-Conn-UKW.id
    allow_forwarded_traffic   = true
    allow_gateway_transit     = false
    use_remote_gateways       = false
    provider                  = azurerm.sub-identity
}

resource "azurerm_virtual_network_peering" "Vnet-Idy-UKS-to-Vnet-Sec-UKW" {
name                     = "Peer-Idy-UKS-to-Sec-UKW"
    resource_group_name       = data.azurerm_resource_group.rg-identity-networking.name
    virtual_network_name      = azurerm_virtual_network.Vnet-Idy-UKS.name
    remote_virtual_network_id = azurerm_virtual_network.Vnet-Sec-UKW.id
    allow_forwarded_traffic   = true
    allow_gateway_transit     = false
    use_remote_gateways       = false
    provider                  = azurerm.sub-identity
}

resource "azurerm_virtual_network_peering" "Vnet-Idy-UKS-to-Vnet-Prod-UKW" {
name                     = "Peer-Idy-UKS-to-Prod-UKW"
    resource_group_name       = data.azurerm_resource_group.rg-identity-networking.name
    virtual_network_name      = azurerm_virtual_network.Vnet-Idy-UKS.name
    remote_virtual_network_id = azurerm_virtual_network.Vnet-Prod-UKW.id
    allow_forwarded_traffic   = true
    allow_gateway_transit     = false
    use_remote_gateways       = false
    provider                  = azurerm.sub-identity
}

resource "azurerm_virtual_network_peering" "Vnet-Idy-UKS-to-Vnet-DevTest-UKW" {
name                     = "Peer-Idy-UKS-to-DevTest-UKW"
    resource_group_name       = data.azurerm_resource_group.rg-identity-networking.name
    virtual_network_name      = azurerm_virtual_network.Vnet-Idy-UKS.name
    remote_virtual_network_id = azurerm_virtual_network.Vnet-DevTest-UKW.id
    allow_forwarded_traffic   = true
    allow_gateway_transit     = false
    use_remote_gateways       = false
    provider                  = azurerm.sub-identity
    }
    
resource "azurerm_virtual_network_peering" "Vnet-Idy-UKW-to-Vnet-Idy-UKS" {
  name                      = "Peer-Idy-UKW-to-Idy-UKS"
  resource_group_name       = data.azurerm_resource_group.rg-identity-networking.name
    virtual_network_name      = azurerm_virtual_network.Vnet-Idy-UKW.name
    remote_virtual_network_id = azurerm_virtual_network.Vnet-Idy-UKS.id
    allow_forwarded_traffic   = true
    allow_gateway_transit     = false
    use_remote_gateways       = false
    provider                  = azurerm.sub-identity
}

resource "azurerm_virtual_network_peering" "Vnet-Idy-UKW-to-Vnet-Conn-UKS" {
name                     = "Peer-Idy-UKW-to-Conn-UKS"
    resource_group_name       = data.azurerm_resource_group.rg-identity-networking.name
    virtual_network_name      = azurerm_virtual_network.Vnet-Idy-UKW.name
    remote_virtual_network_id = azurerm_virtual_network.Vnet-Conn-UKS.id
    allow_forwarded_traffic   = true
    allow_gateway_transit     = false
    use_remote_gateways       = false
    provider                  = azurerm.sub-identity
}

resource "azurerm_virtual_network_peering" "Vnet-Idy-UKW-to-Vnet-Sec-UKS" {
name                     = "Peer-Idy-UKW-to-Sec-UKS"
    resource_group_name       = data.azurerm_resource_group.rg-identity-networking.name
    virtual_network_name      = azurerm_virtual_network.Vnet-Idy-UKW.name
    remote_virtual_network_id = azurerm_virtual_network.Vnet-Sec-UKS.id
    allow_forwarded_traffic   = true
    allow_gateway_transit     = false
    use_remote_gateways       = false
    provider                  = azurerm.sub-identity
}

resource "azurerm_virtual_network_peering" "Vnet-Idy-UKW-to-Vnet-Prod-UKS" {
name                     = "Peer-Idy-UKW-to-Prod-UKS"
    resource_group_name       = data.azurerm_resource_group.rg-identity-networking.name
    virtual_network_name      = azurerm_virtual_network.Vnet-Idy-UKW.name
    remote_virtual_network_id = azurerm_virtual_network.Vnet-Prod-UKS.id
    allow_forwarded_traffic   = true
    allow_gateway_transit     = false
    use_remote_gateways       = false
    provider                  = azurerm.sub-identity
}

resource "azurerm_virtual_network_peering" "Vnet-Idy-UKW-to-Vnet-DevTest-UKS" {
name                     = "Peer-Idy-UKW-to-DevTest-UKS"
    resource_group_name       = data.azurerm_resource_group.rg-identity-networking.name
    virtual_network_name      = azurerm_virtual_network.Vnet-Idy-UKW.name
    remote_virtual_network_id = azurerm_virtual_network.Vnet-DevTest-UKS.id
    allow_forwarded_traffic   = true
    allow_gateway_transit     = false
    use_remote_gateways       = false
    provider                  = azurerm.sub-identity
    }

resource "azurerm_virtual_network_peering" "Vnet-Idy-UKW-to-Vnet-Conn-UKW" {
name                     = "Peer-Idy-UKW-to-Conn-UKW"
    resource_group_name       = data.azurerm_resource_group.rg-identity-networking.name
    virtual_network_name      = azurerm_virtual_network.Vnet-Idy-UKW.name
    remote_virtual_network_id = azurerm_virtual_network.Vnet-Conn-UKW.id
    allow_forwarded_traffic   = true
    allow_gateway_transit     = false
    use_remote_gateways       = false
    provider                  = azurerm.sub-identity
}

resource "azurerm_virtual_network_peering" "Vnet-Idy-UKW-to-Vnet-Sec-UKW" {
name                     = "Peer-Idy-UKW-to-Sec-UKW"
    resource_group_name       = data.azurerm_resource_group.rg-identity-networking.name
    virtual_network_name      = azurerm_virtual_network.Vnet-Idy-UKW.name
    remote_virtual_network_id = azurerm_virtual_network.Vnet-Sec-UKW.id
    allow_forwarded_traffic   = true
    allow_gateway_transit     = false
    use_remote_gateways       = false
    provider                  = azurerm.sub-identity
}

resource "azurerm_virtual_network_peering" "Vnet-Idy-UKW-to-Vnet-Prod-UKW" {
name                     = "Peer-Idy-UKW-to-Prod-UKW"
    resource_group_name       = data.azurerm_resource_group.rg-identity-networking.name
    virtual_network_name      = azurerm_virtual_network.Vnet-Idy-UKW.name
    remote_virtual_network_id = azurerm_virtual_network.Vnet-Prod-UKW.id
    allow_forwarded_traffic   = true
    allow_gateway_transit     = false
    use_remote_gateways       = false
    provider                  = azurerm.sub-identity
}

resource "azurerm_virtual_network_peering" "Vnet-Idy-UKW-to-Vnet-DevTest-UKW" {
name                     = "Peer-Idy-UKW-to-DevTest-UKW"
    resource_group_name       = data.azurerm_resource_group.rg-identity-networking.name
    virtual_network_name      = azurerm_virtual_network.Vnet-Idy-UKW.name
    remote_virtual_network_id = azurerm_virtual_network.Vnet-DevTest-UKW.id
    allow_forwarded_traffic   = true
    allow_gateway_transit     = false
    use_remote_gateways       = false
    provider                  = azurerm.sub-identity
    }


#vNet Peerings - Connectivity vNets

resource "azurerm_virtual_network_peering" "Vnet-Conn-UKS-to-Vnet-Conn-UKW" {
  name                      = "Peer-Conn-UKS-to-Conn-UKW"
  resource_group_name       = data.azurerm_resource_group.rg-connectivity-networking.name
  virtual_network_name      = azurerm_virtual_network.Vnet-Conn-UKS.name
  remote_virtual_network_id = azurerm_virtual_network.Vnet-Conn-UKW.id
  allow_forwarded_traffic   = true
  allow_gateway_transit     = false
  use_remote_gateways       = false
  provider                  = azurerm.sub-connectivity
}

resource "azurerm_virtual_network_peering" "Vnet-Conn-UKS-to-Vnet-IDY-UKS" {
name                     = "Peer-Conn-UKS-to-Idy-UKS"
    resource_group_name       = data.azurerm_resource_group.rg-connectivity-networking.name
    virtual_network_name      = azurerm_virtual_network.Vnet-Conn-UKS.name
    remote_virtual_network_id = azurerm_virtual_network.Vnet-Idy-UKS.id
    allow_forwarded_traffic   = true
    allow_gateway_transit     = false
    use_remote_gateways       = false
    provider                  = azurerm.sub-connectivity
}

resource "azurerm_virtual_network_peering" "Vnet-Conn-UKS-to-Vnet-Sec-UKS" {
name                     = "Peer-Conn-UKS-to-Sec-UKS"
  resource_group_name       = data.azurerm_resource_group.rg-connectivity-networking.name
  virtual_network_name      = azurerm_virtual_network.Vnet-Conn-UKS.name
  remote_virtual_network_id = azurerm_virtual_network.Vnet-Sec-UKS.id
  allow_forwarded_traffic   = true
  allow_gateway_transit     = false
  use_remote_gateways       = false
  provider                  = azurerm.sub-connectivity
}

resource "azurerm_virtual_network_peering" "Vnet-Conn-UKS-to-Vnet-Prod-UKS" {
name                     = "Peer-Conn-UKS-to-Prod-UKS"
    resource_group_name       = data.azurerm_resource_group.rg-connectivity-networking.name
    virtual_network_name      = azurerm_virtual_network.Vnet-Conn-UKS.name
    remote_virtual_network_id = azurerm_virtual_network.Vnet-Prod-UKS.id
    allow_forwarded_traffic   = true
    allow_gateway_transit     = false
    use_remote_gateways       = false
    provider                  = azurerm.sub-connectivity
    }

resource "azurerm_virtual_network_peering" "Vnet-Conn-UKS-to-Vnet-DevTest-UKS" {
name                     = "Peer-Conn-UKS-to-DevTest-UKS"
    resource_group_name       = data.azurerm_resource_group.rg-connectivity-networking.name
    virtual_network_name      = azurerm_virtual_network.Vnet-Conn-UKS.name
    remote_virtual_network_id = azurerm_virtual_network.Vnet-DevTest-UKS.id
    allow_forwarded_traffic   = true
    allow_gateway_transit     = false
    use_remote_gateways       = false
    provider                  = azurerm.sub-connectivity
    }

    resource "azurerm_virtual_network_peering" "Vnet-Conn-UKS-to-Vnet-IDY-UKW" {
name                     = "Peer-Conn-UKS-to-Idy-UKW"
    resource_group_name       = data.azurerm_resource_group.rg-connectivity-networking.name
    virtual_network_name      = azurerm_virtual_network.Vnet-Conn-UKS.name
    remote_virtual_network_id = azurerm_virtual_network.Vnet-Idy-UKW.id
    allow_forwarded_traffic   = true
    allow_gateway_transit     = false
    use_remote_gateways       = false
    provider                  = azurerm.sub-connectivity
}
  resource "azurerm_virtual_network_peering" "Vnet-Conn-UKS-to-Vnet-Sec-UKW" {
name                     = "Peer-Conn-UKS-to-Sec-UKW"
    resource_group_name       = data.azurerm_resource_group.rg-connectivity-networking.name
    virtual_network_name      = azurerm_virtual_network.Vnet-Conn-UKS.name
    remote_virtual_network_id = azurerm_virtual_network.Vnet-Sec-UKW.id
    allow_forwarded_traffic   = true
    allow_gateway_transit     = false
    use_remote_gateways       = false
    provider                  = azurerm.sub-connectivity
}

resource "azurerm_virtual_network_peering" "Vnet-Conn-UKS-to-Vnet-Prod-UKW" {
name                     = "Peer-Conn-UKS-to-Prod-UKW"
    resource_group_name       = data.azurerm_resource_group.rg-connectivity-networking.name
    virtual_network_name      = azurerm_virtual_network.Vnet-Conn-UKS.name
    remote_virtual_network_id = azurerm_virtual_network.Vnet-Prod-UKW.id
    allow_forwarded_traffic   = true
    allow_gateway_transit     = false
    use_remote_gateways       = false
    provider                  = azurerm.sub-connectivity
}

resource "azurerm_virtual_network_peering" "Vnet-Conn-UKS-to-Vnet-DevTest-UKW" {
    name                     = "Peer-Conn-UKS-to-DevTest-UKW"
    resource_group_name       = data.azurerm_resource_group.rg-connectivity-networking.name
    virtual_network_name      = azurerm_virtual_network.Vnet-Conn-UKS.name
    remote_virtual_network_id = azurerm_virtual_network.Vnet-DevTest-UKW.id
    allow_forwarded_traffic   = true
    allow_gateway_transit     = false
    use_remote_gateways       = false
    provider                  = azurerm.sub-connectivity
    }

    resource "azurerm_virtual_network_peering" "Vnet-Conn-UKW-to-Vnet-IDY-UKW" {
name                     = "Peer-Conn-UKW-to-Idy-UKW"
    resource_group_name       = data.azurerm_resource_group.rg-connectivity-networking.name
    virtual_network_name      = azurerm_virtual_network.Vnet-Conn-UKW.name
    remote_virtual_network_id = azurerm_virtual_network.Vnet-Idy-UKW.id
    allow_forwarded_traffic   = true
    allow_gateway_transit     = false
    use_remote_gateways       = false
    provider                  = azurerm.sub-connectivity
    }

resource "azurerm_virtual_network_peering" "Vnet-Conn-UKW-to-Vnet-Sec-UKW" {
name                     = "Peer-Conn-UKW-to-Sec-UKW"
    resource_group_name       = data.azurerm_resource_group.rg-connectivity-networking.name
    virtual_network_name      = azurerm_virtual_network.Vnet-Conn-UKW.name
    remote_virtual_network_id = azurerm_virtual_network.Vnet-Sec-UKW.id
    allow_forwarded_traffic   = true
    allow_gateway_transit     = false
    use_remote_gateways       = false
    provider                  = azurerm.sub-connectivity
}

resource "azurerm_virtual_network_peering" "Vnet-Conn-UKW-to-Vnet-Prod-UKW" {
name                     = "Peer-Conn-UKW-to-Prod-UKW"
    resource_group_name       = data.azurerm_resource_group.rg-connectivity-networking.name
    virtual_network_name      = azurerm_virtual_network.Vnet-Conn-UKW.name
    remote_virtual_network_id = azurerm_virtual_network.Vnet-Prod-UKW.id
    allow_forwarded_traffic   = true
    allow_gateway_transit     = false
    use_remote_gateways       = false
    provider                  = azurerm.sub-connectivity
}

resource "azurerm_virtual_network_peering" "Vnet-Conn-UKW-to-Vnet-DevTest-UKW" {
name                     = "Peer-Conn-UKW-to-DevTest-UKW"
    resource_group_name       = data.azurerm_resource_group.rg-connectivity-networking.name
    virtual_network_name      = azurerm_virtual_network.Vnet-Conn-UKW.name
    remote_virtual_network_id = azurerm_virtual_network.Vnet-DevTest-UKW.id
    allow_forwarded_traffic   = true
    allow_gateway_transit     = false
    use_remote_gateways       = false
    provider                  = azurerm.sub-connectivity
    }


resource "azurerm_virtual_network_peering" "Vnet-Conn-UKW-to-Vnet-Conn-UKS" {
  name                      = "Peer-Conn-UKW-to-Conn-UKS"
    resource_group_name       = data.azurerm_resource_group.rg-connectivity-networking.name
    virtual_network_name      = azurerm_virtual_network.Vnet-Conn-UKW.name
    remote_virtual_network_id = azurerm_virtual_network.Vnet-Conn-UKS.id
    allow_forwarded_traffic   = true
    allow_gateway_transit     = false
    use_remote_gateways       = false
    provider                  = azurerm.sub-connectivity
}

resource "azurerm_virtual_network_peering" "Vnet-Conn-UKW-to-Vnet-IDY-UKS" {
name                     = "Peer-Conn-UKW-to-Idy-UKS"
    resource_group_name       = data.azurerm_resource_group.rg-connectivity-networking.name
    virtual_network_name      = azurerm_virtual_network.Vnet-Conn-UKW.name
    remote_virtual_network_id = azurerm_virtual_network.Vnet-Idy-UKS.id
    allow_forwarded_traffic   = true
    allow_gateway_transit     = false
    use_remote_gateways       = false
    provider                  = azurerm.sub-connectivity
}

resource "azurerm_virtual_network_peering" "Vnet-Conn-UKW-to-Vnet-Sec-UKS" {
name                     = "Peer-Conn-UKW-to-Sec-UKS"
    resource_group_name       = data.azurerm_resource_group.rg-connectivity-networking.name
    virtual_network_name      = azurerm_virtual_network.Vnet-Conn-UKW.name
    remote_virtual_network_id = azurerm_virtual_network.Vnet-Sec-UKS.id
    allow_forwarded_traffic   = true
    allow_gateway_transit     = false
    use_remote_gateways       = false
    provider                  = azurerm.sub-connectivity
}

resource "azurerm_virtual_network_peering" "Vnet-Conn-UKW-to-Vnet-Prod-UKS" {
name                     = "Peer-Conn-UKW-to-Prod-UKS"
    resource_group_name       = data.azurerm_resource_group.rg-connectivity-networking.name
    virtual_network_name      = azurerm_virtual_network.Vnet-Conn-UKW.name
    remote_virtual_network_id = azurerm_virtual_network.Vnet-Prod-UKS.id
    allow_forwarded_traffic   = true
    allow_gateway_transit     = false
    use_remote_gateways       = false
    provider                  = azurerm.sub-connectivity
}

resource "azurerm_virtual_network_peering" "Vnet-Conn-UKW-to-Vnet-DevTest-UKS" {
name                     = "Peer-Conn-UKW-to-DevTest-UKS"
    resource_group_name       = data.azurerm_resource_group.rg-connectivity-networking.name
    virtual_network_name      = azurerm_virtual_network.Vnet-Conn-UKW.name
    remote_virtual_network_id = azurerm_virtual_network.Vnet-DevTest-UKS.id
    allow_forwarded_traffic   = true
    allow_gateway_transit     = false
    use_remote_gateways       = false
    provider                  = azurerm.sub-connectivity
    }

#vNet Peerings - Security vNets

resource "azurerm_virtual_network_peering" "Vnet-Sec-UKS-to-Vnet-Sec-UKW" {
  name                      = "Peer-Sec-UKS-to-Sec-UKW"
  resource_group_name       = data.azurerm_resource_group.rg-security-networking.name
  virtual_network_name      = azurerm_virtual_network.Vnet-Sec-UKS.name
  remote_virtual_network_id = azurerm_virtual_network.Vnet-Sec-UKW.id
  allow_forwarded_traffic   = true
  allow_gateway_transit     = false
  use_remote_gateways       = false
  provider                  = azurerm.sub-security
}

resource "azurerm_virtual_network_peering" "Vnet-Sec-UKW-to-Vnet-Sec-UKS" {
  name                      = "Peer-Sec-UKW-to-Sec-UKS"
    resource_group_name       = data.azurerm_resource_group.rg-security-networking.name
    virtual_network_name      = azurerm_virtual_network.Vnet-Sec-UKW.name
    remote_virtual_network_id = azurerm_virtual_network.Vnet-Sec-UKS.id
    allow_forwarded_traffic   = true
    allow_gateway_transit     = false
    use_remote_gateways       = false
    provider                  = azurerm.sub-security
}

resource "azurerm_virtual_network_peering" "Vnet-Sec-UKS-to-Vnet-IDY-UKS" {
name                     = "Peer-Sec-UKS-to-Idy-UKS"
    resource_group_name       = data.azurerm_resource_group.rg-security-networking.name
    virtual_network_name      = azurerm_virtual_network.Vnet-Sec-UKS.name
    remote_virtual_network_id = azurerm_virtual_network.Vnet-Idy-UKS.id
    allow_forwarded_traffic   = true
    allow_gateway_transit     = false
    use_remote_gateways       = false
    provider                  = azurerm.sub-security
}

resource "azurerm_virtual_network_peering" "Vnet-Sec-UKS-to-Vnet-Conn-UKS" {
name                     = "Peer-Sec-UKS-to-Conn-UKS"
    resource_group_name       = data.azurerm_resource_group.rg-security-networking.name
    virtual_network_name      = azurerm_virtual_network.Vnet-Sec-UKS.name
    remote_virtual_network_id = azurerm_virtual_network.Vnet-Conn-UKS.id
    allow_forwarded_traffic   = true
    allow_gateway_transit     = false
    use_remote_gateways       = false
    provider                  = azurerm.sub-security
 }


resource "azurerm_virtual_network_peering" "Vnet-Sec-UKS-to-Vnet-Prod-UKS" {
name                     = "Peer-Sec-UKS-to-Prod-UKS"
    resource_group_name       = data.azurerm_resource_group.rg-security-networking.name
    virtual_network_name      = azurerm_virtual_network.Vnet-Sec-UKS.name
    remote_virtual_network_id = azurerm_virtual_network.Vnet-Prod-UKS.id
    allow_forwarded_traffic   = true
    allow_gateway_transit     = false
    use_remote_gateways       = false
    provider                  = azurerm.sub-security
    }

    resource "azurerm_virtual_network_peering" "Vnet-Sec-UKS-to-Vnet-DevTest-UKS" {
name                     = "Peer-Sec-UKS-to-DevTest-UKS"
    resource_group_name       = data.azurerm_resource_group.rg-security-networking.name
    virtual_network_name      = azurerm_virtual_network.Vnet-Sec-UKS.name
    remote_virtual_network_id = azurerm_virtual_network.Vnet-DevTest-UKS.id
    allow_forwarded_traffic   = true
    allow_gateway_transit     = false
    use_remote_gateways       = false
    provider                  = azurerm.sub-security
    }

    resource "azurerm_virtual_network_peering" "Vnet-Sec-UKS-to-Vnet-IDY-UKW" {
name                     = "Peer-Sec-UKS-to-Idy-UKW"
    resource_group_name       = data.azurerm_resource_group.rg-security-networking.name
    virtual_network_name      = azurerm_virtual_network.Vnet-Sec-UKS.name
    remote_virtual_network_id = azurerm_virtual_network.Vnet-Idy-UKW.id
    allow_forwarded_traffic   = true
    allow_gateway_transit     = false
    use_remote_gateways       = false
    provider                  = azurerm.sub-security
}

resource "azurerm_virtual_network_peering" "Vnet-Sec-UKS-to-Vnet-Conn-UKW" {
name                     = "Peer-Sec-UKS-to-Conn-UKW"
    resource_group_name       = data.azurerm_resource_group.rg-security-networking.name
    virtual_network_name      = azurerm_virtual_network.Vnet-Sec-UKS.name
    remote_virtual_network_id = azurerm_virtual_network.Vnet-Conn-UKW.id
    allow_forwarded_traffic   = true
    allow_gateway_transit     = false
    use_remote_gateways       = false
    provider                  = azurerm.sub-security
}

resource "azurerm_virtual_network_peering" "Vnet-Sec-UKS-to-Vnet-Prod-UKW" {
name                     = "Peer-Sec-UKS-to-Prod-UKW"
    resource_group_name       = data.azurerm_resource_group.rg-security-networking.name
    virtual_network_name      = azurerm_virtual_network.Vnet-Sec-UKS.name
    remote_virtual_network_id = azurerm_virtual_network.Vnet-Prod-UKW.id
    allow_forwarded_traffic   = true
    allow_gateway_transit     = false
    use_remote_gateways       = false
    provider                  = azurerm.sub-security
}

resource "azurerm_virtual_network_peering" "Vnet-Sec-UKS-to-Vnet-DevTest-UKW" {
name                     = "Peer-Sec-UKS-to-DevTest-UKW"
    resource_group_name       = data.azurerm_resource_group.rg-security-networking.name
    virtual_network_name      = azurerm_virtual_network.Vnet-Sec-UKS.name
    remote_virtual_network_id = azurerm_virtual_network.Vnet-DevTest-UKW.id
    allow_forwarded_traffic   = true
    allow_gateway_transit     = false
    use_remote_gateways       = false
    provider                  = azurerm.sub-security
    }

    resource "azurerm_virtual_network_peering" "Vnet-Sec-UKW-to-Vnet-IDY-UKS" {
name                     = "Peer-Sec-UKW-to-Idy-UKS"
    resource_group_name       = data.azurerm_resource_group.rg-security-networking.name
    virtual_network_name      = azurerm_virtual_network.Vnet-Sec-UKW.name
    remote_virtual_network_id = azurerm_virtual_network.Vnet-Idy-UKS.id
    allow_forwarded_traffic   = true
    allow_gateway_transit     = false
    use_remote_gateways       = false
    provider                  = azurerm.sub-security
}

resource "azurerm_virtual_network_peering" "Vnet-Sec-UKW-to-Vnet-Conn-UKS" {
name                     = "Peer-Sec-UKW-to-Conn-UKS"
    resource_group_name       = data.azurerm_resource_group.rg-security-networking.name
    virtual_network_name      = azurerm_virtual_network.Vnet-Sec-UKW.name
    remote_virtual_network_id = azurerm_virtual_network.Vnet-Conn-UKS.id
    allow_forwarded_traffic   = true
    allow_gateway_transit     = false
    use_remote_gateways       = false
    provider                  = azurerm.sub-security
}

resource "azurerm_virtual_network_peering" "Vnet-Sec-UKW-to-Vnet-Prod-UKS" {
name                     = "Peer-Sec-UKW-to-Prod-UKS"
    resource_group_name       = data.azurerm_resource_group.rg-security-networking.name
    virtual_network_name      = azurerm_virtual_network.Vnet-Sec-UKW.name
    remote_virtual_network_id = azurerm_virtual_network.Vnet-Prod-UKS.id
    allow_forwarded_traffic   = true
    allow_gateway_transit     = false
    use_remote_gateways       = false
    provider                  = azurerm.sub-security
}

resource "azurerm_virtual_network_peering" "Vnet-Sec-UKW-to-Vnet-DevTest-UKS" {
name                     = "Peer-Sec-UKW-to-DevTest-UKS"
    resource_group_name       = data.azurerm_resource_group.rg-security-networking.name
    virtual_network_name      = azurerm_virtual_network.Vnet-Sec-UKW.name
    remote_virtual_network_id = azurerm_virtual_network.Vnet-DevTest-UKS.id
    allow_forwarded_traffic   = true
    allow_gateway_transit     = false
    use_remote_gateways       = false
    provider                  = azurerm.sub-security
}

resource "azurerm_virtual_network_peering" "Vnet-Sec-UKW-to-Vnet-IDY-UKW" {
name                     = "Peer-Sec-UKW-to-Idy-UKW"
    resource_group_name       = data.azurerm_resource_group.rg-security-networking.name
    virtual_network_name      = azurerm_virtual_network.Vnet-Sec-UKW.name
    remote_virtual_network_id = azurerm_virtual_network.Vnet-Idy-UKW.id
    allow_forwarded_traffic   = true
    allow_gateway_transit     = false
    use_remote_gateways       = false
    provider                  = azurerm.sub-security
}

resource "azurerm_virtual_network_peering" "Vnet-Sec-UKW-to-Vnet-Conn-UKW" {
name                     = "Peer-Sec-UKW-to-Conn-UKW"
    resource_group_name       = data.azurerm_resource_group.rg-security-networking.name
    virtual_network_name      = azurerm_virtual_network.Vnet-Sec-UKW.name
    remote_virtual_network_id = azurerm_virtual_network.Vnet-Conn-UKW.id
    allow_forwarded_traffic   = true
    allow_gateway_transit     = false
    use_remote_gateways       = false
    provider                  = azurerm.sub-security
}

resource "azurerm_virtual_network_peering" "Vnet-Sec-UKW-to-Vnet-Prod-UKW" {
name                     = "Peer-Sec-UKW-to-Prod-UKW"
    resource_group_name       = data.azurerm_resource_group.rg-security-networking.name
    virtual_network_name      = azurerm_virtual_network.Vnet-Sec-UKW.name
    remote_virtual_network_id = azurerm_virtual_network.Vnet-Prod-UKW.id
    allow_forwarded_traffic   = true
    allow_gateway_transit     = false
    use_remote_gateways       = false
    provider                  = azurerm.sub-security
}

resource "azurerm_virtual_network_peering" "Vnet-Sec-UKW-to-Vnet-DevTest-UKW" {
name                     = "Peer-Sec-UKW-to-DevTest-UKW"
    resource_group_name       = data.azurerm_resource_group.rg-security-networking.name
    virtual_network_name      = azurerm_virtual_network.Vnet-Sec-UKW.name
    remote_virtual_network_id = azurerm_virtual_network.Vnet-DevTest-UKW.id
    allow_forwarded_traffic   = true
    allow_gateway_transit     = false
    use_remote_gateways       = false
    provider                  = azurerm.sub-security
    }

#vNet Peerings - Production vNets

resource "azurerm_virtual_network_peering" "Vnet-Prod-UKS-to-Vnet-Prod-UKW" {
  name                      = "Peer-Prod-UKS-to-Prod-UKW"
  resource_group_name       = data.azurerm_resource_group.rg-production-networking.name
  virtual_network_name      = azurerm_virtual_network.Vnet-Prod-UKS.name
  remote_virtual_network_id = azurerm_virtual_network.Vnet-Prod-UKW.id
  allow_forwarded_traffic   = true
  allow_gateway_transit     = false
  use_remote_gateways       = false
  provider                  = azurerm.sub-production
}

resource "azurerm_virtual_network_peering" "Vnet-Prod-UKW-to-Vnet-Prod-UKS" {
  name                      = "Peer-Prod-UKW-to-Prod-UKS"
    resource_group_name       = data.azurerm_resource_group.rg-production-networking.name
    virtual_network_name      = azurerm_virtual_network.Vnet-Prod-UKW.name
    remote_virtual_network_id = azurerm_virtual_network.Vnet-Prod-UKS.id
    allow_forwarded_traffic   = true
    allow_gateway_transit     = false
    use_remote_gateways       = false
    provider                  = azurerm.sub-production
}

resource "azurerm_virtual_network_peering" "Vnet-Prod-UKS-to-Vnet-IDY-UKS" {
name                     = "Peer-Prod-UKS-to-Idy-UKS"
    resource_group_name       = data.azurerm_resource_group.rg-production-networking.name
    virtual_network_name      = azurerm_virtual_network.Vnet-Prod-UKS.name
    remote_virtual_network_id = azurerm_virtual_network.Vnet-Idy-UKS.id
    allow_forwarded_traffic   = true
    allow_gateway_transit     = false
    use_remote_gateways       = false
    provider                  = azurerm.sub-production
}

resource "azurerm_virtual_network_peering" "Vnet-Prod-UKS-to-Vnet-Conn-UKS" {
name                     = "Peer-Prod-UKS-to-Conn-UKS"
    resource_group_name       = data.azurerm_resource_group.rg-production-networking.name
    virtual_network_name      = azurerm_virtual_network.Vnet-Prod-UKS.name
    remote_virtual_network_id = azurerm_virtual_network.Vnet-Conn-UKS.id
    allow_forwarded_traffic   = true
    allow_gateway_transit     = false
    use_remote_gateways       = false
    provider                  = azurerm.sub-production
    }

resource "azurerm_virtual_network_peering" "Vnet-Prod-UKS-to-Vnet-Sec-UKS" {
name                     = "Peer-Prod-UKS-to-Sec-UKS"
    resource_group_name       = data.azurerm_resource_group.rg-production-networking.name
    virtual_network_name      = azurerm_virtual_network.Vnet-Prod-UKS.name
    remote_virtual_network_id = azurerm_virtual_network.Vnet-Sec-UKS.id
    allow_forwarded_traffic   = true
    allow_gateway_transit     = false
    use_remote_gateways       = false
    provider                  = azurerm.sub-production
    }

    resource "azurerm_virtual_network_peering" "Vnet-Prod-UKS-to-Vnet-DevTest-UKS" {
name                     = "Peer-Prod-UKS-to-DevTest-UKS"
    resource_group_name       = data.azurerm_resource_group.rg-production-networking.name
    virtual_network_name      = azurerm_virtual_network.Vnet-Prod-UKS.name
    remote_virtual_network_id = azurerm_virtual_network.Vnet-DevTest-UKS.id
    allow_forwarded_traffic   = true
    allow_gateway_transit     = false
    use_remote_gateways       = false
    provider                  = azurerm.sub-production
    }

resource "azurerm_virtual_network_peering" "Vnet-Prod-UKS-to-Vnet-IDY-UKW" {
name                     = "Peer-Prod-UKS-to-Idy-UKW"
    resource_group_name       = data.azurerm_resource_group.rg-production-networking.name
    virtual_network_name      = azurerm_virtual_network.Vnet-Prod-UKS.name
    remote_virtual_network_id = azurerm_virtual_network.Vnet-Idy-UKW.id
    allow_forwarded_traffic   = true
    allow_gateway_transit     = false
    use_remote_gateways       = false
    provider                  = azurerm.sub-production
}

resource "azurerm_virtual_network_peering" "Vnet-Prod-UKS-to-Vnet-Conn-UKW" {
name                     = "Peer-Prod-UKS-to-Conn-UKW"
    resource_group_name       = data.azurerm_resource_group.rg-production-networking.name
    virtual_network_name      = azurerm_virtual_network.Vnet-Prod-UKS.name
    remote_virtual_network_id = azurerm_virtual_network.Vnet-Conn-UKW.id
    allow_forwarded_traffic   = true
    allow_gateway_transit     = false
    use_remote_gateways       = false
    provider                  = azurerm.sub-production
}

resource "azurerm_virtual_network_peering" "Vnet-Prod-UKS-to-Vnet-Sec-UKW" {
name                     = "Peer-Prod-UKS-to-Sec-UKW"
    resource_group_name       = data.azurerm_resource_group.rg-production-networking.name
    virtual_network_name      = azurerm_virtual_network.Vnet-Prod-UKS.name
    remote_virtual_network_id = azurerm_virtual_network.Vnet-Sec-UKW.id
    allow_forwarded_traffic   = true
    allow_gateway_transit     = false
    use_remote_gateways       = false
    provider                  = azurerm.sub-production
}

resource "azurerm_virtual_network_peering" "Vnet-Prod-UKS-to-Vnet-DevTest-UKW" {
name                     = "Peer-Prod-UKS-to-DevTest-UKW"
    resource_group_name       = data.azurerm_resource_group.rg-production-networking.name
    virtual_network_name      = azurerm_virtual_network.Vnet-Prod-UKS.name
    remote_virtual_network_id = azurerm_virtual_network.Vnet-DevTest-UKW.id
    allow_forwarded_traffic   = true
    allow_gateway_transit     = false
    use_remote_gateways       = false
    provider                  = azurerm.sub-production
    }

  resource "azurerm_virtual_network_peering" "Vnet-Prod-UKW-to-Vnet-IDY-UKS" {
     name                     = "Peer-Prod-UKW-to-Idy-UKS"
    resource_group_name       = data.azurerm_resource_group.rg-production-networking.name
     virtual_network_name      = azurerm_virtual_network.Vnet-Prod-UKW.name
     remote_virtual_network_id = azurerm_virtual_network.Vnet-Idy-UKS.id
     allow_forwarded_traffic   = true
     allow_gateway_transit     = false
     use_remote_gateways       = false
     provider                  = azurerm.sub-production
}

resource "azurerm_virtual_network_peering" "Vnet-Prod-UKW-to-Vnet-Conn-UKS" {
    name                     = "Peer-Prod-UKW-to-Conn-UKS"
    resource_group_name       = data.azurerm_resource_group.rg-production-networking.name
    virtual_network_name      = azurerm_virtual_network.Vnet-Prod-UKW.name
    remote_virtual_network_id = azurerm_virtual_network.Vnet-Conn-UKS.id
    allow_forwarded_traffic   = true
    allow_gateway_transit     = false
    use_remote_gateways       = false
    provider                  = azurerm.sub-production
}

resource "azurerm_virtual_network_peering" "Vnet-Prod-UKW-to-Vnet-Sec-UKS" {
    name                     = "Peer-Prod-UKW-to-Sec-UKS"
    resource_group_name       = data.azurerm_resource_group.rg-production-networking.name
    virtual_network_name      = azurerm_virtual_network.Vnet-Prod-UKW.name
    remote_virtual_network_id = azurerm_virtual_network.Vnet-Sec-UKS.id
    allow_forwarded_traffic   = true
    allow_gateway_transit     = false
    use_remote_gateways       = false
    provider                  = azurerm.sub-production
}

resource "azurerm_virtual_network_peering" "Vnet-Prod-UKW-to-Vnet-DevTest-UKS" {
name                     = "Peer-Prod-UKW-to-DevTest-UKS"
    resource_group_name       = data.azurerm_resource_group.rg-production-networking.name
    virtual_network_name      = azurerm_virtual_network.Vnet-Prod-UKW.name
    remote_virtual_network_id = azurerm_virtual_network.Vnet-DevTest-UKS.id
    allow_forwarded_traffic   = true
    allow_gateway_transit     = false
    use_remote_gateways       = false
    provider                  = azurerm.sub-production
}

resource "azurerm_virtual_network_peering" "Vnet-Prod-UKW-to-Vnet-Idy-UKW" {
name                     = "Peer-Prod-UKW-to-Idy-UKW"
    resource_group_name       = data.azurerm_resource_group.rg-production-networking.name
    virtual_network_name      = azurerm_virtual_network.Vnet-Prod-UKW.name
    remote_virtual_network_id = azurerm_virtual_network.Vnet-Idy-UKW.id
    allow_forwarded_traffic   = true
    allow_gateway_transit     = false
    use_remote_gateways       = false
    provider                  = azurerm.sub-production
}

resource "azurerm_virtual_network_peering" "Vnet-Prod-UKW-to-Vnet-Conn-UKW" {
name                     = "Peer-Prod-UKW-to-Conn-UKW"
    resource_group_name       = data.azurerm_resource_group.rg-production-networking.name
    virtual_network_name      = azurerm_virtual_network.Vnet-Prod-UKW.name
    remote_virtual_network_id = azurerm_virtual_network.Vnet-Conn-UKW.id
    allow_forwarded_traffic   = true
    allow_gateway_transit     = false
    use_remote_gateways       = false
    provider                  = azurerm.sub-production
}

resource "azurerm_virtual_network_peering" "Vnet-Prod-UKW-to-Vnet-Sec-UKW" {
name                     = "Peer-Prod-UKW-to-Sec-UKW"   
    resource_group_name       = data.azurerm_resource_group.rg-production-networking.name
    virtual_network_name      = azurerm_virtual_network.Vnet-Prod-UKW.name
    remote_virtual_network_id = azurerm_virtual_network.Vnet-Sec-UKW.id
    allow_forwarded_traffic   = true
    allow_gateway_transit     = false
    use_remote_gateways       = false
    provider                  = azurerm.sub-production
}

resource "azurerm_virtual_network_peering" "Vnet-Prod-UKW-to-Vnet-DevTest-UKW" {
name                     = "Peer-Prod-UKW-to-DevTest-UKW"
    resource_group_name       = data.azurerm_resource_group.rg-production-networking.name
    virtual_network_name      = azurerm_virtual_network.Vnet-Prod-UKW.name
    remote_virtual_network_id = azurerm_virtual_network.Vnet-DevTest-UKW.id
    allow_forwarded_traffic   = true
    allow_gateway_transit     = false
    use_remote_gateways       = false
    provider                  = azurerm.sub-production
}

#vNet Peerings - DevTest vNets

resource "azurerm_virtual_network_peering" "Vnet-DevTest-UKS-to-Vnet-DevTest-UKW" {
  name                      = "Peer-DevTest-UKS-to-DevTest-UKW"
  resource_group_name       = data.azurerm_resource_group.rg-devtest-networking.name
  virtual_network_name      = azurerm_virtual_network.Vnet-DevTest-UKS.name
  remote_virtual_network_id = azurerm_virtual_network.Vnet-DevTest-UKW.id
  allow_forwarded_traffic   = true
  allow_gateway_transit     = false
  use_remote_gateways       = false
  provider                  = azurerm.sub-devtest
}

resource "azurerm_virtual_network_peering" "Vnet-DevTest-UKW-to-Vnet-DevTest-UKS" {
  name                      = "Peer-DevTest-UKW-to-DevTest-UKS"
    resource_group_name       = data.azurerm_resource_group.rg-devtest-networking.name
    virtual_network_name      = azurerm_virtual_network.Vnet-DevTest-UKW.name
    remote_virtual_network_id = azurerm_virtual_network.Vnet-DevTest-UKS.id
    allow_forwarded_traffic   = true
    allow_gateway_transit     = false
    use_remote_gateways       = false
    provider                  = azurerm.sub-devtest
}

resource "azurerm_virtual_network_peering" "Vnet-DevTest-UKS-to-Vnet-IDY-UKS" {
name                     = "Peer-DevTest-UKS-to-Idy-UKS"
    resource_group_name       = data.azurerm_resource_group.rg-devtest-networking.name
    virtual_network_name      = azurerm_virtual_network.Vnet-DevTest-UKS.name
    remote_virtual_network_id = azurerm_virtual_network.Vnet-Idy-UKS.id
    allow_forwarded_traffic   = true
    allow_gateway_transit     = false
    use_remote_gateways       = false 
    provider                  = azurerm.sub-devtest
}

resource "azurerm_virtual_network_peering" "Vnet-DevTest-UKS-to-Vnet-Conn-UKS" {
name                     = "Peer-DevTest-UKS-to-Conn-UKS"
    resource_group_name       = data.azurerm_resource_group.rg-devtest-networking.name
    virtual_network_name      = azurerm_virtual_network.Vnet-DevTest-UKS.name
    remote_virtual_network_id = azurerm_virtual_network.Vnet-Conn-UKS.id
    allow_forwarded_traffic   = true
    allow_gateway_transit     = false
    use_remote_gateways       = false 
    provider                  = azurerm.sub-devtest
    }

resource "azurerm_virtual_network_peering" "Vnet-DevTest-UKS-to-Vnet-Sec-UKS" {
name                     = "Peer-DevTest-UKS-to-Sec-UKS"
    resource_group_name       = data.azurerm_resource_group.rg-devtest-networking.name
    virtual_network_name      = azurerm_virtual_network.Vnet-DevTest-UKS.name
    remote_virtual_network_id = azurerm_virtual_network.Vnet-Sec-UKS.id
    allow_forwarded_traffic   = true
    allow_gateway_transit     = false
    use_remote_gateways       = false
    provider                  = azurerm.sub-devtest
    }

resource "azurerm_virtual_network_peering" "Vnet-DevTest-UKS-to-Vnet-Prod-UKS" {
name                     = "Peer-DevTest-UKS-to-Prod-UKS"
    resource_group_name       = data.azurerm_resource_group.rg-devtest-networking.name
    virtual_network_name      = azurerm_virtual_network.Vnet-DevTest-UKS.name
    remote_virtual_network_id = azurerm_virtual_network.Vnet-Prod-UKS.id
    allow_forwarded_traffic   = true
    allow_gateway_transit     = false
    use_remote_gateways       = false
    provider                  = azurerm.sub-devtest
    }

    resource "azurerm_virtual_network_peering" "Vnet-DevTest-UKS-to-Vnet-IDY-UKW" {
name                     = "Peer-DevTest-UKS-to-Idy-UKW"
    resource_group_name       = data.azurerm_resource_group.rg-devtest-networking.name
    virtual_network_name      = azurerm_virtual_network.Vnet-DevTest-UKS.name
    remote_virtual_network_id = azurerm_virtual_network.Vnet-Idy-UKW.id
    allow_forwarded_traffic   = true
    allow_gateway_transit     = false
    use_remote_gateways       = false
    provider                  = azurerm.sub-devtest
}

resource "azurerm_virtual_network_peering" "Vnet-DevTest-UKS-to-Vnet-Conn-UKW" {
name                     = "Peer-DevTest-UKS-to-Conn-UKW"
    resource_group_name       = data.azurerm_resource_group.rg-devtest-networking.name
    virtual_network_name      = azurerm_virtual_network.Vnet-DevTest-UKS.name
    remote_virtual_network_id = azurerm_virtual_network.Vnet-Conn-UKW.id
    allow_forwarded_traffic   = true
    allow_gateway_transit     = false
    use_remote_gateways       = false
    provider                  = azurerm.sub-devtest
}

resource "azurerm_virtual_network_peering" "Vnet-DevTest-UKS-to-Vnet-Sec-UKW" { 
name                     = "Peer-DevTest-UKS-to-Sec-UKW"
    resource_group_name       = data.azurerm_resource_group.rg-devtest-networking.name
    virtual_network_name      = azurerm_virtual_network.Vnet-DevTest-UKS.name
    remote_virtual_network_id = azurerm_virtual_network.Vnet-Sec-UKW.id
    allow_forwarded_traffic   = true
    allow_gateway_transit     = false
    use_remote_gateways       = false
    provider                  = azurerm.sub-devtest
}

resource "azurerm_virtual_network_peering" "Vnet-DevTest-UKS-to-Vnet-Prod-UKW" {
    name                     = "Peer-DevTest-UKS-to-Prod-UKW"
    resource_group_name       = data.azurerm_resource_group.rg-devtest-networking.name
    virtual_network_name      = azurerm_virtual_network.Vnet-DevTest-UKS.name
    remote_virtual_network_id = azurerm_virtual_network.Vnet-Prod-UKW.id
    allow_forwarded_traffic   = true
    allow_gateway_transit     = false
    use_remote_gateways       = false
    provider                  = azurerm.sub-devtest
}

    resource "azurerm_virtual_network_peering" "Vnet-DevTest-UKW-to-Vnet-IDY-UKS" {
name                     = "Peer-DevTest-UKW-to-Idy-UKS"
    resource_group_name       = data.azurerm_resource_group.rg-devtest-networking.name
    virtual_network_name      = azurerm_virtual_network.Vnet-DevTest-UKW.name
    remote_virtual_network_id = azurerm_virtual_network.Vnet-Idy-UKS.id
    allow_forwarded_traffic   = true
    allow_gateway_transit     = false
    use_remote_gateways       = false
    provider                  = azurerm.sub-devtest
}

resource "azurerm_virtual_network_peering" "Vnet-DevTest-UKW-to-Vnet-Conn-UKS" {
name                     = "Peer-DevTest-UKW-to-Conn-UKS"
    resource_group_name       = data.azurerm_resource_group.rg-devtest-networking.name
    virtual_network_name      = azurerm_virtual_network.Vnet-DevTest-UKW.name
    remote_virtual_network_id = azurerm_virtual_network.Vnet-Conn-UKS.id
    allow_forwarded_traffic   = true
    allow_gateway_transit     = false
    use_remote_gateways       = false
    provider                  = azurerm.sub-devtest
}

resource "azurerm_virtual_network_peering" "Vnet-DevTest-UKW-to-Vnet-Sec-UKS" {
name                     = "Peer-DevTest-UKW-to-Sec-UKS"
    resource_group_name       = data.azurerm_resource_group.rg-devtest-networking.name
    virtual_network_name      = azurerm_virtual_network.Vnet-DevTest-UKW.name
    remote_virtual_network_id = azurerm_virtual_network.Vnet-Sec-UKS.id
    allow_forwarded_traffic   = true
    allow_gateway_transit     = false
    use_remote_gateways       = false
    provider                  = azurerm.sub-devtest
}

resource "azurerm_virtual_network_peering" "Vnet-DevTest-UKW-to-Vnet-Prod-UKS" {
name                     = "Peer-DevTest-UKW-to-Prod-UKS"
    resource_group_name       = data.azurerm_resource_group.rg-devtest-networking.name
    virtual_network_name      = azurerm_virtual_network.Vnet-DevTest-UKW.name
    remote_virtual_network_id = azurerm_virtual_network.Vnet-Prod-UKS.id
    allow_forwarded_traffic   = true
    allow_gateway_transit     = false
    use_remote_gateways       = false
    provider                  = azurerm.sub-devtest
}

resource "azurerm_virtual_network_peering" "Vnet-DevTest-UKW-to-Vnet-IDY-UKW" {
name                     = "Peer-DevTest-UKW-to-Idy-UKW"
    resource_group_name       = data.azurerm_resource_group.rg-devtest-networking.name
    virtual_network_name      = azurerm_virtual_network.Vnet-DevTest-UKW.name
    remote_virtual_network_id = azurerm_virtual_network.Vnet-Idy-UKW.id
    allow_forwarded_traffic   = true
    allow_gateway_transit     = false
    use_remote_gateways       = false
    provider                  = azurerm.sub-devtest
}

resource "azurerm_virtual_network_peering" "Vnet-DevTest-UKW-to-Vnet-Conn-UKW" {
name                     = "Peer-DevTest-UKW-to-Conn-UKW"
    resource_group_name       = data.azurerm_resource_group.rg-devtest-networking.name
    virtual_network_name      = azurerm_virtual_network.Vnet-DevTest-UKW.name
    remote_virtual_network_id = azurerm_virtual_network.Vnet-Conn-UKW.id
    allow_forwarded_traffic   = true
    allow_gateway_transit     = false
    use_remote_gateways       = false
    provider                  = azurerm.sub-devtest
}

resource "azurerm_virtual_network_peering" "Vnet-DevTest-UKW-to-Vnet-Sec-UKW" { 
name                     = "Peer-DevTest-UKW-to-Sec-UKW"
    resource_group_name       = data.azurerm_resource_group.rg-devtest-networking.name
    virtual_network_name      = azurerm_virtual_network.Vnet-DevTest-UKW.name
    remote_virtual_network_id = azurerm_virtual_network.Vnet-Sec-UKW.id
    allow_forwarded_traffic   = true
    allow_gateway_transit     = false
    use_remote_gateways       = false
    provider                  = azurerm.sub-devtest
}

resource "azurerm_virtual_network_peering" "Vnet-DevTest-UKW-to-Vnet-Prod-UKW" {
    name                     = "Peer-DevTest-UKW-to-Prod-UKW"
    resource_group_name       = data.azurerm_resource_group.rg-devtest-networking.name
    virtual_network_name      = azurerm_virtual_network.Vnet-DevTest-UKW.name
    remote_virtual_network_id = azurerm_virtual_network.Vnet-Prod-UKW.id
    allow_forwarded_traffic   = true
    allow_gateway_transit     = false
    use_remote_gateways       = false
    provider                  = azurerm.sub-devtest
}
