output "jenkins_private_key" {
  description = "The Jenkins private ssh key"
  value       = tls_private_key.jenkins_private_key.private_key_openssh
}

output "firezone_private_key" {
  description = "The Firezone private ssh key"
  value       = tls_private_key.firezone_private_key.private_key_openssh
}

output "jenkins_key" {
  description = "Jenkins SSH key"
  value       = digitalocean_ssh_key.jenkins_ssh_key
}

output "firezone_key" {
  description = "Firezone SSH key"
  value       = digitalocean_ssh_key.firezone_ssh_key
}
