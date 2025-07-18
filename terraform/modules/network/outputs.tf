output "vpc_id" {
  description = "VPC ID for droplets"
  value = digitalocean_vpc.main_vpc.id
}

output "jenkins_ip" {
  description = "Jenkins server static IP"
  value = digitalocean_reserved_ip.server_static_ip.ip_address
}