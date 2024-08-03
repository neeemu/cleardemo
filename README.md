# cleardemo

**App Services with Terraform**

***Overview***

This repo is an example of deploying an App Service using Terraform. This is not a complete working example as I didn't have time to fully finish. \
However, I hope it demonstrates how modules can be de-coupled from configuration, as well as using loops, data sources, objects and dry(ish) code to deploy to multiple environments with one set of artifacts. \
The repo is set up to be run via a pipeline, perhaps with a powershell or bash script to loop through the manifest folders, applying each one in turn. \
The modules would be stored in a git (e.g. Github/Azure Devops repo), with the manifest source set to the modules repo url. The pipeline wopuld handle authentication to the repos. 

The repo is broken down into three main parts: \
    - Modules that contain the resource definitions \
    - manifests that contain the parameters required by the modules \
    - a seperate set of variables per environment 

***Modules***

The modules I have created are for a resource group, storage account and an app service plan that will deploy n number of app services to it. \
Originally the app service plan used a data source to obtain the resource group name. However, I found it was taking a long time each plan/apply to refresh the data source, I read that this refresh was introduced to make data sources more reliable. \
The app services depend on the app service plan as they use the app service plans' resource id, as well as it's resource group name. \
I had to hard-code the IP restrictions as I was originally using a dynamic block, passing in a map of IP restrictions. The Terraform validated but didn't actually apply the restrictions, I would of liked to of solved this properly but didn't have time. 

***Manifests (params/config)***

The manifests contain the parameters that are required by the modules, seperated by resource. \
The site.tf contains the information for terraform init, such as azurerm version, Terraform version and remote state storage account. \
It is configured to give each manifest it's own state file. In the past I have had a state file per instance of a resource but I couldn't remember how to do this in the time i had! \

