# NSG for Identity Directory Services UKS Subnet

resource "azurerm_network_security_group" "NSG-Idy-DirServices-UKS" {
  name                = "NSG-Idy-DirServices-UKS"
  location            = var.location_production
  resource_group_name = data.azurerm_resource_group.rg-identity-networking.name
  provider            = azurerm.sub-identity
}
resource "azurerm_subnet_network_security_group_association" "NSG-Assoc-Idy-DirServices-UKS" {
  network_security_group_id = azurerm_network_security_group.NSG-Idy-DirServices-UKS.id
  subnet_id                 = azurerm_subnet.Sn-Idy-DirServices-UKS.id
  provider                  = azurerm.sub-identity
}

resource "azurerm_network_security_rule" "NSG-Idy-DirServices-UKS-Bastion-Allow" {
  name                        = "Allow-Bastion"
  priority                    = 100
  direction                   = "Inbound"
  access                      = "Allow"
  protocol                    = "Tcp"
  source_port_range           = "*"
  destination_port_range      = "3389"
  source_address_prefixes       = ["10.202.251.0/24", "10.203.251.0/24"]
  destination_address_prefix  = "10.200.10.0/23"
  resource_group_name         = data.azurerm_resource_group.rg-identity-networking.name
    network_security_group_name = azurerm_network_security_group.NSG-Idy-DirServices-UKS.name
    provider                    = azurerm.sub-identity
}

resource "azurerm_network_security_rule" "NSG-Idy-DirServices-UKS_Deny-All-Any" {
    name                        = "Deny-All-Any"
    priority                    = 4000
    direction                   = "Inbound"
    access                      = "Deny"
    protocol                    = "*"
    source_port_range           = "*"
    destination_port_range      = "*"
    source_address_prefix       = "*"
    destination_address_prefix  = "*"
    resource_group_name         = data.azurerm_resource_group.rg-identity-networking.name
        network_security_group_name = azurerm_network_security_group.NSG-Idy-DirServices-UKS.name
        provider                    = azurerm.sub-identity
  
}

# NSG for Identity Directory Services UKW Subnet

resource "azurerm_network_security_group" "NSG-Idy-DirServices-UKW" {
  name                = "NSG-Idy-DirServices-UKW"
  location            = var.location_dr
  resource_group_name = data.azurerm_resource_group.rg-identity-networking.name
  provider            = azurerm.sub-identity
}
resource "azurerm_subnet_network_security_group_association" "NSG-Assoc-Idy-DirServices-UKW" {
  network_security_group_id = azurerm_network_security_group.NSG-Idy-DirServices-UKW.id
  subnet_id                 = azurerm_subnet.Sn-Idy-DirServices-UKW.id
  provider                  = azurerm.sub-identity
}

resource "azurerm_network_security_rule" "NSG-Idy-DirServices-UKW-Bastion-Allow" {
  name                        = "Allow-Bastion"
  priority                    = 100
  direction                   = "Inbound"
  access                      = "Allow"
  protocol                    = "Tcp"
  source_port_range           = "*"
  destination_port_range      = "3389"
  source_address_prefixes     = ["10.202.251.0/24", "10.203.251.0/24"]
  destination_address_prefix  = "10.201.10.0/23"
  resource_group_name         = data.azurerm_resource_group.rg-identity-networking.name
    network_security_group_name = azurerm_network_security_group.NSG-Idy-DirServices-UKW.name
    provider                    = azurerm.sub-identity
}

resource "azurerm_network_security_rule" "NSG-Idy-DirServices-UKW_Deny-All-Any" {
    name                        = "Deny-All-Any"
    priority                    = 4000
    direction                   = "Inbound"
    access                      = "Deny"
    protocol                    = "*"
    source_port_range           = "*"
    destination_port_range      = "*"
    source_address_prefix       = "*"
    destination_address_prefix  = "*"
    resource_group_name         = data.azurerm_resource_group.rg-identity-networking.name
        network_security_group_name = azurerm_network_security_group.NSG-Idy-DirServices-UKW.name
        provider                    = azurerm.sub-identity
  
}

