variable "credentials_file" { }
variable "gcloud_project" { description = "project id in Google Cloud" }
variable "region" { default = "europe-west1" }
variable "zone" { default = "europe-west1-b" }

variable "gke_num_nodes" { default = 2 }
variable "gke_cluster_name" { default = "ucluster" }
