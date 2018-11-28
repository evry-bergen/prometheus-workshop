output "public_ip" {
  value = "${azurerm_public_ip.vm.ip_address}"
}

output "private_ip" {
  value = "${azurerm_network_interface.vm.private_ip_address}"
}

output "ssh_user" {
  value = "${var.user}"
}
