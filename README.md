# Sample Serverless Application on Azure: Integration Between Function App and API Management with Terraform

Currently, there does not appear to be a functioning example showcasing the integration between Azure Function App and Azure API Management Instance. Existing samples are outdated, and there are significant gaps and errors in the documentation for both the Terraform AzureRM provider and Azure API Management. I have submitted several pull requests to improve these documentations and am publishing this sample code to assist others in navigating this integration.

# Requirements

The following versions were used and confirmed to work. While other versions may also work, they have not been tested with this setup:

- **Azure CLI**: Version 2.65.0  
- **Terraform CLI**: Version 1.9.7  
- **Terraform AzureRM Provider**: Version 4.0 or later  
- **Azure Functions Core Tools**: Version 4.0.6543  


# How to run

## Deploy infrastructure

- `az login`
- in `terraform_configs/variables.tf` update `subscription_id` and `resource_group_name` (you can run `az group list` to get rg name)
- `cd terraform_configs` then:
- remove terraform state file
- `terraform init`
- `terraform plan -out main.tfplan`
- `terraform apply main.tfplan`

Note that deploying Azure API Management instance can take up to 90 minutes. So, be patient.

Note the `function_app_name` from the outputted results, which will be something like `myfuncappsbigwbgyzdync`. You will need it to deploy your function code. Take note of the `frontend_url`, as it serves as the frontend URL of your API Management instance.


## Deploy the code to the Function App

I have utilized [Azure Functions Core Tools](https://learn.microsoft.com/azure/azure-functions/functions-run-local) to package and deploy Azure Functions, though other tools can also be used. Currently, Terraform does not offer full integration with such deployment tools, requiring Azure Functions to be deployed separately after each Terraform deployment. This process can be automated through the use of custom scripts.

Go to `function_code` folder and package and deploy your functions:

- `cd ../function_code`
- Install code dependencies by `npm install`
- Replace `your_function_app_name` with the name obtained earlier from the outputs and run the following command to package and upload the code: `func azure functionapp publish your_function_app_name`. Upon successful publishing, you will receive the `invoke url`. However, note that the `func` CLI can occasionally exhibit errors, even if it displays the message `Deployment completed successfully`. To ensure the process completes correctly, if the `func azure functionapp publish` command does not return the `invoke url`, rerun the command. 

The `Invoke URL` represents the URL of your Function App, which serves as the backend in the Azure API Management instance. To verify its functionality, make a `GET` request to this URL. No authorization headers are required, and the response should return a 200 status code with the following message `Hello world, this is coming from Function App!`. After confirming that the backend URL of the Azure API Management instance is functioning correctly, send a `GET` request to the API's frontend URL (`frontend_url` provided in the Terraform output). If everything is configured properly, the frontend should return the same 200 status code and message.

Remember that after each Terraform deployment, you may need to redeploy (i.e. publish) your function code.


> [!NOTE]  
> For the sake of easier development and debugging, I have disabled CORS restrictions by setting `Access-Control-Allow-Origin: *` within the function code. Once the application is successfully running, ensure to re-enable and properly configure CORS to secure it.

------

Note that integration between Azure Function App and Azure API Management can be challenging and prone to various issues. Unfortunately, the documentation on this integration is limited (I have submitted some pull requests to improve it and am hopeful they will be accepted). To reduce the likelihood of errors, I have automated the variables as much as possible. However, if you plan to modify the code, please keep the following considerations in mind:
- Ensure that the `url_template` property in the `azurerm_api_management_api_operation` resource aligns with the function name specified in the `invoke_url`. Avoid appending any slashes to the `url_template` value.
- Ensure that `https://your-function-app-name.azurewebsites.net/api` is consistently used in both the policy and the `Service URL` in the backend configuration, and ensure it overrides any existing value in the backend.
