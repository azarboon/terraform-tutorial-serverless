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

output "storage_account_name" {
  value = azurerm_storage_account.example.name
}

output "function_app_name" {
  value = azurerm_linux_function_app.example.name
}

output "storage_container_name" {
  value = azurerm_storage_container.example.name
}

output "storage_blob_name" {
  value = azurerm_storage_blob.example.name
}

output "path_for_packaged_file" {
  value = "https://${azurerm_storage_account.example.name}.blob.core.windows.net/${azurerm_storage_container.example.name}/${azurerm_storage_blob.example.name}"

}
