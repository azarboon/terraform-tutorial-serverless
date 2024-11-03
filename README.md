# Serverless app on Azure with Terraform

//This project is in progress


// TODO: currently, api management and function are not integrated. fix the path
check url arguements in https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/api_management_backend

Then put this in capilot: give an example terraform tutorial that connects azurerm_api_management and azurerm_linux_function_app



Do these to package and deploy your func:

Get function app name, go to your function folder and do this to publish. upon successful publish, you get invocation link which can be different from default link. In case you didnt get invoke url, run the command again.

func azure functionapp publish myfuncrurjvzgovxmrc


You can develop and change functions using func cli. Go to "function_code" folder and run "func start"

