provider "google" {
  credentials = file(var.credentials_file)
  project     = var.gcloud_project
  region      = var.region
  zone        = var.zone
}