# NSG for Identity Management UKS Subnet

resource "azurerm_network_security_group" "NSG-Idy-Management-UKS" {
    name                = "NSG-Idy-Management-UKS"
    location            = var.location_production
    resource_group_name = data.azurerm_resource_group.rg-identity-networking.name
    provider            = azurerm.sub-identity
}

resource "azurerm_subnet_network_security_group_association" "NSG-Assoc-Idy-Management-UKS" {
    network_security_group_id = azurerm_network_security_group.NSG-Idy-Management-UKS.id
    subnet_id                 = azurerm_subnet.Sn-Idy-Management-UKS.id
    provider                  = azurerm.sub-identity
}

resource "azurerm_network_security_rule" "NSG-Idy-Management-UKS-Bastion-Allow" {
  name                        = "Allow-Bastion"
  priority                    = 100
  direction                   = "Inbound"
  access                      = "Allow"
  protocol                    = "Tcp"
  source_port_range           = "*"
  destination_port_range      = "3389"
  source_address_prefixes       = ["10.202.251.0/24", "10.203.251.0/24"]
  destination_address_prefix  = "10.200.50.0/23"
  resource_group_name         = data.azurerm_resource_group.rg-identity-networking.name
    network_security_group_name = azurerm_network_security_group.NSG-Idy-Management-UKS.name
    provider                    = azurerm.sub-identity
}

resource "azurerm_network_security_rule" "NSG-Idy-Management-UKS_Deny-All-Any" {
    name                        = "Deny-All-Any"
    priority                    = 4000
    direction                   = "Inbound"
    access                      = "Deny"
    protocol                    = "*"
    source_port_range           = "*"
    destination_port_range      = "*"
    source_address_prefix       = "*"
    destination_address_prefix  = "*"
    resource_group_name         = data.azurerm_resource_group.rg-identity-networking.name
        network_security_group_name = azurerm_network_security_group.NSG-Idy-Management-UKS.name
        provider                    = azurerm.sub-identity
  
}

# NSG for Identity Management UKW Subnet

resource "azurerm_network_security_group" "NSG-Idy-Management-UKW" {
    name                = "NSG-Idy-Management-UKW"
    location            = var.location_dr
    resource_group_name = data.azurerm_resource_group.rg-identity-networking.name
    provider            = azurerm.sub-identity
}

resource "azurerm_subnet_network_security_group_association" "NSG-Assoc-Idy-Management-UKW" {
    network_security_group_id = azurerm_network_security_group.NSG-Idy-Management-UKW.id
    subnet_id                 = azurerm_subnet.Sn-Idy-Management-UKW.id
    provider                  = azurerm.sub-identity
}

resource "azurerm_network_security_rule" "NSG-Idy-Management-UKW-Bastion-Allow" {
  name                        = "Allow-Bastion"
  priority                    = 100
  direction                   = "Inbound"
  access                      = "Allow"
  protocol                    = "Tcp"
  source_port_range           = "*"
  destination_port_range      = "3389"
  source_address_prefixes       = ["10.202.251.0/24", "10.203.251.0/24"]
  destination_address_prefix  = "10.201.50.0/23"
  resource_group_name         = data.azurerm_resource_group.rg-identity-networking.name
    network_security_group_name = azurerm_network_security_group.NSG-Idy-Management-UKW.name
    provider                    = azurerm.sub-identity
}

resource "azurerm_network_security_rule" "NSG-Idy-Management-UKW_Deny-All-Any" {
    name                        = "Deny-All-Any"
    priority                    = 4000
    direction                   = "Inbound"
    access                      = "Deny"
    protocol                    = "*"
    source_port_range           = "*"
    destination_port_range      = "*"
    source_address_prefix       = "*"
    destination_address_prefix  = "*"
    resource_group_name         = data.azurerm_resource_group.rg-identity-networking.name
        network_security_group_name = azurerm_network_security_group.NSG-Idy-Management-UKW.name
        provider                    = azurerm.sub-identity
  
}

# NSG for Connectivity Management UKS Subnet

