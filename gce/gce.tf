resource "google_compute_instance" "vm_instance" {
  name = var.instance_name
  machine_type = "f1-micro"
  tags = ["web", "dev"]
  project = var.gcloud_project

  boot_disk {
    initialize_params {
      image = "cos-cloud/cos-stable"
    }
  }

  network_interface {
    network = google_compute_network.vpc_network.name
    access_config {
    }
  }
}
