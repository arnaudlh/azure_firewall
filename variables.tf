variable "az_fw_name" {
  description = "(Required) Name of the Azure Firewall to be created"  
}

variable "location" {
  description = "(Required) Location of the Azure Firewall to be created"  
}

variable "tags" {
  description = "(Required) Tags of the Azure Firewall to be created"  
}

variable "az_fw_rg" {
  description = "(Required) Resource Group of the Azure Firewall to be created"  
}

variable "diagnostics_map" {
  description = "(Required) Storage Account and Event Hub data for the AzFW diagnostics"    
}

variable "log_analytics_workspace_id" {
  description = "(Required) ID of Log Analytics data for the AzFW diagnostics"
}

variable "subnet_id" {
  description = "(Required) ID for the subnet where to deploy the Azure Firewall " 
}

variable "public_ip_id" {
  description = "(Required) Public IP address identifier. IP address must be of type static and standard."
}

variable "diagnostics_settings" {
 description = "(Required) Map with the diagnostics settings for AzFW deployment"
}
