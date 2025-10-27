# Route Table for Directory Services UKS Subnet

resource "azurerm_route_table" "RT-Idy-DirServices-UKS" {
    name                = "RT-Idy-DirServices-UKS"
    location            = var.location_production
    resource_group_name = data.azurerm_resource_group.rg-identity-networking.name
    provider            = azurerm.sub-identity
}

resource "azurerm_subnet_route_table_association" "Assoc-RT-Idy-DirServices-UKS" {
    subnet_id          = azurerm_subnet.Sn-Idy-DirServices-UKS.id
    route_table_id     = azurerm_route_table.RT-Idy-DirServices-UKS.id
    depends_on         = [azurerm_route_table.RT-Idy-DirServices-UKS]   
  
}

resource "azurerm_route" "Internet-idy-DirServices-UKS" {
    name                   = "Route-Internet"
    resource_group_name    = data.azurerm_resource_group.rg-identity-networking.name
    provider               = azurerm.sub-identity
    route_table_name       = azurerm_route_table.RT-Idy-DirServices-UKS.name
    address_prefix         = "0.0.0.0/0"
    next_hop_type          = "VirtualAppliance"
    next_hop_in_ip_address = var.firewall_private_ip_uks
}

# Route Table for UKW Directory Services Subnet

resource "azurerm_route_table" "RT-Idy-DirServices-UKW" {
    name                = "RT-Idy-DirServices-UKW"
    location            = var.location_dr
    resource_group_name = data.azurerm_resource_group.rg-identity-networking.name
    provider            = azurerm.sub-identity
}

resource "azurerm_subnet_route_table_association" "Assoc-RT-Idy-DirServices-UKW" {
    subnet_id          = azurerm_subnet.Sn-Idy-DirServices-UKW.id
    route_table_id     = azurerm_route_table.RT-Idy-DirServices-UKW.id
    depends_on         = [azurerm_route_table.RT-Idy-DirServices-UKW]   
  
}

resource "azurerm_route" "Internet-idy-DirServices-UKW" {
    name                   = "Route-Internet"
    resource_group_name    = data.azurerm_resource_group.rg-identity-networking.name
    provider               = azurerm.sub-identity
    route_table_name       = azurerm_route_table.RT-Idy-DirServices-UKW.name
    address_prefix         = "0.0.0.0/0"
    next_hop_type          = "VirtualAppliance"
    next_hop_in_ip_address = var.firewall_private_ip_ukw
}

# Route table for UKS Identity Management Subnet

resource "azurerm_route_table" "RT-Idy-Management-UKS" {
    name                = "RT-Idy-Management-UKS"
    location            = var.location_production
    resource_group_name = data.azurerm_resource_group.rg-identity-networking.name
    provider            = azurerm.sub-identity
}

resource "azurerm_subnet_route_table_association" "Assoc-RT-Idy-management-UKS" {
    subnet_id          = azurerm_subnet.Sn-Idy-Management-UKS.id
    route_table_id     = azurerm_route_table.RT-Idy-Management-UKS.id
    depends_on         = [azurerm_route_table.RT-Idy-Management-UKS]   
  
}

resource "azurerm_route" "Internet-idy-Management-UKS" {
    name                   = "Route-Internet"
    resource_group_name    = data.azurerm_resource_group.rg-identity-networking.name
    provider               = azurerm.sub-identity
    route_table_name       = azurerm_route_table.RT-Idy-Management-UKS.name
    address_prefix         = "0.0.0.0/0"
    next_hop_type          = "VirtualAppliance"
    next_hop_in_ip_address = var.firewall_private_ip_uks
}

# Route table for UKW Identity Management Subnet

resource "azurerm_route_table" "RT-Idy-Management-UKW" {
    name                = "RT-Idy-Management-UKW"
    location            = var.location_dr
    resource_group_name = data.azurerm_resource_group.rg-identity-networking.name
    provider            = azurerm.sub-identity
}

resource "azurerm_subnet_route_table_association" "Assoc-RT-Idy-management-UKW" {
    subnet_id          = azurerm_subnet.Sn-Idy-Management-UKW.id
    route_table_id     = azurerm_route_table.RT-Idy-Management-UKW.id
    depends_on         = [azurerm_route_table.RT-Idy-Management-UKW]   
  
}

