resource "digitalocean_vpc" "main_vpc" {
  name     = "main-vpc"
  region   = "nyc3"
  ip_range = "10.0.0.0/16"
}

# create static IP for Jenkins server
resource "digitalocean_reserved_ip" "jenkins_static_ip" {
  region = "${var.droplet_jenkins}".region
}

resource "digitalocean_reserved_ip_assignment" "assign_jenkins_static_ip" {
  ip_address = digitalocean_reserved_ip.jenkins_static_ip.ip_address
  droplet_id = "${var.droplet_jenkins}".id
}

# create static IP for Firezone VPN

resource "digitalocean_reserved_ip" "firezone_static_ip" {
  region = "${var.droplet_firezone}".region
}

resource "digitalocean_reserved_ip_assignment" "assign_firezon_static_ip" {
  ip_address = digitalocean_reserved_ip.firezone_static_ip.ip_address
  droplet_id = "${var.droplet_firezone}".id
}
