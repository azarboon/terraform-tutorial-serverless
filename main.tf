

//remove the below and replace it with above. make sure to replace "data.azurerm_resource_group" with "azurerm_resource_group"
data "azurerm_resource_group" "rg" {
  name = var.resource_group_name
}

resource "random_string" "random_name" {
  length  = 13
  lower   = true
  numeric = false
  special = false
  upper   = false
}

resource "azurerm_api_management" "example" {
  name                = "${random_string.random_name.result}"
  location            = data.azurerm_resource_group.rg.location
  resource_group_name = data.azurerm_resource_group.rg.name
  publisher_email     = "test@contoso.com"
  publisher_name      = "example publisher"
  sku_name            = "Developer_1"

}

resource "azurerm_api_management_api" "example" {
  name                = "example-api"
  resource_group_name = data.azurerm_resource_group.rg.name
  api_management_name = azurerm_api_management.example.name
  revision            = "1"
  display_name        = "Example API"
  api_type            = "graphql"
  protocols           = ["https"]
}

resource "azurerm_api_management_backend" "example" {
  name                = "example-backend"
  resource_group_name = data.azurerm_resource_group.rg.name
  api_management_name = azurerm_api_management.example.name
  protocol            = "http"
  url                 = "https://${azurerm_linux_function_app.example.default_hostname}"
}

resource "azurerm_storage_account" "example" {
  name                     = "${random_string.random_name.result}"
  resource_group_name      = data.azurerm_resource_group.rg.name
  location                 = data.azurerm_resource_group.rg.location
  account_tier             = "Standard"
  account_replication_type = "LRS"

}



resource "azurerm_service_plan" "example" {
  name                = "example-app-service-plan"
  resource_group_name = data.azurerm_resource_group.rg.name
  location            = data.azurerm_resource_group.rg.location
  os_type             = "Linux"
  sku_name            = "B1"
  
}

resource "azurerm_linux_function_app" "example" {
  name                = "${random_string.random_name.result}"
  resource_group_name = data.azurerm_resource_group.rg.name
  location            = data.azurerm_resource_group.rg.location
  service_plan_id      = azurerm_service_plan.example.id
storage_account_name       = azurerm_storage_account.example.name

  site_config {}
}