resource "azurerm_network_security_group" "NSG-Conn-Management-UKS" {
    name                = "NSG-Conn-Management-UKS"
    location            = var.location_production
    resource_group_name = data.azurerm_resource_group.rg-connectivity-networking.name
    provider            = azurerm.sub-connectivity
}

resource "azurerm_subnet_network_security_group_association" "NSG-Assoc-Conn-Management-UKS" {
    network_security_group_id = azurerm_network_security_group.NSG-Conn-Management-UKS.id
    subnet_id                 = azurerm_subnet.Sn-Conn-Management-UKS.id
    provider                  = azurerm.sub-connectivity
}

resource "azurerm_network_security_rule" "NSG-Conn-Management-UKS-Bastion-Allow" {
  name                        = "Allow-Bastion"
  priority                    = 100
  direction                   = "Inbound"
  access                      = "Allow"
  protocol                    = "Tcp"
  source_port_range           = "*"
  destination_port_range      = "3389"
  source_address_prefixes     = ["10.202.251.0/24", "10.203.251.0/24"]
  destination_address_prefix  = "10.202.50.0/23"
  resource_group_name         = data.azurerm_resource_group.rg-connectivity-networking.name
    network_security_group_name = azurerm_network_security_group.NSG-Conn-Management-UKS.name
    provider                    = azurerm.sub-connectivity
}

resource "azurerm_network_security_rule" "NSG-Conn-Management-UKS_Deny-All-Any" {
    name                        = "Deny-All-Any"
    priority                    = 4000
    direction                   = "Inbound"
    access                      = "Deny"
    protocol                    = "*"
    source_port_range           = "*"
    destination_port_range      = "*"
    source_address_prefix       = "*"
    destination_address_prefix  = "*"
    resource_group_name         = data.azurerm_resource_group.rg-connectivity-networking.name
        network_security_group_name = azurerm_network_security_group.NSG-Conn-Management-UKS.name
        provider                    = azurerm.sub-connectivity
  
}

# NSG for Connectivity Management UKW Subnet

resource "azurerm_network_security_group" "NSG-Conn-Management-UKW" {
    name                = "NSG-Conn-Management-UKW"
    location            = var.location_dr
    resource_group_name = data.azurerm_resource_group.rg-connectivity-networking.name
    provider            = azurerm.sub-connectivity
}

resource "azurerm_subnet_network_security_group_association" "NSG-Assoc-Conn-Management-UKW" {
    network_security_group_id = azurerm_network_security_group.NSG-Conn-Management-UKW.id
    subnet_id                 = azurerm_subnet.Sn-Conn-Management-UKW.id
    provider                  = azurerm.sub-connectivity
}

resource "azurerm_network_security_rule" "NSG-Conn-Management-UKW-Bastion-Allow" {
  name                        = "Allow-Bastion"
  priority                    = 100
  direction                   = "Inbound"
  access                      = "Allow"
  protocol                    = "Tcp"
  source_port_range           = "*"
  destination_port_range      = "3389"
  source_address_prefixes     = ["10.202.251.0/24", "10.203.251.0/24"]
  destination_address_prefix  = "10.203.50.0/23"
  resource_group_name         = data.azurerm_resource_group.rg-connectivity-networking.name
    network_security_group_name = azurerm_network_security_group.NSG-Conn-Management-UKW.name
    provider                    = azurerm.sub-connectivity
}

resource "azurerm_network_security_rule" "NSG-Conn-Management-UKW_Deny-All-Any" {
    name                        = "Deny-All-Any"
    priority                    = 4000
    direction                   = "Inbound"
    access                      = "Deny"
    protocol                    = "*"
    source_port_range           = "*"
    destination_port_range      = "*"
    source_address_prefix       = "*"
    destination_address_prefix  = "*"
    resource_group_name         = data.azurerm_resource_group.rg-connectivity-networking.name
        network_security_group_name = azurerm_network_security_group.NSG-Conn-Management-UKW.name
        provider                    = azurerm.sub-connectivity
  
}

# NSG for Production manaagement subnet UKS Subnet  

