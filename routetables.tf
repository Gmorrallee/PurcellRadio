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

#Route Table for UKS Production Epsom St Hellier Subnet

resource "azurerm_route_table" "RT-Prod-EpsomStHellier-UKS" {
     name = "RT-EpsomStHellier-UKS"
     location            = var.location_production
     resource_group_name = data.azurerm_resource_group.rg-production-networking.name
     provider            = azurerm.sub-production
}

resource "azurerm_subnet_route_table_association" "Assoc-RT-Prod-EpsomStHellier-UKS" {
    subnet_id          = azurerm_subnet.Sn-Prod-EpsomStHellier-UKS.id
    route_table_id     = azurerm_route_table.RT-Prod-EpsomStHellier-UKS.id
    depends_on         = [azurerm_route_table.RT-Prod-EpsomStHellier-UKS]   
}

resource "azurerm_route" "Internet-Prod-EpsomStHellier-UKS" {
    name                   = "Route-Internet"
    resource_group_name    = data.azurerm_resource_group.rg-production-networking.name
    provider               = azurerm.sub-production
    route_table_name       = azurerm_route_table.RT-Prod-EpsomStHellier-UKS.name
    address_prefix         = "0.0.0.0/0"
    next_hop_type          = "VirtualAppliance"
    next_hop_in_ip_address = var.firewall_private_ip_uks
}

#NSG for UKS Production Mitie Subnet

resource "azurerm_route_table" "RT-Prod-Mitie-UKS" {
     name = "RT-Mitie-UKS"
     location            = var.location_production
     resource_group_name = data.azurerm_resource_group.rg-production-networking.name
     provider            = azurerm.sub-production
}

resource "azurerm_subnet_route_table_association" "Assoc-RT-Prod-Mitie-UKS" {
    subnet_id          = azurerm_subnet.Sn-Prod-Mitie-UKS.id
    route_table_id     = azurerm_route_table.RT-Prod-Mitie-UKS.id
    depends_on         = [azurerm_route_table.RT-Prod-Mitie-UKS]   
}

resource "azurerm_route" "Internet-Prod-Mitie-UKS" {
    name                   = "Route-Internet"
    resource_group_name    = data.azurerm_resource_group.rg-production-networking.name
    provider               = azurerm.sub-production
    route_table_name       = azurerm_route_table.RT-Prod-Mitie-UKS.name
    address_prefix         = "0.0.0.0/0"
    next_hop_type          = "VirtualAppliance"
    next_hop_in_ip_address = var.firewall_private_ip_uks
}

#Route table for UKS Production OCS Subnet



#Route table for UKS Production Serco Subnet

resource "azurerm_route_table" "RT-Prod-Serco-UKS" {
     name = "RT-Serco-UKS"
     location            = var.location_production
     resource_group_name = data.azurerm_resource_group.rg-production-networking.name
     provider            = azurerm.sub-production
}

resource "azurerm_subnet_route_table_association" "Assoc-RT-Prod-Serco-UKS" {
    subnet_id          = azurerm_subnet.Sn-Prod-Serco-UKS.id
    route_table_id     = azurerm_route_table.RT-Prod-Serco-UKS.id
    depends_on         = [azurerm_route_table.RT-Prod-Serco-UKS]   
}

resource "azurerm_route" "Internet-Prod-Serco-UKS" {
    name                   = "Route-Internet"
    resource_group_name    = data.azurerm_resource_group.rg-production-networking.name
    provider               = azurerm.sub-production
    route_table_name       = azurerm_route_table.RT-Prod-Serco-UKS.name
    address_prefix         = "0.0.0.0/0"
    next_hop_type          = "VirtualAppliance"
    next_hop_in_ip_address = var.firewall_private_ip_uks
}

#Route table for UKS Production Sodexo Subnet

resource "azurerm_route_table" "RT-Prod-Sodexo-UKS" {
     name = "RT-Sodexo-UKS"
     location            = var.location_production
     resource_group_name = data.azurerm_resource_group.rg-production-networking.name
     provider            = azurerm.sub-production
}

