output "Cloud_Run_server_name" {
  value = var.cloud_run_name
}

output "Cloud_Run_server_URL" {
  value = google_cloud_run_service.default.status[0].url
}
