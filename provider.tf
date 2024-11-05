provider "azurerm" {
  features {}
  subscription_id = "0130cc29-4f44-42e4-88dc-2d28019cd904"
}
terraform {
  required_version = ">= 1.2"

  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = ">= 3.0"
    }
  }
}