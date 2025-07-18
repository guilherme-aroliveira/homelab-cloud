# add a block storage to jenkins server
resource "digitalocean_volume" "jenkins_volume" {
  region                  = "nyc3"
  name                    = "jenkins-volume"
  size                    = 100
  initial_filesystem_type = "ext4"
  description             = "Block storage for Jenkins server"
}

resource "digitalocean_volume_attachment" "jenkins_volume_attach" {
  droplet_id = "${var.droplet_jenkins}".id
  volume_id  = digitalocean_volume.jenkins_volume.id
}
