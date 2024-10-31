# Serverless GraphQL app on Azure with Terraform

//This project is in progress


// TODO: 

Check how can you create linux func app from portal associated with an existing app service plan.

Ask azure team why can you create linux function from Terraform but not from azure portal?


Do these to package and deploy your func:

Following create a func locally
func new --name FuncFromCli --template "HTTP trigger"

Following create a func in azure
az functionapp create -g 1-8eb38932-playground-sandbox  -n FuncFromCli -s sefumqvaglrpw -p example-app-service-plan --runtime node

Go to your function folder and do this to publish. upon successful publish, you get invocation link which can be different from default link
func azure functionapp publish FuncFromCli




Default linux function works but the issue is finding correct folder structure for .zip package file. It seems to be inconsistent with what func cli creates but not sure. Firstly, deploy terraform then create a local file using func cli then deploy it to function. Dont upload using blob cli. put this in capilot "can i upload package to azure functions using func cli?"



note --name and WEBSITE_RUN_FROM_PACKAGE must end with .zip extension. Add this to doc of Azure and probably Terraform

az storage blob upload --account-name lwpqckrxxssuo --container-name example --name example.zip --file functionapp.zip --overwrite . Ask this from capilot: "function code works locally. now, attach the required content to azurerm_linux_function_app in terraform"


You can develop and change functions using func cli. Go to "function_code" folder and run "func start"



Once done, change it to Graphqwl