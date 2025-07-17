resource "digitalocean_vpc" "example" {
  name     = "example-project-network"
  region   = "nyc3"
  ip_range = "10.10.10.0/24"
}

resource "digitalocean_floating_ip" "foobar" {
  droplet_id = digitalocean_droplet.foobar.id
  region     = digitalocean_droplet.foobar.region
}

resource "digitalocean_floating_ip_assignment" "foobar" {
  ip_address = digitalocean_floating_ip.foobar.ip_address
  droplet_id = digitalocean_droplet.foobar.id
}

resource "digitalocean_firewall" "web" {
  name = "only-22-80-and-443"

  droplet_ids = [digitalocean_droplet.web.id]

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
    protocol              = "icmp"
    destination_addresses = ["0.0.0.0/0", "::/0"]
  }
}