resource "azurerm_subnet_route_table_association" "Assoc-RT-Prod-Sodexo-UKS" {
    subnet_id          = azurerm_subnet.Sn-Prod-Sodexo-UKS.id
    route_table_id     = azurerm_route_table.RT-Prod-Sodexo-UKS.id
    depends_on         = [azurerm_route_table.RT-Prod-Sodexo-UKS]   
}

resource "azurerm_route" "Internet-Prod-Sodexo-UKS" {
    name                   = "Route-Internet"
    resource_group_name    = data.azurerm_resource_group.rg-production-networking.name
    provider               = azurerm.sub-production
    route_table_name       = azurerm_route_table.RT-Prod-Sodexo-UKS.name
    address_prefix         = "0.0.0.0/0"
    next_hop_type          = "VirtualAppliance"
    next_hop_in_ip_address = var.firewall_private_ip_uks
}

#Route table for UKS Production Stanley Subnet

resource "azurerm_route_table" "RT-Prod-Stanley-UKS" {
     name = "RT-Stanley-UKS"
     location            = var.location_production
     resource_group_name = data.azurerm_resource_group.rg-production-networking.name
     provider            = azurerm.sub-production
}

resource "azurerm_subnet_route_table_association" "Assoc-RT-Prod-Stanley-UKS" {
    subnet_id          = azurerm_subnet.Sn-Prod-Stanley-UKS.id
    route_table_id     = azurerm_route_table.RT-Prod-Stanley-UKS.id
    depends_on         = [azurerm_route_table.RT-Prod-Stanley-UKS]   
}

resource "azurerm_route" "Internet-Prod-Stanley-UKS" {
    name                   = "Route-Internet"
    resource_group_name    = data.azurerm_resource_group.rg-production-networking.name
    provider               = azurerm.sub-production
    route_table_name       = azurerm_route_table.RT-Prod-Stanley-UKS.name
    address_prefix         = "0.0.0.0/0"
    next_hop_type          = "VirtualAppliance"
    next_hop_in_ip_address = var.firewall_private_ip_uks
}

#Route Table for UKW Production Cornwall Subnet

resource "azurerm_route_table" "RT-Prod-Cornwall-UKW" {
    name = "RT-Prod-Cornwall-UKW"
    location            = var.location_production
    resource_group_name = data.azurerm_resource_group.rg-production-networking.name
    provider            = azurerm.sub-production
}

resource "azurerm_subnet_route_table_association" "Assoc-RT-Prod-Cornwall-UKW" {
    subnet_id          = azurerm_subnet.Sn-Prod-Cornwall-UKW.id
    route_table_id     = azurerm_route_table.RT-Prod-Cornwall-UKW.id
    depends_on         = [azurerm_route_table.RT-Prod-Cornwall-UKW]   
}

resource "azurerm_route" "Internet-Prod-Cornwall-UKW" {
    name                   = "Route-Internet"
    resource_group_name    = data.azurerm_resource_group.rg-production-networking.name
    provider               = azurerm.sub-production
    route_table_name       = azurerm_route_table.RT-Prod-Cornwall-UKW.name
    address_prefix         = "0.0.0.0/0"
    next_hop_type          = "VirtualAppliance"
    next_hop_in_ip_address = var.firewall_private_ip_UKW
}

#Route Table for UKW Production Epsom St Hellier Subnet

resource "azurerm_route_table" "RT-Prod-EpsomStHellier-UKW" {
     name = "RT-EpsomStHellier-UKW"
     location            = var.location_production
     resource_group_name = data.azurerm_resource_group.rg-production-networking.name
     provider            = azurerm.sub-production
}

resource "azurerm_subnet_route_table_association" "Assoc-RT-Prod-EpsomStHellier-UKW" {
    subnet_id          = azurerm_subnet.Sn-Prod-EpsomStHellier-UKW.id
    route_table_id     = azurerm_route_table.RT-Prod-EpsomStHellier-UKW.id
    depends_on         = [azurerm_route_table.RT-Prod-EpsomStHellier-UKW]   
}

