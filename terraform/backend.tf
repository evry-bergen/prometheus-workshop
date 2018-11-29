terraform {
  backend "azurerm" {
    storage_account_name = "promwsterraformstate"
    container_name       = "terraform-state"
    key                  = "terraform.tfstate"
  }
}
