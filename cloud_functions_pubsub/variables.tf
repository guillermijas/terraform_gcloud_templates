variable "cloud_function_name" { default = "terraform-cloud-function-pubsub" }
variable "cloud_function_entry_point" { default = "helloPubSub" }
variable "pubsub_topic" { default = "terraform_cloud_function_pubsub_topic" }
variable "region" { default = "europe-west1" }
variable "zone" { default = "europe-west1-b" }

# Set up these variables in the terraform.tfvars file
variable "gcloud_project" { }
variable "credentials_file" { }
