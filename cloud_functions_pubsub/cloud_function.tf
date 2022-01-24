
# Create Cloud Function
resource "google_cloudfunctions_function" "function" {
  name = var.cloud_function_name
  runtime = "nodejs16" # Switch to a different runtime if needed

  available_memory_mb = 128
  timeout = 300
  source_archive_bucket = google_storage_bucket.bucket.name
  source_archive_object = google_storage_bucket_object.zip.name

  event_trigger {
    event_type = "providers/cloud.pubsub/eventTypes/topic.publish"
    resource = google_pubsub_topic.topic.name
  }

  entry_point = var.cloud_function_entry_point
}