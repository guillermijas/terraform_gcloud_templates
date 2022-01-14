variable "instance_name" { default = "terraform_gce" }
variable "region" { default = "europe-west1" }
variable "zone" { default = "europe-west1-b" }

# Set up these variables in the terraform.tfvars file
variable "project" { }
variable "credentials_file" { }