resource "google_cloud_run_service" "default" {
  name = var.cloud_run_name
  location = var.region

  template {
    spec {
      containers {
        image = var.docker_image
        env {
          name = "ENV_VAR"
          value = "env_var"
        }
      }
    }
  }

  traffic {
    percent = 100
    latest_revision = true
  }

  autogenerate_revision_name = true
}
