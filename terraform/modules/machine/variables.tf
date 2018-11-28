variable "environment" {
  description = "Environment name"
}

variable "name" {
  description = "Name of virtual machine"
}

variable "group_name" {
  description = "Name of resource group"
}

variable "vnet_name" {
  description = "Name of virtual network"
}

variable "subnet_name" {
  description = "Name of subnet"
}

variable "user" {
  description = "SSH user name"
  default     = "azureuser"
}

variable "public_key" {
  description = "SSH public key"
}

variable "storage_accout_tier" {
  default = "Standard"
}

variable "storage_accout_replication_type" {
  default = "LRS"
}

variable "vm_size" {
  default = "Standard_DS1_v2"
}

variable "image_publisher" {
  default = "Canonical"
}

variable "image_offer" {
  default = "UbuntuServer"
}

variable "image_sku" {
  default = "16.04.0-LTS"
}

variable "image_version" {
  default = "latest"
}
