# cleardemo

**App Services with Terraform**

***Overview***

This repo is an example of deploying an App Service using Terraform. This is not a complete working example as I didn't have time to fully finish. \
However, I hope it demonstrates how modules can be de-coupled from configuration, as well as using loops, data sources, objects and dry(ish) code to deploy to multiple environments with one set of artifacts. \
The repo is set up to be run via a pipeline, perhaps with a powershell or bash script to loop through the manifest folders, applying each one in turn. \
The modules would be stored in a git (e.g. Github/Azure Devops repo), with the manifest source set to the modules repo url. The pipeline would handle authentication to the repos. 

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

The manifests contain the parameters that are required by the modules, seperated by resource. They follow the same pattern for every resource. \

*site.tf* \
The site.tf contains the information for terraform init, such as azurerm version, Terraform version and remote state storage account. \
It is configured to give each manifest it's own state file. In the past I have had a state file per instance of a resource but I couldn't remember how to do this in the time i had!

*resource-type.tf* \
This file contains the variable names and values expected by the module, as well as the path to the source of the module (either local or remote url)

*locals.tf* \
I used this file to build the resource names and default tags

*variables* \
Variables used by the manifests, values from the environment tfvars file

***env folder - TFvars variables***

The folders in here are broken down per environment, with a tfvars file in each one. This allows a single set of manifests/modules to be used across all environments, ensuring consistency and repeatablity.\
In this example the values are mostly the same, apart from the environment code (env) and the sku of the app service plan (sku_size)\
There is also a global tfvars file. In this example the global variables are set in each environments tfvars but the global file could be used as part of a pipeline to set variables common to all environments.\
The pipeline would gather the tfvars files and merge them together with a script. You could even have a file for variables that are common to a region/geo.

***Additional work***
- If I had more time I would of liked to implement private networking for these PaaS resources. Perhaps with an Azure Firewall or Azure Front Door to control access to and from the internet for the app services. This would enable the solution\
to satisfy the requirments for only allowing certain types of traffic. \
- I would of liked to have deployed a Key Vault to manage secrets, certificates and keys.
- The way tags have been implemented with a merge means that we can end up in a situation where we never get a clean plan, as there will always be a change. We could add the lifecycle argument ignore_changes to prevent this, although\
it could have unintented consequences.
- The current solution doesn't have any metric logging. I would of created a Log Analytics Workspace and configured diagnostic settings for the resources to send\
metrics data to the workspace. I could then set up alerting/auto remediation.

