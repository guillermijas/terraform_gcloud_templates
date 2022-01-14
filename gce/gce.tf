resource "google_compute_network" "vpc_network" {
  name = "terraform-gce-network"
}

resource "google_compute_instance" "vm_instance" {
  name = var.instance_name
  machine_type = "f1-micro"
  tags = ["web", "dev"]

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