resource "azurerm_route" "Internet-Prod-EpsomStHellier-UKW" {
    name                   = "Route-Internet"
    resource_group_name    = data.azurerm_resource_group.rg-production-networking.name
    provider               = azurerm.sub-production
    route_table_name       = azurerm_route_table.RT-Prod-EpsomStHellier-UKW.name
    address_prefix         = "0.0.0.0/0"
    next_hop_type          = "VirtualAppliance"
    next_hop_in_ip_address = var.firewall_private_ip_UKW
}

#NSG for UKW Production Mitie Subnet

resource "azurerm_route_table" "RT-Prod-Mitie-UKW" {
     name = "RT-Mitie-UKW"
     location            = var.location_production
     resource_group_name = data.azurerm_resource_group.rg-production-networking.name
     provider            = azurerm.sub-production
}

resource "azurerm_subnet_route_table_association" "Assoc-RT-Prod-Mitie-UKW" {
    subnet_id          = azurerm_subnet.Sn-Prod-Mitie-UKW.id
    route_table_id     = azurerm_route_table.RT-Prod-Mitie-UKW.id
    depends_on         = [azurerm_route_table.RT-Prod-Mitie-UKW]   
}

resource "azurerm_route" "Internet-Prod-Mitie-UKW" {
    name                   = "Route-Internet"
    resource_group_name    = data.azurerm_resource_group.rg-production-networking.name
    provider               = azurerm.sub-production
    route_table_name       = azurerm_route_table.RT-Prod-Mitie-UKW.name
    address_prefix         = "0.0.0.0/0"
    next_hop_type          = "VirtualAppliance"
    next_hop_in_ip_address = var.firewall_private_ip_UKW
}

#Route table for UKW Production OCS Subnet

resource "azurerm_route_table" "RT-Prod-OCS-UKW" {
     name = "RT-OCS-UKW"
     location            = var.location_production
     resource_group_name = data.azurerm_resource_group.rg-production-networking.name
     provider            = azurerm.sub-production
}

resource "azurerm_subnet_route_table_association" "Assoc-RT-Prod-OCS-UKW" {
    subnet_id          = azurerm_subnet.Sn-Prod-OCS-UKW.id
    route_table_id     = azurerm_route_table.RT-Prod-OCS-UKW.id
    depends_on         = [azurerm_route_table.RT-Prod-OCS-UKW]   
}

resource "azurerm_route" "Internet-Prod-OCS-UKW" {
    name                   = "Route-Internet"
    resource_group_name    = data.azurerm_resource_group.rg-production-networking.name
    provider               = azurerm.sub-production
    route_table_name       = azurerm_route_table.RT-Prod-OCS-UKW.name
    address_prefix         = "0.0.0.0/0"
    next_hop_type          = "VirtualAppliance"
    next_hop_in_ip_address = var.firewall_private_ip_UKW
}

#Route table for UKW Production Serco Subnet

resource "azurerm_route_table" "RT-Prod-Serco-UKW" {
     name = "RT-Serco-UKW"
     location            = var.location_production
     resource_group_name = data.azurerm_resource_group.rg-production-networking.name
     provider            = azurerm.sub-production
}

resource "azurerm_subnet_route_table_association" "Assoc-RT-Prod-Serco-UKW" {
    subnet_id          = azurerm_subnet.Sn-Prod-Serco-UKW.id
    route_table_id     = azurerm_route_table.RT-Prod-Serco-UKW.id
    depends_on         = [azurerm_route_table.RT-Prod-Serco-UKW]   
}

resource "azurerm_route" "Internet-Prod-Serco-UKW" {
    name                   = "Route-Internet"
    resource_group_name    = data.azurerm_resource_group.rg-production-networking.name
    provider               = azurerm.sub-production
    route_table_name       = azurerm_route_table.RT-Prod-Serco-UKW.name
    address_prefix         = "0.0.0.0/0"
    next_hop_type          = "VirtualAppliance"
    next_hop_in_ip_address = var.firewall_private_ip_UKW
}

