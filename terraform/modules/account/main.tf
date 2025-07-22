data "digitalocean_project" "production" {
  name = "homelab-core"
}

resource "digitalocean_project_resources" "project_resources" {
  project = data.digitalocean_project.production.id
  resources = [
    var.ssh_bucket,
    "${var.droplet_jenkins}".urn,
    "${var.volume_jenkins}".urn
  ]
}

## Genrates a private key
resource "tls_private_key" "rsa_key" {
  algorithm = "RSA"
  rsa_bits  = 4096
}

# Create ssh key 
resource "digitalocean_ssh_key" "openssh_key" {
  name       = "DigitalOcean SSH Key"
  public_key = tls_private_key.rsa_key.public_key_openssh
}