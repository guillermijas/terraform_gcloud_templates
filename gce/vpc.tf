resource "google_compute_network" "vpc_network" {
  name = "terraform-gce-network"
  project = var.gcloud_project
}