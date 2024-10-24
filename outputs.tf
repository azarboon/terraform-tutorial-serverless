output "resource_group_name" {
  value = data.azurerm_resource_group.rg.name
}

output "resource_group_location" {
  value = data.azurerm_resource_group.rg.location
}

output "api_management_service_name" {
  value = azurerm_api_management.example.name
}

output "azurerm_linux_function_app_url" {
  value = azurerm_linux_function_app.example.default_hostname
}