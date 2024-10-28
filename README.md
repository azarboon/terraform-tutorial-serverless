# Serverless GraphQL app on Azure with Terraform

//This project is in progress


// TODO: diagnose why the app gives error. You need to upload package to storage using 
az storage blob upload --account-name mmyndifbomzta --container-name example --name example --file functionapp.zip . Ask this from capilot: "function code works locally. now, attach the required content to azurerm_linux_function_app in terraform"


You can develop and change functions using func cli. Go to "function_code" folder and run "func start"



Once done, change it to Graphqwl