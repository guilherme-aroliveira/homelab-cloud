# create adroplet for the jenkins server
resource "digitalocean_droplet" "jenkins_server" {
  image      = "debian-12-x64"
  name       = "jenkins-server"
  vpc_uuid   = var.vpc_id
  region     = "nyc3"
  size       = "s-2vcpu-2gb"
  volume_ids = ["${var.volume_jenkins}".id]
  ssh_keys   = ["${var.jenkins_key}".id]
  user_data  = file("${path.module}/scripts/jenkins.sh")
  tags       = [digitalocean_tag.jenkins_server_tag.name]
  backups    = true
}

# create a tag of the jenkins server
resource "digitalocean_tag" "jenkins_server_tag" {
  name = "jenkins-server"
}

# create a droplet for the firezone vpn
resource "digitalocean_droplet" "firezone_vpn" {
  image      = "debian-12-x64"
  name       = "firezone-vpn"
  vpc_uuid   = var.vpc_id
  region     = "nyc3"
  size       = "s-1vcpu-1gb"
  ssh_keys   = ["${var.firezone_key}".id]
  user_data  = file("${path.module}/scripts/firezone.sh")
  tags       = [digitalocean_tag.firezone_tag.name]
  backups    = true
}

resource "digitalocean_tag" "firezone_tag" {
  name = "firezone-vpn"
}