#Route table for UKW Production Sodexo Subnet

resource "azurerm_route_table" "RT-Prod-Sodexo-UKW" {
     name = "RT-Sodexo-UKW"
     location            = var.location_production
     resource_group_name = data.azurerm_resource_group.rg-production-networking.name
     provider            = azurerm.sub-production
}

resource "azurerm_subnet_route_table_association" "Assoc-RT-Prod-Sodexo-UKW" {
    subnet_id          = azurerm_subnet.Sn-Prod-Sodexo-UKW.id
    route_table_id     = azurerm_route_table.RT-Prod-Sodexo-UKW.id
    depends_on         = [azurerm_route_table.RT-Prod-Sodexo-UKW]   
}

resource "azurerm_route" "Internet-Prod-Sodexo-UKW" {
    name                   = "Route-Internet"
    resource_group_name    = data.azurerm_resource_group.rg-production-networking.name
    provider               = azurerm.sub-production
    route_table_name       = azurerm_route_table.RT-Prod-Sodexo-UKW.name
    address_prefix         = "0.0.0.0/0"
    next_hop_type          = "VirtualAppliance"
    next_hop_in_ip_address = var.firewall_private_ip_UKW
}

#Route table for UKW Production Stanley Subnet

resource "azurerm_route_table" "RT-Prod-Stanley-UKW" {
     name = "RT-Stanley-UKW"
     location            = var.location_production
     resource_group_name = data.azurerm_resource_group.rg-production-networking.name
     provider            = azurerm.sub-production
}

resource "azurerm_subnet_route_table_association" "Assoc-RT-Prod-Stanley-UKW" {
    subnet_id          = azurerm_subnet.Sn-Prod-Stanley-UKW.id
    route_table_id     = azurerm_route_table.RT-Prod-Stanley-UKW.id
    depends_on         = [azurerm_route_table.RT-Prod-Stanley-UKW]   
}

