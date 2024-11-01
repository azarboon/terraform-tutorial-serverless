# Serverless app on Azure with Terraform

//This project is in progress


// TODO: check how to invoke functions from api. you need to get invoke url of function, connect it to api. then test the path.

Do these to package and deploy your func:

Get function app name, go to your function folder and do this to publish. upon successful publish, you get invocation link which can be different from default link. In case you didnt get invoke url, run the command again.

func azure functionapp publish efzzgfjrmefcw


You can develop and change functions using func cli. Go to "function_code" folder and run "func start"

