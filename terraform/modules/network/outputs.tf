output "vpc_id" {
  description = "VPC ID for droplets"
  value       = digitalocean_vpc.main_vpc.id
}

output "jenkins_ip" {
  description = "Jenkins server static IP"
  value       = digitalocean_reserved_ip.jenkins_static_ip.ip_address
}

output "firezone_ip" {
  description = "Firezone vpn static IP"
  value       = digitalocean_reserved_ip.firezone_static_ip.ip_address
}
