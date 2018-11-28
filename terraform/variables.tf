variable "environment" {
  default = "Promethues Workshop"
}

variable "azure_location" {
  default = "westeurope"
}

variable "resource_group_name" {
  default = "prometheus-ws"
}

variable "vnet_cidr" {
  default = "10.1.0.0/16"
}

variable "subnet_cidr" {
  default = "10.1.1.0/24"
}

variable "ssh_public_key" {
  default = "ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAACAQDahbCPW7WHc1bDOBsBwDuuZFhlFnM3HUl3KnTAvpoZPFxpaa0ClXFLKWtv1a3fBNEkyhdsCIMoT06ctA2rgw9TGOMwtqi01MQyuji/YJbyFf/LiQPI9m3TEy5i7A8P6RjTdGJmSWoAoctLZxUFd+LwHZbkBgCyQaqLktGXg80Z4XlxPuhUrztqXx4ShiH4UGoJIRc93d32NqoAh8ilNwwwXbHDp/u0HCsEwYvi3PEos/9DDuKhsokHtbP2Z9y6jvkiAuF53F2c5ccpSHbCY0z/nZqpjInionPlREvHf9C0pYeR+cwVDflnNLkcTi3NLo2drIeNEK/pkGXfNbFx/VwRqoOGjKgj7X51tuETs+r2+9psLrzjfsRqI/GqmDGy1upuz0tTo3N487nQ5sfhVrIEXEZHC+5IPlLLp9/9M241sAD98jmHNVPqg8p8IoNjAKhFjK/2d5y5k5goAHT8bgBMiBXOaB/v30MDzBp9DsY7Dp0qBNrTRbVFN1fqw/UF0UYCN3oV5YOzfNttxJp6/bQwo5p9OuVnHqzqeTrOsEZTaiMd02fk0DbJmxScO/yoHZkN+Kev5B8ILZqJaM4V1+lm4a20qnr2Tguk0mn9f+qXkKSucH2vlORtyrE7h0Gp6Uc+0qCXA/vlBT2DPkCj6SodF7jrtMKcTjWJaStpkvfm0w== prometheus-workshop@evry.com"
}