resource "azurerm_network_security_group" "NSG-Prod-Management-UKS" {
    name                = "NSG-Prod-Management-UKS"
    location            = var.location_production
    resource_group_name = data.azurerm_resource_group.rg-production-networking.name
    provider            = azurerm.sub-production
}

resource "azurerm_subnet_network_security_group_association" "NSG-Assoc-Prod-Management-UKS" {
    network_security_group_id = azurerm_network_security_group.NSG-Prod-Management-UKS.id
    subnet_id                 = azurerm_subnet.Sn-Prod-Management-UKS.id
    provider                  = azurerm.sub-production
}

resource "azurerm_network_security_rule" "NSG-Prod-Management-UKS-Bastion-Allow" {
  name                        = "Allow-Bastion"
  priority                    = 100
  direction                   = "Inbound"
  access                      = "Allow"
  protocol                    = "Tcp"
  source_port_range           = "*"
  destination_port_range      = "3389"
  source_address_prefixes     = ["10.202.251.0/24", "10.203.251.0/24"]
  destination_address_prefix  = "10.204.50.0/23"
  resource_group_name         = data.azurerm_resource_group.rg-production-networking.name
    network_security_group_name = azurerm_network_security_group.NSG-Prod-Management-UKS.name
    provider                    = azurerm.sub-production
}

resource "azurerm_network_security_rule" "NSG-Prod-Management-UKS_Deny-All-Any" {
    name                        = "Deny-All-Any"
    priority                    = 4000
    direction                   = "Inbound"
    access                      = "Deny"
    protocol                    = "*"
    source_port_range           = "*"
    destination_port_range      = "*"
    source_address_prefix       = "*"
    destination_address_prefix  = "*"
    resource_group_name         = data.azurerm_resource_group.rg-production-networking.name
        network_security_group_name = azurerm_network_security_group.NSG-Prod-Management-UKS.name
        provider                    = azurerm.sub-production
  
}

# NSG for Production manaagement subnet UKW Subnet

resource "azurerm_network_security_group" "NSG-Prod-Management-UKW" {
    name                = "NSG-Prod-Management-UKW"
    location            = var.location_dr
    resource_group_name = data.azurerm_resource_group.rg-production-networking.name
    provider            = azurerm.sub-production
}

resource "azurerm_subnet_network_security_group_association" "NSG-Assoc-Prod-Management-UKW" {
    network_security_group_id = azurerm_network_security_group.NSG-Prod-Management-UKW.id
    subnet_id                 = azurerm_subnet.Sn-Prod-Management-UKW.id
    provider                  = azurerm.sub-production
}

resource "azurerm_network_security_rule" "NSG-Prod-Management-UKW-Bastion-Allow" {
  name                        = "Allow-Bastion"
  priority                    = 100
  direction                   = "Inbound"
  access                      = "Allow"
  protocol                    = "Tcp"
  source_port_range           = "*"
  destination_port_range      = "3389"
  source_address_prefixes     = ["10.202.251.0/24", "10.203.251.0/24"]
  destination_address_prefix  = "10.205.50.0/23"
  resource_group_name         = data.azurerm_resource_group.rg-production-networking.name
    network_security_group_name = azurerm_network_security_group.NSG-Prod-Management-UKW.name
    provider                    = azurerm.sub-production
}

resource "azurerm_network_security_rule" "NSG-Prod-Management-UKW_Deny-All-Any" {
    name                        = "Deny-All-Any"
    priority                    = 4000
    direction                   = "Inbound"
    access                      = "Deny"
    protocol                    = "*"
    source_port_range           = "*"
    destination_port_range      = "*"
    source_address_prefix       = "*"
    destination_address_prefix  = "*"
    resource_group_name         = data.azurerm_resource_group.rg-production-networking.name
        network_security_group_name = azurerm_network_security_group.NSG-Prod-Management-UKW.name
        provider                    = azurerm.sub-production
  
}

#NSG for Production Cornwall UKS Subnet

