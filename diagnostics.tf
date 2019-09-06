#Creates the diagnostics settings for the azure firewall
resource "azurerm_monitor_diagnostic_setting" "az_firewall_diags" {

name                             = "${azurerm_firewall.az_firewall.name}-diag"
target_resource_id               = "${azurerm_firewall.az_firewall.id}"
eventhub_name                    = "${var.diagnostics_map.eh_name}"
eventhub_authorization_rule_id   = "${var.diagnostics_map.eh_id}/authorizationrules/RootManageSharedAccessKey"
log_analytics_workspace_id       = "${var.log_analytics_workspace.id}"
storage_account_id               = "${var.diagnostics_map.diags_sa}"
log {

        category =  "AzureFirewallApplicationRule"
        retention_policy {
            days   = var.opslogs_retention_period
            enabled = true
        }
        }
log {

        category =  "AzureFirewallNetworkRule"
        retention_policy {
            days   = var.opslogs_retention_period
            enabled = true
        }
        }
metric {
        category = "AllMetrics"

        retention_policy {
            days    = var.opslogs_retention_period
            enabled = true
                }
    }
}  