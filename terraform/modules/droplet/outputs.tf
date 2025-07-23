output "droplet_jenkins" {
  description = "Droplet Jenkins server"
  value       = digitalocean_droplet.jenkins_server
}

output "droplet_firezone" {
  description = "Droplet Firezone VPN"
  value       = digitalocean_droplet.firezone_vpn
}