resource "azurerm_network_security_group" "NSG-Prod-Cornwall-UKS" {
    name                = "NSG-Prod-Cornwall-UKS"
    location            = var.location_production
    resource_group_name = data.azurerm_resource_group.rg-production-networking.name
    provider            = azurerm.sub-production
}

resource "azurerm_subnet_network_security_group_association" "NSG-Assoc-Prod-Cornwall-UKS" {
    network_security_group_id = azurerm_network_security_group.NSG-Prod-Cornwall-UKS.id
    subnet_id                 = azurerm_subnet.Sn-Prod-Cornwall-UKS.id
    provider                  = azurerm.sub-production
}

resource "azurerm_network_security_rule" "NSG-Prod-Cornwall-UKS-Bastion-Allow" {
  name                        = "Allow-Bastion"
  priority                    = 100
  direction                   = "Inbound"
  access                      = "Allow"
  protocol                    = "Tcp"
  source_port_range           = "*"
  destination_port_range      = "3389"
  source_address_prefixes     = ["10.202.251.0/24", "10.203.251.0/24"]
  destination_address_prefix  = "10.204.100.0/23"
  resource_group_name         = data.azurerm_resource_group.rg-production-networking.name
    network_security_group_name = azurerm_network_security_group.NSG-Prod-Management-UKS.name
    provider                    = azurerm.sub-production
}

resource "azurerm_network_security_rule" "NSG-Prod-Cornwall-UKS_Deny-All-Any" {
    name                        = "Deny-All-Any"
    priority                    = 4000
    direction                   = "Inbound"
    access                      = "Deny"
    protocol                    = "*"
    source_port_range           = "*"
    destination_port_range      = "*"
    source_address_prefix       = "*"
    destination_address_prefix  = "*"
    resource_group_name         = data.azurerm_resource_group.rg-production-networking.name
        network_security_group_name = azurerm_network_security_group.NSG-Prod-Cornwall-UKS.name
        provider                    = azurerm.sub-production
  
}

#NSG for Production Cornwall UKW Subnet

resource "azurerm_network_security_group" "NSG-Prod-Cornwall-UKW" {
    name                = "NSG-Prod-Cornwall-UKW"
    location            = var.location_dr
    resource_group_name = data.azurerm_resource_group.rg-production-networking.name
    provider            = azurerm.sub-production
}

resource "azurerm_subnet_network_security_group_association" "NSG-Assoc-Prod-Cornwall-UKW" {
    network_security_group_id = azurerm_network_security_group.NSG-Prod-Cornwall-UKW.id
    subnet_id                 = azurerm_subnet.Sn-Prod-Cornwall-UKW.id
    provider                  = azurerm.sub-production
}

resource "azurerm_network_security_rule" "NSG-Prod-Cornwall-UKW-Bastion-Allow" {
  name                        = "Allow-Bastion"
  priority                    = 100
  direction                   = "Inbound"
  access                      = "Allow"
  protocol                    = "Tcp"
  source_port_range           = "*"
  destination_port_range      = "3389"
  source_address_prefixes     = ["10.202.251.0/24", "10.203.251.0/24"]
  destination_address_prefix  = "10.204.100.0/23"
  resource_group_name         = data.azurerm_resource_group.rg-production-networking.name
    network_security_group_name = azurerm_network_security_group.NSG-Prod-Cornwall-UKW.name
    provider                    = azurerm.sub-production
}

resource "azurerm_network_security_rule" "NSG-Prod-Cornwall-UKW_Deny-All-Any" {
    name                        = "Deny-All-Any"
    priority                    = 4000
    direction                   = "Inbound"
    access                      = "Deny"
    protocol                    = "*"
    source_port_range           = "*"
    destination_port_range      = "*"
    source_address_prefix       = "*"
    destination_address_prefix  = "*"
    resource_group_name         = data.azurerm_resource_group.rg-production-networking.name
        network_security_group_name = azurerm_network_security_group.NSG-Prod-Cornwall-UKW.name
        provider                    = azurerm.sub-production
  
}


# NSG for DevTest management subnet UKS Subnet

