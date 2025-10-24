
resource "azurerm_management_group" "mg_Purcell" {
  name         = "mg-Purcell"
  display_name = "Purcell Management Group"
  # parent_management_group_id can be omitted for top-level MG
}

resource "azurerm_management_group" "mg_platform" {
  name                     = "mg-Platform"
  display_name             = "Platform"
  parent_management_group_id = azurerm_management_group.mg_Purcell.id
  
}

resource "azurerm_management_group" "mg_landingzones" {
  name                     = "mg-LandingZones"
  display_name             = "Landing Zones"
  parent_management_group_id = azurerm_management_group.mg_Purcell.id
  
}

resource "azurerm_management_group" "mg_online" {
  name                     = "mg-Online"
  display_name             = "Online"
  parent_management_group_id = azurerm_management_group.mg_landingzones.id
}

resource "azurerm_management_group_subscription_association" "identity_subscription" {
  management_group_id = azurerm_management_group.mg_platform.id
  subscription_id     = "/subscriptions/${var.subscription_identity}"
  
}

resource "azurerm_management_group_subscription_association" "connectivity_subscription" {
  management_group_id = azurerm_management_group.mg_platform.id
  subscription_id     = "/subscriptions/${var.subscription_connectivity}"
}

resource "azurerm_management_group_subscription_association" "security_subscription" {
  management_group_id = azurerm_management_group.mg_platform.id
  subscription_id     = "/subscriptions/${var.subscription_security}"
}

resource "azurerm_management_group_subscription_association" "production_subscription" {
  management_group_id = azurerm_management_group.mg_online.id
  subscription_id     = "/subscriptions/${var.subscription_production}"
}

resource "azurerm_management_group_subscription_association" "devtest_subscription" {
  management_group_id = azurerm_management_group.mg_online.id
  subscription_id     = "/subscriptions/${var.subscription_devtest}"
}