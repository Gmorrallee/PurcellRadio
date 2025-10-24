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

resource "azurerm_route" "Internet" {
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

resource "azurerm_route" "Internet-UKW" {
    name                   = "Route-Internet-UKW"
    resource_group_name    = data.azurerm_resource_group.rg-identity-networking.name
    provider               = azurerm.sub-identity
    route_table_name       = azurerm_route_table.RT-Idy-DirServices-UKW.name
    address_prefix         = "0.0.0.0/0"
    next_hop_type          = "VirtualAppliance"
    next_hop_in_ip_address = var.firewall_private_ip_ukw
}

