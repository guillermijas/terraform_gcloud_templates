locals {
  timestamp = formatdate("YYMMDDhhmmss", timestamp())
  source_code_dir = abspath("./src")
}

# Compress source code
data "archive_file" "source" {
  type = "zip"
  source_dir = local.source_code_dir
  output_path = "/tmp/${var.cloud_function_name}-${local.timestamp}.zip"
}

# Create bucket that will host the source code
resource "google_storage_bucket" "bucket" {
  name = "${var.cloud_function_name}-bucket"
}

# Add source code zip to bucket
resource "google_storage_bucket_object" "zip" {
  # Append file MD5 to force bucket to be recreated
  name = "${var.cloud_function_name}-source.zip#${data.archive_file.source.output_md5}"
  bucket = google_storage_bucket.bucket.name
  source = data.archive_file.source.output_path
}

# Create Cloud Function
resource "google_cloudfunctions_function" "function" {
  name = var.cloud_function_name
  runtime = "python38" # Switch to a different runtime if needed

  available_memory_mb = 128
  source_archive_bucket = google_storage_bucket.bucket.name
  source_archive_object = google_storage_bucket_object.zip.name
  trigger_http = true
  entry_point = var.cloud_function_entry_point
}

# Create IAM entry so all users can invoke the function
resource "google_cloudfunctions_function_iam_member" "invoker" {
  project = google_cloudfunctions_function.function.project
  region = google_cloudfunctions_function.function.region
  cloud_function = google_cloudfunctions_function.function.name

  role = "roles/cloudfunctions.invoker"
  member = "allUsers"
}