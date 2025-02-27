# Acme Corporation - E-commerce API Project (Terraform Code)

# Developed the Terraform Code to deploy the following Azure resources

1. Resource group
2. VNET
3. 3 Subnets (Itntegration for Frontend, Middleware and Data Subnets)
4. App Service Plan (Windows)
5. 2 Web Apps (Backend for Front End WebAPI, Middleware WebAPI)
6. Applciation Insights 
6. Azure SQL DB with a SQL Sever - Encrypted at rest by using Customer Managed Key (CMK) and Transparent Data Encryption feature
7. Private end points for the Middleware WebAPI and Azure SQL DB
8. Keyvault
9. Network security group attached to the SQL Subnet to allow only from Middleware Web API (TCP-1433)

# WorkFlow
1. Customer/Endpoints connect to the frontend usign https voer the internet.Front End Web API (App Service) Connects to Middleware API using the Azure Private link/Private endpoint.Frondend Web API integrated with Integrates with VNET using Integration Subnet
2. Public access has been tunred off on the Middleware API and enabled the privated endpoint -Middleware Subnet.Frontend API access the backend using the Azure Private link only
3. Enabled private endpoints for the Azure SQL Database in Data subnet for the network isolation and disabled the public access. NSG has been applied on the Data Subnet to allow the TCP/1433 traffic only from the Middleware Web API


# Terraform Modules
Re-usable Terraform IaC modules have been created for the following components
1. resourcegroup
2. app-svc-plan
3. subnet
4. vnet
5. windows-webapp

**Note: Reusbale Modules can be created for other azure compnents  as well. Due to timeconstraints, restricted to the above resouces**

# Testing
Tested the code and Deployed the Infra in Canada Central region [Azure Free tier subscription].
For CI/CD pipleines, used Terraform Cloud (personal)
