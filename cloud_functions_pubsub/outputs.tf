output "Cloud_function_name" {
  value = google_cloudfunctions_function.function.name
}

output "Cloud_function_URL" {
  value = google_cloudfunctions_function.function.https_trigger_url
}
