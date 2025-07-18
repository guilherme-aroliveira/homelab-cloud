output "volume_jenkins" {
  description = "Block storage for Jenkins Server"
  value       = digitalocean_volume.jenkins_volume.id
}