resource "azurerm_route" "Internet-idy-Management-UKW" {
    name                   = "Route-Internet"
    resource_group_name    = data.azurerm_resource_group.rg-identity-networking.name
    provider               = azurerm.sub-identity
    route_table_name       = azurerm_route_table.RT-Idy-Management-UKW.name
    address_prefix         = "0.0.0.0/0"
    next_hop_type          = "VirtualAppliance"
    next_hop_in_ip_address = var.firewall_private_ip_ukw
}

# Route table for UKS Connectivity Management Subnet

resource "azurerm_route_table" "RT-Conn-Management-UKS" {
    name                = "RT-Conn-Conn-Management-UKS"
    location            = var.location_production
    resource_group_name = data.azurerm_resource_group.rg-connectivity-networking.name
    provider            = azurerm.sub-connectivity
}

resource "azurerm_subnet_route_table_association" "Assoc-RT-Conn-Management-UKS" {
    subnet_id          = azurerm_subnet.Sn-Conn-Management-UKS.id
    route_table_id     = azurerm_route_table.RT-Conn-Management-UKS.id
    depends_on         = [azurerm_route_table.RT-Conn-Management-UKS]   
}

resource "azurerm_route" "Internet-Conn-Management-UKS" {
    name                   = "Route-Internet"
    resource_group_name    = data.azurerm_resource_group.rg-connectivity-networking.name
    provider               = azurerm.sub-connectivity
    route_table_name       = azurerm_route_table.RT-Conn-Management-UKS.name
    address_prefix         = "0.0.0.0/0"
    next_hop_type          = "VirtualAppliance"
    next_hop_in_ip_address = var.firewall_private_ip_uks
}

# Route table for UKW Connectivity Management Subnet

resource "azurerm_route_table" "RT-Conn-Management-UKW" {
    name                = "RT-Idy-Conn-Management-UKW"
    location            = var.location_dr
    resource_group_name = data.azurerm_resource_group.rg-connectivity-networking.name
    provider            = azurerm.sub-connectivity
}

resource "azurerm_subnet_route_table_association" "Assoc-RT-Conn-Management-UKW" {
    subnet_id          = azurerm_subnet.Sn-Conn-Management-UKW.id
    route_table_id     = azurerm_route_table.RT-Conn-Management-UKW.id
    depends_on         = [azurerm_route_table.RT-Conn-Management-UKW]   
}

resource "azurerm_route" "Internet-Conn-Management-UKW" {
    name                   = "Route-Internet"
    resource_group_name    = data.azurerm_resource_group.rg-connectivity-networking.name
    provider               = azurerm.sub-connectivity
    route_table_name       = azurerm_route_table.RT-Conn-Management-UKW.name
    address_prefix         = "0.0.0.0/0"
    next_hop_type          = "VirtualAppliance"
    next_hop_in_ip_address = var.firewall_private_ip_ukw
}

#Route table for UKS Production Management Subnet

resource "azurerm_route_table" "RT-Prod-Management-UKS" {
    name                = "RT-Prod-Management-UKS"
    location            = var.location_production
    resource_group_name = data.azurerm_resource_group.rg-production-networking.name
    provider            = azurerm.sub-production
}

resource "azurerm_subnet_route_table_association" "Assoc-RT-Prod-Management-UKS" {
    subnet_id          = azurerm_subnet.Sn-Prod-Management-UKS.id
    route_table_id     = azurerm_route_table.RT-Prod-Management-UKS.id
    depends_on         = [azurerm_route_table.RT-Prod-Management-UKS]   
}

resource "azurerm_route" "Internet-Prod-Management-UKS" {
    name                   = "Route-Internet"
    resource_group_name    = data.azurerm_resource_group.rg-production-networking.name
    provider               = azurerm.sub-production
    route_table_name       = azurerm_route_table.RT-Prod-Management-UKS.name
    address_prefix         = "0.0.0.0/0"
    next_hop_type          = "VirtualAppliance"
    next_hop_in_ip_address = var.firewall_private_ip_uks
}

#Route table for UKW Production Management Subnet

resource "azurerm_route_table" "RT-Prod-Management-UKW" {
    name                = "RT-Prod-Management-UKW"
    location            = var.location_dr
    resource_group_name = data.azurerm_resource_group.rg-production-networking.name
    provider            = azurerm.sub-production
}

