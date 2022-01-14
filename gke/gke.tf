# GKE cluster
resource "google_container_cluster" "primary" {
  name = var.gke_cluster_name
  location = var.zone
  release_channel { channel = "RAPID" }

  # Remove default node and create a managed one
  remove_default_node_pool = true
  initial_node_count = 1

  network = google_compute_network.vpc.name
  subnetwork = google_compute_subnetwork.subnet.name
}

# Separately Managed Node Pool
resource "google_container_node_pool" "primary_nodes" {
  name       = "${google_container_cluster.primary.name}-node-pool"
  cluster    = google_container_cluster.primary.name

  location   = var.zone
  node_count = var.gke_num_nodes

  node_config {
    oauth_scopes = [
      "https://www.googleapis.com/auth/logging.write",
      "https://www.googleapis.com/auth/monitoring",
    ]

    machine_type = "n1-standard-1"
    tags = ["gke-node", "${var.gke_cluster_name}-gke"]
    metadata = { disable-legacy-endpoints = "true" }
  }
}