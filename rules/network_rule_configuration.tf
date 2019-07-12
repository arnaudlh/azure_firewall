# resource "azurerm_firewall_network_rule_collection" "test" {
#   name                = "testcollection"
#   azure_firewall_name = "${azurerm_firewall.test.name}"
#   resource_group_name = "${azurerm_resource_group.test.name}"
#   priority            = 100
#   action              = "Allow"

#   rule {
#     name = "testrule"

#     source_addresses = [
#       "10.0.0.0/16",
#     ]

#     destination_ports = [
#       "53",
#     ]

#     destination_addresses = [
#       "8.8.8.8",
#       "8.8.4.4",
#     ]

#     protocols = [
#       "TCP",
#       "UDP",
#     ]
#   }
# }