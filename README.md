# Serverless app on Azure with Terraform

//This project is in progress

Before creating an API instance, go and create an app service then create api from portal and app service's page. check settings.

This the latest policy I've got. Check why it forwards the request to a wrong url. Enable tracing in api management, put it in capilot. Make sure your Postman requests have "origin" header. Don't enable CORS at function app level because it overrides your code level headers. 

<policies>
    <inbound>
        <base />
        <cors>
            <allowed-origins>
                <origin>*</origin>
            </allowed-origins>
            <allowed-methods>
                <method>GET</method>
                <method>POST</method>
                <method>OPTIONS</method>
            </allowed-methods>
            <allowed-headers>
                <header>Content-Type</header>
            </allowed-headers>
        </cors>
        <set-header name="Origin" exists-action="override">
            <value>*</value>
        </set-header>
        <!-- Set the backend service URL -->
        <set-backend-service base-url="https://myfuncappwbpdmbsmzfqyx.azurewebsites.net/api/funcfromcli" />
    </inbound>
    <backend>
        <forward-request />
    </backend>
    <outbound>
        <base />
    </outbound>
    <on-error>
        <base />
    </on-error>
</policies>





Add a PR to azure http triggered function that ensures content-type http/json, and CORS headers exist. Also make PR for followings: Make sure your Postman requests have "origin" header. Don't enable CORS at function app level because it overrides your code level headers. 

// TODO: make the api url path to return content from backend function. Currently, to get 200, you need to delete backend policy from portal.follow from there


After each TF deployment, you need to redeploy function code.

Do these to package and deploy your func:

Get function app name, go to your function folder and do this to publish. upon successful publish, you get invocation link which can be different from default link. In case you didnt get invoke url, run the command again.

func azure functionapp publish myfuncappwbpdmbsmzfqyx


You can develop and change functions using func cli. Go to "function_code" folder and run "func start"

