# Deploys Azure Firewall
Creates an Azure Firewall in a given region


Reference the module to a specific version (recommended):
```
module "az_firewall" {
    source                  = "git://github.com/aztfmod/az_firewall.git?ref=v0.1"
  
    az_fw_name                        = var.az_fw_name
    az_fw_rg                          = var.virtual_network_rg
    subnet_id                         = var.subnetid
    public_ip_id                      = var.pip.id
    location                          = var.location["region1"]
    tags                              = var.tags
    diagnostics_map                   = var.diagnostics_map
    log_analytics_workspace           = var.log_analytics_workspace
}
```

Or get the latest version
```
module "az_firewall" {
    source                  = "git://github.com/aztfmod/az_firewall.git?ref=latest"
  
    az_fw_name                        = var.az_fw_name
    az_fw_rg                          = var.virtual_network_rg
    subnet_id                         = var.subnetid
    public_ip_id                      = var.pip.id
    location                          = var.location["region1"]
    tags                              = var.tags
    diagnostics_map                   = var.diagnostics_map
    log_analytics_workspace           = var.log_analytics_workspace
}
```

# Parameters
## az_fw_name
(Required) Name of the Azure Firewall to be created
```
variable "az_fw_name" {
  description = "(Required) Name of the Azure Firewall to be created"  
}

```
Example
```
az_fw_name = "arnaud-firewall"
```

## az_fw_rg
(Required) Resource Group of the Azure Firewall to be created.
```
variable "az_fw_rg" {
  description = "(Required) Resource Group of the Azure Firewall to be created"  
}

```
Example
```
resource_group_name = "operations-rg"
```

## subnet_id
(Required) ID for the subnet where to deploy the Azure Firewall
```
variable "subnet_id" {
  description = "(Required) ID for the subnet where to deploy the Azure Firewall " 
}

```
Example
```
subnet_id = "/subscriptions/00000000-0000-0000-aa36-000000000000/resourceGroups/ftau-HUB-CORE-NET/providers/Microsoft.Network/virtualNetworks/ftau-Shared-Services/subnets/AzureFirewallSubnet"
```


## public_ip_id
(Required) ID for the subnet where to deploy the Azure Firewall
```
variable "public_ip_id" {
  description = "(Required) Public IP address identifier. IP address must be of type static and standard."
}
```
Example
```
public_ip_id = "/subscriptions/00000000-0000-0000-aa36-000000000000/resourceGroups/ftau-HUB-EDGE-NETS/providers/Microsoft.Network/publicIPAddresses/az_fw_pip"
```

## location
(Required) Define the region where the Azure Firewall will be created.
```

variable "location" {
  description = "(Required) Define the region where the Azure Firewall vault will be created"
  type        = string
}
```
Example
```
    location    = "southeastasia"
```

## tags
(Required) Map of tags for the deployment
```
variable "tags" {
  description = "(Required) map of tags for the deployment"
}
```
Example
```
tags = {
    environment     = "DEV"
    owner           = "Arnaud"
    deploymentType  = "Terraform"
  }
```

## opslogs_retention_period
(Optional) Number of days to keep operations logs inside storage account
```
variable "opslogs_retention_period" {
  description = "(Optional) Number of days to keep operations logs inside storage account"
  default = 60
}
```
Example
```
opslogs_retention_period = 180
```

## diagnostics_map
(Required) Map with the diagnostics repository information"
```
variable "diagnostics_map" {
 description = "(Required) Map with the diagnostics repository information"
}
```
Example
```
  diagnostics_map = {
      diags_sa      = "/subscriptions/00000000-0000-0000-0000-000000000000/resourceGroups/arnaud-hub-operations/providers/Microsoft.Storage/storageAccounts/opslogskumowxv"
      eh_id         = "/subscriptions/00000000-0000-0000-0000-000000000000/resourceGroups/arnaud-hub-operations/providers/Microsoft.EventHub/namespaces/opslogskumowxv"
      eh_name       = "opslogskumowxv"
  }
```
## log_analytics_workspace
(Required) Log Analytics Workspace details
```
variable "log_analytics_workspace" {
  description = "(Required) Log Analytics data for the AzFW diagnostics"
}
```
Example
```
  log_analytics_workspace = {
        id = "/subscriptions/783438ca-d497-4350-aa36-dc55fb0983ab/resourcegroups/ftau-hub-operations/providers/microsoft.operationalinsights/workspaces/ftaulevel1"
        name = "ftaulevel1"
  }
```


# Output
## az_firewall_config
Returns the Azure Firewall object with following attributes:

output "az_firewall_config" {
  value = {
      az_fw_name        = azurerm_firewall.az_firewall.name
      az_fw_id          = azurerm_firewall.az_firewall.id
      az_ipconfig       = azurerm_firewall.az_firewall.ip_configuration
      az_object         = azurerm_firewall.az_firewall
  }
}
