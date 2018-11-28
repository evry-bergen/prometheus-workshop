output "ansible-inventory" {
  value = <<INVENTORY
vm-01 ansible_user=${module.vm-01.ssh_user} ansible_host=${module.vm-01.public_ip}
vm-02 ansible_user=${module.vm-02.ssh_user} ansible_host=${module.vm-02.public_ip}
vm-03 ansible_user=${module.vm-03.ssh_user} ansible_host=${module.vm-03.public_ip}

[controller]
vm-01

[controlees]
vm-02
vm-03

[webservers]
vm-02

[dbservers]
vm-03
INVENTORY
}