resource "azurerm_network_security_group" "NSG-DevTest-Management-UKS" {
    name                = "NSG-DevTest-Management-UKS"
    location            = var.location_devtest
    resource_group_name = data.azurerm_resource_group.rg-devtest-networking.name
    provider            = azurerm.sub-devtest
}

resource "azurerm_subnet_network_security_group_association" "NSG-Assoc-DevTest-Management-UKS" {
    network_security_group_id = azurerm_network_security_group.NSG-DevTest-Management-UKS.id
    subnet_id                 = azurerm_subnet.Sn-DevTest-Management-UKS.id
    provider                  = azurerm.sub-devtest
}

resource "azurerm_network_security_rule" "NSG-DevTest-Management-UKS-Bastion-Allow" {
  name                        = "Allow-Bastion"
  priority                    = 100
  direction                   = "Inbound"
  access                      = "Allow"
  protocol                    = "Tcp"
  source_port_range           = "*"
  destination_port_range      = "3389"
  source_address_prefixes     = ["10.202.251.0/24", "10.203.251.0/24"]
  destination_address_prefix  = "10.206.50.0/23"
  resource_group_name         = data.azurerm_resource_group.rg-devtest-networking.name
    network_security_group_name = azurerm_network_security_group.NSG-DevTest-Management-UKS.name
    provider                    = azurerm.sub-devtest
}

resource "azurerm_network_security_rule" "NSG-DevTest-Management-UKS_Deny-All-Any" {
    name                        = "Deny-All-Any"
    priority                    = 4000
    direction                   = "Inbound"
    access                      = "Deny"
    protocol                    = "*"
    source_port_range           = "*"
    destination_port_range      = "*"
    source_address_prefix       = "*"
    destination_address_prefix  = "*"
    resource_group_name         = data.azurerm_resource_group.rg-devtest-networking.name
        network_security_group_name = azurerm_network_security_group.NSG-DevTest-Management-UKS.name
        provider                    = azurerm.sub-devtest
  
}

# NSG for DevTest management subnet UKW Subnet

resource "azurerm_network_security_group" "NSG-DevTest-Management-UKW" {
    name                = "NSG-DevTest-Management-UKW"
    location            = var.location_dr
    resource_group_name = data.azurerm_resource_group.rg-devtest-networking.name
    provider            = azurerm.sub-devtest
}

resource "azurerm_subnet_network_security_group_association" "NSG-Assoc-DevTest-Management-UKW" {
    network_security_group_id = azurerm_network_security_group.NSG-DevTest-Management-UKW.id
    subnet_id                 = azurerm_subnet.Sn-DevTest-Management-UKW.id
    provider                  = azurerm.sub-devtest
}

resource "azurerm_network_security_rule" "NSG-DevTest-Management-UKW-Bastion-Allow" {
  name                        = "Allow-Bastion"
  priority                    = 100
  direction                   = "Inbound"
  access                      = "Allow"
  protocol                    = "Tcp"
  source_port_range           = "*"
  destination_port_range      = "3389"
  source_address_prefixes     = ["10.202.251.0/24", "10.203.251.0/24"]
  destination_address_prefix  = "10.207.50.0/23"
  resource_group_name         = data.azurerm_resource_group.rg-devtest-networking.name
    network_security_group_name = azurerm_network_security_group.NSG-DevTest-Management-UKW.name
    provider                    = azurerm.sub-devtest
}

resource "azurerm_network_security_rule" "NSG-DevTest-Management-UKW_Deny-All-Any" {
    name                        = "Deny-All-Any"
    priority                    = 4000
    direction                   = "Inbound"
    access                      = "Deny"
    protocol                    = "*"
    source_port_range           = "*"
    destination_port_range      = "*"
    source_address_prefix       = "*"
    destination_address_prefix  = "*"
    resource_group_name         = data.azurerm_resource_group.rg-devtest-networking.name
        network_security_group_name = azurerm_network_security_group.NSG-DevTest-Management-UKW.name
        provider                    = azurerm.sub-devtest
  
}

# NSG for DevTest Cornwall UKS Subnet

