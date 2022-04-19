resource "google_cloud_tasks_queue" "advanced_configuration" {
  name     = var.queue_name
  location = var.region

  rate_limits {
    max_concurrent_dispatches = 500
    max_dispatches_per_second = 1000
  }

  retry_config {
    max_attempts       = 5
    max_retry_duration = "0s"
    max_backoff        = "300s"
    min_backoff        = "10s"
    max_doublings      = 1
  }
}
