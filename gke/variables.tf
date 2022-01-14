variable "credentials_file" { }
variable "gcloud_project" { description = "project id in Google Cloud" }
variable "region" { default = "europe-west1" }
variable "zone" { default = "europe-west1-b" }

variable "gke_username" {
  default     = ""
  description = "gke username"
}

variable "gke_password" {
  default     = ""
  description = "gke password"
}

variable "gke_num_nodes" {
  default     = 2
  description = "number of gke nodes"
}

variable "gke_cluster_name" {
  default     = "ucluster"
  description = "Cluster name in GKE"
}
