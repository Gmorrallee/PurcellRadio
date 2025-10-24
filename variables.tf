variable "subscription_identity" {
  description = "Identity subscription ID"
  type        = string
  default = "0ca1a536-3615-49f3-bd03-8f89ff55ceb8"
}

variable "subscription_connectivity" {
  description = "Connectivity ID"
  type        = string
  default = "4ae90be1-71ac-4478-83e0-6d66ef0ea79e"
}

variable "subscription_security" {
  description = "Security Subcription ID"
  type        = string
  default = "4bd8b6d0-e327-42c0-9d1b-9e7f61ed27f6"
}

variable "subscription_production" {
  description = "Production subscription ID"
  type        = string
  default = "3635cc97-a2d6-4bc1-9ea6-00fcddc10aa6"
}

variable "subscription_devtest" {
  description = "Dev / Test subscription ID"
  type        = string
  default = "43d74b2b-f6c0-4c6b-9e12-1095e6955562"
}

variable "Vnet_location_identity" {
  description = "Location for all resources."
  type        = string
  default     = "uksouth"
}

variable "location_production" {
  description = "Location for all Production resources."
  type        = string
  default     = "uksouth"
}

variable "location_devtest" {
  description = "Location for all DevTest resources."
  type        = string
  default     = "uksouth"
}


variable "Vnet_location_identity_dr" {
  description = "Location for all DR Identity resources."
  type        = string
  default     = "ukwest"
}

variable "location_dr" {
  description = "Location for all DR Identity resources."
  type        = string
  default     = "ukwest"
}

variable "firewall_private_ip_uks" {
  description = "Private IP address of the Azure Firewall in UKS"
  type        = string
  default     = "10.202.252.4"
}

variable "firewall_private_ip_ukw" {
  description = "Private IP address of the Azure Firewall in UKW"
  type        = string
  default     = "10.203.252.4"
}
