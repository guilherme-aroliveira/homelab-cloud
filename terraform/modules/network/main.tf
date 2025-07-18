resource "digitalocean_vpc" "main_vpc" {
  name     = "main-vpc"
  region   = "nyc3"
  ip_range = "10.0.0.0/16"
}

resource "digitalocean_reserved_ip" "server_static_ip" {
  region = "${var.droplet_jenkins}".region
}

resource "digitalocean_reserved_ip_assignment" "assign_static_ip" {
  ip_address = digitalocean_reserved_ip.server_static_ip.ip_address
  droplet_id = "${var.droplet_jenkins}".id
}

resource "digitalocean_firewall" "droplet_firewall" {
  name = "droplet-firewall-rules"

  droplet_ids = ["${var.droplet_jenkins}".id]

  inbound_rule {
    protocol         = "tcp"
    port_range       = "22"
    source_addresses = ["0.0.0.0/0", "::/0"]
  }

  inbound_rule {
    protocol         = "tcp"
    port_range       = "80"
    source_addresses = ["0.0.0.0/0", "::/0"]
  }

  inbound_rule {
    protocol         = "tcp"
    port_range       = "443"
    source_addresses = ["0.0.0.0/0", "::/0"]
  }

  outbound_rule {
    protocol         = "tcp"
    port_range       = "80"
    destination_addresses = ["0.0.0.0/0", "::/0"]
  }

  outbound_rule {
    protocol         = "tcp"
    port_range       = "443"
    destination_addresses = ["0.0.0.0/0", "::/0"]
  }

  outbound_rule {
    protocol         = "udp"
    port_range       = "53"
    destination_addresses = ["0.0.0.0/0", "::/0"]
  }
}
