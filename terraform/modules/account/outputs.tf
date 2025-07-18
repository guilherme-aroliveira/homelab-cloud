output "ssh_rsa_key" {
  description = "The private ssh key"
  value       = tls_private_key.rsa_key.private_key_openssh
}

output "openssh_key" {
  description = "Public SSH key"
  value = digitalocean_ssh_key.openssh_key
}