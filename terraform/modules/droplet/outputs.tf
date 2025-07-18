output "droplet_jenkins" {
  description = "Droplet Jenkins server"
  value       = digitalocean_droplet.jenkins_server
}
