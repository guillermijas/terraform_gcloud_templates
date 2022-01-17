variable "cloud_run_name" { default = "terraform-cloud-run" }
variable "region" { default = "europe-west1" }
variable "zone" { default = "europe-west1-b" }

# Set up these variables in the terraform.tfvars file
variable "gcloud_project" { }
variable "credentials_file" { }
variable "docker_image" { }