resource "azurerm_route" "Internet-Prod-Stanley-UKW" {
    name                   = "Route-Internet"
    resource_group_name    = data.azurerm_resource_group.rg-production-networking.name
    provider               = azurerm.sub-production
    route_table_name       = azurerm_route_table.RT-Prod-Stanley-UKW.name
    address_prefix         = "0.0.0.0/0"
    next_hop_type          = "VirtualAppliance"
    next_hop_in_ip_address = var.firewall_private_ip_UKW
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

#Route Table for UKS DevTest Cornwall Subnet

resource "azurerm_route_table" "RT-DevTest-Cornwall-UKS" {
    name = "RT-DevTest-Cornwall-UKS"
    location            = var.location_DevTest
    resource_group_name = data.azurerm_resource_group.rg-DevTest-networking.name
    provider            = azurerm.sub-DevTest
}

resource "azurerm_subnet_route_table_association" "Assoc-RT-DevTest-Cornwall-UKS" {
    subnet_id          = azurerm_subnet.Sn-DevTest-Cornwall-UKS.id
    route_table_id     = azurerm_route_table.RT-DevTest-Cornwall-UKS.id
    depends_on         = [azurerm_route_table.RT-DevTest-Cornwall-UKS]   
}

resource "azurerm_route" "Internet-DevTest-Cornwall-UKS" {
    name                   = "Route-Internet"
    resource_group_name    = data.azurerm_resource_group.rg-DevTest-networking.name
    provider               = azurerm.sub-DevTest
    route_table_name       = azurerm_route_table.RT-DevTest-Cornwall-UKS.name
    address_prefix         = "0.0.0.0/0"
    next_hop_type          = "VirtualAppliance"
    next_hop_in_ip_address = var.firewall_private_ip_uks
}

#Route Table for UKS DevTest Epsom St Hellier Subnet

resource "azurerm_route_table" "RT-DevTest-EpsomStHellier-UKS" {
     name = "RT-EpsomStHellier-UKS"
     location            = var.location_DevTest
     resource_group_name = data.azurerm_resource_group.rg-DevTest-networking.name
     provider            = azurerm.sub-DevTest
}

resource "azurerm_subnet_route_table_association" "Assoc-RT-DevTest-EpsomStHellier-UKS" {
    subnet_id          = azurerm_subnet.Sn-DevTest-EpsomStHellier-UKS.id
    route_table_id     = azurerm_route_table.RT-DevTest-EpsomStHellier-UKS.id
    depends_on         = [azurerm_route_table.RT-DevTest-EpsomStHellier-UKS]   
}

resource "azurerm_route" "Internet-DevTest-EpsomStHellier-UKS" {
    name                   = "Route-Internet"
    resource_group_name    = data.azurerm_resource_group.rg-DevTest-networking.name
    provider               = azurerm.sub-DevTest
    route_table_name       = azurerm_route_table.RT-DevTest-EpsomStHellier-UKS.name
    address_prefix         = "0.0.0.0/0"
    next_hop_type          = "VirtualAppliance"
    next_hop_in_ip_address = var.firewall_private_ip_uks
}

#NSG for UKS DevTest Mitie Subnet

resource "azurerm_route_table" "RT-DevTest-Mitie-UKS" {
     name = "RT-Mitie-UKS"
     location            = var.location_DevTest
     resource_group_name = data.azurerm_resource_group.rg-DevTest-networking.name
     provider            = azurerm.sub-DevTest
}

resource "azurerm_subnet_route_table_association" "Assoc-RT-DevTest-Mitie-UKS" {
    subnet_id          = azurerm_subnet.Sn-DevTest-Mitie-UKS.id
    route_table_id     = azurerm_route_table.RT-DevTest-Mitie-UKS.id
    depends_on         = [azurerm_route_table.RT-DevTest-Mitie-UKS]   
}

resource "azurerm_route" "Internet-DevTest-Mitie-UKS" {
    name                   = "Route-Internet"
    resource_group_name    = data.azurerm_resource_group.rg-DevTest-networking.name
    provider               = azurerm.sub-DevTest
    route_table_name       = azurerm_route_table.RT-DevTest-Mitie-UKS.name
    address_prefix         = "0.0.0.0/0"
    next_hop_type          = "VirtualAppliance"
    next_hop_in_ip_address = var.firewall_private_ip_uks
}

#Route table for UKS DevTest OCS Subnet

resource "azurerm_route_table" "RT-DevTest-OCS-UKS" {
     name = "RT-OCS-UKS"
     location            = var.location_DevTest
     resource_group_name = data.azurerm_resource_group.rg-DevTest-networking.name
     provider            = azurerm.sub-DevTest
}

resource "azurerm_subnet_route_table_association" "Assoc-RT-DevTest-OCS-UKS" {
    subnet_id          = azurerm_subnet.Sn-DevTest-OCS-UKS.id
    route_table_id     = azurerm_route_table.RT-DevTest-OCS-UKS.id
    depends_on         = [azurerm_route_table.RT-DevTest-OCS-UKS]   
}

resource "azurerm_route" "Internet-DevTest-OCS-UKS" {
    name                   = "Route-Internet"
    resource_group_name    = data.azurerm_resource_group.rg-DevTest-networking.name
    provider               = azurerm.sub-DevTest
    route_table_name       = azurerm_route_table.RT-DevTest-OCS-UKS.name
    address_prefix         = "0.0.0.0/0"
    next_hop_type          = "VirtualAppliance"
    next_hop_in_ip_address = var.firewall_private_ip_uks
}

#Route table for UKS DevTest Serco Subnet

resource "azurerm_route_table" "RT-DevTest-Serco-UKS" {
     name = "RT-Serco-UKS"
     location            = var.location_DevTest
     resource_group_name = data.azurerm_resource_group.rg-DevTest-networking.name
     provider            = azurerm.sub-DevTest
}

resource "azurerm_subnet_route_table_association" "Assoc-RT-DevTest-Serco-UKS" {
    subnet_id          = azurerm_subnet.Sn-DevTest-Serco-UKS.id
    route_table_id     = azurerm_route_table.RT-DevTest-Serco-UKS.id
    depends_on         = [azurerm_route_table.RT-DevTest-Serco-UKS]   
}

resource "azurerm_route" "Internet-DevTest-Serco-UKS" {
    name                   = "Route-Internet"
    resource_group_name    = data.azurerm_resource_group.rg-DevTest-networking.name
    provider               = azurerm.sub-DevTest
    route_table_name       = azurerm_route_table.RT-DevTest-Serco-UKS.name
    address_prefix         = "0.0.0.0/0"
    next_hop_type          = "VirtualAppliance"
    next_hop_in_ip_address = var.firewall_private_ip_uks
}

#Route table for UKS DevTest Sodexo Subnet

resource "azurerm_route_table" "RT-DevTest-Sodexo-UKS" {
     name = "RT-Sodexo-UKS"
     location            = var.location_DevTest
     resource_group_name = data.azurerm_resource_group.rg-DevTest-networking.name
     provider            = azurerm.sub-DevTest
}

resource "azurerm_subnet_route_table_association" "Assoc-RT-DevTest-Sodexo-UKS" {
    subnet_id          = azurerm_subnet.Sn-DevTest-Sodexo-UKS.id
    route_table_id     = azurerm_route_table.RT-DevTest-Sodexo-UKS.id
    depends_on         = [azurerm_route_table.RT-DevTest-Sodexo-UKS]   
}

resource "azurerm_route" "Internet-DevTest-Sodexo-UKS" {
    name                   = "Route-Internet"
    resource_group_name    = data.azurerm_resource_group.rg-DevTest-networking.name
    provider               = azurerm.sub-DevTest
    route_table_name       = azurerm_route_table.RT-DevTest-Sodexo-UKS.name
    address_prefix         = "0.0.0.0/0"
    next_hop_type          = "VirtualAppliance"
    next_hop_in_ip_address = var.firewall_private_ip_uks
}

#Route table for UKS DevTest Stanley Subnet

resource "azurerm_route_table" "RT-DevTest-Stanley-UKS" {
     name = "RT-Stanley-UKS"
     location            = var.location_DevTest
     resource_group_name = data.azurerm_resource_group.rg-DevTest-networking.name
     provider            = azurerm.sub-DevTest
}

resource "azurerm_subnet_route_table_association" "Assoc-RT-DevTest-Stanley-UKS" {
    subnet_id          = azurerm_subnet.Sn-DevTest-Stanley-UKS.id
    route_table_id     = azurerm_route_table.RT-DevTest-Stanley-UKS.id
    depends_on         = [azurerm_route_table.RT-DevTest-Stanley-UKS]   
}

resource "azurerm_route" "Internet-DevTest-Stanley-UKS" {
    name                   = "Route-Internet"
    resource_group_name    = data.azurerm_resource_group.rg-DevTest-networking.name
    provider               = azurerm.sub-DevTest
    route_table_name       = azurerm_route_table.RT-DevTest-Stanley-UKS.name
    address_prefix         = "0.0.0.0/0"
    next_hop_type          = "VirtualAppliance"
    next_hop_in_ip_address = var.firewall_private_ip_uks
}

#Route Table for UKW DevTest Cornwall Subnet

resource "azurerm_route_table" "RT-DevTest-Cornwall-UKW" {
    name = "RT-DevTest-Cornwall-UKW"
    location            = var.location_DevTest
    resource_group_name = data.azurerm_resource_group.rg-DevTest-networking.name
    provider            = azurerm.sub-DevTest
}

resource "azurerm_subnet_route_table_association" "Assoc-RT-DevTest-Cornwall-UKW" {
    subnet_id          = azurerm_subnet.Sn-DevTest-Cornwall-UKW.id
    route_table_id     = azurerm_route_table.RT-DevTest-Cornwall-UKW.id
    depends_on         = [azurerm_route_table.RT-DevTest-Cornwall-UKW]   
}

resource "azurerm_route" "Internet-DevTest-Cornwall-UKW" {
    name                   = "Route-Internet"
    resource_group_name    = data.azurerm_resource_group.rg-DevTest-networking.name
    provider               = azurerm.sub-DevTest
    route_table_name       = azurerm_route_table.RT-DevTest-Cornwall-UKW.name
    address_prefix         = "0.0.0.0/0"
    next_hop_type          = "VirtualAppliance"
    next_hop_in_ip_address = var.firewall_private_ip_UKW
}

#Route Table for UKW DevTest Epsom St Hellier Subnet

resource "azurerm_route_table" "RT-DevTest-EpsomStHellier-UKW" {
     name = "RT-EpsomStHellier-UKW"
     location            = var.location_DevTest
     resource_group_name = data.azurerm_resource_group.rg-DevTest-networking.name
     provider            = azurerm.sub-DevTest
}

resource "azurerm_subnet_route_table_association" "Assoc-RT-DevTest-EpsomStHellier-UKW" {
    subnet_id          = azurerm_subnet.Sn-DevTest-EpsomStHellier-UKW.id
    route_table_id     = azurerm_route_table.RT-DevTest-EpsomStHellier-UKW.id
    depends_on         = [azurerm_route_table.RT-DevTest-EpsomStHellier-UKW]   
}

resource "azurerm_route" "Internet-DevTest-EpsomStHellier-UKW" {
    name                   = "Route-Internet"
    resource_group_name    = data.azurerm_resource_group.rg-DevTest-networking.name
    provider               = azurerm.sub-DevTest
    route_table_name       = azurerm_route_table.RT-DevTest-EpsomStHellier-UKW.name
    address_prefix         = "0.0.0.0/0"
    next_hop_type          = "VirtualAppliance"
    next_hop_in_ip_address = var.firewall_private_ip_UKW
}

#NSG for UKW DevTest Mitie Subnet

resource "azurerm_route_table" "RT-DevTest-Mitie-UKW" {
     name = "RT-Mitie-UKW"
     location            = var.location_DevTest
     resource_group_name = data.azurerm_resource_group.rg-DevTest-networking.name
     provider            = azurerm.sub-DevTest
}

resource "azurerm_subnet_route_table_association" "Assoc-RT-DevTest-Mitie-UKW" {
    subnet_id          = azurerm_subnet.Sn-DevTest-Mitie-UKW.id
    route_table_id     = azurerm_route_table.RT-DevTest-Mitie-UKW.id
    depends_on         = [azurerm_route_table.RT-DevTest-Mitie-UKW]   
}

resource "azurerm_route" "Internet-DevTest-Mitie-UKW" {
    name                   = "Route-Internet"
    resource_group_name    = data.azurerm_resource_group.rg-DevTest-networking.name
    provider               = azurerm.sub-DevTest
    route_table_name       = azurerm_route_table.RT-DevTest-Mitie-UKW.name
    address_prefix         = "0.0.0.0/0"
    next_hop_type          = "VirtualAppliance"
    next_hop_in_ip_address = var.firewall_private_ip_UKW
}

#Route table for UKW DevTest OCS Subnet

resource "azurerm_route_table" "RT-DevTest-OCS-UKW" {
     name = "RT-OCS-UKW"
     location            = var.location_DevTest
     resource_group_name = data.azurerm_resource_group.rg-DevTest-networking.name
     provider            = azurerm.sub-DevTest
}

resource "azurerm_subnet_route_table_association" "Assoc-RT-DevTest-OCS-UKW" {
    subnet_id          = azurerm_subnet.Sn-DevTest-OCS-UKW.id
    route_table_id     = azurerm_route_table.RT-DevTest-OCS-UKW.id
    depends_on         = [azurerm_route_table.RT-DevTest-OCS-UKW]   
}

resource "azurerm_route" "Internet-DevTest-OCS-UKW" {
    name                   = "Route-Internet"
    resource_group_name    = data.azurerm_resource_group.rg-DevTest-networking.name
    provider               = azurerm.sub-DevTest
    route_table_name       = azurerm_route_table.RT-DevTest-OCS-UKW.name
    address_prefix         = "0.0.0.0/0"
    next_hop_type          = "VirtualAppliance"
    next_hop_in_ip_address = var.firewall_private_ip_UKW
}

#Route table for UKW DevTest Serco Subnet

resource "azurerm_route_table" "RT-DevTest-Serco-UKW" {
     name = "RT-Serco-UKW"
     location            = var.location_DevTest
     resource_group_name = data.azurerm_resource_group.rg-DevTest-networking.name
     provider            = azurerm.sub-DevTest
}

resource "azurerm_subnet_route_table_association" "Assoc-RT-DevTest-Serco-UKW" {
    subnet_id          = azurerm_subnet.Sn-DevTest-Serco-UKW.id
    route_table_id     = azurerm_route_table.RT-DevTest-Serco-UKW.id
    depends_on         = [azurerm_route_table.RT-DevTest-Serco-UKW]   
}

resource "azurerm_route" "Internet-DevTest-Serco-UKW" {
    name                   = "Route-Internet"
    resource_group_name    = data.azurerm_resource_group.rg-DevTest-networking.name
    provider               = azurerm.sub-DevTest
    route_table_name       = azurerm_route_table.RT-DevTest-Serco-UKW.name
    address_prefix         = "0.0.0.0/0"
    next_hop_type          = "VirtualAppliance"
    next_hop_in_ip_address = var.firewall_private_ip_UKW
}

#Route table for UKW DevTest Sodexo Subnet

resource "azurerm_route_table" "RT-DevTest-Sodexo-UKW" {
     name = "RT-Sodexo-UKW"
     location            = var.location_DevTest
     resource_group_name = data.azurerm_resource_group.rg-DevTest-networking.name
     provider            = azurerm.sub-DevTest
}

resource "azurerm_subnet_route_table_association" "Assoc-RT-DevTest-Sodexo-UKW" {
    subnet_id          = azurerm_subnet.Sn-DevTest-Sodexo-UKW.id
    route_table_id     = azurerm_route_table.RT-DevTest-Sodexo-UKW.id
    depends_on         = [azurerm_route_table.RT-DevTest-Sodexo-UKW]   
}

resource "azurerm_route" "Internet-DevTest-Sodexo-UKW" {
    name                   = "Route-Internet"
    resource_group_name    = data.azurerm_resource_group.rg-DevTest-networking.name
    provider               = azurerm.sub-DevTest
    route_table_name       = azurerm_route_table.RT-DevTest-Sodexo-UKW.name
    address_prefix         = "0.0.0.0/0"
    next_hop_type          = "VirtualAppliance"
    next_hop_in_ip_address = var.firewall_private_ip_UKW
}

#Route table for UKW DevTest Stanley Subnet

resource "azurerm_route_table" "RT-DevTest-Stanley-UKW" {
     name = "RT-Stanley-UKW"
     location            = var.location_DevTest
     resource_group_name = data.azurerm_resource_group.rg-DevTest-networking.name
     provider            = azurerm.sub-DevTest
}

resource "azurerm_subnet_route_table_association" "Assoc-RT-DevTest-Stanley-UKW" {
    subnet_id          = azurerm_subnet.Sn-DevTest-Stanley-UKW.id
    route_table_id     = azurerm_route_table.RT-DevTest-Stanley-UKW.id
    depends_on         = [azurerm_route_table.RT-DevTest-Stanley-UKW]   
}

resource "azurerm_route" "Internet-DevTest-Stanley-UKW" {
    name                   = "Route-Internet"
    resource_group_name    = data.azurerm_resource_group.rg-DevTest-networking.name
    provider               = azurerm.sub-DevTest
    route_table_name       = azurerm_route_table.RT-DevTest-Stanley-UKW.name
    address_prefix         = "0.0.0.0/0"
    next_hop_type          = "VirtualAppliance"
    next_hop_in_ip_address = var.firewall_private_ip_UKW
}



