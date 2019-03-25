terraform {
  backend "azurerm" {
    storage_account_name = "prometheusws"
    container_name       = "terraform-state"
    key                  = "terraform.tfstate"
  }
}
