output "private_key" {
  description = "The private ssh key"
  value       = tls_private_key.private_key.private_key_openssh
}

output "jenkins_key" {
  description = "Jenkins SSH key"
  value       = digitalocean_ssh_key.jenkins_ssh_key
}

output "firezone_key" {
  description = "Firezone SSH key"
  value       = digitalocean_ssh_key.firezone_ssh_key
}
