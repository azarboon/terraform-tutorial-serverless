# Serverless app on Azure with Terraform

//This project is in progress


// TODO: make the api url path to return content from backend function. Currently, to get 200, you need to delete backend policy from portal.follow from there


After each TF deployment, you need to redeploy function code.

Do these to package and deploy your func:

Get function app name, go to your function folder and do this to publish. upon successful publish, you get invocation link which can be different from default link. In case you didnt get invoke url, run the command again.

func azure functionapp publish myfuncappruftisoiqarzg


You can develop and change functions using func cli. Go to "function_code" folder and run "func start"

