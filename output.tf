output "az_firewall_config" {
  //exports ID, pip, config settings, rules? 
  value = {
      az_fw_name        = azurerm_firewall.az_firewall.name
      az_fw_id          = azurerm_firewall.az_firewall.id
      az_ipconfig       = azurerm_firewall.az_firewall.ip_configuration
      az_object         = azurerm_firewall.az_firewall
  }
}
