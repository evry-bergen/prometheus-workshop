variable "environment" {
  default = "Promethues Workshop"
}

variable "azure_location" {
  default = "euwest"
}

variable "resource_group_name" {
  default = "promethues-workshop"
}

variable "vnet_cidr" {
  default = "10.1.0.0/16"
}

variable "subnet_cidr" {
  default = "10.1.1.0/24"
}
