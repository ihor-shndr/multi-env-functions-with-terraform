terraform {
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "~>3.0"
    }
    random = {
      source  = "hashicorp/random"
      version = ">3.5.0"
    }
  }
  backend "azurerm" {
    container_name = "tfstate"
  }
  required_version = "> 1.5.0"
}
provider "azurerm" {
  features {}
}