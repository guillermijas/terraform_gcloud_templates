variable "queue_name" { default = "terraform-cloud-task" }
variable "region" { default = "europe-west1" }
variable "zone" { default = "europe-west1-b" }

# Set up these variables in the terraform.tfvars file
variable "gcloud_project" { default = "gcloud_project" }
variable "credentials_file" {} #{ default = "./terraform_service_account.json" }
