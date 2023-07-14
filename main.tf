terraform {
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "=3.0.0"
    }
  }
}

provider "azurerm" {
  features {}
}


resource "azurerm_resource_group" "container-rg" {
  name     = "container-resources"
  location = "Southeast Asia"
}

resource "azurerm_container_group" "container-grp" {
  name                = "container-ankittask"
  location            = azurerm_resource_group.container-rg.location
  resource_group_name = azurerm_resource_group.container-rg.name
  ip_address_type     = "Public"
  dns_name_label      = "container-ankittask"
  os_type             = "Linux"




  container {
    name   = "backend"
    image  = "docker.io/babodesi/pernbackend:latest"
    cpu    = "0.5"
    memory = "0.5"

    ports {
      port     = 4000
      protocol = "TCP"
    }
  }

  container {
    name   = "database"
    image  = "docker.io/babodesi/perndb:latest"
    cpu    = "0.5"
    memory = "0.5"

    ports {
      port     = 5432
      protocol = "TCP"
    }
  }

    container {
    name   = "frontend"
    image  = "docker.io/babodesi/pernfrontend:latest"
    cpu    = "0.5"
    memory = "0.5"

    ports {
      port     = 80
      protocol = "TCP"
    }
  }

  tags = {
    environment = "testing"
  }
}

















# resource "azurerm_resource_group" "container-rg" {
#   name     = "Container"
#   location = "eastus"
# }

# resource "azurerm_log_analytics_workspace" "container-log" {
#   name                = "acctest-01"
#   location            = azurerm_resource_group.container-rg.location
#   resource_group_name = azurerm_resource_group.container-rg.name
#   sku                 = "PerGB2018"
#   retention_in_days   = 30
# }

# resource "azurerm_app_service_plan" "backend-asp" {
#   name                = "container-backend-appserviceplan"
#   location            = azurerm_resource_group.container-rg.location
#   resource_group_name = azurerm_resource_group.container-rg.name
#   kind                = "Linux"
#   reserved            = true # required for Linux plans, might need to be in a properties thing
#   sku {
#     tier = "Basic"
#     size = "B1"
#   } 
# }

# resource "azurerm_app_service" "backend-ap" {
#   name                = "container-backend-app-service"
#   location            = azurerm_resource_group.container-rg.location
#   resource_group_name = azurerm_resource_group.container-rg.name
#   app_service_plan_id = azurerm_app_service_plan.backend-asp.id
#   app_settings = {
#     WEBSITES_ENABLE_APP_SERVICE_STORAGE = false
#     WEBSITES_PORT                       = 80
#   }

#   site_config {
#     always_on = "true"
#     # define the images to used for you application
#     linux_fx_version = "DOCKER|docker.io/babodesi/pernbackend:latest"
#   }

#   identity {
#     type = "SystemAssigned"
#   }
# }


# resource "azurerm_app_service_plan" "db-asp" {
#   name                = "container-db-appserviceplan"
#   location            = azurerm_resource_group.container-rg.location
#   resource_group_name = azurerm_resource_group.container-rg.name
#   kind                = "Linux"
#   reserved            = true # required for Linux plans, might need to be in a properties thing
#   sku {
#     tier = "Basic"
#     size = "B1"
#   } 
# }

# resource "azurerm_app_service" "db-ap" {
#   name                = "container-db-app-service"
#   location            = azurerm_resource_group.container-rg.location
#   resource_group_name = azurerm_resource_group.container-rg.name
#   app_service_plan_id = azurerm_app_service_plan.db-asp.id
#   app_settings = {
#     WEBSITES_ENABLE_APP_SERVICE_STORAGE = false
#     WEBSITES_PORT                       = 80
#   }

#   site_config {
#     always_on = "true"
#     # define the images to used for you application
#     linux_fx_version = "DOCKER|docker.io/babodesi/perndb:latest"
#   }

#   identity {
#     type = "SystemAssigned"
#   }
# }

