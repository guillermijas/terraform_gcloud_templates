output "GCE instance name" {
  value = var.instance_name
}

output "GCE instance ip" {
  value = google_compute_instance.vm_instance.network_interface.0.network_ip
}
