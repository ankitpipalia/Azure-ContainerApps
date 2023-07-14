output "ip_address" {
  value = azurerm_container_group.container-grp.ip_address
}

output "fqdn" {
  value = azurerm_container_group.container-grp.fqdn
}