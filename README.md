# Terraform Backend
This project is responsible to create the tf backend S3 and DynamoDB for storing terraform state files and locks.

Terraform state is handled locally as this will be deployed once per AWS account.

> Commands to execute:
> - terraform init 
> - terraform plan -var-file="./vars/common.tfvars" -var="app_name=<app-name>"
> - terraform apply -var-file="./vars/common.tfvars" -var="app_name=<app-name>" -auto-approve
> - terraform destroy -var-file="./vars/common.tfvars" -var="app_name=<app-name>" -auto-approve 