resource "azurerm_subnet_route_table_association" "Assoc-RT-ProdManagement-UKW" {
    subnet_id          = azurerm_subnet.Sn-Prod-Management-UKW.id
    route_table_id     = azurerm_route_table.RT-Prod-Management-UKW.id
    depends_on         = [azurerm_route_table.RT-Prod-Management-UKW]   
}

resource "azurerm_route" "Internet-Prod-Management-UKW" {
    name                   = "Route-Internet"
    resource_group_name    = data.azurerm_resource_group.rg-production-networking.name
    provider               = azurerm.sub-production
    route_table_name       = azurerm_route_table.RT-Prod-Management-UKW.name
    address_prefix         = "0.0.0.0/0"
    next_hop_type          = "VirtualAppliance"
    next_hop_in_ip_address = var.firewall_private_ip_ukw
}

#Route Table for UKS Production Cornwall Subnet

resource "azurerm_route_table" "RT-Prod-Cornwall-UKS" {
    name = "RT-Prod-Cornwall-UKS"
    location            = var.location_production
    resource_group_name = data.azurerm_resource_group.rg-production-networking.name
    provider            = azurerm.sub-production
}

resource "azurerm_subnet_route_table_association" "Assoc-RT-Prod-Cornwall-UKS" {
    subnet_id          = azurerm_subnet.Sn-Prod-Cornwall-UKS.id
    route_table_id     = azurerm_route_table.RT-Prod-Cornwall-UKS.id
    depends_on         = [azurerm_route_table.RT-Prod-Cornwall-UKS]   
}

resource "azurerm_route" "Internet-Prod-Cornwall-UKS" {
    name                   = "Route-Internet"
    resource_group_name    = data.azurerm_resource_group.rg-production-networking.name
    provider               = azurerm.sub-production
    route_table_name       = azurerm_route_table.RT-Prod-Cornwall-UKS.name
    address_prefix         = "0.0.0.0/0"
    next_hop_type          = "VirtualAppliance"
    next_hop_in_ip_address = var.firewall_private_ip_uks
}


#Route table for UKS DevTest Management Subnet

resource "azurerm_route_table" "RT-DevTest-Management-UKS" {
    name                = "RT-DevTest-Management-UKS"
    location            = var.location_devtest
    resource_group_name = data.azurerm_resource_group.rg-devtest-networking.name
    provider            = azurerm.sub-devtest
}

resource "azurerm_subnet_route_table_association" "Assoc-RT-DevTestManagement-UKS" {
    subnet_id          = azurerm_subnet.Sn-DevTest-Management-UKS.id
    route_table_id     = azurerm_route_table.RT-DevTest-Management-UKS.id
    depends_on         = [azurerm_route_table.RT-DevTest-Management-UKS]   
}

resource "azurerm_route" "Internet-DevTest-Management-UKS" {
    name                   = "Route-Internet"
    resource_group_name    = data.azurerm_resource_group.rg-devtest-networking.name
    provider               = azurerm.sub-devtest
    route_table_name       = azurerm_route_table.RT-DevTest-Management-UKS.name
    address_prefix         = "0.0.0.0/0"
    next_hop_type          = "VirtualAppliance"
    next_hop_in_ip_address = var.firewall_private_ip_uks
}

#Route table for UKW DevTest Management Subnet

resource "azurerm_route_table" "RT-DevTest-Management-UKW" {
    name                = "RT-DevTest-Management-UKW"
    location            = var.location_dr
    resource_group_name = data.azurerm_resource_group.rg-devtest-networking.name
    provider            = azurerm.sub-devtest
}

resource "azurerm_subnet_route_table_association" "Assoc-RT-DevTestManagement-UKW" {
    subnet_id          = azurerm_subnet.Sn-DevTest-Management-UKW.id
    route_table_id     = azurerm_route_table.RT-DevTest-Management-UKW.id
    depends_on         = [azurerm_route_table.RT-DevTest-Management-UKW]   
}

resource "azurerm_route" "Internet-DevTest-Management-UKW" {
    name                   = "Route-Internet"
    resource_group_name    = data.azurerm_resource_group.rg-devtest-networking.name
    provider               = azurerm.sub-devtest
    route_table_name       = azurerm_route_table.RT-DevTest-Management-UKW.name
    address_prefix         = "0.0.0.0/0"
    next_hop_type          = "VirtualAppliance"
    next_hop_in_ip_address = var.firewall_private_ip_ukw
}





