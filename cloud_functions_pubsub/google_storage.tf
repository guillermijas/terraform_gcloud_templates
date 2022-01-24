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
  location = var.region
}

# Add source code zip to bucket
resource "google_storage_bucket_object" "zip" {
  # Append file MD5 to force bucket to be recreated
  name = "${var.cloud_function_name}-source.zip#${data.archive_file.source.output_md5}"
  bucket = google_storage_bucket.bucket.name
  source = data.archive_file.source.output_path
}