data "azurerm_resource_group" "group" {
  name = "${var.group_name}"
}

data "azurerm_subnet" "subnet" {
  name                 = "${var.subnet_name}"
  virtual_network_name = "${var.vnet_name}"
  resource_group_name  = "${var.group_name}"
}

# Create public IPs
resource "azurerm_public_ip" "vm" {
  name                         = "${var.name}-public-ip"
  location                     = "${data.azurerm_resource_group.group.location}"
  resource_group_name          = "${data.azurerm_resource_group.group.name}"
  allocation_method            = "Dynamic"

  tags {
    environment = "${var.environment}"
  }
}

# Create Network Security Group and rule
resource "azurerm_network_security_group" "vm" {
  name                = "${var.name}-nsg"
  location            = "${data.azurerm_resource_group.group.location}"
  resource_group_name = "${data.azurerm_resource_group.group.name}"

  security_rule {
    name                       = "SSH"
    priority                   = 1001
    direction                  = "Inbound"
    access                     = "Allow"
    protocol                   = "Tcp"
    source_port_range          = "*"
    destination_port_range     = "22"
    source_address_prefix      = "*"
    destination_address_prefix = "*"
  }

  security_rule {
    name                       = "Prometheus"
    priority                   = 1002
    direction                  = "Inbound"
    access                     = "Allow"
    protocol                   = "Tcp"
    source_port_range          = "*"
    destination_port_range     = "9090"
    source_address_prefix      = "*"
    destination_address_prefix = "*"
  }

  security_rule {
    name                       = "node_exporter"
    priority                   = 1003
    direction                  = "Inbound"
    access                     = "Allow"
    protocol                   = "Tcp"
    source_port_range          = "*"
    destination_port_range     = "9100"
    source_address_prefix      = "*"
    destination_address_prefix = "*"
  }

  tags {
    environment = "${var.environment}"
  }
}

# Create network interface
resource "azurerm_network_interface" "vm" {
  name                      = "${var.name}-nic"
  location                  = "${data.azurerm_resource_group.group.location}"
  resource_group_name       = "${data.azurerm_resource_group.group.name}"
  network_security_group_id = "${azurerm_network_security_group.vm.id}"

  ip_configuration {
    name                          = "${var.name}-nic-config"
    subnet_id                     = "${data.azurerm_subnet.subnet.id}"
    private_ip_address_allocation = "dynamic"
    public_ip_address_id          = "${azurerm_public_ip.vm.id}"
  }

  tags {
    environment = "${var.environment}"
  }
}

# Generate random text for a unique storage account name
resource "random_id" "random-id" {
  keepers = {
    # Generate a new ID only when a new resource group is defined
    resource_group = "${data.azurerm_resource_group.group.name}"
  }

  byte_length = 8
}

# Create storage account for boot diagnostics
resource "azurerm_storage_account" "vm" {
  name                     = "${replace("${var.name}-sa-${random_id.random-id.hex}", "-", "")}"
  resource_group_name      = "${data.azurerm_resource_group.group.name}"
  location                 = "${data.azurerm_resource_group.group.location}"
  account_tier             = "${var.storage_accout_tier}"
  account_replication_type = "${var.storage_accout_replication_type}"

  tags {
    environment = "${var.environment}"
  }
}

# Create virtual machine
resource "azurerm_virtual_machine" "vm" {
  name                  = "${var.name}"
  location              = "${data.azurerm_resource_group.group.location}"
  resource_group_name   = "${data.azurerm_resource_group.group.name}"
  network_interface_ids = ["${azurerm_network_interface.vm.id}"]
  vm_size               = "${var.vm_size}"

  storage_os_disk {
    name              = "${var.name}-os-disk"
    caching           = "ReadWrite"
    create_option     = "FromImage"
    managed_disk_type = "Premium_LRS"
  }

  storage_image_reference {
    publisher = "${var.image_publisher}"
    offer     = "${var.image_offer}"
    sku       = "${var.image_sku}"
    version   = "${var.image_version}"
  }

  os_profile {
    computer_name  = "${var.name}"
    admin_username = "${var.user}"
  }

  os_profile_linux_config {
    disable_password_authentication = true

    ssh_keys {
      path     = "/home/${var.user}/.ssh/authorized_keys"
      key_data = "${var.public_key}"
    }
  }

  #boot_diagnostics {
  #  enabled     = "true"
  #  storage_uri = "${azurerm_storage_account.vm.primary_blob_endpoint}"
  #}

  tags {
    environment = "${var.environment}"
  }
}
