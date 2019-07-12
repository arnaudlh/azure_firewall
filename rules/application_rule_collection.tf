# resource "azurerm_firewall_application_rule_collection" "test" {
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

#     target_fqdns = [
#       "*.google.com",
#     ]

#     protocol {
#       port = "443"
#       type = "Https"
#     }
#   }
# }