resource "azurerm_network_security_group" "NSG-DevTest-Cornwall-UKS" {
    name                = "NSG-DevTest-Cornwall-UKS"
    location            = var.location_devtest
    resource_group_name = data.azurerm_resource_group.rg-devtest-networking.name
    provider            = azurerm.sub-devtest
}

resource "azurerm_subnet_network_security_group_association" "NSG-Assoc-DevTest-Cornwall-UKS" {
    network_security_group_id = azurerm_network_security_group.NSG-DevTest-Cornwall-UKS.id
    subnet_id                 = azurerm_subnet.Sn-DevTest-Cornwall-UKS.id
    provider                  = azurerm.sub-devtest
}

resource "azurerm_network_security_rule" "NSG-DevTest-Cornwall-UKS-Bastion-Allow" {
  name                        = "Allow-Bastion"
  priority                    = 100
  direction                   = "Inbound"
  access                      = "Allow"
  protocol                    = "Tcp"
  source_port_range           = "*"
  destination_port_range      = "3389"
  source_address_prefixes     = ["10.202.251.0/24", "10.203.251.0/24"]
  destination_address_prefix  = "10.206.100.0/23"
  resource_group_name         = data.azurerm_resource_group.rg-devtest-networking.name
    network_security_group_name = azurerm_network_security_group.NSG-DevTest-Cornwall-UKS.name
    provider                    = azurerm.sub-devtest
}

resource "azurerm_network_security_rule" "NSG-DevTest-Cornwall-UKS_Deny-All-Any" {
    name                        = "Deny-All-Any"
    priority                    = 4000
    direction                   = "Inbound"
    access                      = "Deny"
    protocol                    = "*"
    source_port_range           = "*"
    destination_port_range      = "*"
    source_address_prefix       = "*"
    destination_address_prefix  = "*"
    resource_group_name         = data.azurerm_resource_group.rg-devtest-networking.name
        network_security_group_name = azurerm_network_security_group.NSG-DevTest-Cornwall-UKS.name
        provider                    = azurerm.sub-devtest
  
}

# NSG for DevTest Cornwall UKW Subnet

resource "azurerm_network_security_group" "NSG-DevTest-Cornwall-UKW" {
    name                = "NSG-DevTest-Cornwall-UKW"
    location            = var.location_dr
    resource_group_name = data.azurerm_resource_group.rg-devtest-networking.name
    provider            = azurerm.sub-devtest
}

resource "azurerm_subnet_network_security_group_association" "NSG-Assoc-DevTest-Cornwall-UKW" {
    network_security_group_id = azurerm_network_security_group.NSG-DevTest-Cornwall-UKW.id
    subnet_id                 = azurerm_subnet.Sn-DevTest-Cornwall-UKW.id
    provider                  = azurerm.sub-devtest
}

resource "azurerm_network_security_rule" "NSG-DevTest-Cornwall-UKW-Bastion-Allow" {
  name                        = "Allow-Bastion"
  priority                    = 100
  direction                   = "Inbound"
  access                      = "Allow"
  protocol                    = "Tcp"
  source_port_range           = "*"
  destination_port_range      = "3389"
  source_address_prefixes     = ["10.202.251.0/24", "10.203.251.0/24"]
  destination_address_prefix  = "10.207.100.0/23"
  resource_group_name         = data.azurerm_resource_group.rg-devtest-networking.name
    network_security_group_name = azurerm_network_security_group.NSG-DevTest-Cornwall-UKW.name
    provider                    = azurerm.sub-devtest
}
resource "azurerm_network_security_rule" "NSG-DevTest-Cornwall-UKW_Deny-All-Any" {
    name                        = "Deny-All-Any"
    priority                    = 4000
    direction                   = "Inbound"
    access                      = "Deny"
    protocol                    = "*"
    source_port_range           = "*"
    destination_port_range      = "*"
    source_address_prefix       = "*"
    destination_address_prefix  = "*"
    resource_group_name         = data.azurerm_resource_group.rg-devtest-networking.name
        network_security_group_name = azurerm_network_security_group.NSG-DevTest-Cornwall-UKW.name
        provider                    = azurerm.sub-devtest
  
}


