# Sample Serverless Application on Azure: Function App and API Management with Terraform

//This is in progress

TODO:

Make sure required parameter is passed into policy file
Check how the name of function in "invoke url" is determined and make sure `url_template` automatically refer to it.


## How to run

- `az login`
- in terraform_configs/variables.tf update `subscription_id` and `resource_group_name` (you can run `az group list` to get rg name)
- `cd terraform_configs` then:
- remove terraform state file
- `terraform init`
- `terraform plan -out main.tfplan`
- `terraform apply main.tfplan`

Note that deploying Azure API Management instance can take up to 90 minutes. So, be patient.

Note the function app name from the outputted results, which will be something like `myfuncappsbigwbgyzdync`. You will need it to deploy your function code.

> [!NOTE]  
> I have utilized [Azure Functions Core Tools](https://learn.microsoft.com/azure/azure-functions/functions-run-local) to package and deploy Azure Functions, though other tools can also be used. Currently, Terraform does not offer full integration with such deployment tools, requiring Azure Functions to be deployed separately after each Terraform deployment. This process can be automated through the use of custom scripts.

Go to `function_code` folder and package and deploy your functions:

- `cd ../function_code`

Get function app name, go to your function folder and do this to publish. upon successful publish, you get invocation link which can be different from default link. In case you didnt get invoke url, run the command again.

`func azure functionapp publish myfuncappsbigwbgyzdync`

After each TF deployment, you need to redeploy function code.

> [!NOTE]  
> Ensure that the `url_template` property in the `azurerm_api_management_api_operation` resource aligns with the function name specified in the `invoke_url`. Avoid appending any slashes to the `url_template` value.

> [!NOTE]  
> EEnsure that `https://your-function-app-name.azurewebsites.net/api` is consistently used in both the policy and the `Service URL` in the backend configuration, and ensure it overrides any existing value in the backend.