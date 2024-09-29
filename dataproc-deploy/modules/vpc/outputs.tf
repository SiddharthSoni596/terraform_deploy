output "subnet_id" {
  value = google_compute_subnetwork.us_east1.id
}
output "vpc_id" {
  value = google_compute_network.dataproc_network.id
}
output "vpc_self_link" {
  value = google_compute_network.dataproc_network.self_link
}
