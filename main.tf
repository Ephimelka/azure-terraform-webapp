# Azure Provider Configuration  
provider "azurerm" {  
  features {}  
}  
  
# Create a Resource Group  
resource "azurerm_resource_group" "app_service_rg" {  
  name     = var.resource_group_name  
  location = var.location  
}  
  
# Create an App Service Plan  
resource "azurerm_app_service_plan" "app_service_plan" {  
  name                = var.app_service_plan_name  
  location            = azurerm_resource_group.app_service_rg.location  
  resource_group_name = azurerm_resource_group.app_service_rg.name  
  sku {  
    tier = var.app_service_plan_tier  
    size = var.app_service_plan_size  
  }  
}  
  
# Create an App Service  
resource "azurerm_app_service" "app_service" {  
  name                = var.app_service_name  
  location            = azurerm_resource_group.app_service_rg.location  
  resource_group_name = azurerm_resource_group.app_service_rg.name  
  app_service_plan_id = azurerm_app_service_plan.app_service_plan.id  
}  