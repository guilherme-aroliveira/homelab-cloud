data "digitalocean_project" "production" {
  name = "homelab-core"
}

# add resource to project 
resource "digitalocean_project_resources" "project_resources" {
  project = data.digitalocean_project.production.id
  resources = [
    var.ssh_bucket,
    "${var.droplet_jenkins}".urn,
    "${var.droplet_firezone}".urn,
    "${var.volume_jenkins}".urn
  ]
}

# create public ssh key for jenkins
resource "tls_private_key" "jenkins_private_key" {
  algorithm = "ED25519"
}


resource "digitalocean_ssh_key" "jenkins_ssh_key" {
  name       = "Jenkins SSH Key"
  public_key = tls_private_key.jenkins_private_key.public_key_openssh
}

resource "tls_private_key" "firezone_private_key" {
  algorithm = "ED25519"
}

# create public ssh key for firezone
resource "digitalocean_ssh_key" "firezone_ssh_key" {
  name       = "Firezone SSH Key"
  public_key = tls_private_key.firezone_private_key.public_key_openssh
}
