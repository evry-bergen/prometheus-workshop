# Create a resource group if it doesn't exist
resource "azurerm_resource_group" "corp" {
  name     = "${var.resource_group_name}"
  location = "${var.azure_location}"

  tags {
    environment = "${var.environment}"
  }
}

# Create virtual network
resource "azurerm_virtual_network" "corp-vnet" {
  name                = "${azurerm_resource_group.corp.name}-vnet"
  address_space       = ["${var.subnet_cidr}"]
  location            = "${azurerm_resource_group.corp.location}"
  resource_group_name = "${azurerm_resource_group.corp.name}"

  tags {
    environment = "${var.environment}"
  }
}

# Create subnet
resource "azurerm_subnet" "corp-subnet" {
  name                 = "${azurerm_resource_group.corp.name}-subnet"
  resource_group_name  = "${azurerm_resource_group.corp.name}"
  virtual_network_name = "${azurerm_virtual_network.corp-vnet.name}"
  address_prefix       = "${var.subnet_cidr}"
}

module "vm-01" {
  source      = "./modules/machine"
  name        = "vm-01"
  group_name  = "${azurerm_resource_group.name}"
  vnet_name   = "${azurerm_virtual_network.name}"
  subnet_name = "${azurerm_subnet.name}"
  public_key  = "${var.ssh_public_key}"
}

module "vm-02" {
  source      = "./modules/machine"
  name        = "vm-02"
  group_name  = "${azurerm_resource_group.name}"
  vnet_name   = "${azurerm_virtual_network.name}"
  subnet_name = "${azurerm_subnet.name}"
  public_key  = "${var.ssh_public_key}"
}

module "vm-03" {
  source      = "./modules/machine"
  name        = "vm-03"
  group_name  = "${azurerm_resource_group.name}"
  vnet_name   = "${azurerm_virtual_network.name}"
  subnet_name = "${azurerm_subnet.name}"
  public_key  = "${var.ssh_public_key}"
}
