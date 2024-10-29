# Serverless GraphQL app on Azure with Terraform

//This project is in progress


// TODO: 

Default linux function works but the issue is finding correct folder structure for .zip package file. It seems to be inconsistent with what func cli creates but not sure. Firstly, deploy terraform then create a local file using func cli then deploy it to function. Dont upload using blob cli. put this in capilot "can i upload package to azure functions using func cli?"



note --name and WEBSITE_RUN_FROM_PACKAGE must end with .zip extension. Add this to doc of Azure and probably Terraform

az storage blob upload --account-name lwpqckrxxssuo --container-name example --name example.zip --file functionapp.zip --overwrite . Ask this from capilot: "function code works locally. now, attach the required content to azurerm_linux_function_app in terraform"


You can develop and change functions using func cli. Go to "function_code" folder and run "func start"



Once done, change it to Graphqwl