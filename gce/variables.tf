variable "instance_name" { default = "terraform-gce" }
variable "region" { default = "europe-west1" }
variable "zone" { default = "europe-west1-b" }

# Set up these variables in the terraform.tfvars file
variable "gcloud_project" { }
variable "credentials_file" { }